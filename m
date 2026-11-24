Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E85606A686
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=rSJju4W4
Received: from list by lists.xenproject.org with outflank-mailman.1501262.1697357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk2-0008V3-CB; Tue, 24 Nov 2026 16:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501262.1697357; Tue, 24 Nov 2026 16:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk2-0008UC-60; Tue, 24 Nov 2026 16:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1501262;
 Tue, 24 Nov 2026 16:51:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk0-00082l-QG
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjz-004DBX-VW
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:35 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e783c310001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-34
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:35 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e783c310001cf5@swg.vates.tech>)
 id 6b05c095-4cb1-0a2a45050019-b9ff1c228ac5-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:35 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e783c310001cf5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:30 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CFA9E82B4D;
 Tue, 24 Nov 2026 17:51:29 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=CtcFt/2MGu3BfCmYPRfEskYhtBgletHje/lLnJsqG+c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rSJju4W4rz/cZ4X0ey/Yy0epl1itWr2gWd5kBC4UntaSKySUnd0dW99j3xylu0r/FHEOPxcLo
 ZitnWdXZQj2aVZaQ6hQlsUO7mlZgEXLOZcR5vFnKGaIAUYbbi9NPT/NOczpPAkdAAV209mmaHcO
 cjH8uOTLi2s020vicDto4ctloQnfutUH/usYyGdYBuWB8o2q7HhlSM0Qn98KZoUoAILGlAAW+I2
 xLPrQKMFM6kgM2wbIUCMQEQMML/zZpjJjlkaH43Mudx0VtRL/FMOtIwop6HYfRrMu4E+QAYPfTV
 7+XiYhWG/gVsvMxbry3d7k5e7EvVlIvCiOwlaXaM6sSQ==
X-Zone-Loop: 54e240f15f5036659dedb8d05e4023852ac075ec3dbc
x-campaign-type: default
x-transaction-id: 7fd3ef5a-201f-4afa-94be-cb80e415ebb7
x-swg-uid: 01-3ec243f0-4edd-4945-be04-dc5407bfaf72
X-Mailer: Sweego
Message-ID:
 <1795539090.8631fc262581453bbf619ec5b2062170.1a20e783c310001cf5@vates.tech>
x-swg-bid: 1795539090.8631fc262581453bbf619ec5b2062170.1a20e783c310001cf5
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 06/13] fastabi: Introduce event_channel_op
Date: Tue, 24 Nov 2026 17:50:34 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.132.43ad86f96c9a942e.1a20e783aae.92aa647da842281e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539090094
X-purgate-ID: tlsNG-c201ff/1795539095-72CB02A1-3A0D77F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 11073
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.132.43ad86f96c9a942e.1a20e783aae.92aa647da842281e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 =2E=2E=2E/guest-guide/fastabi/abi/event_channel=2Eyml | 130 ++++++++++++
 xen/common/event_channel=2Ec                    | 198 ++++++++++++++++++
 xen/common/fastabi=2Ec                          |   4 +
 xen/include/xen/fastabi=2Eh                     |   2 +
 4 files changed, 334 insertions(+)
 create mode 100644 docs/guest-guide/fastabi/abi/event_channel=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/event_channel=2Eyml b/docs/guest=
-guide/fastabi/abi/event_channel=2Eyml
new file mode 100644
index 0000000000=2E=2Eee9d92a4cf
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/event_channel=2Eyml
@@ -0,0 +1,130 @@
+name: event_channel
+hypercall_index: 32
+
+subops:
+  alloc_unbound:
+    index: 6
+    input:
+      dom: 2
+      remote_dom: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_alloc_unbound
+
+  bind_interdomain:
+    index: 0
+    input:
+      remote_dom: 2
+      remote_port: 3
+    output:
+      local_port: 4
+    c_lang:
+      struct: evtchn_bind_interdomain
+
+  bind_virq:
+    index: 1
+    input:
+      virq: 2
+      vcpu: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_virq
+
+  bind_ipi:
+    index: 7
+    input:
+      vcpu: 2
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_ipi
+
+  bind_pirq:
+    index: 2
+    input:
+      pirq: 2
+      flags: 3
+    output:
+      port: 4
+    c_lang:
+      struct: evtchn_bind_pirq
+ =20
+  close:
+    index: 3
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_close
+ =20
+  send:
+    index: 4
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_send
+
+  status:
+    index: 5
+    input:
+      dom: 2
+      port: 3
+    output:
+      status: 4
+      vcpu: 5
+      output1: 6
+      output2: 7
+    c_lang:
+      struct: evtchn_status
+      mapping:
+        output1: u=2Eraw=2E_output1
+        output2: u=2Eraw=2E_output2
+ =20
+  bind_vcpu:
+    index: 8
+    input:
+      vcpu: 2
+      port: 3
+    c_lang:
+      struct: evtchn_bind_vcpu
+ =20
+  unmask:
+    index: 9
+    input:
+      port: 2
+    c_lang:
+      struct: evtchn_unmask
+ =20
+  reset:
+    index: 10
+    input:
+      dom: 2
+    c_lang:
+      struct: evtchn_reset
+
+  init_control:
+    index: 11
+    input:
+      control_gfn: 2
+      offset: 3
+      vcpu: 4
+    output:
+      link_bits: 5
+    c_lang:
+      struct: evtchn_init_control
+ =20
+  expand_array:
+    index: 12
+    input:
+      array_gfn: 2
+    c_lang:
+      struct: evtchn_expand_array
+
+  set_priority:
+    index: 13
+    input:
+      port: 2
+      priority: 3
+    c_lang:
+      struct: evtchn_set_priority
diff --git a/xen/common/event_channel=2Ec b/xen/common/event_channel=2Ec
index 97104bea15=2E=2E01cc68be30 100644
--- a/xen/common/event_channel=2Ec
+++ b/xen/common/event_channel=2Ec
@@ -19,6 +19,7 @@
 #include <xen/init=2Eh>
 #include <xen/lib=2Eh>
 #include <xen/errno=2Eh>
+#include <xen/fastabi=2Eh>
 #include <xen/sched=2Eh>
 #include <xen/irq=2Eh>
 #include <xen/iocap=2Eh>
@@ -1564,6 +1565,203 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
     return rc;
 }
=20
+#ifdef CONFIG_FASTABI
+void do_event_channel_fast_op(struct cpu_user_regs *regs)
+{
+    long rc;
+    uint64_t cmd =3D fastabi_value_n(regs, 1);
+
+    switch ( cmd )
+    {
+    case EVTCHNOP_alloc_unbound: {
+        struct evtchn_alloc_unbound alloc_unbound =3D {
+            =2Edom =3D fastabi_value_n(regs, 2),
+            =2Eremote_dom =3D fastabi_value_n(regs, 3),
+            =2Eport =3D 0,
+        };
+        rc =3D evtchn_alloc_unbound(&alloc_unbound, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D alloc_unbound=2Eport;
+        break;
+    }
+
+    case EVTCHNOP_bind_interdomain: {
+        struct evtchn_bind_interdomain bind_interdomain =3D {
+            =2Eremote_dom =3D fastabi_value_n(regs, 2),
+            =2Eremote_port =3D fastabi_value_n(regs, 3),
+            =2Elocal_port =3D 0,
+        };
+        rc =3D evtchn_bind_interdomain(&bind_interdomain, current->domain=
, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D bind_interdomain=2Elocal_port;
+        break;
+    }
+
+    case EVTCHNOP_bind_virq: {
+        struct evtchn_bind_virq bind_virq =3D {
+            =2Evirq =3D fastabi_value_n(regs, 2),
+            =2Evcpu =3D fastabi_value_n(regs, 3),
+            =2Eport =3D 0,
+        };
+        rc =3D evtchn_bind_virq(&bind_virq, 0);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D bind_virq=2Eport;
+        break;
+    }
+
+    case EVTCHNOP_bind_ipi: {
+        struct evtchn_bind_ipi bind_ipi =3D {
+            =2Evcpu =3D fastabi_value_n(regs, 2),
+            =2Eport =3D 0,
+        };
+        rc =3D evtchn_bind_ipi(&bind_ipi);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D bind_ipi=2Eport;
+        break;
+    }
+
+    case EVTCHNOP_bind_pirq: {
+        struct evtchn_bind_pirq bind_pirq =3D {
+            =2Epirq =3D fastabi_value_n(regs, 2),
+            =2Eflags =3D fastabi_value_n(regs, 3),
+        };
+        rc =3D evtchn_bind_pirq(&bind_pirq);
+
+        if ( !rc )
+            fastabi_value_n(regs, 4) =3D bind_pirq=2Eport;
+        break;
+    }
+
+    case EVTCHNOP_close: {
+        struct evtchn_close close =3D { =2Eport =3D fastabi_value_n(regs,=
 2) };
+        rc =3D evtchn_close(current->domain, close=2Eport, 1);
+        break;
+    }
+
+    case EVTCHNOP_send: {
+        struct evtchn_send send =3D { =2Eport =3D fastabi_value_n(regs, 2=
) };
+        rc =3D evtchn_send(current->domain, send=2Eport);
+        break;
+    }
+
+    case EVTCHNOP_status: {
+        struct evtchn_status status =3D {
+            =2Edom =3D fastabi_value_n(regs, 2),
+            =2Eport =3D fastabi_value_n(regs, 3),
+        };
+        rc =3D evtchn_status(&status);
+
+        if ( !rc )
+        {
+            fastabi_value_n(regs, 4) =3D status=2Estatus;
+            fastabi_value_n(regs, 5) =3D status=2Evcpu;
+
+            switch (status=2Estatus)
+            {
+            case EVTCHNSTAT_unbound:
+                fastabi_value_n(regs, 6) =3D status=2Eu=2Eunbound=2Edom;
+                break;
+            case EVTCHNSTAT_interdomain:
+                fastabi_value_n(regs, 6) =3D status=2Eu=2Einterdomain=2Ed=
om;
+                fastabi_value_n(regs, 7) =3D status=2Eu=2Einterdomain=2Ep=
ort;
+                break;
+            case EVTCHNSTAT_pirq:
+                fastabi_value_n(regs, 6) =3D status=2Eu=2Epirq;
+                break;
+            case EVTCHNSTAT_virq:
+                fastabi_value_n(regs, 6) =3D status=2Eu=2Evirq;
+                break;
+            default:
+                break;
+            }
+        }
+        break;
+    }
+
+    case EVTCHNOP_bind_vcpu: {
+        struct evtchn_bind_vcpu bind_vcpu =3D {
+            =2Evcpu =3D fastabi_value_n(regs, 2),
+            =2Eport =3D fastabi_value_n(regs, 3)
+        };
+        rc =3D evtchn_bind_vcpu(bind_vcpu=2Eport, bind_vcpu=2Evcpu);
+        break;
+    }
+
+    case EVTCHNOP_unmask: {
+        struct evtchn_unmask unmask =3D { =2Eport =3D fastabi_value_n(reg=
s, 2) };
+        rc =3D evtchn_unmask(unmask=2Eport);
+        break;
+    }
+
+    case EVTCHNOP_reset:
+    case EVTCHNOP_reset_cont: {
+        struct evtchn_reset reset =3D { =2Edom =3D fastabi_value_n(regs, =
2) };
+        struct domain *d;
+
+        d =3D rcu_lock_domain_by_any_id(reset=2Edom);
+        if ( d =3D=3D NULL )
+        {
+            rc =3D -ESRCH;
+            break;
+        }
+
+        rc =3D xsm_evtchn_reset(XSM_TARGET, current->domain, d);
+        if ( !rc )
+            rc =3D evtchn_reset(d, cmd =3D=3D EVTCHNOP_reset_cont);
+
+        rcu_unlock_domain(d);
+
+        if ( rc =3D=3D -ERESTART )
+        {
+            fastabi_value_n(regs, 1) =3D EVTCHNOP_reset_cont;
+            fastabi_make_continuation();
+            return;
+        }
+        break;
+    }
+
+    case EVTCHNOP_init_control: {
+        struct evtchn_init_control init_control =3D {
+            =2Econtrol_gfn =3D fastabi_value_n(regs, 2),
+            =2Eoffset =3D fastabi_value_n(regs, 3),
+            =2Evcpu =3D fastabi_value_n(regs, 4)
+        };
+        rc =3D evtchn_fifo_init_control(&init_control);
+
+        if ( !rc )
+            fastabi_value_n(regs, 5) =3D init_control=2Elink_bits;
+        break;
+    }
+
+    case EVTCHNOP_expand_array: {
+        struct evtchn_expand_array expand_array =3D {
+            =2Earray_gfn =3D fastabi_value_n(regs, 2)
+        };
+        rc =3D evtchn_fifo_expand_array(&expand_array);
+        break;
+    }
+
+    case EVTCHNOP_set_priority: {
+        struct evtchn_set_priority set_priority =3D {
+            =2Eport =3D fastabi_value_n(regs, 2),
+            =2Epriority =3D fastabi_value_n(regs, 3),
+        };
+        rc =3D evtchn_set_priority(&set_priority);
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
=20
 int alloc_unbound_xen_event_channel(
     struct domain *ld, unsigned int lvcpu, domid_t remote_domid,
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
index efaaaaf96b=2E=2E223082ea9a 100644
--- a/xen/common/fastabi=2Ec
+++ b/xen/common/fastabi=2Ec
@@ -23,6 +23,10 @@ void fastabi_dispatch(unsigned long index, struct cpu_u=
ser_regs *regs)
         do_sched_fast_op(regs);
         break;
=20
+    case __HYPERVISOR_event_channel_op:
+        do_event_channel_fast_op(regs);
+        break;
+
     default:
         fastabi_value_n(regs, 0) =3D -ENOSYS;
         break;
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index 9364a85fc5=2E=2E85244ea811 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -8,6 +8,8 @@
 void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs);
 void fastabi_make_continuation(void);
=20
+void do_event_channel_fast_op(struct cpu_user_regs *regs);
+
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
---=Part.132.43ad86f96c9a942e.1a20e783aae.92aa647da842281e=---

