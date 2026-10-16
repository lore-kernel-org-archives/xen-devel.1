Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B43CCA464
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 10:23:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451532.1666580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHf5t-0007L8-CZ; Fri, 16 Oct 2026 10:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451532.1666580; Fri, 16 Oct 2026 10:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHf5t-0007L1-9k; Fri, 16 Oct 2026 10:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1451532;
 Fri, 16 Oct 2026 10:23:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@swg.vates.tech>)
 id 1xHf5r-0007Ks-2G
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:23:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHf5q-005d1v-F0
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:23:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@swg.vates.tech>)
 id 6ad1fb11-2eae-0a2a0a5409dd-0a2a45019418-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:23:18 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@swg.vates.tech>)
 id 6ad1fb15-5984-0a2a45010019-b9ff1c239b41-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 12:23:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1443cb7e90008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 10:23:12 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6691782B33;
 Fri, 16 Oct 2026 12:23:11 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=EIwNFn27oeeB1Vrvy7FJ5dLaZJdL2NDuWkIdyglqKvU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Ig44eVE9pZ+58qo9oYBXPKR18c835lfxgDYEx6+aMFBxPMEqELLnnQNuHoEd7LkkGEryNsimL
 ssuC/tqVnvCJ8yJPVxexZ3EygTmRN99nE4gTA3ZpYgho72HsnKOp/kRF12axmk2e10naJE/FJDa
 jNaA+iaFLEn1VPFhH21LTcZWP7qjQ01EEDeri1gql0C6zePtWtd54Dpa0Ldh7ROrJDKsczboy+p
 CwyDiN/PzSzmP8KcqjjZqiswtF0Ahdob7YWPxo73R8YDSPKefyfphj5GXQ3pHh3Edu1/V5C8AYe
 L0Ejvw3L1ijMUFHw/gCKQRjQ+MJUHL01ylOLqw25opKA==
X-Zone-Loop: 477319da4ae58a73404ceb02744c273941bdba5e373b
x-campaign-type: default
x-transaction-id: b28f0cdd-68a8-467c-9f25-95f76abd61f8
x-swg-uid: 01-adb76025-8703-475e-908d-c500b6386f73
X-Mailer: Sweego
Message-ID:
 <1792146192.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425@vates.tech>
x-swg-bid: 1792146192.8631fc262581453bbf619ec5b2062170.1a1443cb7e90008425
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
Subject: [PATCH] xen: Use VCPUOP_register_{runstate,vcpu_time}_phys_area when available
Date: Fri, 16 Oct 2026 12:22:00 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2b5.eea8caf3adaf82ca.1a1443cb515.d621e0f4827f716e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792146191643
X-purgate-ID: tlsNG-d62444/1792146198-C4B45757-AEE1FEF6/0/0
X-purgate-type: clean
X-purgate-size: 8222

---=Part.2b5.eea8caf3adaf82ca.1a1443cb515.d621e0f4827f716e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Updating these area can be expensive when done through virtual addresses
(especially for runstate one), in particular for HVM/PVH guests=2E
Xen 4=2E18 introduced physical address alternatives to address those
short-commings, but they aren't used currently=2E

Fix it by using these alternatives when available (when reported in
XENFEAT_{runstate,vcpu_time}_phys_area, but keep the current logic
in the PV case=2E

Assisted-by: LLM
[guidance and testing]
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
When using phys_area ABI, the struct is not allowed to cross a page
boundary anymore, hence we need to be careful with per-cpu struct
alignment=2E

I've deliberately put the PV domain (!XENFEAT_auto_translated_physmap)
case aside as it profits less from the physical address ABI, and it
would make things more complicated as "physical address" doesn't have
a obvious meaning there=2E

CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: David Woodhouse <dwmw2@infradead=2Eorg>
CC: George Dunlap <gwd@xenproject=2Eorg>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/xen/time=2Ec              | 35 ++++++++++++++++++--------------
 drivers/xen/time=2Ec               | 24 +++++++++++++++++-----
 include/xen/interface/features=2Eh |  9 ++++++++
 include/xen/interface/vcpu=2Eh     | 17 ++++++++++++++++
 4 files changed, 65 insertions(+), 20 deletions(-)

diff --git a/arch/x86/xen/time=2Ec b/arch/x86/xen/time=2Ec
index 5c7822254a01=2E=2E19ace1b78ae4 100644
--- a/arch/x86/xen/time=2Ec
+++ b/arch/x86/xen/time=2Ec
@@ -37,6 +37,22 @@
=20
 static u64 xen_sched_clock_offset __read_mostly;
=20
+static int xen_register_time_area(struct pvclock_vcpu_time_info *pvti)
+{
+	struct vcpu_register_time_memory_area t;
+	bool phys =3D xen_feature(XENFEAT_vcpu_time_phys_area) &&
+		    xen_feature(XENFEAT_auto_translated_physmap);
+	int op =3D phys ? VCPUOP_register_vcpu_time_phys_area
+		      : VCPUOP_register_vcpu_time_memory_area;
+
+	if (phys)
+		t=2Eaddr=2Ep =3D pvti ? virt_to_phys(pvti) : ~0LLU;
+	else
+		t=2Eaddr=2Ev =3D pvti;
+
+	return HYPERVISOR_vcpu_op(op, 0, &t);
+}
+
 /* Get the TSC speed from Xen */
 static unsigned long xen_tsc_khz(void)
 {
@@ -395,7 +411,6 @@ static u64 xen_clock_value_saved;
=20
 void xen_save_time_memory_area(void)
 {
-	struct vcpu_register_time_memory_area t;
 	int ret;
=20
 	xen_clock_value_saved =3D xen_clocksource_read() - xen_sched_clock_offse=
t;
@@ -403,9 +418,7 @@ void xen_save_time_memory_area(void)
 	if (!xen_clock)
 		return;
=20
-	t=2Eaddr=2Ev =3D NULL;
-
-	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
+	ret =3D xen_register_time_area(NULL);
 	if (ret !=3D 0)
 		pr_notice("Cannot save secondary vcpu_time_info (err %d)",
 			  ret);
@@ -415,15 +428,12 @@ void xen_save_time_memory_area(void)
=20
 void xen_restore_time_memory_area(void)
 {
-	struct vcpu_register_time_memory_area t;
 	int ret;
=20
 	if (!xen_clock)
 		goto out;
=20
-	t=2Eaddr=2Ev =3D &xen_clock->pvti;
-
-	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
+	ret =3D xen_register_time_area(&xen_clock->pvti);
=20
 	/*
 	 * We don't disable VDSO_CLOCKMODE_PVCLOCK entirely if it fails to
@@ -446,7 +456,6 @@ void xen_restore_time_memory_area(void)
=20
 static void xen_setup_vsyscall_time_info(void)
 {
-	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
 	int ret;
=20
@@ -454,9 +463,7 @@ static void xen_setup_vsyscall_time_info(void)
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
@@ -469,9 +476,7 @@ static void xen_setup_vsyscall_time_info(void)
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
index a2be0a4d45b0=2E=2E6b6ddc7a5822 100644
--- a/drivers/xen/time=2Ec
+++ b/drivers/xen/time=2Ec
@@ -19,8 +19,12 @@
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
@@ -152,11 +156,21 @@ u64 xen_steal_clock(int cpu)
 void xen_setup_runstate_info(int cpu)
 {
 	struct vcpu_register_runstate_memory_area area;
+	unsigned int op;
=20
-	area=2Eaddr=2Ev =3D &per_cpu(xen_runstate, cpu);
+	if (xen_feature(XENFEAT_runstate_phys_area) &&
+	    xen_feature(XENFEAT_auto_translated_physmap))
+	{
+		op =3D VCPUOP_register_runstate_phys_area;
+		area=2Eaddr=2Ep =3D per_cpu_ptr_to_phys(&per_cpu(xen_runstate, cpu));
+	}
+	else
+	{
+		op =3D VCPUOP_register_runstate_memory_area;
+		area=2Eaddr=2Ev =3D &per_cpu(xen_runstate, cpu);
+	}
=20
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
---=Part.2b5.eea8caf3adaf82ca.1a1443cb515.d621e0f4827f716e=---

