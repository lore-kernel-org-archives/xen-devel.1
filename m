Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A6F419BC
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 13:54:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282512.1565094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hR-0006HS-TD; Wed, 15 Apr 2026 13:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282512.1565094; Wed, 15 Apr 2026 13:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hR-0006HJ-Oy; Wed, 15 Apr 2026 13:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1282512;
 Wed, 15 Apr 2026 13:54:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df9366.v1-4a8938bac7ba4f1da0b2eca74ce48353@bounce.vates.tech>)
 id 1wD0hR-0006Gm-6I
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:54:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0hQ-00AiEv-J7
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:54:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df9366.v1-4a8938bac7ba4f1da0b2eca74ce48353@bounce.vates.tech>)
 id 69df9880-e002-0a2a0a5209dd-0a2a450ab858-42
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:36 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df9366.v1-4a8938bac7ba4f1da0b2eca74ce48353@bounce.vates.tech>)
 id 69df989b-ee98-0a2a450a0019-c602bb012713-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:36 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fwhs210V9zBsbVnk
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4a8938bac7ba4f1da0b2eca74ce48353; Wed, 15 Apr 2026 13:32:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259942; x=1776529942;
	bh=BuRU+2TlBcBTTb5Q+25wdwHHW2PQBda97rbEBk2HBMg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=apafzCn1D7dkgCAP+0AjQlCovSuawJ7U/aO/D63ik+eRQX5BuBCfKkFM0hys+l4MS
	 yCt7cCc2xU91kZ48za/Eu+Rn3C7g8CtdCiJ+xDH64IcWxSSMNYIpfTh7cmYy4dx6sv
	 nuoB4tDfEYzJakMU6ziW2flgBRMnIVA08FWOcLEGgQJeNAxs88j78lJHJrwv/LTOzu
	 09LdE9FaEi6u5x+a0MEfU9b9d19PrkUrG6y2msQalKXtW7VJq2iffuGWM2VIzHCiuT
	 5u+OUB1dTUZ06cd1sggMHedQF7NabDHv/rAhdSba94ppi8ZGMiGAHHNsdzS93+QctT
	 GDh1mcioHVj0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259942; x=1776520442; i=teddy.astie@vates.tech;
	bh=BuRU+2TlBcBTTb5Q+25wdwHHW2PQBda97rbEBk2HBMg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hI2Bdf1HB2413BPp4DlZ3xzYuvIoZXqhgjQwJTZT95WWdYYyvv1uTmZrqBSxwG/kV
	 gbi9lsO0BQLwyIJHb00h2ces0yaBJhWBuL5CZhc5X/s94EHKXF87eo2Pv2vlzwOJQ4
	 1sWyBN4sdrsibmP2RnQyaSX/1V0364bh+XG2+ZtAvmvJyOl4QusgTISD1Hsq7q29um
	 4HnSZu1I5qN6AJRSmdjR+0N5PvU0Y+gOzDtmw/FIai6aKYW8vOjrxiIhjYCvtBj+37
	 gxRIl/8BP10jHRKB/0soWoYwi9PCDO+cKdDvp8Ilwz+RIiml/H7UuvEJznFP4Yifgl
	 irKu+6nyNL52A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=205/7]=20x86/hvm:=20Flush=20TLB=20on=20vCPU=20overlaps=20on=20the=20same=20pCPU?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259941217
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <f70c32a1cf28a5972a3f237f0aab7382b19234dc.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4a8938bac7ba4f1da0b2eca74ce48353?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776261276-0FF430B1-C81FA595/0/0
X-purgate-type: clean
X-purgate-size: 2201

When using the same ASID/VPID for all vCPU of a domain, we need
to make sure that when context switching between 2 vCPUs of the
same domain on the same pCPU don't miss a TLB flush, as they
may be using different CR3.

Flush the TLB if the latest vCPU that ran on this core differ
to the one we're currently on.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Would it be preferable to move it to common code (or shared logic for x86).

 xen/arch/x86/hvm/svm/svm.c | 8 ++++++++
 xen/arch/x86/hvm/vmx/vmx.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 64c08432fd..8714fb18ec 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -981,6 +981,14 @@ void asmlinkage svm_vmenter_helper(void)
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
+    /**
+     * Check if we were the latest vCPU of this domain that ran on this pCPU.
+     * Flush the TLB if it is not, as the TLB entries are the ones from the previous
+     * vCPU. vCPU migration from a CPU to another always imply a TLB flush.
+     */
+    if ( curr->domain->latest_vcpu[cpu] != curr->vcpu_id )
+        curr->needs_tlb_flush = true;
+
     curr->domain->latest_vcpu[cpu] = curr->vcpu_id;
 
     vmcb->rax = regs->rax;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0e4f9f9c3d..dceff2f221 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4980,6 +4980,13 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
 
     if ( unlikely(need_flush) )
         vpid_sync_all();
+    /**
+     * Check if we were the latest vCPU of this domain that ran on this pCPU.
+     * Flush the TLB if it is not, as the TLB entries are the ones from the previous
+     * vCPU. vCPU migration from a CPU to another always imply a TLB flush.
+     */
+    if ( currd->latest_vcpu[cpu] != curr->vcpu_id )
+        curr->needs_tlb_flush = true;
 
     currd->latest_vcpu[cpu] = curr->vcpu_id;
 
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


