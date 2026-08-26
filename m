Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6887C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 18:14:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400131.1636014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzI8L-000435-VI; Wed, 26 Aug 2026 18:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400131.1636014; Wed, 26 Aug 2026 18:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzI8L-00042y-SF; Wed, 26 Aug 2026 18:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1400131;
 Wed, 26 Aug 2026 18:13:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1wzI8K-00042s-VZ
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 18:13:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzI8J-008uc1-VY
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 20:13:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8f2ca3-e002-0a2a0a5209dd-0a2a4508d810-34
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 20:13:55 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6a8f2ce2-f659-0a2a45080019-a0658308caa2-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 20:13:55 +0200
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 0A31E4510A2F;
 Wed, 26 Aug 2026 14:12:05 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org,
	jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v2] x86/nSVM: Expose the FlushByASID CPU feature support to L1 guests
Date: Wed, 26 Aug 2026 19:09:37 +0100
Message-ID: <616bf3633e902f2fdba5d00691653d3bb82444ce.1787765809.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787768035-DF6D687B-3BC6A441/0/0
X-purgate-type: clean
X-purgate-size: 2354

Some hypervisors explicitly require FlushByASID capability to function under
nested virtualization; otherwise, they fail to boot or run nested guests, see
see Xen's start_nested_svm and (1) and (2). To ensure functional nested
virtualization support and allow L1 hypervisors to correctly detect this
hardware capability, extend the exposed HVM CPU policy to surface the
FlushByASID CPU feature to the L1 guests when nestedhvm is enabled.

(1) VMWare (Launchpad Bug #2008583) https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2008583
(2) https://lore.kernel.org/all/b9915c9c-4cf6-051a-2d91-44cc6380f455@proxmox.com/T/#u

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
---
Changes in V2:
- Commit Message: Rephrased to clearly state that exposing this flag is a
  functional dependency for some hypervisors and hence for nested
  virtualization support.
- Code Cleanup: Dropped the unrelated change that removed the dangling 
  'exitinfo1 = ns_vmcb->exitinfo1;' assignment inside svm_vmexit_handler().
- Testing: Updated the testing notes to the successful validation using the XTF
  CPUID test.
---
Testing:
 - Using XTF CPUID test with nestedhvm=1
   - without the change, EDX returns 0x4AB (the FlushByASID 6th bit is not
     set).
     8000000a:ffffffff -> 00000001:00008000:00000000:000004ab
   - with the change, EDX returns 0x4EB (the FlushByASID 6th bit is set).
     8000000a:ffffffff -> 00000001:00008000:00000000:000004eb
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2793662718
---
 xen/arch/x86/cpu-policy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index eddcd9778f..48a3185eed 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -843,6 +843,7 @@ static void __init calculate_hvm_max_policy(void)
         p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
                                (1u << SVM_FEATURE_LBRV) |
                                (1u << SVM_FEATURE_NRIPS) |
+                               (1u << SVM_FEATURE_FLUSHBYASID) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
                                (1u << SVM_FEATURE_DECODEASSISTS));
         /* Enable features which are always emulated. */
-- 
2.53.0


