Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393ADC624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407260.1640381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D4-0006T4-Qv; Thu, 03 Sep 2026 14:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407260.1640381; Thu, 03 Sep 2026 14:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D4-0006St-N9; Thu, 03 Sep 2026 14:14:34 +0000
Received: by outflank-mailman (input) for mailman id 1407260;
 Thu, 03 Sep 2026 14:14:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed728000c4f3@swg.vates.tech>)
 id 1x28D2-0006FP-Rm
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28D2-001H4c-7x
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:32 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed728000c4f3@swg.vates.tech>)
 id 6a9980c3-2eae-0a2a0a5409dd-0a2a4506ae08-18
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:32 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed728000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-7
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed728000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:18 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D6AB8400D;
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
 q=dns/txt; s=selector1; bh=XlXn7+U7AhcVnIuq8LehatGTdH1rv7CZg+DUPNdYgUU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Gkq0stmJhwqiGy80JiK+VixgmmbCoI+NQAlTG5W+JcewQXs3cQaJgQVRXgKAqAz1WmiWI8EqL
 8NgoxORM4GPgGHyWesiwuQnPDi4oyd6MSKdRa4UwZQI3P1r2y/EE9umwfZy1Qa+3A7/alS3F6oJ
 om9Ytno/CdkMbDPVi/fH1w95VoVTu4l+qx1+JZjmXFlbVuIMIHoIZUR0HROkP3hvh/t+L5+V82T
 vzyt1TEpauRVWCoj3MlYq+Pqz7dxFXkaLuR9c57kjiyMpXsY+7kxLaNhSQuLtQ9oYzKHXUFHD3L
 9+eNk6llGkn2ZWNT2jFkdpQU5IjKKSs95p0eKl2g0z2Q==
X-Zone-Loop: 70ef9b24403594f9905bebe9f916eb79cba80da7c1eb
x-campaign-type: default
x-transaction-id: 11323503-91e7-43da-b618-24919b35d4cb
x-swg-uid: 01-301f6409-08d7-4cbb-8e44-63148d780951
X-Mailer: Sweego
Message-ID:
 <1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed728000c4f3@vates.tech>
x-swg-bid: 1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed728000c4f3
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
Subject: [PATCH v5 06/11] x86/passthrough: Re-indent pt_irq_bind_msi() body
Date: Thu,  3 Sep 2026 16:14:04 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a9.39c8d9bf421e1e25.1a0679ed57e.33cdc81cbace567b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444857726
X-purgate-ID: tlsNG-16d1c6/1788444872-FD80D77B-5DB27F4F/0/0
X-purgate-type: clean
X-purgate-size: 12064

---=Part.35a9.39c8d9bf421e1e25.1a0679ed57e.33cdc81cbace567b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Purely mechanical follow-up to the previous patch: drop the compound
block that preserved the original switch/case indentation, shift the
body one level left, move the block-local declarations to the top of the
function, and add the missing blank line before the dest_vcpu_id
calculation=2E No functional change=2E 'git show --ignore-all-space' is
empty apart from the declaration move and the removed brackets=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- New patch: the re-indent half of the v4 extraction=2E Drops the compound
  block, shifts the body one level left, move the block-local
  declarations and adds the missing blank line=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/drivers/passthrough/x86/hvm=2Ec | 224 +++++++++++++++---------------
 1 file changed, 111 insertions(+), 113 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index ed368a7fdb=2E=2E5fdb885311 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -295,146 +295,144 @@ static int pt_irq_bind_msi(struct domain *d, unsig=
ned int machine_irq,
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
     int rc;
+    uint8_t dest, delivery_mode;
+    bool dest_mode;
+    int dest_vcpu_id;
+    const struct vcpu *vcpu;
=20
     rc =3D pt_irq_dpci_setup(d, machine_irq, &hvm_irq_dpci, &pirq_dpci, &=
info);
     if ( rc )
         return rc;
=20
+    if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
     {
-        uint8_t dest, delivery_mode;
-        bool dest_mode;
-        int dest_vcpu_id;
-        const struct vcpu *vcpu;
-
-        if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
+        pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MSI =
|
+                           HVM_IRQ_DPCI_GUEST_MSI;
+        pirq_dpci->gmsi=2Egvec =3D gvec;
+        pirq_dpci->gmsi=2Egflags =3D gflags;
+        /*
+         * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'=2E
+         * The 'pirq_cleanup_check' which would free the structure is onl=
y
+         * called if the event channel for the PIRQ is active=2E However
+         * OS-es that use event channels usually bind PIRQs to eventds
+         * and unbind them before calling 'pt_irq_destroy_bind' - with th=
e
+         * result that we re-use the 'dpci' structure=2E This can be
+         * reproduced with unloading and loading the driver for a device=
=2E
+         *
+         * As such on every 'pt_irq_bind_msi' call we MUST set it=2E
+         */
+        pirq_dpci->dom =3D d;
+        /* Bind after hvm_irq_dpci is setup to avoid race with irq handle=
r=2E */
+        rc =3D pirq_guest_bind(d->vcpu[0], info, 0);
+        if ( rc =3D=3D 0 && gtable )
         {
-            pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_=
MSI |
-                               HVM_IRQ_DPCI_GUEST_MSI;
-            pirq_dpci->gmsi=2Egvec =3D gvec;
-            pirq_dpci->gmsi=2Egflags =3D gflags;
-            /*
-             * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind=
'=2E
-             * The 'pirq_cleanup_check' which would free the structure is=
 only
-             * called if the event channel for the PIRQ is active=2E Howe=
ver
-             * OS-es that use event channels usually bind PIRQs to eventd=
s
-             * and unbind them before calling 'pt_irq_destroy_bind' - wit=
h the
-             * result that we re-use the 'dpci' structure=2E This can be
-             * reproduced with unloading and loading the driver for a dev=
ice=2E
-             *
-             * As such on every 'pt_irq_bind_msi' call we MUST set it=2E
-             */
-            pirq_dpci->dom =3D d;
-            /* Bind after hvm_irq_dpci is setup to avoid race with irq ha=
ndler=2E */
-            rc =3D pirq_guest_bind(d->vcpu[0], info, 0);
-            if ( rc =3D=3D 0 && gtable )
-            {
-                rc =3D msixtbl_pt_register(d, info, gtable);
-                if ( unlikely(rc) )
-                {
-                    pirq_guest_unbind(d, info);
-                    /*
-                     * Between 'pirq_guest_bind' and before 'pirq_guest_u=
nbind'
-                     * an interrupt can be scheduled=2E No more of them a=
re going
-                     * to be scheduled but we must deal with the one that=
 may be
-                     * in the queue=2E
-                     */
-                    pt_pirq_softirq_reset(pirq_dpci);
-                }
-            }
+            rc =3D msixtbl_pt_register(d, info, gtable);
             if ( unlikely(rc) )
             {
-                pirq_dpci->gmsi=2Egflags =3D 0;
-                pirq_dpci->gmsi=2Egvec =3D 0;
-                pirq_dpci->dom =3D NULL;
-                pirq_dpci->flags =3D 0;
-                if ( !info->evtchn )
-                    pirq_cleanup_check(info, d);
-                write_unlock(&d->event_lock);
-                return rc;
+                pirq_guest_unbind(d, info);
+                /*
+                 * Between 'pirq_guest_bind' and before 'pirq_guest_unbin=
d'
+                 * an interrupt can be scheduled=2E No more of them are g=
oing
+                 * to be scheduled but we must deal with the one that may=
 be
+                 * in the queue=2E
+                 */
+                pt_pirq_softirq_reset(pirq_dpci);
             }
         }
-        else
+        if ( unlikely(rc) )
         {
-            uint32_t mask =3D HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUEST_=
MSI;
-
-            if ( (pirq_dpci->flags & mask) !=3D mask )
-            {
-                write_unlock(&d->event_lock);
-                return -EBUSY;
-            }
-
-            /* If pirq is already mapped as vmsi, update guest data/addr=
=2E */
-            if ( pirq_dpci->gmsi=2Egvec !=3D gvec ||
-                 pirq_dpci->gmsi=2Egflags !=3D gflags )
-            {
-                /* Directly clear pending EOIs before enabling new MSI in=
fo=2E */
-                pirq_guest_eoi(info);
-
-                pirq_dpci->gmsi=2Egvec =3D gvec;
-                pirq_dpci->gmsi=2Egflags =3D gflags;
-            }
+            pirq_dpci->gmsi=2Egflags =3D 0;
+            pirq_dpci->gmsi=2Egvec =3D 0;
+            pirq_dpci->dom =3D NULL;
+            pirq_dpci->flags =3D 0;
+            if ( !info->evtchn )
+                pirq_cleanup_check(info, d);
+            write_unlock(&d->event_lock);
+            return rc;
         }
-        /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
-        dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
-        dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_M=
ASK;
-        delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                                  XEN_DOMCTL_VMSI_X86_DELIV_MASK);
-
-        dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
-        pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
-        write_unlock(&d->event_lock);
+    }
+    else
+    {
+        uint32_t mask =3D HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUEST_MSI;
=20
-        pirq_dpci->gmsi=2Eposted =3D false;
-        vcpu =3D (dest_vcpu_id >=3D 0) ? d->vcpu[dest_vcpu_id] : NULL;
-        if ( iommu_intpost )
+        if ( (pirq_dpci->flags & mask) !=3D mask )
         {
-            if ( delivery_mode =3D=3D dest_LowestPrio )
-                vcpu =3D vector_hashing_dest(d, dest, dest_mode,
-                                           pirq_dpci->gmsi=2Egvec);
-            if ( vcpu )
-                pirq_dpci->gmsi=2Eposted =3D true;
+            write_unlock(&d->event_lock);
+            return -EBUSY;
         }
-        if ( vcpu && is_iommu_enabled(d) )
-            hvm_migrate_pirq(pirq_dpci, vcpu);
=20
-        /* Use interrupt posting if it is supported=2E */
-        if ( iommu_intpost )
+        /* If pirq is already mapped as vmsi, update guest data/addr=2E *=
/
+        if ( pirq_dpci->gmsi=2Egvec !=3D gvec ||
+             pirq_dpci->gmsi=2Egflags !=3D gflags )
         {
-            struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
-                =2Emachine_irq =3D machine_irq,
-                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
-            };
+            /* Directly clear pending EOIs before enabling new MSI info=
=2E */
+            pirq_guest_eoi(info);
=20
-            rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec)=
;
-            if ( rc )
-            {
-                pt_irq_destroy_bind(d, &pt_irq_bind);
-                return rc;
-            }
+            pirq_dpci->gmsi=2Egvec =3D gvec;
+            pirq_dpci->gmsi=2Egflags =3D gflags;
         }
+    }
+
+    /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
+    dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
+                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+    dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
+    delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
+                              XEN_DOMCTL_VMSI_X86_DELIV_MASK);
+
+    dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
+    pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
+    write_unlock(&d->event_lock);
+
+    pirq_dpci->gmsi=2Eposted =3D false;
+    vcpu =3D (dest_vcpu_id >=3D 0) ? d->vcpu[dest_vcpu_id] : NULL;
+    if ( iommu_intpost )
+    {
+        if ( delivery_mode =3D=3D dest_LowestPrio )
+            vcpu =3D vector_hashing_dest(d, dest, dest_mode,
+                                       pirq_dpci->gmsi=2Egvec);
+        if ( vcpu )
+            pirq_dpci->gmsi=2Eposted =3D true;
+    }
+    if ( vcpu && is_iommu_enabled(d) )
+        hvm_migrate_pirq(pirq_dpci, vcpu);
+
+    /* Use interrupt posting if it is supported=2E */
+    if ( iommu_intpost )
+    {
+        struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
+            =2Emachine_irq =3D machine_irq,
+            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+        };
=20
-        if ( unmasked )
+        rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec);
+        if ( rc )
         {
-            struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
-                =2Emachine_irq =3D machine_irq,
-                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
-            };
-            unsigned long flags;
-            struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flag=
s);
+            pt_irq_destroy_bind(d, &pt_irq_bind);
+            return rc;
+        }
+    }
=20
-            if ( !desc )
-            {
-                pt_irq_destroy_bind(d, &pt_irq_bind);
-                return -EINVAL;
-            }
+    if ( unmasked )
+    {
+        struct xen_domctl_bind_pt_irq pt_irq_bind =3D {
+            =2Emachine_irq =3D machine_irq,
+            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+        };
+        unsigned long flags;
+        struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flags);
=20
-            guest_mask_msi_irq(desc, false);
-            spin_unlock_irqrestore(&desc->lock, flags);
+        if ( !desc )
+        {
+            pt_irq_destroy_bind(d, &pt_irq_bind);
+            return -EINVAL;
         }
=20
-        return 0;
+        guest_mask_msi_irq(desc, false);
+        spin_unlock_irqrestore(&desc->lock, flags);
     }
+
+    return 0;
 }
=20
 int pt_irq_create_bind(
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35a9.39c8d9bf421e1e25.1a0679ed57e.33cdc81cbace567b=---

