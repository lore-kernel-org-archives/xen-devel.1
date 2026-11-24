Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451A606A69E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VS4LQSjw
Received: from list by lists.xenproject.org with outflank-mailman.1501264.1697374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk5-0000c9-DO; Tue, 24 Nov 2026 16:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501264.1697374; Tue, 24 Nov 2026 16:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk5-0000bo-7C; Tue, 24 Nov 2026 16:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1501264;
 Tue, 24 Nov 2026 16:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk2-0008Pb-3R
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk1-004zem-Fi
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7841e90001cf5@swg.vates.tech>)
 id 6b05c08e-e002-0a2a0a5209dd-0a2a45089c0e-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:37 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7841e90001cf5@swg.vates.tech>)
 id 6b05c099-f659-0a2a45080019-b9ff1c12b0d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7841e90001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:31 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5288C82B4D;
 Tue, 24 Nov 2026 17:51:31 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=kqMHAAssV5gEuL9YDmulej2nddRUJPqapM0c1fglSf0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VS4LQSjwdnIhjL/DYM5rRnopDThjlK8zHTNEwlO63frBDgT78egfkjDyTYQoya2a4vT79bYXP
 GSFTdNtEuBKsI3M1tSoGkZfTNTtJyfe7ohDBu/ubwKmJJUwVV0wSyWPdEBttrZ4Atw4TccxY/Lu
 WdyOHqE9fgqTxVaWWb0RfRahP+kz6mdIWpSNjJlXB+P6Y68jNbmYKx/wJ4hw+6HoDcLqaziLiOD
 96bRhTxqoj8pOR14Ciq0FZbPpuHpvlyTo1Yc0BLL/vb/E0JDV2FYVKEjX7NiKKHFcBfibO4BANm
 C83nekNUrOjrvoGUHcHEP1UAAQRQ7BZqO3Uj5n19QoZQ==
X-Zone-Loop: 6033dc76656be00fd091175ea2b9a3e0dde34065d6b4
x-campaign-type: default
x-transaction-id: a671c12b-0217-4b68-a3b4-e95fd51c9ac4
x-swg-uid: 01-9f36267b-8f47-4188-a3f0-6a49e290f7ec
X-Mailer: Sweego
Message-ID:
 <1795539092.8631fc262581453bbf619ec5b2062170.1a20e7841e90001cf5@vates.tech>
x-swg-bid: 1795539092.8631fc262581453bbf619ec5b2062170.1a20e7841e90001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 08/13] fastabi: Introduce hvm_op
Date: Tue, 24 Nov 2026 17:50:36 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.134.fbd78efc32d7eb8f.1a20e784067.8a630e0813724f84=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539091559
X-purgate-ID: tlsNG-c1860d/1795539097-CD74B87B-6CC46CE1/10/73395122804
X-purgate-type: spam
X-purgate-size: 5835
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.134.fbd78efc32d7eb8f.1a20e784067.8a630e0813724f84=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 docs/guest-guide/fastabi/abi/hvm=2Eyml | 50 ++++++++++++++++++
 xen/arch/x86/hvm/hvm=2Ec               | 78 +++++++++++++++++++++++++++-
 xen/common/fastabi=2Ec                 |  4 ++
 xen/include/xen/fastabi=2Eh            |  1 +
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 docs/guest-guide/fastabi/abi/hvm=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/hvm=2Eyml b/docs/guest-guide/fas=
tabi/abi/hvm=2Eyml
new file mode 100644
index 0000000000=2E=2E20c2421bdf
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/hvm=2Eyml
@@ -0,0 +1,50 @@
+name: hvm
+hypercall_index: 34
+
+subops:
+  set_param:
+    index: 0
+    input:
+      domid: 2
+      index: 3
+      value: 4
+    c_lang:
+      struct: xen_hvm_param
+
+  get_param:
+    index: 1
+    input:
+      domid: 2
+      index: 3
+    output:
+      value: 4
+    c_lang:
+      struct: xen_hvm_param
+
+  flush_tlbs:
+    index: 5
+
+  get_time:
+    index: 10
+    output:
+      now: 2
+    c_lang:
+      struct: xen_hvm_get_time
+
+  get_mem_type:
+    index: 15
+    input:
+      domid: 2
+      pfn: 3
+    output:
+      mem_type: 4
+    c_lang:
+      struct: xen_hvm_get_mem_type
+
+  set_evtchn_upcall_vector:
+    index: 23
+    input:
+      vcpu: 2
+      vector: 3
+    c_lang:
+      struct: xen_hvm_evtchn_upcall_vector
diff --git a/xen/arch/x86/hvm/hvm=2Ec b/xen/arch/x86/hvm/hvm=2Ec
index 45d91ff62a=2E=2Ed74b65b6b1 100644
--- a/xen/arch/x86/hvm/hvm=2Ec
+++ b/xen/arch/x86/hvm/hvm=2Ec
@@ -12,6 +12,7 @@
 #include <xen/domain=2Eh>
 #include <xen/domain_page=2Eh>
 #include <xen/event=2Eh>
+#include <xen/fastabi=2Eh>
 #include <xen/guest_access=2Eh>
 #include <xen/hypercall=2Eh>
 #include <xen/init=2Eh>
@@ -4510,7 +4511,7 @@ static int hvmop_get_param(struct xen_hvm_param *op)
=20
     rc =3D -EINVAL;
     if ( is_hvm_domain(d) && !(rc =3D hvm_get_param(d, op->index, &op->va=
lue)) )
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u =3D %"PRIx64, a=2Einde=
x, a=2Evalue);
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "get param %u =3D %"PRIx64, op->inde=
x, op->value);
=20
     rcu_unlock_domain(d);
     return rc;
@@ -5214,6 +5215,81 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_P=
ARAM(void) arg)
     return rc;
 }
=20
+#ifdef CONFIG_FASTABI
+void do_hvm_fast_op(struct cpu_user_regs *regs)
+{
+    long rc =3D 0;
+    unsigned long op =3D fastabi_value_n(regs, 1);
+
+    switch ( op )
+    {
+    case HVMOP_set_evtchn_upcall_vector:
+    {
+        struct xen_hvm_evtchn_upcall_vector op =3D {
+            =2Evcpu =3D fastabi_value_n(regs, 2),
+            =2Evector =3D fastabi_value_n(regs, 3),
+        };
+
+        rc =3D hvmop_set_evtchn_upcall_vector(op);
+        break;
+    }
+
+    case HVMOP_set_param:
+    {
+        struct xen_hvm_param op =3D {
+            =2Edomid =3D fastabi_value_n(regs, 2),
+            =2Eindex =3D fastabi_value_n(regs, 3),
+            =2Evalue =3D fastabi_value_n(regs, 4),
+        };
+
+        rc =3D hvmop_set_param(op);
+        break;
+    }
+
+    case HVMOP_get_param:
+    {
+        struct xen_hvm_param op =3D {
+            =2Edomid =3D fastabi_value_n(regs, 2),
+            =2Eindex =3D fastabi_value_n(regs, 3),
+        };
+
+        rc =3D hvmop_get_param(&op);
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D op=2Evalue;
+        break;
+    }
+
+    case HVMOP_flush_tlbs:
+        rc =3D hvmop_flush_tlb_all();
+        break;
+
+    case HVMOP_get_time:
+        fastabi_value_n(regs, 2) =3D NOW();
+        break;
+   =20
+    case HVMOP_get_mem_type:
+    {
+        struct xen_hvm_get_mem_type op =3D {
+            =2Edomid =3D fastabi_value_n(regs, 2),
+            =2Epfn =3D fastabi_value_n(regs, 3),
+        };
+
+        rc =3D hvmop_get_mem_type(&op);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D op=2Emem_type;
+        break;
+    }
+
+    default:
+        rc =3D -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) =3D rc;
+}
+#endif
+
 int hvm_debug_op(struct vcpu *v, int32_t op)
 {
     int rc =3D 0;
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
index 6abe3a047f=2E=2E6c7e61ae34 100644
--- a/xen/common/fastabi=2Ec
+++ b/xen/common/fastabi=2Ec
@@ -31,6 +31,10 @@ void fastabi_dispatch(unsigned long index, struct cpu_u=
ser_regs *regs)
         do_event_channel_fast_op(regs);
         break;
=20
+    case __HYPERVISOR_hvm_op:
+        do_hvm_fast_op(regs);
+        break;
+
     default:
         fastabi_value_n(regs, 0) =3D -ENOSYS;
         break;
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index a3a152442f=2E=2Ede5a349787 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -12,6 +12,7 @@ void do_event_channel_fast_op(struct cpu_user_regs *regs=
);
=20
 long common_vcpu_fast_op(struct cpu_user_regs *regs, int cmd, struct vcpu=
 *v);
 void do_vcpu_fast_op(struct cpu_user_regs *regs);
+void do_hvm_fast_op(struct cpu_user_regs *regs);
 void do_sched_fast_op(struct cpu_user_regs *regs);
 void do_xen_version_fast_op(struct cpu_user_regs *regs);
 #endif /* XEN_FASTABI_H */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.134.fbd78efc32d7eb8f.1a20e784067.8a630e0813724f84=---

