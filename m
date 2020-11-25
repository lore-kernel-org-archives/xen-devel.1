Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3653C5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 08:49:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2303A20637
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 08:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XyoXnOj9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2303A20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37446.69808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqUN-0003HW-RJ; Wed, 25 Nov 2020 08:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37446.69808; Wed, 25 Nov 2020 08:49:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqUN-0003HP-O4; Wed, 25 Nov 2020 08:49:23 +0000
Received: by outflank-mailman (input) for mailman id 37446;
 Wed, 25 Nov 2020 08:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqUM-0003HK-GP
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:49:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da7568d2-6e50-4441-a603-52bebf66854c;
 Wed, 25 Nov 2020 08:49:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9945AC90;
 Wed, 25 Nov 2020 08:49:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqUM-0003HK-GP
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:49:22 +0000
X-Inumbo-ID: da7568d2-6e50-4441-a603-52bebf66854c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id da7568d2-6e50-4441-a603-52bebf66854c;
	Wed, 25 Nov 2020 08:49:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606294161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U1LKbOfB2ZMjw4na7OMaZ9Bq1kO31mvqo/7Y3UNtHJw=;
	b=XyoXnOj9Wknf1zmg1tFyZwodveuixxGPUub6kVYP+VBBtOqYJcMEqsmqabjaeV23bL3CAh
	hs7oLozAVrfdkRnmX/gXYdDwM4O03N5BDk6fH3BlKOKvMjfAtsMf+qBKQCAD/Iyn+djxVA
	ND2ZL8n9+NE9E0kGYu2mQDOy3jBJJZc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E9945AC90;
	Wed, 25 Nov 2020 08:49:20 +0000 (UTC)
Subject: [PATCH 2/5] x86/build: limit #include-ing by asm-offsets.c
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Message-ID: <d7ac370e-2e1f-5b7a-b832-63577689053c@suse.com>
Date: Wed, 25 Nov 2020 09:49:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This file has a long dependencies list and asm-offsets.h, generated from
it, has a long list of dependents. IOW if any of the former changes, all
of the latter will be rebuilt, even if there's no actual change to the
generated file. Therefore avoid including headers we don't actually need
(generally or configuration dependent).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -5,11 +5,13 @@
  */
 #define COMPILE_OFFSETS
 
+#ifdef CONFIG_PERF_COUNTERS
 #include <xen/perfc.h>
+#endif
 #include <xen/sched.h>
-#include <xen/bitops.h>
+#ifdef CONFIG_PV
 #include <compat/xen.h>
-#include <asm/fixmap.h>
+#endif
 #include <asm/hardirq.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
@@ -101,7 +103,6 @@ void __dummy__(void)
 #ifdef CONFIG_PV
     OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
     BLANK();
-#endif
 
     OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
     OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
@@ -110,6 +111,7 @@ void __dummy__(void)
     OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
     OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
     BLANK();
+#endif
 
     OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
     OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);

