Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02143CA9EBB
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 20:26:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444696.1661390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFHAG-0000W5-U6; Fri, 09 Oct 2026 20:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444696.1661390; Fri, 09 Oct 2026 20:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFHAG-0000Vx-QL; Fri, 09 Oct 2026 20:26:00 +0000
Received: by outflank-mailman (input) for mailman id 1444696;
 Fri, 09 Oct 2026 20:26:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1xFHAF-0000Vo-PG
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 20:26:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFHAF-009hdL-6B
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 22:25:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ac94dc0-8faa-0a2a0a5109dd-0a2a4506df62-14
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 22:25:59 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ac94dd6-195a-0a2a45060019-d15580afa8f7-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 22:25:59 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-8aca54b75d4so16860147b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:25:58 -0700 (PDT)
Received: from StolidWingnut.localdomain ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b07f1eab6csm11469547b3.20.2026.10.09.13.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 13:25:56 -0700 (PDT)
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
        d=edera.io; s=google; t=1791577557; x=1792182357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viiD07VAm0wzPwhi7WCLojzjM3p/uz3mpHV0GNtwMuE=;
        b=NLpS+QGJPwlc+gxi4SrepdIdDcZm8znZBNYWKPAvAcoisdZKnqHVhv1zRggl1i4TnZ
         BSO5DqrY4Eh3m/PAfbuWeeEfVsN8Tin4WRDny1vjkNxQ7qfgHs5nhkTpzNdt86K5uRoE
         02o/2fhjtQzfbRibuijeMEg7lbwcZjuyxKyL8wE0M8RMGuIo32Nzl30zo6TxcDUEhARO
         kKuKEZaWC9MIhT+nszOnGjdhx2VLD0MYBCablb0B35/OC6uTp9/P5bTUJmsmjF8sqnr4
         VDnBW2+A9BK0nuoPjB444EnKTGgQjkUyo8A0Q8T48i30Xo1sZXh6SyUpR5B/OgPbb0P5
         nj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791577557; x=1792182357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=viiD07VAm0wzPwhi7WCLojzjM3p/uz3mpHV0GNtwMuE=;
        b=OtYBFhvZEBNHUTg9PW2S7jrRy9RHkIcB1n5M8bEZopCGvLmU1NZD2xSqa7E1WT7qPO
         BdQtxSiILxlNQE0S2P3W8M9PNzzulqFCTXoDDSnB+dDQxw6V8T+xeTTxBV095ngeGbq5
         4WPFOey8DaJei//mupEDnBh6MkB4t2DE6xNQ4oLMm41jJJpMCcNJ/vrkOC1QxLX6vSso
         nPpeIdO6Za/AVMfbvbEnr5I7VCjX8nY0dkV9ml4Waq35tPe0BX5EOfikhmwvyabrrxnp
         U7ZWmlNbowyWoQj2VRFoFu00HAkNf/GG6b9EXVcxLQbKtZ5YYgCeAJ8uMaxcneuZC/Cw
         f3ZA==
X-Gm-Message-State: AFq9FYKllLiKh0SxTu5QuoFyNrJvdTKCMzcrNkvR9XvW4uBPr9od+ZfV
	0730NAUT+e4TYHl78SHhPjKJDr86zCKXGyCVgy3mDRQiTIPtUhZjD6+jf6/d9Mzawt6H6yurjk/
	UthslKQUBJg==
X-Gm-Gg: AYBFou3THsk7YmeAhc9S4mKjdBVI6TBB54raBFtxVdIcaWmi7HMhKR4fIdZP+f58sVb
	/L30M+bcV7Ozs/HQYaUTbv0qPDAUtwlSRJuZCwifAVYkICarSWqLDkQflDSU2oHJKWh6GJbJCkx
	7tYnOcahgj1w84WtJlKMIQk1cwhIvN64v4WhmC7ippkUw/QliEynfGg1PJzc9zR820LDwhIRhVh
	pylrPOvgE9UrU9ow8uiGwZF19aXO9j7eBih3bXy0nXNHj6wHqlAV7exKiDYH5AS8k2dqwaLaPXi
	onyUGRLEAz0sKPaYaXM3459KxTOuXFHQRrFPr0MHHGViUSkxmS+h0itaSh6vhm/VXVefFmmjxBX
	bktLbJ5LLQ1oMtvWbNZWW5A5O5XNl5ZI+GoKtDVSj4MLnefZOOnY2Uy5n1A9j30TNtk2sRPQiIb
	TK6nB0kOL0CDGTZCnfd9IRY5bxWo45f74jofhE7tAdf05dCqCwb4U0GkgZwLalh3IQuVJAfV9zH
	Y4toS9hPJh/Bjc9E9Q8QpZHLdGHGCjySf7BzRp5n0E+z2lZLYK8m//AO9VdNyVXSwZ0FAc=
X-Received: by 2002:a05:690c:c50d:b0:890:f416:7a27 with SMTP id 00721157ae682-8b07ed91534mr9377927b3.19.1791577557288;
        Fri, 09 Oct 2026 13:25:57 -0700 (PDT)
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
Date: Fri,  9 Oct 2026 16:24:47 -0400
Message-ID: <20261009202447.852414-1-benjamin@edera.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922184316.324817-1-benjamin@edera.io>
References: <20260922184316.324817-1-benjamin@edera.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791577559-F6C7777B-A7031A45/0/0
X-purgate-type: clean
X-purgate-size: 5461

On some systems the console UART is at the legacy I/O port, and on
others, such as Amazon EC2 bare metal instances, the only UART is on
PCI. "com1=...,pci" finds the PCI UART, but it prefers any PCI serial
device to the legacy port, so it is not correct on a system that has
both. No option today says "use the legacy port, and scan PCI only if
it has no UART". A deployment that boots one command line on many
kinds of machine needs exactly that.

Add "auto" as a value in the <io-base> position. With it, Xen probes
the default base as usual. Only if check_existence() fails there does
it scan PCI, as "pci" does. Without "auto", nothing changes.

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

When the scan finds nothing, pci_uart_config() puts back the original
base, and check_existence() does not test MMIO addresses. Thus
ps_bdf_enable, not check_existence(), tells whether a device was
found.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 docs/misc/xen-command-line.pandoc |  5 ++++-
 xen/drivers/char/ns16550.c        | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ea0e3368b1..58ef53a5b2 100644
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
 
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cdda28879e..ab55e2ba45 100644
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
@@ -1321,6 +1322,10 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                     }
                 }
 
+                /* Keep "auto" off unknown devices, including their BARs. */
+                if ( uart->pci_fallback && i == ARRAY_SIZE(uart_config) )
+                    continue;
+
                 if ( port_idx >= param->max_ports )
                 {
                     idx -= param->max_ports;
@@ -1628,6 +1633,11 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
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
@@ -1819,7 +1829,26 @@ static void __init ns16550_parse_port_config(
     if ( uart->io_base == 0 )
         PARSE_ERR("I/O base address must be specified.");
     if ( !check_existence(uart) )
-        PARSE_ERR("16550-compatible serial UART not present");
+    {
+#ifdef CONFIG_HAS_PCI
+        if ( uart->pci_fallback )
+        {
+            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
+            if ( uart->ps_bdf_enable )
+                printk("ns16550: com%u: no UART at default base, using %pp\n",
+                       (unsigned int)(uart - ns16550_com) + 1,
+                       &uart->pci_device);
+        }
+
+        /*
+         * A failed scan puts back the rejected base, and check_existence()
+         * passes MMIO addresses untested, so only ps_bdf_enable says that
+         * a device was found.
+         */
+        if ( !uart->ps_bdf_enable || !check_existence(uart) )
+#endif
+            PARSE_ERR("16550-compatible serial UART not present");
+    }
 
     /* Register with generic serial driver. */
     serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
-- 
2.55.0


