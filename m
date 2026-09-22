Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B500C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 18:43:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429417.1652297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95Sq-0007yh-KG; Tue, 22 Sep 2026 18:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429417.1652297; Tue, 22 Sep 2026 18:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95Sq-0007ya-Gd; Tue, 22 Sep 2026 18:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1429417;
 Tue, 22 Sep 2026 18:43:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1x95Sp-0007yP-GO
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 18:43:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x95So-006dB4-Be
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 20:43:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab2cc47-e002-0a2a0a5209dd-0a2a4505c714-30
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:43:34 +0200
Received: from [74.125.224.170] (helo=mail-yx2-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab2cc55-4cb1-0a2a45050019-4a7de0aa8d9b-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:43:34 +0200
Received: by mail-yx2-f42.google.com with SMTP id
 00721157ae682-89666ee9b3bso3799877b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:43:33 -0700 (PDT)
Received: from StolidWingnut.axolotl-tone.ts.net ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8a4658c723asm1141807b3.15.2026.09.22.11.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 11:43:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.io header.i="@edera.io" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1790102613; x=1790707413; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=29xwDDSi2fCcXa+moxCVRPRT7c5WgBkgjLtY01+nTtM=;
        b=ffMv+K3EM6mv7X/lWUCvFSLXwKioRoyz2RDtQER0vz4LSDbJwpQV6/BhFQIFOqWwYG
         UIMYJVKihtk5JXljBQdHjRJlY3PCZvOV/rYZy0Lk2u7LcS5+Ou1QVQGx5HcMq5wyLrD2
         mQeZ6iYRvhVVGI9Gtk4PgjovYB91afCT1X+BF0owL2udSjcKjxCXHS7GPrP3gsBifUHk
         wsc6H2Gy38iE7HTg9RFbHt7ohZsJ19vUe5IjG9zipMKhm67aL130aGHQPhXhkwSVgi76
         Ir1lEtJ9Aeiq5+DHXtjhFB+hgeQ0/Y76pt9kt5SwWYPWvmt0JLVNyQMaowLWBQGDrFKy
         agGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102613; x=1790707413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29xwDDSi2fCcXa+moxCVRPRT7c5WgBkgjLtY01+nTtM=;
        b=GOqMgzH/owIJArtofb/9xZA4vHsuj0OKUsFGrNBgiKMlnEjyHiyuaKfCDc8bwzC1jS
         YSm32P7QIyI1NVGF7qTk+8NBXES7xrgQO49gE+tlCbSF2p2fAleUeLmD6dOZZWHE3+8E
         0UtMDTM1SBzJ0503MaRyxP0s47zlKpMfVzSNFQCEcf0l/j22wbx2KvHE9YnepgWCsKEl
         aedYN9JBlaiHC+Scmrr3fSNPc106illC4x+B4CDDNe9nyXrg9p/9T3Tjxy3RNub4+wCj
         gx4zpJXrvwp3RoL/JRhawj0ULgBWcZsnf0Khul1zx6+7D+FCsIuKJNPaNXqagQtL06ZE
         Tggw==
X-Gm-Message-State: AFuF++m717//7kMEA+cvE6jeqTETBeFkY2lQVaDOJ1KpdIqyIbp7vDUt
	6KTyHh7B5nWhQJaD66N87tBtOxZT/wNFbuLNf7aTrwDoS9OZ4DA3YfOBBs0WGSZDIsjx2fFRXTW
	aCpsqBpk=
X-Gm-Gg: AYBFou12H++Z8UEC3Zz8WbFUrwMtL3cNY2jmzM6g0mQyEtfClmtxZfzPmzEm6ipXcsw
	Kzq+Midu83epN1qQ3zfVKzoJgflMsrrcR2wTcaU+lJW1Gg27P4VnEXel7muLwC4McjDoLq4eVLZ
	+NM3rBFp6hNOMv6WNe5banUrjfavKh5bz3M3CSfR88/lgIfRzKYBEytv/IJaBuihNeXmjIoihoy
	3Jo40bvg/BDD7mzYmdv3NsgBHzAB3Y5S+K76IW1+0E7c560+DUJeFOUuqDOOiaVS1Dw5HLUbAsf
	Racxj7CtT+aHHx7vq4iyiRkIvKqygePTwh310AGIUIbMlP+yOdIvg7gVXHYJL494G0MJJB8Dx4v
	OsecD+WiuNziqVP64Arv+Q0n3HAQn48RCIbn4PC4tQ3YLj6pyzVozTbzm2MAssZNcbjijRR9pk0
	5zdwT72v74IxsOs4ooq+PmG2jMep3+Q4cMglmuVH7sgwKIqKTZ6J6oj+TEk+kZd3WJZIST7iYqi
	Uv9D8c7ynzWso468DASySomMeHMOfVlhYrPIgjBqMhKE0BGzvSIbvEoQYZZkMyGHqTynFiejwwu
	Sq0TiQ==
X-Received: by 2002:a05:690c:a6d4:b0:888:7a02:280d with SMTP id 00721157ae682-8a45afa799emr2654537b3.30.1790102612569;
        Tue, 22 Sep 2026 11:43:32 -0700 (PDT)
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
Subject: [PATCH] ns16550: find the console UART on PCI when there is no legacy one
Date: Tue, 22 Sep 2026 14:43:16 -0400
Message-ID: <20260922184316.324817-1-benjamin@edera.io>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790102614-6BEB92A1-8F0D6B88/0/0
X-purgate-type: clean
X-purgate-size: 5800

Amazon EC2 bare metal instances have no UART at the legacy I/O port
0x3f8. Their only serial port is a 16550-compatible PCI device (vendor
0x1d0f, device 0x8250) with its registers in the MMIO space of BAR 0.
Today Xen has no console on these systems unless the command line
names that device, and "com1=...,pci" cannot find it, because
uart_config[] doesn't have it.

Add the device to uart_config[].

Additionally, when the port that com1 describes is not present, scan PCI
for a known UART before giving up. This way the same command line works on
systems with and without a legacy UART, and a machine-specific "pci"
option is not needed. The fallback does not run when the command line
gave an I/O base, or when it already asked for a scan with "pci" or
"amt", so explicit config keeps its current meaning. It is
for com1 only: for com2, pci_uart_config() skips the first port it
finds, so it can never match a single-port device.

When the scan finds nothing, pci_uart_config() puts back the original
base, and check_existence() does not test MMIO addresses.

On a system with a legacy UART, check_existence() passes and nothing
changes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 xen/drivers/char/ns16550.c | 47 +++++++++++++++++++++++++++++++++++++-
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 120ac09d23..d5403598d2 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -64,8 +64,10 @@ static struct ns16550 {
     bool intr_works;
     bool force_polling;
     bool dw_usr_bsy;
+    bool io_base_set;       /* if =1, io_base came from the command line */
 #ifdef NS16550_PCI
     /* PCI card parameters. */
+    bool pci_scanned;       /* if =1, pci_uart_config() already ran */
     bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
     bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
     pci_sbdf_t pci_bridge;
@@ -98,6 +100,7 @@ struct ns16550_config {
         param_intel_lpss,
         param_wch_ch382,
         param_asix,
+        param_amazon,
     } param;
 };
 
@@ -909,6 +912,13 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .bar0 = true,
         .max_ports = 1,
     },
+    [param_amazon] = {
+        .reg_width = 1,
+        .lsr_mask = UART_LSR_THRE,
+        .bar0 = true,
+        .mmio = true,
+        .max_ports = 1,
+    },
 };
 
 static const struct ns16550_config __initconst uart_config[] =
@@ -1255,6 +1265,12 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x9910,
         .param = param_asix
     },
+    /* Amazon EC2 bare metal UART, the only serial port on those systems */
+    {
+        .vendor_id = PCI_VENDOR_ID_AMAZON,
+        .dev_id = 0x8250,
+        .param = param_amazon
+    },
 };
 
 static int __init
@@ -1263,6 +1279,8 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
     u64 orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
 
+    uart->pci_scanned = true;
+
     /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
     for ( b = skip_amt ? 1 : 0; b < 0x100; b++ )
     {
@@ -1618,6 +1636,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #endif
         {
             uart->io_base = simple_strtoull(conf, &conf, 0);
+            uart->io_base_set = true;
         }
     }
 
@@ -1693,6 +1712,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
                 break;
             }
             uart->io_base = simple_strtoull(param_value, NULL, 0);
+            uart->io_base_set = true;
             break;
 
         case irq:
@@ -1805,7 +1825,32 @@ static void __init ns16550_parse_port_config(
     if ( uart->io_base == 0 )
         PARSE_ERR("I/O base address must be specified.");
     if ( !check_existence(uart) )
-        PARSE_ERR("16550-compatible serial UART not present");
+    {
+        bool present = false;
+
+#ifdef NS16550_PCI
+        /*
+         * Some systems, EC2 bare metal among them, have no legacy UART and
+         * carry their only serial port on PCI. Look for one before giving up,
+         * unless the command line named a base or already asked for a scan.
+         * com1 only: for com2 the scan skips the first port it finds, so it
+         * can never match a single-port device.
+         */
+        if ( uart == ns16550_com && !uart->io_base_set && !uart->pci_scanned )
+        {
+            pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
+            /*
+             * A scan that matched nothing puts back the base we just rejected,
+             * and check_existence() passes MMIO addresses through untested, so
+             * ps_bdf_enable is what says a device was found.
+             */
+            present = uart->ps_bdf_enable && check_existence(uart);
+        }
+#endif
+
+        if ( !present )
+            PARSE_ERR("16550-compatible serial UART not present");
+    }
 
     /* Register with generic serial driver. */
     serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index fd424ef55d..a17c88dcf7 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -17,6 +17,8 @@
 
 #define PCI_VENDOR_ID_WCHIC              0x1c00
 
+#define PCI_VENDOR_ID_AMAZON             0x1d0f
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 
 #endif /* XEN_PCI_IDS_H */
-- 
2.55.0


