Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71477CC6B19
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 20:50:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448300.1664318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGjRd-0005eb-Jv; Tue, 13 Oct 2026 20:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448300.1664318; Tue, 13 Oct 2026 20:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGjRd-0005eU-Gr; Tue, 13 Oct 2026 20:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1448300;
 Tue, 13 Oct 2026 20:49:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1xGjRc-0005eO-UC
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 20:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGjRc-001WtP-BG
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:49:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ace9904-bab6-0a2a0a5309dd-0a2a450b950e-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 22:49:56 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ace996e-b7e8-0a2a450b0019-d15580b6a9d1-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 22:49:51 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-8ae9bc9a2fcso43360157b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:49:50 -0700 (PDT)
Received: from StolidWingnut.localdomain ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b07f25141dsm48837417b3.40.2026.10.13.13.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 13:49:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.io header.i="@edera.io" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1791924589; x=1792529389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXbNAe5TbgxJKCM2vYO3nk3BjSGUJWEFuyRNOjRKIEw=;
        b=cbtEynWHK0jCzj75NZRlzWWxEGZiqtmRU5k95rtA1FWAC/Pyc5w3kvG8hnU79Adwov
         qhzqPh1lVWtTlzHJpmRV7HZZPct1V4TB0DHBN1BALuIFP84jk04ycbUKsqsWmIa4kY23
         j53ttb+7fn0Tl7IsmHRD52O/DNwI8bUeJ7x1ddgZuD0deuhohx2MnTWaNZSrMyByD0Wk
         HNLvz9qILWZjVRfQeemsEG/C5e5wtT8Ko1iJX0eMLPQiRh6K6CRRqoSWhcY05E/vO1Gy
         IwLYCp8xF4r2mjM6W1t9neB2VVjGhYk6I5aZA8bqytmGxymK3JbbaAXqfkU/V1THu7xV
         0VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924589; x=1792529389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXbNAe5TbgxJKCM2vYO3nk3BjSGUJWEFuyRNOjRKIEw=;
        b=bIS9kU4QSYFsVRbpys7jIjrU7XR19QpY5RfbOUWL+Vi6gKbNWLWq75Xr7TIeZL8KAP
         EBon6hRjUCyn7QIqFFh2Wa4c5uRMPP36gtABhX4253J3HdKPV1kNYWz+lcMSyWKlP8FR
         Yfv5YbEZpeFBlqq95bWdlYHqDepoEt2C7hOq8R1N8T9/QdpWuLGghPl+mnpHiaHozLRx
         8IViijy5Iwlfj9FVjmX73hyPzu1RMmmqiKRU2qnZ6Mfq5tXo9gT9alnCURMXIgAiZam8
         5aU7invrttxqDxT9sVi+w3A4H9BFeXCp71jOkWhXEWA3XxP5rnH1Pqfn+3TKvDDX3N+c
         7TFw==
X-Gm-Message-State: AFq9FYIfUTk8pYA9McOApm5a1vXHBU8rz6JbfVAs40UyLH7UfH2IUMQd
	68jnxVlSQ7Uxt2ZWJkCquUiFusl0dE8ib68iqc9+s2KF8I6F9ZXpYv2Q/AVs/blfYS3Y3lQ4Fni
	8uQPSWao=
X-Gm-Gg: AYBFou0ovsHt+6Akl777IcncIKe+xW/FOtJi1tUYjFzB8mog1AWsF39fxyj7IiSMXcq
	BoWGVit5pDQ0pqj3/iDfKpQbjyRqUgpQJ7rigNhEEdPd6vzPonp8WEbxulgHeuBoM/GvH+fBpIB
	98aX8TjKkw8YTHaXdwDC028gk6e91+trKt4rPP4CuX055UgbUBdOx5cQMMI9AwV6tL+v0Ponypa
	3dp/Ik5/rxnVJXp6Kxtbqa7zxGGm2QfU9loa7LBYQ9mTWhZb7gdI0pBMII1dydj5ju7ZrRwpTkV
	+to09KnvxFNXJhsi32rjehiuvGXPqhGF/CZOFmFpu6p+FaoHWYQQSge52Pdh84MfS/E1xc7YSF5
	GJKDP3qu4l9afcVdrPgKH3uKSOPcUrJNjtVY37sn3Czn1OrDO85x+ZpJWzpriKz1ylJTzoiosD0
	fvsRQ/yNo2I/w8vEt75F2OHSYCUu7AufT4l5Onmuscs/PIuT+ASUllzxbFjC5AedRqTZsojAGHk
	ebGrboGxX8oriLxpHk7k6FYwGs=
X-Received: by 2002:a05:690c:5886:b0:87f:32fa:aa08 with SMTP id 00721157ae682-8b07ed55c46mr36684497b3.14.1791924589251;
        Tue, 13 Oct 2026 13:49:49 -0700 (PDT)
From: Benjamin Leggett <benjamin@edera.io>
To: xen-devel@lists.xenproject.org
Cc: Benjamin Leggett <benjamin@edera.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] ns16550: add "auto" to scan PCI only when the default base has no UART
Date: Tue, 13 Oct 2026 16:49:46 -0400
Message-ID: <20261013204946.1980090-1-benjamin@edera.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009202447.852414-1-benjamin@edera.io>
References: <20261009202447.852414-1-benjamin@edera.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791924596-18AC89EA-FF93D8A0/0/0
X-purgate-type: clean
X-purgate-size: 8281

On some systems the console UART is at the legacy I/O port, and on
others, such as Amazon EC2 bare metal instances, the only UART is on
PCI. "com1=...,pci" finds the PCI UART, but it prefers any PCI serial
device to the legacy port, so it is not correct on a system that has
both. No option today says "use the legacy port, and scan PCI only if
it has no UART". A deployment that boots one command line on many
kinds of machine needs exactly that.

Add "auto" as a value in the <io-base> position, and as "dev=auto".
With it, Xen probes the default base as usual. Only if
check_existence() fails there does it scan PCI, as "pci" does.
Without "auto", nothing changes.

The decision rests on check_existence(), which until now reported an
MMIO base as present without testing it. Make it return -1 for a base
that it cannot probe, so that callers can tell "no UART" apart from
"not probed". The HAS_IOPORTS=n branch returns -1 too, for the same
reason, although it is not reachable today: the function is x86-only,
and x86 always selects HAS_IOPORTS. Existing behavior does not change,
as -1 is still non-zero, but "auto" now refuses a base that cannot be
probed. The decision therefore always comes from the I/O port probe,
and with nothing at the port, reads return 0xff and the IER test
fails.

The scan runs only when the command line asks for it, at the same
point in boot as "pci" and "amt". There is no console yet, but the
scan is not silent: it logs the device that it picked, and
PARSE_ERR() logs a failure. Both messages go to the console ring, and
console_init_preirq() replays the ring to each console that comes up,
VGA included. Only a hang or a crash inside the scan goes unreported,
as with "pci" and "amt" today.

To limit what an unexpected scan can touch, "auto" only considers
devices that are in uart_config[]. A serial-class device without
built-in parameters is skipped before its BARs are sized, so a
firmware that misreports the legacy port cannot move com1 to an
arbitrary plug-in card.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 docs/misc/xen-command-line.pandoc |  9 ++++--
 xen/drivers/char/ns16550.c        | 46 ++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a6f08463d1..6fff62800f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -357,7 +357,7 @@ ACPI indicating none to be there.
 
 ### com1 (x86)
 ### com2 (x86)
-> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
+> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt|auto][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
 
 Both option `com1` and `com2` follow the same format.
 
@@ -387,6 +387,9 @@ Both option `com1` and `com2` follow the same format.
   avoiding Intel AMT devices.
 * `amt` indicated that Xen should scan the PCI bus for the UART,
   including Intel AMT devices if present.
+* `auto` indicates that Xen should use the default I/O base if a UART
+  responds there, and otherwise scan the PCI bus for the UART as `pci`
+  does, but only for devices with built-in parameters in Xen.
 
 A typical setup for most situations might be `com1=115200,8n1`
 
@@ -411,9 +414,9 @@ The accepted name keywords for name=value pairs are:
 * `clock-hz`- accepts large integers to setup UART clock frequencies.
               Do note - these values are multiplied by 16.
 * `data-bits` - integer between 5 and 8
-* `dev` - accepted values are `pci` OR `amt`. If this option
+* `dev` - accepted values are `pci`, `amt` OR `auto`. If this option
           is used to specify if the serial device is pci-based. The io_base
-          cannot be specified when `dev=pci` or `dev=amt` is used.
+          cannot be specified when `dev=pci`, `dev=amt` or `dev=auto` is used.
 * `io-base` - accepts integer which specified IO base port for UART registers
 * `irq` - IRQ number to use
 * `parity` - accepted values are same as positional parameters
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cdda28879e..56de4d50fb 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -66,6 +66,7 @@ static struct ns16550 {
     bool dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
+    bool pci_fallback;      /* if =1, scan PCI if io_base has no UART */
     bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
     pci_sbdf_t pci_bridge;
@@ -727,6 +728,7 @@ static int __init parse_parity_char(int c)
     return 0;
 }
 
+/* Returns 1 if a UART answers at io_base, 0 if none does, -1 if untestable. */
 static int __init check_existence(struct ns16550 *uart)
 {
     unsigned char status, scratch, scratch2, scratch3;
@@ -737,9 +739,9 @@ static int __init check_existence(struct ns16550 *uart)
      * if we're getting MMIO UARTs, the arch code knows what it's doing.
      */
     if ( uart->io_base >= 0x10000 )
-        return 1;
+        return -1;
 #else
-    return 1; /* Everything is MMIO */
+    return -1; /* Everything is MMIO */
 #endif
 
     pci_serial_early_init(uart);
@@ -1321,6 +1323,10 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                     }
                 }
 
+                /* Keep "auto" off unknown devices, including their BARs. */
+                if ( uart->pci_fallback && i == ARRAY_SIZE(uart_config) )
+                    continue;
+
                 if ( port_idx >= param->max_ports )
                 {
                     idx -= param->max_ports;
@@ -1628,6 +1634,11 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
                 return true;
             conf += 3;
         }
+        else if ( strncmp(conf, "auto", 4) == 0 )
+        {
+            uart->pci_fallback = true;
+            conf += 4;
+        }
         else
 #endif
         {
@@ -1745,6 +1756,11 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
                 pci_uart_config(uart, 0, uart - ns16550_com);
                 dev_set = true;
             }
+            else if ( strncmp(param_value, "auto", 4) == 0 )
+            {
+                uart->pci_fallback = true;
+                dev_set = true;
+            }
             else
                 PARSE_ERR_RET("Unknown device type %s\n", param_value);
             break;
@@ -1785,6 +1801,7 @@ static void __init ns16550_parse_port_config(
 {
     char com_console_options[128];
     char *str;
+    int present;
 
     /* No user-specified configuration? */
     if ( (conf == NULL) || (*conf == '\0') )
@@ -1818,8 +1835,29 @@ static void __init ns16550_parse_port_config(
         PARSE_ERR("%d stop bits are unsupported.", uart->stop_bits);
     if ( uart->io_base == 0 )
         PARSE_ERR("I/O base address must be specified.");
-    if ( !check_existence(uart) )
-        PARSE_ERR("16550-compatible serial UART not present");
+    present = check_existence(uart);
+#ifdef CONFIG_HAS_PCI
+    if ( uart->pci_fallback && present < 0 )
+        PARSE_ERR("\"auto\" needs a base that can be probed");
+#endif
+    if ( !present )
+    {
+#ifdef CONFIG_HAS_PCI
+        if ( uart->pci_fallback )
+            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
+
+        /*
+         * A failed scan puts back the rejected base, and check_existence()
+         * can't test an MMIO BAR, so only ->param says that a device was
+         * found.
+         */
+        if ( uart->pci_fallback && uart->param && check_existence(uart) )
+            printk("ns16550: com%zd: no UART at default base, using %pp\n",
+                   uart - ns16550_com + 1, &uart->pci_device);
+        else
+#endif
+            PARSE_ERR("16550-compatible serial UART not present");
+    }
 
     /* Register with generic serial driver. */
     serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
-- 
2.55.0


