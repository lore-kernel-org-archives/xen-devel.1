Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C11C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 13:22:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49ED660D07
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 13:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49ED660D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128230.240754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidCE-0001WG-PX; Mon, 17 May 2021 13:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128230.240754; Mon, 17 May 2021 13:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidCE-0001W9-Li; Mon, 17 May 2021 13:22:10 +0000
Received: by outflank-mailman (input) for mailman id 128230;
 Mon, 17 May 2021 13:22:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lidCC-0001W3-Hf
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:22:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f3ba80b-5fb1-4c77-a076-907c4bcf72f2;
 Mon, 17 May 2021 13:22:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 054C8B162;
 Mon, 17 May 2021 13:22:07 +0000 (UTC)
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
X-Inumbo-ID: 7f3ba80b-5fb1-4c77-a076-907c4bcf72f2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621257727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tYp/S6dDZV1GNnEKVFysZqTjdXObr/Rva9bndRnzBW8=;
	b=ihxuP61zjkBqOnd3jeVXPfy6maw5O90eAkYOJbYifWOx/1FulEqI0AvNf/Ha89vZ8dWTgO
	PAxJe5OjQyMcpi4zTKLGYOsIvOZFOkxQFsshtuziNP+zsSiYtzM4ldNiZr9xUS9zCtVVzd
	MFcMvDtCgbG3quTEO3+mJcZwub6hqoQ=
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][XTF] XSA-286: fix PAE variant of test
Message-ID: <d6f4bfd1-791f-8191-5cce-6c98977a5175@suse.com>
Date: Mon, 17 May 2021 15:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

L3 entry updates aren't specified to take immediate effect in PAE mode:
On bare metal, only the next CR3 load actually loads the PDPTEs, and a
32-bit Xen also wouldn't immediately propagate new entries into the
PDPTEs. Them taking immediate effect (leaving aside the need to flush
the TLB) on 64-bit Xen is merely to not complicate the hypervisor
implementation more than necessary. Guests cannot depend on such
behavior, and hence this test shouldn't either.

Insert the hypercall equivalent of a CR3 reload into the multicall.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With this, cb199cc7de98 ('Revert "x86/PV32: avoid TLB flushing after
mod_l3_entry()" and "x86/PV: restrict TLB flushing after
mod_l[234]_entry()"') should imo be reverted from the Xen tree. The
claim was wrong that the test was correct and hypervisor code flawed.

--- a/tests/xsa-286/main.c
+++ b/tests/xsa-286/main.c
@@ -128,9 +128,18 @@ void test_main(void)
          *
          * - update_va_mapping(addr, 0, INLVPG)
          * - mmu_update(&l3t[slot], l2t2)
+         * - (PAE only) new_baseptr(cr3)
          * - update_va_mapping(addr, gfn0 | AD|WR|P, INLVPG)
          */
         mu[0].val = pte_from_virt(l2t2, PF_SYM(AD, RW, P));
+#ifdef __i386__
+        mmuext_op_t mx[] = {
+            {
+                .cmd = MMUEXT_NEW_BASEPTR,
+                .arg1.mfn = read_cr3() >> PAGE_SHIFT,
+            },
+        };
+#endif
         intpte_t nl1e = pte_from_gfn(pfn_to_mfn(0), PF_SYM(AD, RW, P));
         multicall_entry_t multi[] = {
             {
@@ -153,6 +162,17 @@ void test_main(void)
                     DOMID_SELF,
                 },
             },
+#ifdef __i386__
+            {
+                .op = __HYPERVISOR_mmuext_op,
+                .args = {
+                    _u(mx),
+                    ARRAY_SIZE(mx),
+                    _u(NULL),
+                    DOMID_SELF,
+                },
+            },
+#endif
             {
                 .op = __HYPERVISOR_update_va_mapping,
                 .args = {

