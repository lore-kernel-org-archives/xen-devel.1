Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F23606A691
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VFk0mj/g
Received: from list by lists.xenproject.org with outflank-mailman.1501261.1697343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk0-00085k-Pk; Tue, 24 Nov 2026 16:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501261.1697343; Tue, 24 Nov 2026 16:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk0-00084e-Jr; Tue, 24 Nov 2026 16:51:36 +0000
Received: by outflank-mailman (input) for mailman id 1501261;
 Tue, 24 Nov 2026 16:51:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtjy-0007oW-PM
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjy-002XqQ-0W
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:34 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7838c20001cf5@swg.vates.tech>)
 id 6b05c075-bab6-0a2a0a5309dd-0a2a4506b284-44
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7838c20001cf5@swg.vates.tech>)
 id 6b05c095-195a-0a2a45060019-b9ff1c23ad3d-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7838c20001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:29 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E56C082B4D;
 Tue, 24 Nov 2026 17:51:28 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=kdrIXJugjV07vbHlp49GOUD4KsJjXOmcwx4iL45nRAA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VFk0mj/gtMdamNc5MbpgLre1Pim9Be0VoTvzG47mbnzPQnZwuinx7uYNJnmBcW2SsnQxWGlU5
 eJt9+25Ew5aztZCj5ZpgGkpXThDXNpyTnC7sunbCqa2QeOIYSbn1QOGNxVW7rEsT3FTcmVEc28b
 Uu4KeBx79o5KRh5FK3QnlkpzwD87NAlY4nAiZqcG2PXW4X0Md89SNt2v1x8y198Tdo3m+ZLXytX
 8XmAcwQMLeNJnRYvCsDWau2Smh7gLRSLJvMzXXEpCEP5rI6vGwVitdsKAqGEPKR/DQFYGRNDIoW
 U5FpC2hZCr5XGOGMNoHBy35nzwqMEOsDK9+wgYD+rg9Q==
X-Zone-Loop: e0fedf55ecba68a83d93e692acabfbcbd501934be8d3
x-campaign-type: default
x-transaction-id: f08a6eb8-2e2a-46a7-b568-1702e4146ccb
x-swg-uid: 01-1dbe1c55-0025-4706-98ba-1430c720af06
X-Mailer: Sweego
Message-ID:
 <1795539089.8631fc262581453bbf619ec5b2062170.1a20e7838c20001cf5@vates.tech>
x-swg-bid: 1795539089.8631fc262581453bbf619ec5b2062170.1a20e7838c20001cf5
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
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 05/13] fastabi: Introduce sched_op
Date: Tue, 24 Nov 2026 17:50:33 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.131.b3c47d63b6f4d937.1a20e783742.873b434ab5e004a4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539089218
X-purgate-ID: tlsNG-16d1c6/1795539093-FD80D77B-856E26E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 8592
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.131.b3c47d63b6f4d937.1a20e783742.873b434ab5e004a4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Implement sched_op for fastabi=2E

poll only support a single port=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

 docs/guest-guide/fastabi/abi/sched=2Eyml |  48 ++++++++
 xen/common/fastabi=2Ec                   |   4 +
 xen/common/sched/core=2Ec                | 145 +++++++++++++++++++++----
 xen/include/xen/fastabi=2Eh              |   1 +
 4 files changed, 179 insertions(+), 19 deletions(-)
 create mode 100644 docs/guest-guide/fastabi/abi/sched=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/sched=2Eyml b/docs/guest-guide/f=
astabi/abi/sched=2Eyml
new file mode 100644
index 0000000000=2E=2E1b1ef50c7a
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/sched=2Eyml
@@ -0,0 +1,48 @@
+name: sched
+hypercall_index: 29
+
+subops:
+  yield:
+    index: 0
+
+  block:
+    index: 1
+
+  shutdown:
+    index: 2
+    input:
+      reason: 2
+    c_lang:
+      struct: sched_shutdown
+
+  poll:
+    index: 3
+    input:
+      timeout: 2
+      port: 3
+    c_lang:
+      params:
+        timeout: uint64_t
+        port: evtchn_port_t
+
+  shutdown_code:
+    index: 5
+    input:
+      reason: 2
+    c_lang:
+      struct: sched_shutdown
+
+  watchdog:
+    index: 6
+    input:
+      id: 2
+      timeout: 3
+    c_lang:
+      struct: sched_watchdog
+
+  pin_override:
+    index: 7
+    input:
+      pcpu: 2
+    c_lang:
+      struct: sched_pin_override
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
index 1e5d8bcd9c=2E=2Eefaaaaf96b 100644
--- a/xen/common/fastabi=2Ec
+++ b/xen/common/fastabi=2Ec
@@ -19,6 +19,10 @@ void fastabi_dispatch(unsigned long index, struct cpu_u=
ser_regs *regs)
         do_xen_version_fast_op(regs);
         break;
=20
+    case __HYPERVISOR_sched_op:
+        do_sched_fast_op(regs);
+        break;
+
     default:
         fastabi_value_n(regs, 0) =3D -ENOSYS;
         break;
diff --git a/xen/common/sched/core=2Ec b/xen/common/sched/core=2Ec
index 88ae40f954=2E=2E6d180ce7d3 100644
--- a/xen/common/sched/core=2Ec
+++ b/xen/common/sched/core=2Ec
@@ -21,6 +21,7 @@
 #include <xen/domain=2Eh>
 #include <xen/delay=2Eh>
 #include <xen/event=2Eh>
+#include <xen/fastabi=2Eh>
 #include <xen/time=2Eh>
 #include <xen/timer=2Eh>
 #include <xen/perfc=2Eh>
@@ -1485,21 +1486,13 @@ void vcpu_block_enable_events(void)
     vcpu_block();
 }
=20
-static long do_poll(const struct sched_poll *sched_poll)
+static long vcpu_poll(unsigned int nr_ports, uint64_t timeout, evtchn_por=
t_t *ports)
 {
     struct vcpu   *v =3D current;
     struct domain *d =3D v->domain;
-    evtchn_port_t  port =3D 0;
     long           rc;
     unsigned int   i;
=20
-    /* Fairly arbitrary limit=2E */
-    if ( sched_poll->nr_ports > 128 )
-        return -EINVAL;
-
-    if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
-        return -EFAULT;
-
     set_bit(_VPF_blocked, &v->pause_flags);
     v->poll_evtchn =3D -1;
     set_bit(v->vcpu_id, d->poll_mask);
@@ -1526,13 +1519,9 @@ static long do_poll(const struct sched_poll *sched_=
poll)
     if ( local_events_need_delivery() )
         goto out;
=20
-    for ( i =3D 0; i < sched_poll->nr_ports; i++ )
+    for ( i =3D 0; i < nr_ports; i++ )
     {
-        rc =3D -EFAULT;
-        if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
-            goto out;
-
-        rc =3D evtchn_port_poll(d, port);
+        rc =3D evtchn_port_poll(d, ports[i]);
         if ( rc )
         {
             if ( rc > 0 )
@@ -1541,11 +1530,11 @@ static long do_poll(const struct sched_poll *sched=
_poll)
         }
     }
=20
-    if ( sched_poll->nr_ports =3D=3D 1 )
-        v->poll_evtchn =3D port;
+    if ( nr_ports =3D=3D 1 )
+        v->poll_evtchn =3D ports[0];
=20
-    if ( sched_poll->timeout !=3D 0 )
-        set_timer(&v->poll_timer, sched_poll->timeout);
+    if ( timeout !=3D 0 )
+        set_timer(&v->poll_timer, timeout);
=20
     TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
@@ -1559,6 +1548,20 @@ static long do_poll(const struct sched_poll *sched_=
poll)
     return rc;
 }
=20
+static long do_poll(struct sched_poll *sched_poll)
+{
+    evtchn_port_t ports[128];
+
+    /* Fairly arbitrary limit */
+    if ( sched_poll->nr_ports > 128 )
+        return -EINVAL;
+
+    if ( copy_from_guest(ports, sched_poll->ports, sched_poll->nr_ports) =
)
+        return -EFAULT;
+
+    return vcpu_poll(sched_poll->nr_ports, sched_poll->timeout, ports);
+}
+
 /* Voluntarily yield the processor for this allocation=2E */
 long vcpu_yield(void)
 {
@@ -1941,6 +1944,110 @@ void domain_update_node_aff(struct domain *d, stru=
ct affinity_masks *affinity)
=20
 typedef long ret_t;
=20
+#ifdef CONFIG_FASTABI
+void do_sched_fast_op(struct cpu_user_regs *regs)
+{
+    long ret =3D 0;
+    unsigned long cmd =3D fastabi_value_n(regs, 1);
+
+    switch ( cmd )
+    {
+    case SCHEDOP_yield:
+    {
+        ret =3D vcpu_yield();
+        break;
+    }
+
+    case SCHEDOP_block:
+    {
+        vcpu_block_enable_events();
+        break;
+    }
+
+    case SCHEDOP_shutdown:
+    {
+        struct sched_shutdown sched_shutdown =3D {
+            =2Ereason =3D fastabi_value_n(regs, 2)
+        };
+
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
+                   current->vcpu_id, sched_shutdown=2Ereason);
+        ret =3D domain_shutdown(current->domain, (u8)sched_shutdown=2Erea=
son);
+
+        break;
+    }
+
+    case SCHEDOP_shutdown_code:
+    {
+        struct sched_shutdown sched_shutdown =3D {
+            =2Ereason =3D fastabi_value_n(regs, 2)
+        };
+        struct domain *d =3D current->domain;
+
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_i=
d,
+                   sched_shutdown=2Ereason);
+
+        spin_lock(&d->shutdown_lock);
+        if ( d->shutdown_code =3D=3D SHUTDOWN_CODE_INVALID )
+            d->shutdown_code =3D (u8)sched_shutdown=2Ereason;
+        spin_unlock(&d->shutdown_lock);
+
+        ret =3D 0;
+        break;
+    }
+
+    case SCHEDOP_poll:
+    {
+        uint64_t timeout =3D fastabi_value_n(regs, 2);
+        evtchn_port_t port =3D fastabi_value_n(regs, 3);
+
+        ret =3D vcpu_poll(1, timeout, &port);
+
+        break;
+    }
+
+    case SCHEDOP_watchdog:
+    {
+        struct sched_watchdog sched_watchdog =3D {
+            =2Eid =3D fastabi_value_n(regs, 2),
+            =2Etimeout =3D fastabi_value_n(regs, 3)
+        };
+
+        ret =3D domain_watchdog(
+            current->domain, sched_watchdog=2Eid, sched_watchdog=2Etimeou=
t);
+        break;
+    }
+
+    case SCHEDOP_pin_override:
+    {
+        struct sched_pin_override sched_pin_override =3D {
+            =2Epcpu =3D fastabi_value_n(regs, 2),
+        };
+        unsigned int cpu;
+
+        ret =3D -EPERM;
+        if ( !is_hardware_domain(current->domain) )
+            break;
+
+        ret =3D -EINVAL;
+        if ( sched_pin_override=2Epcpu >=3D NR_CPUS )
+           break;
+
+        cpu =3D sched_pin_override=2Epcpu < 0 ? NR_CPUS : sched_pin_overr=
ide=2Epcpu;
+        ret =3D vcpu_temporary_affinity(current, cpu, VCPU_AFFINITY_OVERR=
IDE);
+
+        break;
+    }
+
+    default:
+        ret =3D -ENOSYS;
+        break;
+    }
+
+    fastabi_value_n(regs, 0) =3D ret;
+}
+#endif
+
 #endif /* !COMPAT */
=20
 ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index 2427093dc7=2E=2E9364a85fc5 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -8,5 +8,6 @@
 void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs);
 void fastabi_make_continuation(void);
=20
+void do_sched_fast_op(struct cpu_user_regs *regs);
 void do_xen_version_fast_op(struct cpu_user_regs *regs);
 #endif /* XEN_FASTABI_H */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.131.b3c47d63b6f4d937.1a20e783742.873b434ab5e004a4=---

