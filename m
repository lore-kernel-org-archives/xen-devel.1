Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A5DCC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:07:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452490.1667353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOO-0007q8-Um; Fri, 16 Oct 2026 17:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452490.1667353; Fri, 16 Oct 2026 17:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOO-0007ps-OY; Fri, 16 Oct 2026 17:06:52 +0000
Received: by outflank-mailman (input) for mailman id 1452490;
 Fri, 16 Oct 2026 17:06:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae12660008425@swg.vates.tech>)
 id 1xHlON-0007hO-CJ
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOM-003ZI0-PR
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae12660008425@swg.vates.tech>)
 id 6ad25998-2eae-0a2a0a5409dd-0a2a45018f3e-22
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae12660008425@swg.vates.tech>)
 id 6ad259aa-5984-0a2a45010019-b9ff1c2296c1-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae12660008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:38 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6A8C182A13;
 Fri, 16 Oct 2026 19:06:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VS4quSyVJhh8mzjqUt+vcxd0p5YKDAPuKL8x46oLPQ4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ngwg0LiOjRWYsTuh8be8o3VL3vm9Z6IvImBSborsP8Ck+qglz3fTuuu5HJTvRu50SxVwTpYv/
 zokYXgVbAn6bgLZLqmFxB26NS1eJnnnxzjGRIMlOnaLF4oIV9o+ru8SPtSUhmBq8nfTS9Yd3giA
 M9qQgV6pY0cjgQ2PJ336xl4SXYS6/WtId4YcXixI9yZS7W8+uy9SZGLy7PsqPWIez4+a7tpCdbX
 unYX/Zt3vHrc+MenjtIe9LsU+UXB43HgyfwKzC249WUugp/nDkLw2+UuwUX981OhrTS8ldqJFa5
 aBpWvTkETVGXgQbDRkxJHUeW+4uPxBVrvwcguYu1wIRg==
X-Zone-Loop: 6b903ccc1841e9912c15d2cf2358dfced6715bd3f703
x-campaign-type: default
x-transaction-id: 31f0c2a9-1bd0-4229-88f3-6a476471b5d9
x-swg-uid: 01-dcffddd3-b704-4a2b-8adf-68aeb56c5ca0
X-Mailer: Sweego
Message-ID:
 <1792170398.8631fc262581453bbf619ec5b2062170.1a145ae12660008425@vates.tech>
x-swg-bid: 1792170398.8631fc262581453bbf619ec5b2062170.1a145ae12660008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Woodhouse <dwmw2@infradead.org>,
	George Dunlap <gwd@xenproject.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] x86/xen/time: Use VCPUOP_register_{runstate,vcpu_time}_phys_area when available
Date: Fri, 16 Oct 2026 19:06:12 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2fc.1e3869260948a3ed.1a145ae0fc6.e3537833f6f70b36=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170397638
X-purgate-ID: tlsNG-d62444/1792170410-BDE78757-EC8C4E95/0/0
X-purgate-type: clean
X-purgate-size: 8806

---=Part.2fc.1e3869260948a3ed.1a145ae0fc6.e3537833f6f70b36=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Updating these area can be expensive when done through virtual addresses
(especially for runstate one), in particular for HVM/PVH guests=2E
Xen 4=2E18 introduced physical address alternatives to address those
short-commings, but they aren't used currently=2E

Fix it by using these alternatives when available (when reported in
XENFEAT_{runstate,vcpu_time}_phys_area=2E

Assisted-by: LLM
[guidance and testing]
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: David Woodhouse <dwmw2@infradead=2Eorg>
CC: George Dunlap <gwd@xenproject=2Eorg>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

For PV, this actually depends on
"x86/xen/pv: Don't setup runstate area too early"

When using phys_area ABI, the struct is not allowed to cross a page
boundary anymore, hence we need to be careful with per-cpu struct
alignment=2E

v2:
 - Add PV domain support=2E
 - Clarify xen_register_time_area()
 - fold out &per_cpu(xen_runstate, cpu) in a separate variable
---
 arch/x86/xen/time=2Ec              | 42 ++++++++++++++++++++------------
 drivers/xen/time=2Ec               | 24 +++++++++++++-----
 include/xen/interface/features=2Eh |  9 +++++++
 include/xen/interface/vcpu=2Eh     | 17 +++++++++++++
 4 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/arch/x86/xen/time=2Ec b/arch/x86/xen/time=2Ec
index 0d8643cc8159=2E=2E5fa22925c0d5 100644
--- a/arch/x86/xen/time=2Ec
+++ b/arch/x86/xen/time=2Ec
@@ -21,6 +21,7 @@
 #include <asm/cpuid/api=2Eh>
 #include <asm/pvclock=2Eh>
 #include <asm/timer=2Eh>
+#include <asm/xen/page=2Eh>
 #include <asm/xen/hypervisor=2Eh>
 #include <asm/xen/hypercall=2Eh>
 #include <asm/xen/cpuid=2Eh>
@@ -37,6 +38,28 @@
=20
 static u64 xen_sched_clock_offset __read_mostly;
=20
+/*
+ * Register the vcpu time info for vCPU 0 to pvti=2E
+ * When NULL is passed, unregister the time area instead=2E
+ *
+ * Register using physical address when available (reported by
+ * XENFEAT_vcpu_time_phys_area), and use virtual address otherwise=2E
+ */
+static int xen_register_time_area(struct pvclock_vcpu_time_info *pvti)
+{
+	struct vcpu_register_time_memory_area t;
+	bool phys =3D xen_feature(XENFEAT_vcpu_time_phys_area);
+	int op =3D phys ? VCPUOP_register_vcpu_time_phys_area
+		      : VCPUOP_register_vcpu_time_memory_area;
+
+	if (phys)
+		t=2Eaddr=2Ep =3D pvti ? virt_to_guest(pvti)=2Egaddr : ~0LLU;
+	else
+		t=2Eaddr=2Ev =3D pvti;
+
+	return HYPERVISOR_vcpu_op(op, 0, &t);
+}
+
 /* Get the TSC speed from Xen */
 static unsigned long xen_tsc_khz(void)
 {
@@ -395,7 +418,6 @@ static u64 xen_clock_value_saved;
=20
 void xen_save_time_memory_area(void)
 {
-	struct vcpu_register_time_memory_area t;
 	int ret;
=20
 	xen_clock_value_saved =3D xen_clocksource_read() - xen_sched_clock_offse=
t;
@@ -403,25 +425,20 @@ void xen_save_time_memory_area(void)
 	if (!xen_clock)
 		return;
=20
-	t=2Eaddr=2Ev =3D NULL;
-
-	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
+	ret =3D xen_register_time_area(NULL);
 	if (ret !=3D 0)
 		pr_notice("Cannot unregister vcpu_time_info (err %d)", ret);
 }
=20
 void xen_restore_time_memory_area(void)
 {
-	struct vcpu_register_time_memory_area t;
 	int ret;
=20
 	if (!xen_clock)
 		goto out;
=20
 	memset(xen_clock, 0, sizeof(*xen_clock));
-	t=2Eaddr=2Ev =3D &xen_clock->pvti;
-
-	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
+	ret =3D xen_register_time_area(&xen_clock->pvti);
=20
 	/*
 	 * We don't disable VDSO_CLOCKMODE_PVCLOCK entirely if it fails to
@@ -444,7 +461,6 @@ void xen_restore_time_memory_area(void)
=20
 static void __init xen_setup_vsyscall_time_info(void)
 {
-	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
 	int ret;
=20
@@ -452,9 +468,7 @@ static void __init xen_setup_vsyscall_time_info(void)
 	if (!ti)
 		return;
=20
-	t=2Eaddr=2Ev =3D &ti->pvti;
-
-	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
+	ret =3D xen_register_time_area(&ti->pvti);
 	if (ret) {
 		pr_notice("xen: VDSO_CLOCKMODE_PVCLOCK not supported (err %d)\n", ret);
 		free_page((unsigned long)ti);
@@ -467,9 +481,7 @@ static void __init xen_setup_vsyscall_time_info(void)
 	 * still check it in case hypervisor is buggy=2E
 	 */
 	if (!(ti->pvti=2Eflags & PVCLOCK_TSC_STABLE_BIT)) {
-		t=2Eaddr=2Ev =3D NULL;
-		ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area,
-					 0, &t);
+		ret =3D xen_register_time_area(NULL);
 		if (!ret)
 			free_page((unsigned long)ti);
=20
diff --git a/drivers/xen/time=2Ec b/drivers/xen/time=2Ec
index a2be0a4d45b0=2E=2E49e61ad905d9 100644
--- a/drivers/xen/time=2Ec
+++ b/drivers/xen/time=2Ec
@@ -10,6 +10,7 @@
 #include <linux/static_call=2Eh>
 #include <linux/sched/cputime=2Eh>
=20
+#include <asm/xen/page=2Eh>
 #include <asm/xen/hypervisor=2Eh>
 #include <asm/xen/hypercall=2Eh>
=20
@@ -19,8 +20,12 @@
 #include <xen/interface/vcpu=2Eh>
 #include <xen/xen-ops=2Eh>
=20
-/* runstate info updated by Xen */
-static DEFINE_PER_CPU(struct vcpu_runstate_info, xen_runstate);
+/*
+ * Runstate info updated by Xen=2E The phys-area ABI doesn't allow it to =
cross
+ * a page boundary; the struct is 48 bytes, so 64 is the smallest alignme=
nt
+ * that guarantees this=2E
+ */
+static DEFINE_PER_CPU(struct vcpu_runstate_info, xen_runstate) __aligned(=
64);
=20
 static DEFINE_PER_CPU(u64[4], old_runstate_time);
=20
@@ -152,11 +157,18 @@ u64 xen_steal_clock(int cpu)
 void xen_setup_runstate_info(int cpu)
 {
 	struct vcpu_register_runstate_memory_area area;
+	unsigned int op;
+	struct vcpu_runstate_info *cpu_runstate =3D &per_cpu(xen_runstate, cpu);
+
+	if (xen_feature(XENFEAT_runstate_phys_area)) {
+		op =3D VCPUOP_register_runstate_phys_area;
+		area=2Eaddr=2Ep =3D percpu_to_gaddr(cpu_runstate)=2Egaddr;
+	} else {
+		op =3D VCPUOP_register_runstate_memory_area;
+		area=2Eaddr=2Ev =3D cpu_runstate;
+	}
=20
-	area=2Eaddr=2Ev =3D &per_cpu(xen_runstate, cpu);
-
-	if (HYPERVISOR_vcpu_op(VCPUOP_register_runstate_memory_area,
-			       xen_vcpu_nr(cpu), &area))
+	if (HYPERVISOR_vcpu_op(op, xen_vcpu_nr(cpu), &area))
 		BUG();
 }
=20
diff --git a/include/xen/interface/features=2Eh b/include/xen/interface/fe=
atures=2Eh
index 53f760378e39=2E=2Ef00144a7c790 100644
--- a/include/xen/interface/features=2Eh
+++ b/include/xen/interface/features=2Eh
@@ -97,6 +97,15 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
=20
+/*
+ * Signal whether the domain is able to use the following hypercalls:
+ *
+ * VCPUOP_register_runstate_phys_area
+ * VCPUOP_register_vcpu_time_phys_area
+ */
+#define XENFEAT_runstate_phys_area        18
+#define XENFEAT_vcpu_time_phys_area       19
+
 #define XENFEAT_NR_SUBMAPS 1
=20
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/include/xen/interface/vcpu=2Eh b/include/xen/interface/vcpu=
=2Eh
index c7cc28ad8d63=2E=2Ed3858233c32f 100644
--- a/include/xen/interface/vcpu=2Eh
+++ b/include/xen/interface/vcpu=2Eh
@@ -203,4 +203,21 @@ struct vcpu_register_time_memory_area {
 };
 DEFINE_GUEST_HANDLE_STRUCT(vcpu_register_time_memory_area);
=20
+/*
+ * Like the respective VCPUOP_register_*_memory_area, just using the "add=
r=2Ep"
+ * field of the supplied struct as a guest physical address (i=2Ee=2E in =
GFN space)=2E
+ * The respective area may not cross a page boundary=2E  Pass ~0 to unreg=
ister an
+ * area=2E  Note that as long as an area is registered by physical addres=
s, the
+ * linear address based area will not be serviced (updated) by the hyperv=
isor=2E
+ *
+ * Note that the area registered via VCPUOP_register_runstate_phys_area w=
ill
+ * be updated in the same manner as the one registered via virtual addres=
s PLUS
+ * VMASST_TYPE_runstate_update_flag engaged by the domain=2E
+ *
+ * XENFEAT_{runstate,vcpu_time}_phys_area feature bits signal the availab=
ility
+ * of these ops=2E
+ */
+#define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2fc.1e3869260948a3ed.1a145ae0fc6.e3537833f6f70b36=---

