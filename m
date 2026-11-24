Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5E606A685
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=RhFzdHtD
Received: from list by lists.xenproject.org with outflank-mailman.1501258.1697329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjz-0007pD-7q; Tue, 24 Nov 2026 16:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501258.1697329; Tue, 24 Nov 2026 16:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtjz-0007p4-4Y; Tue, 24 Nov 2026 16:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1501258;
 Tue, 24 Nov 2026 16:51:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtjx-0007ng-Sh
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:51:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVtjx-00HDqX-8V
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:51:33 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e78322d0001cf5@swg.vates.tech>)
 id 6b05c084-8faa-0a2a0a5109dd-0a2a450591b8-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e78322d0001cf5@swg.vates.tech>)
 id 6b05c095-4cb1-0a2a45050019-b9ff1c228ac5-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:51:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e78322d0001cf5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:51:27 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4C01D82B4D;
 Tue, 24 Nov 2026 17:51:27 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=d3/2mshBUYsHjejGFIMA9A/3qNoSr2Tv7VXacHtjcNE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RhFzdHtDaGC97p2v+JIbPGPfomrFStxMz+uVj2yJt03RSTLxLRBWXpp45jOn8yBkLnx/nWi1U
 mxR8f0LIhzLj9IHpBM5TrzGSEkNtsBV/z7GGw7cYE+UmkzFKh2WsDgzimMq5YtWB9pCXeRG+tzJ
 9cL2NpSqHNfUrOY6Hv5SBH4LD2BuYO1+RWlqHqddgSDSs0w7mrR5P2iPRXLGsZQqeioDq+glVYY
 WPZ1qEcnekHgKejwHu57L0GtChCg/+V3N17cUGwcrNRn91xcD50q1rkZaBWMeCDoXMfNSMizKV8
 t1rEHIzfQgXjfo6n+JOcSyEA93pxFGJWE4rqDuB1j4gg==
X-Zone-Loop: 063e750266d441103148a83aa1454350a88e5722201a
x-campaign-type: default
x-transaction-id: 4de7977e-dd4f-4539-b176-fe4e935baf65
x-swg-uid: 01-156d38a9-c5da-4f51-bea5-6239bcd28d34
X-Mailer: Sweego
Message-ID:
 <1795539087.8631fc262581453bbf619ec5b2062170.1a20e78322d0001cf5@vates.tech>
x-swg-bid: 1795539087.8631fc262581453bbf619ec5b2062170.1a20e78322d0001cf5
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
Subject: [RFC PATCH v2 03/13] hvm: Introduce FastABI infrastructure
Date: Tue, 24 Nov 2026 17:50:31 +0100
In-Reply-To: <20261124165041.653941-2-teddy.astie@vates.tech>
References: <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
 <20261124165041.653941-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.12f.f3c0f5e1acb85c86.1a20e7830af.cd93ee4083dec51b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795539087535
X-purgate-ID: tlsNG-c201ff/1795539093-F64B42A1-D4C18893/10/73395122804
X-purgate-type: spam
X-purgate-size: 10359
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.12f.f3c0f5e1acb85c86.1a20e7830af.cd93ee4083dec51b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

FastABI is a new hypercall ABI intended to be used for confidential
guests, but also address some of the shortcomings of the current
virtual address based one=2E

Some of the key aspects :
- *everything* is passed through registers that can be either
  input, output, both or unused=2E There is no clobbering of unused
  registers (unused registers are untouched)=2E
- On x86, available registers are :
  rax, rdi, rsi, r8, r9, r10, r11, r12
Only long mode is supported, hypercall made outside of long mode are
sign-extended and may not behave as expected=2E
- Only a subset of existing hypercalls is covered=2E
- physmap manipulation by the guest is not provided grant table and
  shared info are mapped in advance and its location is reported to
  the guest through E820

Support for this ABI is reported to guest through CPUID
(XEN_HVM_CPUID_FASTABI)=2E Support for this ABI is gated
behind CONFIG_FASTABI=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

For now, it's HVM-only, but perhaps we may want to support it to PV64 ?
---
 docs/guest-guide/fastabi/index=2Erst  | 26 +++++++++++++
 docs/guest-guide/x86/fastabi=2Erst    | 58 +++++++++++++++++++++++++++++
 docs/guest-guide/x86/index=2Erst      |  1 +
 xen/arch/x86/hvm/hypercall=2Ec        | 20 ++++++++++
 xen/arch/x86/include/asm/fastabi=2Eh  | 18 +++++++++
 xen/common/Kconfig                  |  7 ++++
 xen/common/Makefile                 |  1 +
 xen/common/fastabi=2Ec                | 22 +++++++++++
 xen/include/public/arch-x86/cpuid=2Eh |  4 ++
 xen/include/public/fastabi=2Eh        | 11 ++++++
 xen/include/xen/fastabi=2Eh           | 11 ++++++
 11 files changed, 179 insertions(+)
 create mode 100644 docs/guest-guide/fastabi/index=2Erst
 create mode 100644 docs/guest-guide/x86/fastabi=2Erst
 create mode 100644 xen/arch/x86/include/asm/fastabi=2Eh
 create mode 100644 xen/common/fastabi=2Ec
 create mode 100644 xen/include/public/fastabi=2Eh
 create mode 100644 xen/include/xen/fastabi=2Eh

diff --git a/docs/guest-guide/fastabi/index=2Erst b/docs/guest-guide/fasta=
bi/index=2Erst
new file mode 100644
index 0000000000=2E=2E1127ae8451
--- /dev/null
+++ b/docs/guest-guide/fastabi/index=2Erst
@@ -0,0 +1,26 @@
+=2E=2E SPDX-License-Identifier: CC-BY-4=2E0
+
+FastABI Hypercall ABI
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A alternative hypercall may be available for guest, which
+is based on passing parameters and outputs through registers
+instead of virtual addresses=2E
+
+This is meant to be more efficient and compatible with confidential
+computing technologies (such as AMD SEV)=2E
+
+Each architecture defines 8 registers which, if used in the
+operation, may be a input, a output or both=2E Unused registers are not
+considered nor modified by the hypervisor=2E
+
+Only a subset of hypercalls are exposed through this interface=2E
+
+As a convention, hypercall index is register 0, hypercall sub-operation
+(if any) is register 1=2E Error code is returned in register 0=2E
+
+Preemption
+----------
+
+FastABI hypercalls are allowed to report -ERESTART, in such case,
+the platform should redo the hypercall without altering parameters=2E
\ No newline at end of file
diff --git a/docs/guest-guide/x86/fastabi=2Erst b/docs/guest-guide/x86/fas=
tabi=2Erst
new file mode 100644
index 0000000000=2E=2E899e45d097
--- /dev/null
+++ b/docs/guest-guide/x86/fastabi=2Erst
@@ -0,0 +1,58 @@
+=2E=2E SPDX-License-Identifier: CC-BY-4=2E0
+
+x86 FastABI Hypercall ABI
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+Registers
+---------
+
+The FastABI registers used for x86 are defined as follow=2E
+
+=2E=2E list-table::
+   :header-rows: 1
+
+   * - Index
+     - Register=20
+
+   * - 0
+     - rax
+
+   * - 1
+     - rdi
+  =20
+   * - 2
+     - rsi
+  =20
+   * - 3
+     - r8
+  =20
+   * - 4
+     - r9
+
+   * - 5
+     - r10
+    =20
+   * - 6
+     - r11
+  =20
+   * - 7
+     - r12
+
+Hypercall method
+----------------
+
+=2E=2E list-table::
+   :header-rows: 1
+
+   * - Hardware/Execution mode
+     - Transfer method
+
+   * - AMD SVM
+     - VMMCALL
+ =20
+   * - Intel VMX
+     - VMCALL
+
+   * - AMD SEV-ES/SNP
+     - VMGEXIT with GHCB Page
+
diff --git a/docs/guest-guide/x86/index=2Erst b/docs/guest-guide/x86/index=
=2Erst
index 5b38ae397a=2E=2E73d281047f 100644
--- a/docs/guest-guide/x86/index=2Erst
+++ b/docs/guest-guide/x86/index=2Erst
@@ -8,3 +8,4 @@ x86
=20
    hypercall-abi
    pv-traps
+   fastabi
diff --git a/xen/arch/x86/hvm/hypercall=2Ec b/xen/arch/x86/hvm/hypercall=
=2Ec
index b254b3e2f7=2E=2Ee38a81a27e 100644
--- a/xen/arch/x86/hvm/hypercall=2Ec
+++ b/xen/arch/x86/hvm/hypercall=2Ec
@@ -10,6 +10,7 @@
 #include <xen/hypercall=2Eh>
 #include <xen/ioreq=2Eh>
 #include <xen/nospec=2Eh>
+#include <xen/fastabi=2Eh>
=20
 #include <asm/hvm/emulate=2Eh>
 #include <asm/hvm/support=2Eh>
@@ -155,6 +156,25 @@ int hvm_hypercall(struct cpu_user_regs *regs)
=20
     curr->hcall_preempted =3D false;
=20
+    #ifdef CONFIG_FASTABI
+    if ( eax & __HYPERVISOR_FASTABI_MASK && is_hvm_domain(currd) &&
+         mode =3D=3D X86_MODE_64BIT )
+    {
+        unsigned long index =3D eax & ~__HYPERVISOR_FASTABI_MASK;
+        HVM_DBG_LOG(DBG_LEVEL_HCALL,
+                    "fasthcall%lu(%lx, %lx, %lx, %lx, %lx, %lx, %lx)",
+                    index, fastabi_value_n(regs, 1),
+                    fastabi_value_n(regs, 2), fastabi_value_n(regs, 3),
+                    fastabi_value_n(regs, 4), fastabi_value_n(regs, 5),
+                    fastabi_value_n(regs, 6), fastabi_value_n(regs, 7));
+
+        fastabi_dispatch(index, regs);
+
+        hvmemul_cache_restore(curr, token);
+        return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_co=
mpleted;
+    }
+    #endif
+
     if ( mode =3D=3D X86_MODE_64BIT )
     {
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
diff --git a/xen/arch/x86/include/asm/fastabi=2Eh b/xen/arch/x86/include/a=
sm/fastabi=2Eh
new file mode 100644
index 0000000000=2E=2E3a6fd0c31f
--- /dev/null
+++ b/xen/arch/x86/include/asm/fastabi=2Eh
@@ -0,0 +1,18 @@
+#ifndef XEN_ASM_FASTABI_H
+#define XEN_ASM_FASTABI_H
+
+#include <asm/current=2Eh>
+#include <public/fastabi=2Eh>
+
+#define fastabi_param_reg0 rax
+#define fastabi_param_reg1 rdi
+#define fastabi_param_reg2 rsi
+#define fastabi_param_reg3 r8
+#define fastabi_param_reg4 r9
+#define fastabi_param_reg5 r10
+#define fastabi_param_reg6 r11
+#define fastabi_param_reg7 r12
+
+#define fastabi_value_n(regs, n) (regs)->fastabi_param_reg##n
+
+#endif /* XEN_ASM_FASTABI_H */
\ No newline at end of file
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444f=2E=2Ee9be973fd4 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -675,4 +675,11 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
=20
+config FASTABI
+	bool "Fast HVM ABI (UNSUPPORTED)" if UNSUPPORTED
+	depends on X86 && HVM
+	default n
+	help
+		Add support for a alternative fast HVM ABI=2E
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f69d47d189=2E=2Ec9ec72e5df 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -63,6 +63,7 @@ obj-y +=3D vsprintf=2Eo
 obj-$(CONFIG_VM_EVENT) +=3D wait=2Eo
 obj-bin-y +=3D warning=2Einit=2Eo
 obj-y +=3D xmalloc_tlsf=2Eo
+obj-$(CONFIG_FASTABI) +=3D fastabi=2Eo
=20
 obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma lzo=
 unlzo unlz4 unzstd,$(n)=2Einit=2Eo)
=20
diff --git a/xen/common/fastabi=2Ec b/xen/common/fastabi=2Ec
new file mode 100644
index 0000000000=2E=2E90228206de
--- /dev/null
+++ b/xen/common/fastabi=2Ec
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2=2E0-only */
+
+#include <xen/errno=2Eh>
+#include <xen/fastabi=2Eh>
+#include <xen/sched=2Eh>
+
+#include <public/xen=2Eh>
+
+void fastabi_make_continuation(void)
+{
+    current->hcall_preempted =3D true;
+}
+
+void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs)
+{
+    switch (index) {
+    /* Wrappers over traditional hypercalls */
+    default:
+        fastabi_value_n(regs, 0) =3D -ENOSYS;
+        break;
+    }
+}
diff --git a/xen/include/public/arch-x86/cpuid=2Eh b/xen/include/public/ar=
ch-x86/cpuid=2Eh
index 3bb0dd249f=2E=2Eff44ce0e7b 100644
--- a/xen/include/public/arch-x86/cpuid=2Eh
+++ b/xen/include/public/arch-x86/cpuid=2Eh
@@ -106,6 +106,10 @@
  * bound to event channels=2E
  */
 #define XEN_HVM_CPUID_UPCALL_VECTOR    (1u << 6)
+/*
+ * Support for fast HVM ABI=2E
+ */
+#define XEN_HVM_CPUID_FASTABI          (1u << 7)
=20
 /*
  * Leaf 6 (0x40000x05)
diff --git a/xen/include/public/fastabi=2Eh b/xen/include/public/fastabi=
=2Eh
new file mode 100644
index 0000000000=2E=2Eb710fc72b8
--- /dev/null
+++ b/xen/include/public/fastabi=2Eh
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __XEN_PUBLIC_FASTABI_H__
+#define __XEN_PUBLIC_FASTABI_H__
+
+#if defined(__x86_64__)
+#define __HYPERVISOR_FASTABI_MASK 0x40000000U
+#else
+#define __HYPERVISOR_FASTABI_MASK 0
+#endif
+
+#endif
diff --git a/xen/include/xen/fastabi=2Eh b/xen/include/xen/fastabi=2Eh
new file mode 100644
index 0000000000=2E=2E9d0ca5264a
--- /dev/null
+++ b/xen/include/xen/fastabi=2Eh
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2=2E0-only */
+
+#ifndef XEN_FASTABI_H
+#define XEN_FASTABI_H
+
+#include <asm/fastabi=2Eh>
+
+void fastabi_dispatch(unsigned long index, struct cpu_user_regs *regs);
+void fastabi_make_continuation(void);
+
+#endif /* XEN_FASTABI_H */
--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.12f.f3c0f5e1acb85c86.1a20e7830af.cd93ee4083dec51b=---

