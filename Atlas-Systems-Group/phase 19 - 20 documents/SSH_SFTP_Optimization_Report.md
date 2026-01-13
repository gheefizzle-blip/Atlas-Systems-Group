# Optimizing SSH/SFTP Throughput for NAS ↔ n8n Transfers

## Overview

SSH encrypts every packet, which introduces CPU overhead. Using modern
AEAD ciphers, optimizing rekey intervals, and tuning buffers can
dramatically improve throughput for large file transfers, especially in
NAS-to-n8n workflows handling multi-gigabyte Fusion 360 assets.

------------------------------------------------------------------------

## 1. Prefer Modern AEAD Ciphers

Use AEAD (Authenticated Encryption with Associated Data) ciphers that
encrypt and authenticate in a single pass.

**Recommended Options:** - `chacha20-poly1305@openssh.com` (optimal for
CPUs without AES-NI) - `aes128-gcm@openssh.com` (optimal for CPUs with
AES-NI)

**Client Configuration (`~/.ssh/config`):**

``` sshconfig
Host *
  Ciphers chacha20-poly1305@openssh.com,aes128-gcm@openssh.com
```

**One-Off Transfer Example:**

``` bash
scp -c aes128-gcm@openssh.com bigfile.zip user@host:/path/
```

------------------------------------------------------------------------

## 2. Optimize MACs When AEAD Isn't Used

AEAD ciphers already include message authentication, but if you fall
back to CTR ciphers, use efficient encrypt-then-MAC algorithms:

**Recommended MACs:**

    hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com

**Server Configuration (`/etc/ssh/sshd_config`):**

``` sshconfig
MACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com
```

------------------------------------------------------------------------

## 3. Adjust RekeyLimit for Large Transfers

Frequent rekeying can cause brief stalls during large transfers.
Increasing the limit reduces interruptions.

**Client Configuration:**

``` sshconfig
Host *
  RekeyLimit 4G 1h
```

This rekeys only after 4 GiB or one hour of continuous transfer.

------------------------------------------------------------------------

## 4. Use HPN-SSH for High-Latency Links

HPN-SSH (High-Performance Networking SSH) increases buffer sizes and
improves window scaling---ideal for long-distance, high-bandwidth
networks.

> **Note:** Use only in controlled environments, as it requires custom
> builds.

------------------------------------------------------------------------

## 5. Verify Negotiated Settings

To confirm cipher and MAC negotiation:

``` bash
ssh -Q cipher      # list supported ciphers
ssh -vvv host      # view negotiated cipher/MAC during connection
```

------------------------------------------------------------------------

## 6. Recommended Server Defaults

**Suggested `/etc/ssh/sshd_config` block:**

``` sshconfig
Ciphers chacha20-poly1305@openssh.com,aes128-gcm@openssh.com
MACs hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com
RekeyLimit 4G 1h
```

Restart sshd after applying changes.

------------------------------------------------------------------------

## 7. Integration Notes for NAS ↔ n8n Workflows

-   Use SFTP over SSH with AEAD ciphers for large file integrity and
    performance.
-   SMB2 adds latency and overhead; SFTP reduces round-trip chatter.
-   For long-haul or VPN connections, test HPN-SSH if compatible.
-   n8n's SFTP node supports custom SSH options---set cipher preferences
    directly.

------------------------------------------------------------------------

## 8. Optional Benchmarking

To measure improvements between ciphers:

``` bash
time scp -c aes128-gcm@openssh.com bigfile.zip user@host:/path/
time scp -c chacha20-poly1305@openssh.com bigfile.zip user@host:/path/
```

Compare transfer times to determine the best-performing cipher for your
system.

------------------------------------------------------------------------

**Author:** Sam (ChatGPT / Spear Enterprise Engineering)\
**Date:** October 2025\
**Document Type:** Technical Optimization Report
