Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA04606A32D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=cLE63OkR
Received: from list by lists.xenproject.org with outflank-mailman.1501265.1697379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk5-0000fw-Rw; Tue, 24 Nov 2026 16:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501265.1697379; Tue, 24 Nov 2026 16:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtk5-0000fC-JX; Tue, 24 Nov 2026 16:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1501265;
 Tue, 24 Nov 2026 16:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtk2-0008TT-Bp
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtk1-004zem-Np
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7844760001cf5@swg.vates.tech>)
 id 6b05c08e-e002-0a2a0a5209dd-0a2a45089c0e-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:37 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e7844760001cf5@swg.vates.tech>)
 id 6b05c099-f659-0a2a45080019-b9ff1c12b0d9-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e7844760001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:32 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 00B238304E;
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
 q=dns/txt; s=selector1; bh=sLB55gmeB2l9FvLyJD2Go97P8XU8lt+hbt/wO1xK90o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cLE63OkRfXGaFyzJU5rGFefbFB1uLvRtr11q8CjScOcG4+igeVch0yrrb6Juzn37W3XBN5cIU
 QrExd0MRMPP/ad7YiJ261of28d+t/Ky2cvLXfjvRFTrc/EK3iUaoKAcrffiwyuaYGePLP9yLIXF
 3z1R/VWe2TowTadCyqGf6Ro8jMyH62g3NegOkRsPGAIMpUEeIj1XQ5fvEGkwsB872OsAPZltrAu
 94QQAERg+SwwlRcvgdb2hW/P8Sq8y+adtoBW8mUZHhoGf4KaIgJ+OPwYui+ZzrmFceBgMMscA24
 h5GoEJb3QIya7nEdV/hiwD421QBikO8ohRHRDTapfwlQ==
X-Zone-Loop: 1172194cbb231e5623e2706a5fb048157781a903ae04
x-campaign-type: default
x-transaction-id: 188f9619-f16e-4f90-815d-fd7e0b99d949
x-swg-uid: 01-37c0ca82-4249-4c42-ab92-237d2bddfb02
X-Mailer: Sweego
Message-ID:
 <1795539092.8631fc262581453bbf619ec5b2062170.1a20e7844760001cf5@vates.tech>
x-swg-bid: 1795539092.8631fc262581453bbf619ec5b2062170.1a20e7844760001cf5
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
Subject: [RFC PATCH v2 09/13] wip: fastabi: Introduce memory_op
Date: Tue, 24 Nov 2026 17:50:37 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.135.dd1ee40ed18484a4.1a20e7842ff.7b5b97948ff1a297=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539092224
X-purgate-ID: tlsNG-c1860d/1795539097-CDF4787B-DC8FDA75/10/73395122804
X-purgate-type: spam
X-purgate-size: 5396
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.135.dd1ee40ed18484a4.1a20e7842ff.7b5b97948ff1a297=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

The idea here is to provide for the guest a way to get original E820
(with shared_info/grant_table locations) even if OVMF/firmware altered
it=2E

 docs/guest-guide/fastabi/abi/memory=2Eyml      | 16 ++++++++
 xen/common/memory=2Ec                          | 40 ++++++++++++++++++++
 xen/include/public/arch-x86/hvm/start_info=2Eh |  9 +++++
 xen/include/public/memory=2Eh                  | 12 ++++++
 xen/include/xen/fastabi=2Eh                    |  2 +
 5 files changed, 79 insertions(+)
 create mode 100644 docs/guest-guide/fastabi/abi/memory=2Eyml

diff --git a/docs/guest-guide/fastabi/abi/memory=2Eyml b/docs/guest-guide/=
fastabi/abi/memory=2Eyml
new file mode 100644
index 0000000000=2E=2Ea327702de8
--- /dev/null
+++ b/docs/guest-guide/fastabi/abi/memory=2Eyml
@@ -0,0 +1,16 @@
+name: memory
+hypercall_index: 12
+
+subops:
+  memory_map_entry:
+    index: 9
+    input:
+      entry_index: 2
+    output:
+      addr: 3
+      size: 4
+      type: 5
+    c_lang:
+      param:
+        entry_index: uint64_t
+      struct: xen_memory_map_entry
diff --git a/xen/common/memory=2Ec b/xen/common/memory=2Ec
index 4afa2271b7=2E=2Ee240b2fb54 100644
--- a/xen/common/memory=2Ec
+++ b/xen/common/memory=2Ec
@@ -38,6 +38,7 @@
 #include <xsm/xsm=2Eh>
=20
 #ifdef CONFIG_X86
+#include <asm/fastabi=2Eh>
 #include <asm/guest=2Eh>
 #endif
=20
@@ -2014,6 +2015,45 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HAND=
LE_PARAM(void) arg)
     return rc;
 }
=20
+#ifdef CONFIG_FASTABI
+long do_memory_fast_op(struct cpu_user_regs *regs)
+{
+    long cmd =3D fastabi_value_n(regs, 1);
+    long rc =3D 0;
+
+    switch ( cmd )
+    {
+#ifdef CONFIG_X86
+    case XENMEM_memory_map_entry:
+    {
+        struct domain *d =3D current->domain;
+        unsigned long entry_index =3D fastabi_value_n(regs, 2);
+
+        spin_lock(&d->arch=2Ee820_lock);
+        if ( d->arch=2Ee820 && entry_index < d->arch=2Enr_e820 )
+        {
+            const struct e820entry entry =3D d->arch=2Ee820[entry_index];
+           =20
+            fastabi_value_n(regs, 3) =3D entry=2Eaddr;
+            fastabi_value_n(regs, 4) =3D entry=2Esize;
+            fastabi_value_n(regs, 5) =3D entry=2Etype;
+        }
+        else
+            rc =3D -ENOENT;
+        spin_unlock(&d->arch=2Ee820_lock);
+        break;
+    }
+#endif
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
 void clear_domain_page(mfn_t mfn)
 {
     void *ptr =3D map_domain_page(mfn);
diff --git a/xen/include/public/arch-x86/hvm/start_info=2Eh b/xen/include/=
public/arch-x86/hvm/start_info=2Eh
index e33557c0b4=2E=2E909feb381e 100644
--- a/xen/include/public/arch-x86/hvm/start_info=2Eh
+++ b/xen/include/public/arch-x86/hvm/start_info=2Eh
@@ -99,6 +99,15 @@
 #define XEN_HVM_MEMMAP_TYPE_DISABLED  6
 #define XEN_HVM_MEMMAP_TYPE_PMEM      7
=20
+/* Xen-specific types (OEM-specific range of the ACPI spec) */
+#define XEN_HVM_MEMMAP_TYPE_SHARED_INFO   0xF0000001 /* Shared info page =
*/
+#define XEN_HVM_MEMMAP_TYPE_GRANT_TABLE   0xF0000002 /* Grant table pages=
 */
+#define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table statu=
s page (v2) */
+#define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region f=
or grant mappings */
+                                                     /* and foreign mappi=
ngs */
+/* For the future :) */
+#define XEN_HVM_MEMMAP_TYPE_HOTPLUG_ZONE  0xF0000005 /* Memory hotpluggab=
le zone */
+
 /*
  * C representation of the x86/HVM start info layout=2E
  *
diff --git a/xen/include/public/memory=2Eh b/xen/include/public/memory=2Eh
index bd9fc37b52=2E=2E2ab23ad2f5 100644
--- a/xen/include/public/memory=2Eh
+++ b/xen/include/public/memory=2Eh
@@ -328,6 +328,18 @@ struct xen_memory_map {
 typedef struct xen_memory_map xen_memory_map_t;
 DEFINE_XEN_GUEST_HANDLE(xen_memory_map_t);
=20
+/*
+ * Read a specific memory map entry=2E
+ * FastABI only=2E
+ */
+#define XENMEM_memory_map_entry     9
+struct xen_memory_map_entry {
+    uint64_t addr;
+    uint64_t size;
+    uint32_t type;
+};
+typedef struct xen_memory_map_entry xen_memory_map_entry_t;
+
 /*
  * Returns the real physical memory map=2E Passes the same structure as
  * XENMEM_memory_map=2E
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
index de5a349787=2E=2E7fa7590199 100644
--- a/xen/include/xen/fastabi=2Eh
+++ b/xen/include/xen/fastabi=2Eh
@@ -15,4 +15,6 @@ void do_vcpu_fast_op(struct cpu_user_regs *regs);
 void do_hvm_fast_op(struct cpu_user_regs *regs);
 void do_sched_fast_op(struct cpu_user_regs *regs);
 void do_xen_version_fast_op(struct cpu_user_regs *regs);
+long do_memory_fast_op(struct cpu_user_regs *regs);
+
 #endif /* XEN_FASTABI_H */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.135.dd1ee40ed18484a4.1a20e7842ff.7b5b97948ff1a297=---

