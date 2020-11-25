Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530F8C56201
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 08:50:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE73520637
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 08:50:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="F/riuD7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE73520637
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37453.69820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqUu-0003Ok-8L; Wed, 25 Nov 2020 08:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37453.69820; Wed, 25 Nov 2020 08:49:56 +0000
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
	id 1khqUu-0003Od-5D; Wed, 25 Nov 2020 08:49:56 +0000
Received: by outflank-mailman (input) for mailman id 37453;
 Wed, 25 Nov 2020 08:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqUt-0003OW-CT
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:49:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db0f7686-f875-4e5d-82d4-45c46b5d9328;
 Wed, 25 Nov 2020 08:49:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5FC2AC90;
 Wed, 25 Nov 2020 08:49:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqUt-0003OW-CT
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:49:55 +0000
X-Inumbo-ID: db0f7686-f875-4e5d-82d4-45c46b5d9328
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id db0f7686-f875-4e5d-82d4-45c46b5d9328;
	Wed, 25 Nov 2020 08:49:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606294193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cMjBzLauJw5SKrfwXQnQb0ce9Bg9IPFpz3h0NPwyEQ=;
	b=F/riuD7HD9w3jnq4EbN2kMXuoWkqs4dYSNX/5ppXibldO5K0OMp8xhKV7rSnANLrQEDdUG
	rHX1yylqJN9NpWnFYX9pHLOGZeBjg9NPwFez058PnlqwCKUJK02tfn6QrKLfOUeacaeiFY
	htlJ5kDm3Suaupo8h8ywLaLFrt0ityI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D5FC2AC90;
	Wed, 25 Nov 2020 08:49:53 +0000 (UTC)
Subject: [PATCH 3/5] x86/build: restrict contents of asm-offsets.h when !HVM /
 !PV
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Message-ID: <d41ce371-262f-747a-9f6d-e5ab85a93aa5@suse.com>
Date: Wed, 25 Nov 2020 09:49:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This file has a long dependencies list (through asm-offsets.[cs]) and a
long list of dependents. IOW if any of the former changes, all of the
latter will be rebuilt, even if there's no actual change to the
generated file. Therefore avoid producing symbols we don't actually
need, depending on configuration.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -84,6 +84,7 @@ void __dummy__(void)
     DEFINE(_VGCF_syscall_disables_events,  _VGCF_syscall_disables_events);
     BLANK();
 
+#ifdef CONFIG_HVM
     OFFSET(VCPU_svm_vmcb_pa, struct vcpu, arch.hvm.svm.vmcb_pa);
     OFFSET(VCPU_svm_vmcb, struct vcpu, arch.hvm.svm.vmcb);
     BLANK();
@@ -99,6 +100,7 @@ void __dummy__(void)
     OFFSET(VCPU_nhvm_p2m, struct vcpu, arch.hvm.nvcpu.nv_p2m);
     OFFSET(VCPU_nsvm_hap_enabled, struct vcpu, arch.hvm.nvcpu.u.nsvm.ns_hap_enabled);
     BLANK();
+#endif
 
 #ifdef CONFIG_PV
     OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
@@ -128,6 +130,7 @@ void __dummy__(void)
     DEFINE(CPUINFO_sizeof, sizeof(struct cpu_info));
     BLANK();
 
+#ifdef CONFIG_PV
     OFFSET(TRAPINFO_eip, struct trap_info, address);
     OFFSET(TRAPINFO_cs, struct trap_info, cs);
     OFFSET(TRAPINFO_flags, struct trap_info, flags);
@@ -139,6 +142,7 @@ void __dummy__(void)
     OFFSET(TRAPBOUNCE_cs, struct trap_bounce, cs);
     OFFSET(TRAPBOUNCE_eip, struct trap_bounce, eip);
     BLANK();
+#endif
 
     OFFSET(VCPUMSR_spec_ctrl_raw, struct vcpu_msrs, spec_ctrl.raw);
     BLANK();


