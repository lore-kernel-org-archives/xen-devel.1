Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CD9107BCCA
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 16:37:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254031.1550029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vt-0007LF-CO; Fri, 13 Mar 2026 16:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254031.1550029; Fri, 13 Mar 2026 16:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Vt-0007KX-9L; Fri, 13 Mar 2026 16:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1254031;
 Fri, 13 Mar 2026 16:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+CwN=BN=bounce.vates.tech=bounce-md_30504962.69b43cb8.v1-4c742f4a7f4f4904ac3549a756e6bd0d@srs-se1.protection.inumbo.net>)
 id 1w15To-0006Ek-Nv
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:16 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9947323d-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:08 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT42HJpzPm0V3p
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4c742f4a7f4f4904ac3549a756e6bd0d; Fri, 13 Mar 2026 16:35:04 +0000
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
X-Inumbo-ID: 9947323d-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419704; x=1773689704;
	bh=Hgw6ALXwahveH8XpeaP1oYUCpV9mVDJR9YzEbJZFSCM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Mw1wDR5DHu8B4KkyqcCPxxNRFao0l9qHnuMzUvOEDFGgGAN4p8xZ7tWMBSSDTzm1f
	 bvhCjJsH1efWgoJQ6KRhB/yt+CT5gOT59mKx5PsOpnkruvxo3m7XpLNBl8CEItgPKK
	 7+rSslNK6mh/aLYc2nq51CXrVZ2kft2WEAYZUWscRdGaHyRSYhdwsHSchSE9PqzIgO
	 UKIe0jccpuhd/bZ7vWlskZcf0kBVeAEeaQvIfRPdHdXt3mliQbQVNL9HAxz6NZhtFf
	 Cd0OdZc8ut1N7z7Q+Xs92/+A8oH9YgG78C2U0LX1hTKbJ5JPL3aeSGFkqHjgvHcZkc
	 3MiEIXYpyAXtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419704; x=1773680204; i=thierry.escande@vates.tech;
	bh=Hgw6ALXwahveH8XpeaP1oYUCpV9mVDJR9YzEbJZFSCM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BEn/o7TCPtwEkYCRFfTyo80k7wi0W1aCZ8bJzjbv272Vg+pZKFrYx/wBtmsYO/CU+
	 dHXvdJtKNEn+8ui23EFuXwbZHEGliqNY7m4QpOn3s6dcp4QG+aLLsf0c0JFWwWEPAO
	 PE7F4AQhKywwk0w2t01HOcPqqmdxygPL5qCYpI1D2jo6E9pBX+HatfUp/Izy8LO7ij
	 7LpevsfSpK9ENg9AWlDBzSWdACdtvNyszxXWbtLFxcedk5r5HoLjbjfVb1IU/Mzjxr
	 C7PYxVfEhQMjiaHN3LVXEZEh/RIqEyiXcfjZ8afe3nAfF75foUosFcC43c+BLS6/ku
	 1WQV9hkKxtntQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2009/17]=20xev/hvm:=20Add=20HVMOP=5Fget|set=5Fecam=5Fspace=20hypercalls?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419702933
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20260313163455.790692-10-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4c742f4a7f4f4904ac3549a756e6bd0d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch adds 2 HVMOP hypercalls, HVMOP_get|set_ecam_space, used to
set and get the base address and size of the PCIe ECAM space as
configured by hvmloader.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 xen/arch/x86/hvm/hvm.c            | 52 +++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/domain.h |  4 +++
 xen/include/public/hvm/hvm_op.h   | 11 +++++++
 3 files changed, 67 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..a46dfa955d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
         break;
 
+    case HVMOP_set_ecam_space: {
+        xen_hvm_ecam_space_t ecam;
+        struct domain *d;
+
+        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
+            return -EFAULT;
+
+        d = rcu_lock_domain_by_any_id(ecam.domid);
+        if ( d == NULL )
+            return -ESRCH;
+
+        if ( d->arch.ecam_addr ) {
+            rcu_unlock_domain(d);
+            return -EFAULT;
+        }
+
+        if ( (ecam.size >> 28) || (!ecam.addr) ) {
+            rcu_unlock_domain(d);
+            return -EINVAL;
+        }
+
+        d->arch.ecam_addr = ecam.addr;
+        d->arch.ecam_size = ecam.size;
+
+        rcu_unlock_domain(d);
+        break;
+    }
+
+    case HVMOP_get_ecam_space: {
+        xen_hvm_ecam_space_t ecam;
+        struct domain *d;
+
+        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
+            return -EFAULT;
+
+        d = rcu_lock_domain_by_any_id(ecam.domid);
+        if ( d == NULL )
+            return -ESRCH;
+
+        if ( ! d->arch.ecam_addr || ! d->arch.ecam_size ) {
+            rcu_unlock_domain(d);
+            return -EINVAL;
+        }
+
+        ecam.addr = d->arch.ecam_addr;
+        ecam.size = d->arch.ecam_size;
+        rc = __copy_to_guest(arg, &ecam, 1) ? -EFAULT : 0;
+
+        rcu_unlock_domain(d);
+        break;
+    }
+
     default:
         rc = -ENOSYS;
         break;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index ad7f6adb2c..24ec33fc4d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -476,6 +476,10 @@ struct arch_domain
 
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
+
+    /* PCI ECAM space emulation */
+    uint64_t ecam_addr;
+    uint32_t ecam_size;
 } __cacheline_aligned;
 
 #ifdef CONFIG_HVM
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index e22adf0319..c84febc37c 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -166,6 +166,17 @@ struct xen_hvm_get_mem_type {
 typedef struct xen_hvm_get_mem_type xen_hvm_get_mem_type_t;
 DEFINE_XEN_GUEST_HANDLE(xen_hvm_get_mem_type_t);
 
+#define HVMOP_set_ecam_space    16
+#define HVMOP_get_ecam_space    17
+struct xen_hvm_ecam_space {
+    domid_t  domid;
+    uint16_t pad[3]; /* align next field on 8-byte boundary */
+    uint64_t addr;
+    uint32_t size;
+};
+typedef struct xen_hvm_ecam_space xen_hvm_ecam_space_t;
+DEFINE_XEN_GUEST_HANDLE(xen_hvm_ecam_space_t);
+
 /* Following tools-only interfaces may change in future. */
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


