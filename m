Return-Path: <SRS0=3GnW=FZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D9C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 16:50:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A51122525
	for <xen-devel@archiver.kernel.org>; Mon, 21 Dec 2020 16:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A51122525
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57444.100481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOO0-0000pv-3I; Mon, 21 Dec 2020 16:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57444.100481; Mon, 21 Dec 2020 16:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krOO0-0000po-0K; Mon, 21 Dec 2020 16:50:16 +0000
Received: by outflank-mailman (input) for mailman id 57444;
 Mon, 21 Dec 2020 16:50:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DEM5=FZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krONx-0000pj-RG
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:50:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a99d8327-aa16-49db-8bc6-dfbf70236ede;
 Mon, 21 Dec 2020 16:50:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30411AD09;
 Mon, 21 Dec 2020 16:50:12 +0000 (UTC)
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
X-Inumbo-ID: a99d8327-aa16-49db-8bc6-dfbf70236ede
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608569412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=enTm/9GB+OWX/0sqZW9UDys9X+JqSoosCB3Lsl9kzrE=;
	b=llGHLVyxl/6Q5QCXcoGyNxU78N36cEi2AZ3DFJhz0yipajQh7vB0jUGi9vBqdHo8G9k5Wl
	8CUwmEECclbQezMcuOUI2I218oRGcbQnAQojhhWdIStx1ncCzJySmQSh9IEs3NfIwJU/pC
	j3lYhcmyBPR0mItVp6Qs3WqKUR5GuxQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Intel: insert Tiger Lake model numbers
Message-ID: <97963ff7-e37e-693b-5c02-a4f99669ccbe@suse.com>
Date: Mon, 21 Dec 2020 17:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Both match prior generation processors as far as LBR and C-state MSRs
go (SDM rev 073). The if_pschange_mc erratum, according to the spec
update, is not applicable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -183,6 +183,9 @@ static void do_get_hw_residencies(void *
     /* Ice Lake */
     case 0x7D:
     case 0x7E:
+    /* Tiger Lake */
+    case 0x8C:
+    case 0x8D:
     /* Kaby Lake */
     case 0x8E:
     case 0x9E:
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2436,6 +2436,12 @@ static bool __init has_if_pschange_mc(vo
         return true;
 
         /*
+         * Newer Core processors are not vulnerable.
+         */
+    case 0x8c: /* Tiger Lake */
+    case 0x8d: /* Tiger Lake */
+
+        /*
          * Atom processors are not vulnerable.
          */
     case 0x1c: /* Pineview */
@@ -2776,6 +2782,8 @@ static const struct lbr_info *last_branc
         case 0x7a:
         /* Ice Lake */
         case 0x7d: case 0x7e:
+        /* Tiger Lake */
+        case 0x8c: case 0x8d:
         /* Tremont */
         case 0x86:
         /* Kaby Lake */

