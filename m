Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E1606A683
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=TzlkKMqS
Received: from list by lists.xenproject.org with outflank-mailman.1501256.1697311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjs-0007Ly-N6; Tue, 24 Nov 2026 16:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501256.1697311; Tue, 24 Nov 2026 16:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjs-0007Lr-Jv; Tue, 24 Nov 2026 16:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1501256;
 Tue, 24 Nov 2026 16:51:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtjs-0007Lg-0s
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjr-00HDqX-DE
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:27 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7825e70001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:27 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7825e70001cf5@swg.vates.tech>)
 id 6b05c08f-4cb1-0a2a45050019-b9ff1c2295f1-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:27 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7825e70001cf5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:24 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1384782EDA;
 Tue, 24 Nov 2026 17:51:24 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=rkai20etxpAMQDf3DG/ZnPm5YLiHW6GbY1suw54tucc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TzlkKMqSjuWgmd4LSHxQt8Cw5byQk42Ko2TWU86u8Q2YBzmHO78Sb2+/ocjgG+ryqki+FkAaG
 s6gbbBveJCO9SURC5XpmZcclB/byHaBIQjAeM4yKApdkagacSiLgmRsORx/Za7jkDj8aA8vcC7U
 9jgXSNXrHM8Dq2WkPbxXpPCVUoaTyrX80lLw1lW42+VC/WZpZNEF9Pt9MS6H45OWCdjnaPoWkQ9
 Al/kx87zIxoe5xNws5V3uKite4dtSowRJ7rc+uOpdKFJ7uEytcpScu694pL/fqLP73klQKrAB2T
 cv58RP4kxNHpkTxQA6X6pPKAQWNjTHbwNQyY67dqVn9A==
X-Zone-Loop: 71e2da4af004bbcc8205b3a4b5764b86d38c0b9a4480
x-campaign-type: default
x-transaction-id: 76089c91-f140-448b-921f-7c9c777fed0d
x-swg-uid: 01-fa24e2f3-03b9-4ced-b840-a78976b638d9
X-Mailer: Sweego
Message-ID:
 <1795539084.8631fc262581453bbf619ec5b2062170.1a20e7825e70001cf5@vates.tech>
x-swg-bid: 1795539084.8631fc262581453bbf619ec5b2062170.1a20e7825e70001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 01/13] x86/hvm: Use direct structures instead of guest handles
Date: Tue, 24 Nov 2026 17:50:29 +0100
In-Reply-To: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.12d.b157812cfadf7ccc.1a20e7823cc.3fb1a740ccce60b8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539084236
X-purgate-ID: tlsNG-c201ff/1795539087-716AD2A1-6F8D2115/10/73395122804
X-purgate-type: spam
X-purgate-size: 7411
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.12d.b157812cfadf7ccc.1a20e7823cc.3fb1a740ccce60b8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

That will be used later on for a new hypercall ABI=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 xen/arch/x86/hvm/hvm=2Ec | 126 +++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 56 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm=2Ec b/xen/arch/x86/hvm/hvm=2Ec
index ef9c7cd057=2E=2E45d91ff62a 100644
--- a/xen/arch/x86/hvm/hvm=2Ec
+++ b/xen/arch/x86/hvm/hvm=2Ec
@@ -4094,19 +4094,14 @@ static int hvmop_flush_tlb_all(void)
     return paging_flush_tlb(NULL) ? 0 : -ERESTART;
 }
=20
-static int hvmop_set_evtchn_upcall_vector(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_evtchn_upcall_vector_t) uop)
+static int hvmop_set_evtchn_upcall_vector(xen_hvm_evtchn_upcall_vector_t =
op)
 {
-    xen_hvm_evtchn_upcall_vector_t op;
     struct domain *d =3D current->domain;
     struct vcpu *v;
=20
     if ( !is_hvm_domain(d) )
         return -EINVAL;
=20
-    if ( copy_from_guest(&op, uop, 1) )
-        return -EFAULT;
-
     if ( op=2Evector < 0x10 )
         return -EINVAL;
=20
@@ -4396,26 +4391,21 @@ static int hvm_set_param(struct domain *d, uint32_=
t index, uint64_t value)
     return rc;
 }
=20
-static int hvmop_set_param(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_param_t) arg)
+static int hvmop_set_param(struct xen_hvm_param op)
 {
-    struct xen_hvm_param a;
     struct domain *d;
     int rc;
=20
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a=2Eindex >=3D HVM_NR_PARAMS )
+    if ( op=2Eindex >=3D HVM_NR_PARAMS )
         return -EINVAL;
=20
-    d =3D rcu_lock_domain_by_any_id(a=2Edomid);
+    d =3D rcu_lock_domain_by_any_id(op=2Edomid);
     if ( d =3D=3D NULL )
         return -ESRCH;
=20
     rc =3D -EINVAL;
     if ( is_hvm_domain(d) )
-        rc =3D hvm_set_param(d, a=2Eindex, a=2Evalue);
+        rc =3D hvm_set_param(d, op=2Eindex, op=2Evalue);
=20
     rcu_unlock_domain(d);
     return rc;
@@ -4506,31 +4496,21 @@ int hvm_get_param(struct domain *d, uint32_t index=
, uint64_t *value)
     return 0;
 };
=20
-static int hvmop_get_param(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_param_t) arg)
+static int hvmop_get_param(struct xen_hvm_param *op)
 {
-    struct xen_hvm_param a;
     struct domain *d;
     int rc;
=20
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    if ( a=2Eindex >=3D HVM_NR_PARAMS )
+    if ( op->index >=3D HVM_NR_PARAMS )
         return -EINVAL;
=20
-    d =3D rcu_lock_domain_by_any_id(a=2Edomid);
+    d =3D rcu_lock_domain_by_any_id(op->domid);
     if ( d =3D=3D NULL )
         return -ESRCH;
=20
     rc =3D -EINVAL;
-    if ( is_hvm_domain(d) && !(rc =3D hvm_get_param(d, a=2Eindex, &a=2Eva=
lue)) )
-    {
-        rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
-
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u =3D %"PRIx64,
-                    a=2Eindex, a=2Evalue);
-    }
+    if ( is_hvm_domain(d) && !(rc =3D hvm_get_param(d, op->index, &op->va=
lue)) )
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u =3D %"PRIx64, a=2Einde=
x, a=2Evalue);
=20
     rcu_unlock_domain(d);
     return rc;
@@ -5036,18 +5016,13 @@ static int compat_altp2m_op(
     return rc;
 }
=20
-static int hvmop_get_mem_type(
-    XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
+static int hvmop_get_mem_type(struct xen_hvm_get_mem_type *op)
 {
-    struct xen_hvm_get_mem_type a;
     struct domain *d;
     p2m_type_t t;
     int rc;
=20
-    if ( copy_from_guest(&a, arg, 1) )
-        return -EFAULT;
-
-    d =3D rcu_lock_domain_by_any_id(a=2Edomid);
+    d =3D rcu_lock_domain_by_any_id(op->domid);
     if ( d =3D=3D NULL )
         return -ESRCH;
=20
@@ -5064,25 +5039,22 @@ static int hvmop_get_mem_type(
      * type, not in allocating or unsharing=2E That'll happen
      * on access=2E
      */
-    get_gfn_query_unlocked(d, a=2Epfn, &t);
+    get_gfn_query_unlocked(d, op->pfn, &t);
     if ( p2m_is_mmio(t) )
-        a=2Emem_type =3D  HVMMEM_mmio_dm;
+        op->mem_type =3D  HVMMEM_mmio_dm;
     else if ( t =3D=3D p2m_ioreq_server )
-        a=2Emem_type =3D HVMMEM_ioreq_server;
+        op->mem_type =3D HVMMEM_ioreq_server;
     else if ( p2m_is_readonly(t) )
-        a=2Emem_type =3D  HVMMEM_ram_ro;
+        op->mem_type =3D  HVMMEM_ram_ro;
     else if ( p2m_is_ram(t) )
-        a=2Emem_type =3D  HVMMEM_ram_rw;
+        op->mem_type =3D  HVMMEM_ram_rw;
     else if ( p2m_is_pod(t) )
-        a=2Emem_type =3D  HVMMEM_ram_rw;
+        op->mem_type =3D  HVMMEM_ram_rw;
     else if ( p2m_is_grant(t) )
-        a=2Emem_type =3D  HVMMEM_ram_rw;
+        op->mem_type =3D  HVMMEM_ram_rw;
     else
-        a=2Emem_type =3D  HVMMEM_mmio_dm;
+        op->mem_type =3D  HVMMEM_mmio_dm;
=20
-    rc =3D -EFAULT;
-    if ( __copy_to_guest(arg, &a, 1) )
-        goto out;
     rc =3D 0;
=20
  out:
@@ -5105,28 +5077,70 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_=
PARAM(void) arg)
     switch ( op )
     {
     case HVMOP_set_evtchn_upcall_vector:
-        rc =3D hvmop_set_evtchn_upcall_vector(
-            guest_handle_cast(arg, xen_hvm_evtchn_upcall_vector_t));
+    {
+        struct xen_hvm_evtchn_upcall_vector op;
+
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc =3D -EFAULT;
+            break;
+        }
+
+        rc =3D hvmop_set_evtchn_upcall_vector(op);
         break;
+    }
    =20
     case HVMOP_set_param:
-        rc =3D hvmop_set_param(
-            guest_handle_cast(arg, xen_hvm_param_t));
+    {
+        struct xen_hvm_param op;
+       =20
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc =3D -EFAULT;
+            break;
+        }
+
+        rc =3D hvmop_set_param(op);
         break;
+    }
=20
     case HVMOP_get_param:
-        rc =3D hvmop_get_param(
-            guest_handle_cast(arg, xen_hvm_param_t));
+    {
+        struct xen_hvm_param op;
+       =20
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc =3D -EFAULT;
+            break;
+        }
+
+        rc =3D hvmop_get_param(&op);
+
+        if ( !rc && copy_to_guest(arg, &op, 1) )
+            rc =3D -EFAULT;
         break;
+    }
=20
     case HVMOP_flush_tlbs:
         rc =3D guest_handle_is_null(arg) ? hvmop_flush_tlb_all() : -EINVA=
L;
         break;
=20
     case HVMOP_get_mem_type:
-        rc =3D hvmop_get_mem_type(
-            guest_handle_cast(arg, xen_hvm_get_mem_type_t));
+    {
+        struct xen_hvm_get_mem_type op;
+
+        if ( copy_from_guest(&op, arg, 1) )
+        {
+            rc =3D -EFAULT;
+            break;
+        }
+       =20
+        rc =3D hvmop_get_mem_type(&op);
+
+        if ( !rc && copy_to_guest(arg, &op, 1) )
+            rc =3D -EFAULT;
         break;
+    }
=20
     case HVMOP_pagetable_dying:
     {
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.12d.b157812cfadf7ccc.1a20e7823cc.3fb1a740ccce60b8=---

