Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0292DCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 19:08:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448261.1664302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGhqn-0005xs-Bd; Tue, 13 Oct 2026 19:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448261.1664302; Tue, 13 Oct 2026 19:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGhqn-0005xl-8U; Tue, 13 Oct 2026 19:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1448261;
 Tue, 13 Oct 2026 19:07:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xGhql-0005xf-BD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 19:07:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGhqk-00Dwie-4P
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 21:07:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ace8169-8faa-0a2a0a5109dd-0a2a4501dddc-42
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 21:07:46 +0200
Received: from [202.12.124.159] (helo=fhigh-b8-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ace8180-5984-0a2a45010019-ca0c7c9f9bc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 21:07:45 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 0E6237A0074
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:07:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 13 Oct 2026 15:07:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 15:07:41 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1791918463; x=1792004863; bh=j+6JrncPQugIRbAHvnMoTmELLkm5bzQJ
	kwF5sPXA5bg=; b=ahS6WWEH0n70Yt/dYTeGAXMUaHqBdnx8Mwz2p19Wq1JQ6nJ1
	Kfs8A4JLzEbxNmnBVYeParset2CkN+da7PY+W6dCKnGl49mtlQPDNnWDKS5+7sXX
	2zH4kgZ2RXzOU7aE+TINifv7mA01RdaHWMX+JgZqAiAt1CT67f02vthmvGLYrW62
	TaBtJwqFFfpKArY7HGCgQqfraW20+1el4S6x5OhCmXSjDToaspHEaF2xLN8v61+h
	4mKD4WRKrVh8yH5NahvJFvmDJxX4iuTEPqec2VSRPvvj+oU5bJLwcILKoFwWyNF7
	0h4pt982/wNvv8yQ4QLBnswEgJ3jrqIHlI1JVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791918463; x=1792004863; bh=j+6JrncPQugIRbAHvnMoTmELLkm5
	bzQJkwF5sPXA5bg=; b=P5LbKjeQjjfBnfkfr5xBWFVBRpCvWZ4qlpAgKfbbDyp8
	L51cExA8rTv8mYM+149hdjcseuybqYK6Aw5ubiU9ccAVvXDt/Pya+6BGnWhbTMYK
	IdhYD20525EiJ0XE5k+N8Yb7NnNwwa3Hz42Yw87d4MzPH6NVt17xJWHH1pyHI6Q6
	psMbbCTFZPUKVc6OWDM/zq+W2/EuVZBRfWkOkcxs8KelA09ch8id5kFlyWOR0afo
	2y68qFsG3Wy7yVVOdHFFXF48nmjc8wI/i2rkExqth45+skgo2dOEY+EeST+khAul
	s3VQEWgTODZWFjirsLdXrHQPDQ7+oLXzQ2uF9HGbYg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791918463; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm2:rsa-sha256:K5Y5/SYygJ46gVOqnDgiy4m3Nx61ZWDIlrq7++sWMIIrDtX
	cawve0N1eUnbgMRtJG3Dm1xkFKNc2zydQmJNID8TydMa82Bnz/MuL7LtJ0OPGZ41
	FJ9uaMMiXGuWPLY0+ddq17tPFr4I0Vd97ewqttUNKSuQXkCOMMDKHawsQsjsVTnZ
	2aR9arNZE+HnYBuYHuwGDiaXtd+FJpUv1zsupe0bxUooR8QBMGSeJlL/SxDcSdCC
	lXa9qkdZSZ6Po00FfSORG44T+JCzVW8Ju3wsGp7CuFsmpYIvD0i50aNWGBRmAL5v
	Tmb+JXD8raCvcgHG4973XG6X9K+ZpR6qOsgUYmw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:73l1Ga0o0c+clrHXa1CkAoNDM/NtGOoKGPETbFU8Z68=:bVE4G8hqzCRTYNdA708j92bGUfnemoEIKiTSYwVgltQ=;
X-ME-Sender: <xms:f4HOamR7-zfhrILDyIvBSp8TaitOrHHm4DNXCKg-yep5VPOq9bJzrg>
    <xme:f4HOauVB03EuYMmJpXy6pEyffYMqKa_vxV_7OcqcY-GC6I3Q9YEQRv8a8ZvqSW3aR
    vchiudBBG-8uSTPJ2KH3smSHzNtI_2OeVG0vUk1s12EjqRTrpc>
X-ME-Received: <xmr:f4HOanehYCA50WcD5jPpegUu5tE1x3ll50e4IdXaGq2z5Px_zllzOjaMKgLMYAa1Te6j8Iap6elcyO_MlF948Sz1AoIiAw2Fx_nj9M328huJsVocfdE>
X-ME-Proxy-Cause: dmFkZTGqNqXzjZ+lWuvAX0utJ4EiLSJCWj3QM1sVHAz5MjIqkJEkHoWqKRp6ha2Rr6iGko
    tdsisdUkikWSKYeB0pvLlJUXo7VPi9znZlR2se2TRtnWXjHxLlToz5AKTY3tdJfdMzP6uh
    W8uLTUON9+8cTKZoIkFtDAV8NCUkYq/L89dzXBr516nFXcj1MRag5IFTwkzIHAmoNSrcrh
    JjoLr+qJY6mYTd3RFAbcZNEw9WllWOq+EBWPELEcwJ5dxGzs6xoEZvWHIcke2qu70Sm503
    /eIwHiMj/gybIOmBGsrcdW0k2srd99r9aDFVoJmbX2p+buxxhHHPzZBEscoNkAIsoXt6Js
    y8Sxa+K075D1/iUUK+dx1jsKy8HnsuL7h2r0yUkC5Gx+Cc/ew2qggZ47XH9WBT8Bo9IgTh
    vUTQTKLEZZNcvXxAB/Ghk4UU+gVX0lzRqP2NZuxJDfSAg3KakpaFnVbljeqJ3D0926XAhE
    UoBe9mZOv2uj4mK+WdQbDBuDjlDNKOa4v+QXTy+2yZGbN/ttuxY7l6BZHo0SDaZdagOiPE
    3uq9g7cWreiKfoPYMkUmA7xVSkr+KfHCP3zmgcpirepAf1Z4taShHEH3BVWJ4lJjt7RcUg
    cdmBkD0i0eoZ5MyE3hGmm9lqGYa0GsyypPNrMp5oIocScQQTgaFsa5pM15wA
X-ME-Proxy: <xmx:f4HOaiJfdrMUAUZ-NO1YrXmj6Pmr3kvFMXWcwk4gMlMK6QHeI9Mwmg>
    <xmx:f4HOakw9t3NL2IcI_Fa9_THpeM_a_DNs7vrkizivKhpp1ZJTXZDlpw>
    <xmx:f4HOaosXyWFWwi7L4LtLIzcy2sCMlyjFaUB2cEaQHc_RPDQftsbQXA>
    <xmx:f4HOanDk8FTrPDipHRhUgORKYPRBjxpC9lg1MkqFVlR_ovahT6HqOA>
    <xmx:f4HOaq5G8hVoI5uEJ3S_uGjqw6HT4mBvpIRn2BvI4kTi8R-LKBpbnpk9>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] drivers/char: Add several newer PCI IDs for Intel LPSS
Date: Tue, 13 Oct 2026 21:07:31 +0200
Message-ID: <20261013190735.365024-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1791918466-C4558757-F3CCDFF3/0/0
X-purgate-type: clean
X-purgate-size: 4986

Include PCI IDs of UART ports on Intel RPL - PTL. Based on Linux driver
and hwdata, they all share the same parameters.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I tested it on MTL, but given Linux driver handles them uniformly, I
assume others work too.

The list gets quite long, would it be preferred to have a macro to
reduce (at least similar) entries to one-liners? In Linux driver it
looks this way:
    /* MTL-P */
    { PCI_VDEVICE(INTEL, 0x7e25), .driver_data = (kernel_ulong_t)&bxt_uart_info },
    { PCI_VDEVICE(INTEL, 0x7e26), .driver_data = (kernel_ulong_t)&bxt_uart_info },
    ...
---
 xen/drivers/char/ns16550.c | 132 +++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cdda28879e66..be388c8e6582 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1245,6 +1245,138 @@ static const struct ns16550_config __initconst uart_config[] =
         .dev_id = 0x7adc,
         .param = param_intel_lpss
     },
+    /* Intel Corp. RPL-S LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7a28,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. RPL-S LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7a29,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. RPL-S LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7a5c,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. LNL-M LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa825,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. LNL-M LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa826,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. LNL-M LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xa852,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTL-P LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7e25,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTL-P LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7e26,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTL-P LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7e52,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTP-S LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7f28,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTP-S LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7f29,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTP-S LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7f5c,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. MTP-S LPSS PCI UART #3 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0x7f5d,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. NVL-H LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xd325,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. NVL-H LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xd326,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. NVL-H LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xd352,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-H LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe325,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-H LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe326,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-H LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe352,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-P LPSS PCI UART #0 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe425,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-P LPSS PCI UART #1 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe426,
+        .param = param_intel_lpss
+    },
+    /* Intel Corp. PTL-P LPSS PCI UART #2 */
+    {
+        .vendor_id = PCI_VENDOR_ID_INTEL,
+        .dev_id = 0xe452,
+        .param = param_intel_lpss
+    },
     /* WCH CH382 2S1P */
     {
         .vendor_id = PCI_VENDOR_ID_WCHIC,
-- 
2.54.0


