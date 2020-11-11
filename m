Return-Path: <SRS0=tVq8=ER=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C17C388F9
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 20:07:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69864208B3
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2020 20:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69864208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25208.52837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcwOu-0003IT-Dr; Wed, 11 Nov 2020 20:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25208.52837; Wed, 11 Nov 2020 20:07:28 +0000
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
	id 1kcwOu-0003IL-9V; Wed, 11 Nov 2020 20:07:28 +0000
Received: by outflank-mailman (input) for mailman id 25208;
 Wed, 11 Nov 2020 20:07:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kcwOs-0003FT-IO
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:26 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcwOs-0000pY-Ai; Wed, 11 Nov 2020 20:07:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOs-0003FT-IO
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 20:07:26 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcwOs-0000pY-Ai; Wed, 11 Nov 2020 20:07:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and accessor functions...
Date: Wed, 11 Nov 2020 20:07:14 +0000
Message-Id: <20201111200721.30551-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111200721.30551-1-paul@xen.org>
References: <20201111200721.30551-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... and make use of them in hvcall_flush()/need_flush().

Subsequent patches will need to deal with virtual processor masks potentially
wider than 64 bits. Thus, to avoid using too much stack, this patch
introduces global per-cpu virtual processor masks and converts the
implementation of hvcall_flush() to use them.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/viridian/viridian.c | 51 +++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index c4f720f58d6d..4ab1f14b2248 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -507,15 +507,41 @@ void viridian_domain_deinit(struct domain *d)
     XFREE(d->arch.hvm.viridian);
 }
 
+struct hypercall_vpmask {
+    DECLARE_BITMAP(mask, HVM_MAX_VCPUS);
+};
+
+static DEFINE_PER_CPU(struct hypercall_vpmask, hypercall_vpmask);
+
+static void vpmask_empty(struct hypercall_vpmask *vpmask)
+{
+    bitmap_zero(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static void vpmask_set(struct hypercall_vpmask *vpmask, unsigned int vp)
+{
+    __set_bit(vp, vpmask->mask);
+}
+
+static void vpmask_fill(struct hypercall_vpmask *vpmask)
+{
+    bitmap_fill(vpmask->mask, HVM_MAX_VCPUS);
+}
+
+static bool vpmask_test(struct hypercall_vpmask *vpmask, unsigned int vp)
+{
+    return test_bit(vp, vpmask->mask);
+}
+
 /*
  * Windows should not issue the hypercalls requiring this callback in the
  * case where vcpu_id would exceed the size of the mask.
  */
 static bool need_flush(void *ctxt, struct vcpu *v)
 {
-    uint64_t vcpu_mask = *(uint64_t *)ctxt;
+    struct hypercall_vpmask *vpmask = ctxt;
 
-    return vcpu_mask & (1ul << v->vcpu_id);
+    return vpmask_test(vpmask, v->vcpu_id);
 }
 
 union hypercall_input {
@@ -546,6 +572,7 @@ static int hvcall_flush(union hypercall_input *input,
                         unsigned long input_params_gpa,
                         unsigned long output_params_gpa)
 {
+    struct hypercall_vpmask *vpmask = &this_cpu(hypercall_vpmask);
     struct {
         uint64_t address_space;
         uint64_t flags;
@@ -567,13 +594,29 @@ static int hvcall_flush(union hypercall_input *input,
      * so err on the safe side.
      */
     if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
-        input_params.vcpu_mask = ~0ul;
+        vpmask_fill(vpmask);
+    else
+    {
+        unsigned int vp;
+
+        vpmask_empty(vpmask);
+        for (vp = 0; vp < 64; vp++)
+        {
+            if ( !input_params.vcpu_mask )
+                break;
+
+            if ( input_params.vcpu_mask & 1 )
+                vpmask_set(vpmask, vp);
+
+            input_params.vcpu_mask >>= 1;
+        }
+    }
 
     /*
      * A false return means that another vcpu is currently trying
      * a similar operation, so back off.
      */
-    if ( !paging_flush_tlb(need_flush, &input_params.vcpu_mask) )
+    if ( !paging_flush_tlb(need_flush, vpmask) )
         return -ERESTART;
 
     output->rep_complete = input->rep_count;
-- 
2.20.1


