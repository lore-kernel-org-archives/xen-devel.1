Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAA6C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 11:03:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5537664FEA
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 11:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5537664FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97007.184079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfZZ-0003lq-Cp; Fri, 12 Mar 2021 11:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97007.184079; Fri, 12 Mar 2021 11:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfZZ-0003lj-8r; Fri, 12 Mar 2021 11:03:13 +0000
Received: by outflank-mailman (input) for mailman id 97007;
 Fri, 12 Mar 2021 11:03:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKfZX-0003kX-Sd
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:03:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74f87939-5567-4ea0-a86a-218298e721bf;
 Fri, 12 Mar 2021 11:03:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7002EB02C;
 Fri, 12 Mar 2021 11:03:05 +0000 (UTC)
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
X-Inumbo-ID: 74f87939-5567-4ea0-a86a-218298e721bf
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615546985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFrMh+sBcKyoQb7P1wDYHd/74ZilGORQiERspE6maW0=;
	b=E7zJOJnPZJDSBqXWO2Xl7S/OH4dNjw/nn5lBDdGm1lfYu9kVqN97TkToCnJ4gdWyMbbTrz
	Rb76q8VHo4hpc0E4MFGaXjYB/yEejqHqRMLXdpwuvBUu6iu7pzZRFhsrxlh6p7JvDiny4k
	CX5O5wN8A8C+WAOZZ6wWe4F+Hv8BkoI=
Subject: [PATCH v4 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
Message-ID: <0c8043e3-07aa-6242-19bd-07b04f574b87@suse.com>
Date: Fri, 12 Mar 2021 12:03:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Linux has been warning ("firmware bug") about this bit being clear for a
long time. While writable in older hardware it has been readonly on more
than just most recent hardware. For simplicitly report it always set (if
anything we may want to log the issue ourselves if it turns out to be
clear on older hardware) on CPU families 10h and up (in family 0fh the
bit is part of a larger field of different purpose).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v3: Report 0 for Fam0F.
v2: New.
---
There are likely more bits worthwhile to expose, but for about every one
of them there would be the risk of a lengthy discussion, as there are
clear downsides to exposing such information. The more that it would be
tbd whether the hardware values should be surfaced, and if so what
should happen when the guest gets migrated.

The main risk with making the read not fault here is that guests might
imply they can also write this MSR then.

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -315,6 +315,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_K8_HWCR:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
+               ? K8_HWCR_TSC_FREQ_SEL : 0;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -287,6 +287,8 @@
 
 #define MSR_K7_HWCR			0xc0010015
 #define MSR_K8_HWCR			0xc0010015
+#define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
+
 #define MSR_K7_FID_VID_CTL		0xc0010041
 #define MSR_K7_FID_VID_STATUS		0xc0010042
 #define MSR_K8_PSTATE_LIMIT		0xc0010061


