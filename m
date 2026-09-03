Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D4C624DB
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407259.1640372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D2-0006C9-DU; Thu, 03 Sep 2026 14:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407259.1640372; Thu, 03 Sep 2026 14:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D2-0006C0-AI; Thu, 03 Sep 2026 14:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1407259;
 Thu, 03 Sep 2026 14:14:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed5cb000c4f3@swg.vates.tech>)
 id 1x28D0-00063Q-Pr
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28D0-001H4c-6J
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed5cb000c4f3@swg.vates.tech>)
 id 6a9980c3-2eae-0a2a0a5409dd-0a2a4506ae08-12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:30 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed5cb000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-6
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed5cb000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:17 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2D2D48400B;
 Thu,  3 Sep 2026 16:14:17 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=EMoj4d2wG+b14N1m0v4nZI3dq2ElOe1px6bJBfqEcts=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=P10K10XmOLF2zVa2SU1jN2trI4UVwJKX2I8yxbmXoGIAsnBK0k1pcfMWQVCZ5KOYXbs5XAqKR
 vAQ5dbf2c2weugGRqy/zY8L29sWpfTCAa0dE7cC6GacDBzkEe4wwAF9bVO6FWlY24PHzWQnipEm
 Pgi7NhRUFR/x7baiMbaAoxWGox1GdeBJjEEB2gafJih7q3d3uFj7NedWSzNuBqNrmvG5UnampvU
 Nxxf+qApFtJ92AE1bUuEWHFY6C21n1iIcbZpH9RhVHNS2ODyuQGhlCicWNpFt21Yh1c/g7O2iqt
 GA7PA+qPAf6NvcMnJ2T4qGUFVtg4JvsZNnYxKi59iE1A==
X-Zone-Loop: 805b0bc169318dc6ad4260f732d926418730b83fe513
x-campaign-type: default
x-transaction-id: 17d51502-7c92-47e6-910f-5c7f0c7b0138
x-swg-uid: 01-d46563e3-3bd1-49f0-8f7c-35efecd22d89
X-Mailer: Sweego
Message-ID:
 <1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed5cb000c4f3@vates.tech>
x-swg-bid: 1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed5cb000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 05/11] x86/passthrough: Extract PT_IRQ_TYPE_MSI body into pt_irq_bind_msi()
Date: Thu,  3 Sep 2026 16:14:03 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a8.4b933214084d2238.1a0679ed436.e3f9f62c71b5f07a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444857399
X-purgate-ID: tlsNG-16d1c6/1788444870-1EEC477B-A58899A3/0/0
X-purgate-type: clean
X-purgate-size: 8979

---=Part.35a8.4b933214084d2238.1a0679ed436.e3f9f62c71b5f07a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Move the PT_IRQ_TYPE_MSI case of pt_irq_create_bind() into a new static
helper pt_irq_bind_msi(d, machine_irq, gvec, gflags, gtable, unmasked)=2E
The helper calls pt_irq_dpci_setup() itself, so pt_irq_create_bind() now
invokes the setup helper separately in the PCI / MSI_TRANSLATE case and
the 'default' case no longer needs to drop d->event_lock=2E

To keep this step "just" a code move, the extracted body is left at its
original (switch/case) indentation inside a compound block=2E The next
commit re-indents it=2E References to pt_irq_bind->u=2Emsi=2E* are replace=
d by
the corresponding parameters, and the two pt_irq_destroy_bind() error
paths build a local xen_domctl_bind_pt_irq instead=2E No functional
change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- New patch: this is the first half of v4's single "Extract
  PT_IRQ_TYPE_MSI body" patch, now split into "extract as-is, keeping
  the switch/case indentation inside a bare block" plus a re-indent
  (next patch), so each step reviews cleanly=2E
- machine_irq / gflags parameters are now unsigned int=2E
- The redundant nr_pirqs bound check inside the helper was dropped=2E
- The "!!" on the unmasked argument was removed=2E
- pt_irq_dpci_setup() is now called per-case=2E
- The "default" case no longer double-unlocks d->event_lock=2E
- The two pt_irq_destroy_bind() error paths build a local
  xen_domctl_bind_pt_irq=2E
- Comment capitalisation fixed=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/drivers/passthrough/x86/hvm=2Ec | 81 +++++++++++++++++++++----------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 7fcd3cc046=2E=2Eed368a7fdb 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -287,40 +287,33 @@ static int pt_irq_dpci_setup(struct domain *d, unsig=
ned int pirq,
     return 0;
 }
=20
-int pt_irq_create_bind(
-    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+static int pt_irq_bind_msi(struct domain *d, unsigned int machine_irq,
+                           uint8_t gvec, unsigned int gflags, uint64_t gt=
able,
+                           bool unmasked)
 {
     struct hvm_irq_dpci *hvm_irq_dpci;
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
-    int rc, pirq =3D pt_irq_bind->machine_irq;
-
-    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
-        return -EINVAL;
+    int rc;
=20
-    rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info);
+    rc =3D pt_irq_dpci_setup(d, machine_irq, &hvm_irq_dpci, &pirq_dpci, &=
info);
     if ( rc )
         return rc;
=20
-    switch ( pt_irq_bind->irq_type )
-    {
-    case PT_IRQ_TYPE_MSI:
     {
         uint8_t dest, delivery_mode;
         bool dest_mode;
         int dest_vcpu_id;
         const struct vcpu *vcpu;
-        uint32_t gflags =3D pt_irq_bind->u=2Emsi=2Egflags &
-                          ~XEN_DOMCTL_VMSI_X86_UNMASKED;
=20
         if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
         {
             pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_=
MSI |
                                HVM_IRQ_DPCI_GUEST_MSI;
-            pirq_dpci->gmsi=2Egvec =3D pt_irq_bind->u=2Emsi=2Egvec;
+            pirq_dpci->gmsi=2Egvec =3D gvec;
             pirq_dpci->gmsi=2Egflags =3D gflags;
             /*
-             * 'pt_irq_create_bind' can be called after 'pt_irq_destroy_b=
ind'=2E
+             * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind=
'=2E
              * The 'pirq_cleanup_check' which would free the structure is=
 only
              * called if the event channel for the PIRQ is active=2E Howe=
ver
              * OS-es that use event channels usually bind PIRQs to eventd=
s
@@ -328,14 +321,14 @@ int pt_irq_create_bind(
              * result that we re-use the 'dpci' structure=2E This can be
              * reproduced with unloading and loading the driver for a dev=
ice=2E
              *
-             * As such on every 'pt_irq_create_bind' call we MUST set it=
=2E
+             * As such on every 'pt_irq_bind_msi' call we MUST set it=2E
              */
             pirq_dpci->dom =3D d;
-            /* bind after hvm_irq_dpci is setup to avoid race with irq ha=
ndler*/
+            /* Bind after hvm_irq_dpci is setup to avoid race with irq ha=
ndler=2E */
             rc =3D pirq_guest_bind(d->vcpu[0], info, 0);
-            if ( rc =3D=3D 0 && pt_irq_bind->u=2Emsi=2Egtable )
+            if ( rc =3D=3D 0 && gtable )
             {
-                rc =3D msixtbl_pt_register(d, info, pt_irq_bind->u=2Emsi=
=2Egtable);
+                rc =3D msixtbl_pt_register(d, info, gtable);
                 if ( unlikely(rc) )
                 {
                     pirq_guest_unbind(d, info);
@@ -371,13 +364,13 @@ int pt_irq_create_bind(
             }
=20
             /* If pirq is already mapped as vmsi, update guest data/addr=
=2E */
-            if ( pirq_dpci->gmsi=2Egvec !=3D pt_irq_bind->u=2Emsi=2Egvec =
||
+            if ( pirq_dpci->gmsi=2Egvec !=3D gvec ||
                  pirq_dpci->gmsi=2Egflags !=3D gflags )
             {
                 /* Directly clear pending EOIs before enabling new MSI in=
fo=2E */
                 pirq_guest_eoi(info);
=20
-                pirq_dpci->gmsi=2Egvec =3D pt_irq_bind->u=2Emsi=2Egvec;
+                pirq_dpci->gmsi=2Egvec =3D gvec;
                 pirq_dpci->gmsi=2Egflags =3D gflags;
             }
         }
@@ -408,23 +401,31 @@ int pt_irq_create_bind(
         /* Use interrupt posting if it is supported=2E */
         if ( iommu_intpost )
         {
-            rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec)=
;
+            struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
+                =2Emachine_irq =3D machine_irq,
+                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+            };
=20
+            rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec)=
;
             if ( rc )
             {
-                pt_irq_destroy_bind(d, pt_irq_bind);
+                pt_irq_destroy_bind(d, &pt_irq_bind);
                 return rc;
             }
         }
=20
-        if ( pt_irq_bind->u=2Emsi=2Egflags & XEN_DOMCTL_VMSI_X86_UNMASKED=
 )
+        if ( unmasked )
         {
+            struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
+                =2Emachine_irq =3D machine_irq,
+                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+            };
             unsigned long flags;
             struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flag=
s);
=20
             if ( !desc )
             {
-                pt_irq_destroy_bind(d, pt_irq_bind);
+                pt_irq_destroy_bind(d, &pt_irq_bind);
                 return -EINVAL;
             }
=20
@@ -432,15 +433,44 @@ int pt_irq_create_bind(
             spin_unlock_irqrestore(&desc->lock, flags);
         }
=20
-        break;
+        return 0;
+    }
+}
+
+int pt_irq_create_bind(
+    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
+{
+    int pirq =3D pt_irq_bind->machine_irq;
+
+    if ( pirq < 0 || pirq >=3D d->nr_pirqs )
+        return -EINVAL;
+
+    switch ( pt_irq_bind->irq_type )
+    {
+    case PT_IRQ_TYPE_MSI:
+    {
+        unsigned int gflags =3D pt_irq_bind->u=2Emsi=2Egflags;
+
+        return pt_irq_bind_msi(d, pirq, pt_irq_bind->u=2Emsi=2Egvec,
+                               gflags & ~XEN_DOMCTL_VMSI_X86_UNMASKED,
+                               pt_irq_bind->u=2Emsi=2Egtable,
+                               gflags & XEN_DOMCTL_VMSI_X86_UNMASKED);
     }
=20
     case PT_IRQ_TYPE_PCI:
     case PT_IRQ_TYPE_MSI_TRANSLATE:
     {
+        struct hvm_irq_dpci *hvm_irq_dpci;
+        struct hvm_pirq_dpci *pirq_dpci;
+        struct pirq *info;
         struct dev_intx_gsi_link *digl =3D NULL;
         struct hvm_girq_dpci_mapping *girq =3D NULL;
         unsigned int guest_gsi;
+        int rc;
+
+        rc =3D pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &inf=
o);
+        if ( rc )
+            return rc;
=20
         /*
          * Mapping GSIs for the hardware domain is different than doing i=
t for
@@ -589,7 +619,6 @@ int pt_irq_create_bind(
     }
=20
     default:
-        write_unlock(&d->event_lock);
         return -EOPNOTSUPP;
     }
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35a8.4b933214084d2238.1a0679ed436.e3f9f62c71b5f07a=---

