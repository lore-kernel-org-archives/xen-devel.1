Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AD9C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:40:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430938.1653349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P57-0004tI-2d; Wed, 23 Sep 2026 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430938.1653349; Wed, 23 Sep 2026 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9P56-0004tB-Vr; Wed, 23 Sep 2026 15:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1430938;
 Wed, 23 Sep 2026 15:40:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1x9P55-0004t1-Qp
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:40:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9P55-006pms-4I
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:40:23 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab3f2e2-8faa-0a2a0a5109dd-0a2a450ced3e-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:40:23 +0200
Received: from [74.125.224.140] (helo=mail-yx2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6ab3f2e5-f479-0a2a450c0019-4a7de08ccb6f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:40:22 +0200
Received: by mail-yx2-f12.google.com with SMTP id
 00721157ae682-85d440939f0so12350497b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:40:22 -0700 (PDT)
Received: from StolidWingnut.axolotl-tone.ts.net ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8a465ec41acsm11211697b3.26.2026.09.23.08.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 08:40:20 -0700 (PDT)
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
        d=edera.io; s=google; t=1790178021; x=1790782821; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRSBigR+fNtVFjx5bu3waR1j8HxydhkAAJV7I+0HM74=;
        b=ryozL9GSP7GQnj9DSEnHbw5lP8HgUd3bayjhyrtRp1VTvREKe4Q/ko/i0QkcU7jYkb
         31pJ7eSFNCMrEuEqqqDr3CdhHsIFO6o0bLIgvW2C7fWhnBk6LVtvCEzMtQUF71vEI81l
         CajmXv+WdeC6JmCAIhb5N3M7Hu6yoJiNdqF26coeVR86+VMXK3EsnlNnmABxc1/JkpAh
         a13ye66ckGi4tBjdMekQ2jMiQ+rMm4FKBCbxALMi+/8nDDG7inL+Ueo0ubEpuftnuLth
         9ecdtxx/54lcv96uR6PzPlsNWFyKtQGlH6TAxrm3LILuwWRGE3BTphbNHFttXOsgcQQr
         Jx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178021; x=1790782821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRSBigR+fNtVFjx5bu3waR1j8HxydhkAAJV7I+0HM74=;
        b=iT5EejCvIGF0TT3keMnV3eqRtY0UVUoux8/4V8glQrgHZVN9xo782oeDUdJgWJXrsR
         WPkVIMMC+l3ieLnXl4Xi0bQ8AckLbQxnZmjYta6wP7G6Vv5nmupJCJdfEfx+103+qZJC
         Vvr/ya6aX+aZ3tUNT4c91M0DvVwlfsOmznv0zijg981/Ta/nfsdYSdId0fMFwURzWnMn
         NxavEqV44ELEbE/owbxrNM8zS/uuGb4Qi3VIX45Xg5cBY4tbflp5APXwHoLcOI63jMYM
         CDIgxLPsgkYtSDttsJbXv0iuqT9g6zkrdZKVPsayHNaeW3q68XE34hk3Hj5S/zCSYNGf
         Ys0w==
X-Gm-Message-State: AFuF++mrEVzE5ZczdRSsz5Ggt/zxyhNU48kvCHS3BQOtCTUGDLBtcV+t
	CpWMUoVc5pCexDJkeSQnEvy7SI36paSoncmRu/W88/LGGq/34XvX/rJqqTscr7HLpQ8tYI2YBF6
	Po9uFDzg=
X-Gm-Gg: AYBFou0NsJo8qPFSVoIY1F0d5PhlsSHYr0J0jjSIPKhWpo/bt6phkWOADxggTzctWnl
	uyQ05Lg/aL28IXqYI7JSzrE8RdwG57U2PAXvBl3otVJNWBwWD9CsaPizHNI2Yr/fQgqRxkLBtkO
	72yG3Kxzy7R87ZFJd+o91SZdCnxBrJbVs7PpEieyAQAuUFf2QmbA+CulzHjTKbFn5FS4vttIQrS
	JR1hyZqr6+BVza8lGj+R7hY6ffMmtxhQdsOk7iYkVBAoiAbeR+kFsaxBsp6FDjBVEtpGIdv7zdf
	qGChtgO0DXYUoe65fZ0Sql9iaWXbthO1WkMDmQXmchmJ7HqBdscmgCN9UXWvIHFB8wziubP6k6b
	yweiNHNj8jMbvRDhG7GRX0glKeQgg+r6dbH2WYdu3YuGU1lsx0RvY6JhS1DjjBUE84A46NBwck9
	cUagoW/7zy6/7A01q4yAn06YKZafk5XjfhyE9Xb7ry4fY597itYSH0KT4cyYHga8/9C1/ftM875
	Dq9fHFJl86PdFnReQm44NpLhiGFZuFZGiYuh++DGdlR/xqu6FXqTWMwom1vzEV8IdGvKll0z963
	Ve479WemF4RCvcrXKg==
X-Received: by 2002:a05:690c:c59c:b0:873:5bb2:6bff with SMTP id 00721157ae682-8a45b09e620mr17371697b3.41.1790178021171;
        Wed, 23 Sep 2026 08:40:21 -0700 (PDT)
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
Subject: [PATCH] ns16550: add the Amazon EC2 PCI serial device
Date: Wed, 23 Sep 2026 11:39:33 -0400
Message-ID: <20260923153933.2024896-1-benjamin@edera.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922184316.324817-1-benjamin@edera.io>
References: <20260922184316.324817-1-benjamin@edera.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790178023-022C0A5B-E2C9AA9A/0/0
X-purgate-type: clean
X-purgate-size: 2288

Amazon EC2 bare metal instances have no UART at the legacy I/O port
0x3f8. Their only serial port is a 16550-compatible PCI device (vendor
0x1d0f, device 0x8250) with its registers in the MMIO space of BAR 0.

pci_uart_config() uses the default parameters for a device that is not
in uart_config[], and those only accept an I/O BAR, so "com1=...,pci"
cannot find this device. Add it, with the same layout that Linux uses
(commit 3bfd1300abfe ("serial: 8250_pci: Add Amazon PCI serial device
ID")): one port at the start of BAR 0, 1-byte registers, and the
default 1.8432MHz clock.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 xen/drivers/char/ns16550.c | 14 ++++++++++++++
 xen/include/xen/pci_ids.h  |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 120ac09d23..593d208483 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -98,6 +98,7 @@ struct ns16550_config {
         param_intel_lpss,
         param_wch_ch382,
         param_asix,
+        param_amazon,
     } param;
 };
 
@@ -909,6 +910,13 @@ static const struct ns16550_config_param __initconst uart_param[] = {
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
@@ -1255,6 +1263,12 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x9910,
         .param = param_asix
     },
+    /* Amazon EC2 bare metal UART */
+    {
+        .vendor_id = PCI_VENDOR_ID_AMAZON,
+        .dev_id = 0x8250,
+        .param = param_amazon
+    },
 };
 
 static int __init
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


