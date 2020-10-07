Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500B6C4363C
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 10:21:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B832220782
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 10:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UpQL+I67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B832220782
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3407.9797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6Yz-0003TS-1C; Wed, 07 Oct 2020 10:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3407.9797; Wed, 07 Oct 2020 10:20:49 +0000
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
	id 1kQ6Yy-0003TL-Uc; Wed, 07 Oct 2020 10:20:48 +0000
Received: by outflank-mailman (input) for mailman id 3407;
 Wed, 07 Oct 2020 10:20:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqtN=DO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQ6Yx-0003TE-PC
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:20:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50f16277-5f50-4ec3-963b-8b1b70349d73;
 Wed, 07 Oct 2020 10:20:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aqtN=DO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQ6Yx-0003TE-PC
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:20:47 +0000
X-Inumbo-ID: 50f16277-5f50-4ec3-963b-8b1b70349d73
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 50f16277-5f50-4ec3-963b-8b1b70349d73;
	Wed, 07 Oct 2020 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602066045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mn6pxC92/K1q3H34qSpWU52CtwsJhqF4O23oEktGShA=;
  b=UpQL+I67DX4RHxCUT6PwHrt8vyD51stUS6vWl8WlLfsn6N6ESDYbK7sl
   agXfWR58y628Dbgq3zpu4VE7kfZmjsJqYP2+a4Xv9iYwD5sS7nVXFW/Yf
   fc2aIpnUIUwu4MgQpKbHmkllDkadPPyb3P6QVAHcB0IHk7IU5TqCJchfG
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OT05eKaA7bJf3fmLEQH4RaUgm893gUAss1DD+UtZfWZNZ5tdOif/RcdFTxqeYPuPLOU9Ru4Aqd
 XJGFhxu1jeLnxv44vluqOB8c5/tuzcEBaSweTb2dyIrY5FvMtkgqDyXSvuW8+N2AHh1oxXQLSv
 modd+NSOA32qRS2q6QDbelAG6pOmhins9EcXTd8J2uinaVb8xZWMqQhXG721TRTKydhVhbsVvT
 TN4eQNMakaLECyfYCvibbTisw/HFbo8jOTRCYvEldnQZmdVdCgU0EAXD0rsJpK/kxvqGHYO8ix
 6Ww=
X-SBRS: None
X-MesageID: 29495330
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,346,1596513600"; 
   d="scan'208";a="29495330"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/msr: handle IA32_THERM_STATUS
Date: Wed, 7 Oct 2020 12:20:32 +0200
Message-ID: <20201007102032.98565-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Windows 8 will attempt to read MSR_IA32_THERM_STATUS and panic if a
#GP fault is injected as a result:

vmx.c:3035:d8v0 RDMSR 0x0000019c unimplemented
d8v0 VIRIDIAN CRASH: 3b c0000096 fffff8061de31651 fffff4088a613720 0

So handle the MSR and return 0 instead.

Note that this is done on the generic MSR handler, and PV guest will
also get 0 back when trying to read the MSR. There doesn't seem to be
much value in handling the MSR for HVM guests only.

Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index e4c4fa6127..190d6ac6c5 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -253,6 +253,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             break;
         goto gp_fault;
 
+    case MSR_IA32_THERM_STATUS:
+        if ( cp->x86_vendor != X86_VENDOR_INTEL )
+            goto gp_fault;
+        *val = 0;
+        break;
+
     case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
         if ( !is_hvm_domain(d) || v != curr )
             goto gp_fault;
-- 
2.28.0


