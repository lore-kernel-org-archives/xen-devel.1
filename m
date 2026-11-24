Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD96A606A699
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=MTXHf2Km
Received: from list by lists.xenproject.org with outflank-mailman.1501263.1697362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk2-00006n-Pr; Tue, 24 Nov 2026 16:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501263.1697362; Tue, 24 Nov 2026 16:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk2-00005H-GM; Tue, 24 Nov 2026 16:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1501263;
 Tue, 24 Nov 2026 16:51:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk1-0008Bh-9Z
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk0-004DBX-MJ
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:36 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e783f1a0001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:36 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e783f1a0001cf5@swg.vates.tech>)
 id 6b05c095-4cb1-0a2a45050019-b9ff1c228ac5-5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:36 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e783f1a0001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:31 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 94DC582B4D;
 Tue, 24 Nov 2026 17:51:30 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=UOJrblKuEKEd9KChzA9B82Pgfnbq9SWr/dqXZ1tAxC8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=MTXHf2KmDwwo4RFi7u3zCjPcsmXfB1E1PlTqT7YkseLTA9yAvraDd4IUGPkAh1XzWAwTWElb3
 spTAqqTSiR0GgxJiCKFCnJ4otWDDwFlD/4HAi7QfV9hyixV6qgptJjKhVKjNTPhzmGQqO9KpofF
 1QDQMmQs9urheWST7CqFFFmlpKPBXSGMksoqEY5hZMTYW3gxYIESRaker9JzTq1aej1S4LCI6QB
 t3UAZr7L43djZNV/tRfAP21wvrOnnsochZpkUvFiGEp1Sl9gkd5XMFxq2l3vCCmKRb0hJekl8Yx
 HqQA5gNWJ8QMhOtTbBSUspui9IgoCiJtdrn+qGD3ntpA==
X-Zone-Loop: 51e7a63e1d4abdf3b24e88ce0cc71ea6d2e07fb9c43a
x-campaign-type: default
x-transaction-id: d398432e-3026-4d0e-9abe-355b6093a584
x-swg-uid: 01-1e21f799-2367-458e-bf1f-14833636b1b9
X-Mailer: Sweego
Message-ID:
 <1795539091.8631fc262581453bbf619ec5b2062170.1a20e783f1a0001cf5@vates.tech>
x-swg-bid: 1795539091.8631fc262581453bbf619ec5b2062170.1a20e783f1a0001cf5
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
Subject: [RFC PATCH v2 07/13] fastabi: Introduce vcpu_op
Date: Tue, 24 Nov 2026 17:50:35 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.133.4f6577c94b5809e3.1a20e783d94.1d5701840158c8e1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539090836
X-purgate-ID: tlsNG-c201ff/1795539096-F76BD2A1-9E0B2426/10/73395122804
X-purgate-type: spam
X-purgate-size: 12399
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.133.4f6577c94b5809e3.1a20e783d94.1d5701840158c8e1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Only phys_area variants of vcpu_time/runstate are implemented=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

Do we need "initialise" ?

 docs/guest-guide/fastabi/abi/vcpu=2Eyml | 139 +++++++++++++++++++++
 xen/arch/x86/domain=2Ec                 |  67 ++++++++++
 xen/common/domain=2Ec                   | 171 ++++++++++++++++++++++++++
 xen/common/fastabi=2Ec                  |   4 +
 xen/include/xen/fastabi=2Eh             |   2 +
 5 files changed, 383 insertions(+)
 create mode 100644 docs/guest-guide/fastabi/abi/vcpu=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/vcpu=2Eyml b/docs/guest-guide/fa=
stabi/abi/vcpu=2Eyml
new file mode 100644
index 0000000000=2E=2E0b4fe4ea1f
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/vcpu=2Eyml
@@ -0,0 +1,139 @@
+name: vcpu
+hypercall_index: 24
+
+subops:
+  initialise:
+    index: 0
+    input:
+      vcpuid: 2
+      context_gfn: 3
+    c_lang:
+      params:
+        vcpuid: uint32_t
+        context_gfn: uint64_t
+
+  up:
+    index: 1
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  down:
+    index: 2
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  is_up:
+    index: 3
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  get_runstate_info:
+    index: 4
+    input:
+      vcpuid: 2
+    output:
+      state: 2
+      state_entry_time: 3
+      time[0]: 4
+      time[1]: 5
+      time[2]: 6
+      time[3]: 7
+    c_lang:
+      struct: vcpu_runstate_info
+      params:
+        vcpuid: uint32_t
+
+  register_runstate_phys_area:
+    index: 14
+    input:
+      vcpuid: 2
+      addr=2Ep: 3
+    c_lang:
+      struct: vcpu_register_time_memory_area
+      params:
+        vcpuid: uint32_t
+
+  set_periodic_timer:
+    index: 6
+    input:
+      vcpuid: 2
+      period_ns: 3
+    c_lang:
+      struct: vcpu_set_periodic_timer
+      params:
+        vcpuid: uint32_t
+
+  stop_periodic_timer:
+    index: 7
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+ =20
+  set_singleshot_timer:
+    index: 8
+    input:
+      vcpuid: 2
+      timeout_abs_ns: 3
+      flags: 4
+    c_lang:
+      struct: vcpu_set_singleshot_timer
+      params:
+        vcpuid: uint32_t
+
+  stop_singleshot_timer:
+    index: 9
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  register_vcpu_info:
+    index: 10
+    input:
+      vcpuid: 2
+      mfn: 3
+      offset: 4
+    c_lang:
+      struct: vcpu_register_vcpu_info
+      params:
+        vcpuid: uint32_t
+
+  send_nmi:
+    index: 11
+    input:
+      vcpuid: 2
+    c_lang:
+      params:
+        vcpuid: uint32_t
+
+  get_physid:
+    index: 12
+    input:
+      vcpuid: 2
+      phys_id: 3
+    c_lang:
+      struct: vcpu_get_physid
+      params:
+        vcpuid: uint32_t
+
+  register_vcpu_time_phys_area:
+    index: 15
+    input:
+      vcpuid: 2
+      addr=2Ep: 3
+    c_lang:
+      struct: vcpu_register_time_memory_area
+      params:
+        vcpuid: uint32_t
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 368e4deff3=2E=2E3d8f26dd99 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -21,6 +21,7 @@
 #include <xen/event=2Eh>
 #include <xen/grant_table=2Eh>
 #include <xen/guest_access=2Eh>
+#include <xen/fastabi=2Eh>
 #include <xen/hypercall=2Eh>
 #include <xen/init=2Eh>
 #include <xen/iocap=2Eh>
@@ -1758,6 +1759,72 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_G=
UEST_HANDLE_PARAM(void) arg)
     return rc;
 }
=20
+#ifdef CONFIG_FASTABI
+void do_vcpu_fast_op(struct cpu_user_regs *regs)
+{
+    long rc =3D 0;
+    struct domain *d =3D current->domain;
+    struct vcpu *v;
+
+    unsigned long cmd =3D fastabi_value_n(regs, 1);
+    unsigned long vcpuid =3D fastabi_value_n(regs, 2);
+
+    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
+    {
+        fastabi_value_n(regs, 0) =3D -ENOENT;
+        return;
+    }
+
+    switch ( cmd )
+    {
+    case VCPUOP_send_nmi:
+        if ( !test_and_set_bool(v->arch=2Enmi_pending) )
+            vcpu_kick(v);
+        break;
+
+    case VCPUOP_register_vcpu_time_phys_area:
+    {
+        struct vcpu_register_time_memory_area area =3D {
+            =2Eaddr=2Ep =3D fastabi_value_n(regs, 3)
+        };
+
+        rc =3D -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_vcpu_time_phys_area setting */ )
+            break;
+
+        rc =3D map_guest_area(v, area=2Eaddr=2Ep,
+                            sizeof(vcpu_time_info_t),
+                            &v->arch=2Etime_guest_area,
+                            time_area_populate);
+        break;
+    }
+
+    case VCPUOP_get_physid:
+    {
+        rc =3D -EINVAL;
+        if ( !is_hwdom_pinned_vcpu(v) )
+            break;
+
+        fastabi_value_n(regs, 3) =3D
+            (uint64_t)x86_cpu_to_apicid[v->vcpu_id] |
+            ((uint64_t)acpi_get_processor_id(v->vcpu_id) << 32);
+
+        rc =3D 0;
+        break;
+    }
+
+    default:
+        rc =3D common_vcpu_fast_op(regs, cmd, v);
+        break;
+    }
+
+    if ( rc =3D=3D -ERESTART )
+        fastabi_make_continuation();
+    else
+        fastabi_value_n(regs, 0) =3D rc;
+}
+#endif
+
 /*
  * Notes on PV segment handling:
  *  - 32bit: All data from the GDT/LDT=2E
diff --git a/xen/common/domain=2Ec b/xen/common/domain=2Ec
index b41be89cd0=2E=2E1a3c0fea8e 100644
--- a/xen/common/domain=2Ec
+++ b/xen/common/domain=2Ec
@@ -36,6 +36,7 @@
 #include <xen/argo=2Eh>
 #include <xen/llc-coloring=2Eh>
 #include <xen/xvmalloc=2Eh>
+#include <asm/fastabi=2Eh>
 #include <asm/p2m=2Eh>
 #include <asm/processor=2Eh>
 #include <public/sched=2Eh>
@@ -2383,6 +2384,176 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_G=
UEST_HANDLE_PARAM(void) arg)
     return rc;
 }
=20
+#ifdef CONFIG_FASTABI
+long common_vcpu_fast_op(struct cpu_user_regs *regs, int cmd, struct vcpu=
 *v)
+{
+    long rc =3D 0;
+    struct domain *d =3D v->domain;
+    unsigned int vcpuid =3D v->vcpu_id;
+
+    switch ( cmd )
+    {
+    case VCPUOP_up:
+    {
+        bool wake =3D false;
+
+        domain_lock(d);
+        if ( !v->is_initialised )
+            rc =3D -EINVAL;
+        else
+            wake =3D test_and_clear_bit(_VPF_down, &v->pause_flags);
+        domain_unlock(d);
+        if ( wake )
+            vcpu_wake(v);
+    }
+
+        break;
+
+    case VCPUOP_down:
+        for_each_vcpu ( d, v )
+            if ( v->vcpu_id !=3D vcpuid && is_vcpu_online(v) )
+            {
+               rc =3D 1;
+               break;
+            }
+
+        if ( !rc ) /* Last vcpu going down? */
+        {
+            domain_shutdown(d, SHUTDOWN_poweroff);
+            break;
+        }
+
+        rc =3D 0;
+        v =3D d->vcpu[vcpuid];
+
+        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
+            vcpu_sleep_nosync(v);
+
+        break;
+
+    case VCPUOP_is_up:
+        rc =3D !(v->pause_flags & VPF_down);
+        break;
+
+    case VCPUOP_get_runstate_info:
+    {
+        struct vcpu_runstate_info runstate;
+        vcpu_runstate_get(v, &runstate);
+
+        fastabi_value_n(regs, 2) =3D runstate=2Estate;
+        fastabi_value_n(regs, 3) =3D runstate=2Estate_entry_time;
+        fastabi_value_n(regs, 4) =3D runstate=2Etime[0];
+        fastabi_value_n(regs, 5) =3D runstate=2Etime[1];
+        fastabi_value_n(regs, 6) =3D runstate=2Etime[2];
+        fastabi_value_n(regs, 7) =3D runstate=2Etime[3];
+        break;
+    }
+
+    case VCPUOP_set_periodic_timer:
+    {
+        uint64_t period_ns =3D fastabi_value_n(regs, 3);
+
+        if ( period_ns < MILLISECS(1) )
+            return -EINVAL;
+
+        if ( period_ns > STIME_DELTA_MAX )
+            return -EINVAL;
+
+        vcpu_set_periodic_timer(v, period_ns);
+
+        break;
+    }
+
+    case VCPUOP_stop_periodic_timer:
+        vcpu_set_periodic_timer(v, 0);
+        break;
+
+    case VCPUOP_set_singleshot_timer:
+    {
+        struct vcpu_set_singleshot_timer set =3D {
+            =2Etimeout_abs_ns =3D fastabi_value_n(regs, 3),
+            =2Eflags =3D fastabi_value_n(regs, 4),
+        };
+
+        if ( v !=3D current )
+            return -EINVAL;
+
+        if ( set=2Etimeout_abs_ns < NOW() )
+        {
+            /*
+             * Simplify the logic if the timeout has already expired and =
just
+             * inject the event=2E
+             */
+            stop_timer(&v->singleshot_timer);
+            send_timer_event(v);
+            break;
+        }
+
+        migrate_timer(&v->singleshot_timer, smp_processor_id());
+        set_timer(&v->singleshot_timer, set=2Etimeout_abs_ns);
+
+        break;
+    }
+
+    case VCPUOP_stop_singleshot_timer:
+        if ( v !=3D current )
+            return -EINVAL;
+
+        stop_timer(&v->singleshot_timer);
+
+        break;
+
+    case VCPUOP_register_vcpu_info:
+    {
+        struct vcpu_register_vcpu_info info =3D {
+            =2Emfn =3D fastabi_value_n(regs, 3),
+            =2Eoffset =3D fastabi_value_n(regs, 4)
+        };
+        paddr_t gaddr;
+
+        rc =3D -EINVAL;
+        gaddr =3D gfn_to_gaddr(_gfn(info=2Emfn)) + info=2Eoffset;
+        if ( !~gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) !=3D info=2Emfn )
+            break;
+
+        /* Preliminary check only; see map_guest_area()=2E */
+        rc =3D -EBUSY;
+        if ( v->vcpu_info_area=2Epg )
+            break;
+
+        /* See the BUILD_BUG_ON() in vcpu_info_populate()=2E */
+        rc =3D map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        break;
+    }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct vcpu_register_runstate_memory_area area =3D {
+            =2Eaddr=2Ep =3D fastabi_value_n(regs, 3)
+        };
+
+        rc =3D -ENOSYS;
+        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
+            break;
+
+        rc =3D map_guest_area(v, area=2Eaddr=2Ep,
+                            sizeof(struct vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        break;
+    }
+
+    default:
+        rc =3D -ENOSYS;
+        break;
+    }
+
+    return rc;
+}
+#endif
+
 #ifdef arch_vm_assist_valid_mask
 long do_vm_assist(unsigned int cmd, unsigned int type)
 {
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
index 223082ea9a=2E=2E6abe3a047f 100644
--- a/xen/common/fastabi=2Ec
+++ b/xen/common/fastabi=2Ec
@@ -19,6 +19,10 @@ void fastabi_dispatch(unsigned long index, struct cpu_u=
ser_regs *regs)
         do_xen_version_fast_op(regs);
         break;
=20
+    case __HYPERVISOR_vcpu_op:
+        do_vcpu_fast_op(regs);
+        break;
+
     case __HYPERVISOR_sched_op:
         do_sched_fast_op(regs);
         break;
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index 85244ea811=2E=2Ea3a152442f 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -10,6 +10,8 @@ void fastabi_make_continuation(void);
=20
 void do_event_channel_fast_op(struct cpu_user_regs *regs);
=20
+long common_vcpu_fast_op(struct cpu_user_regs *regs, int cmd, struct vcpu=
 *v);
+void do_vcpu_fast_op(struct cpu_user_regs *regs);
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
---=Part.133.4f6577c94b5809e3.1a20e783d94.1d5701840158c8e1=---

