Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59DBCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452486.1667316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOF-0006mB-L9; Fri, 16 Oct 2026 17:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452486.1667316; Fri, 16 Oct 2026 17:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOF-0006m0-I8; Fri, 16 Oct 2026 17:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1452486;
 Fri, 16 Oct 2026 17:06:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@swg.vates.tech>)
 id 1xHlOE-0006YS-6s
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOD-006h1r-D7
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@swg.vates.tech>)
 id 6ad25982-bab6-0a2a0a5309dd-0a2a4508963e-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:41 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@swg.vates.tech>)
 id 6ad259a1-f659-0a2a45080019-b9ff1c238827-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae07870008425.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:35 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E759C81C51;
 Fri, 16 Oct 2026 19:06:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+LNBhEDwwmptohY+V5OCHc4pdC+JuNZqOfMEasILLE8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FJIEYkiMgMfTOj7wxnvX6+4dnLFAhOMtWrQNq5SRJrPDnGcTdrRWIoSvWmJu+Xqz1ffQMqjh5
 pa1OHGPj0JDFa45+U7OKUzggr50+5CsHoMtQGfGdW2i8bqlqaW1HBY6ppSmvxBDETbUQxpuEnvT
 DzSkYMY71zUWi70uc8/UvPIUX4TI/nRE7eSX4p8cCowLJBMiqLrDzaeOl5T7lrstSTqnVjAvG+c
 X/paPsOqdetMQQchtsjj4hZlpdKXR0SkQuqpHVWhRFpjt2CRGcv04i+Tod/s0UJsFZ/yQX7/eXV
 WlAJiY0Pb0E7Em7GM6VWy6fIIM+2FWfx2R8nNCDbCu8A==
X-Zone-Loop: 42c6eaefb7a3cd665a2b57a53e2b3eb98c89f49fc8d4
x-campaign-type: default
x-transaction-id: 52795dc7-7d01-4842-9ebf-f59bdf2e9335
x-swg-uid: 01-8c980a6c-8af4-4346-9f01-29864c53b29e
X-Mailer: Sweego
Message-ID:
 <1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425@vates.tech>
x-swg-bid: 1792170395.8631fc262581453bbf619ec5b2062170.1a145ae07870008425
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
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] xen: Add gpa conversion helpers
Date: Fri, 16 Oct 2026 19:06:08 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f8.d083e86f72d0a7a2.1a145ae05ea.5ac65cbb0f451376=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170395115
X-purgate-ID: tlsNG-c1860d/1792170401-D477387B-F7744114/0/0
X-purgate-type: clean
X-purgate-size: 4543

---=Part.2f8.d083e86f72d0a7a2.1a145ae05ea.5ac65cbb0f451376=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce various helpers to convert between GPA and virt/paddr=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/include/asm/xen/page=2Eh | 22 ++++++++++++++++++++++
 include/xen/arm/page=2Eh          | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/x86/include/asm/xen/page=2Eh b/arch/x86/include/asm/xen/=
page=2Eh
index 59f642a94b9d=2E=2Ed8fc2dc24809 100644
--- a/arch/x86/include/asm/xen/page=2Eh
+++ b/arch/x86/include/asm/xen/page=2Eh
@@ -26,6 +26,11 @@ typedef struct xpaddr {
 	phys_addr_t paddr;
 } xpaddr_t;
=20
+/* Xen guest physical address */
+typedef struct xgaddr {
+	phys_addr_t gaddr;
+} xgaddr_t;
+
 #ifdef CONFIG_X86_64
 #define XEN_PHYSICAL_MASK	__sme_clr((1UL << 52) - 1)
 #else
@@ -37,6 +42,7 @@ typedef struct xpaddr {
=20
 #define XMADDR(x)	((xmaddr_t) { =2Emaddr =3D (x) })
 #define XPADDR(x)	((xpaddr_t) { =2Epaddr =3D (x) })
+#define XGADDR(x) ((xgaddr_t) { =2Egaddr =3D (x) })
=20
 /**** MACHINE <-> PHYSICAL CONVERSION MACROS ****/
 #define INVALID_P2M_ENTRY	(~0UL)
@@ -256,6 +262,18 @@ static inline unsigned long gfn_to_pfn(unsigned long =
gfn)
 		return mfn_to_pfn(gfn);
 }
=20
+static inline xgaddr_t phys_to_guest(xpaddr_t phys)
+{
+	unsigned int offset =3D phys=2Epaddr & ~PAGE_MASK;
+	return XGADDR(PFN_PHYS(pfn_to_gfn(PFN_DOWN(phys=2Epaddr))) | offset);
+}
+
+static inline xpaddr_t guest_to_phys(xgaddr_t guest)
+{
+	unsigned int offset =3D guest=2Egaddr & ~PAGE_MASK;
+	return XPADDR(PFN_PHYS(gfn_to_pfn(PFN_DOWN(guest=2Egaddr))) | offset);
+}
+
 /* Pseudo-physical <-> Bus conversion */
 #define pfn_to_bfn(pfn)		pfn_to_gfn(pfn)
 #define bfn_to_pfn(bfn)		gfn_to_pfn(bfn)
@@ -305,6 +323,10 @@ static inline unsigned long virt_to_pfn(const void *v=
)
 /* VIRT <-> GUEST conversion */
 #define virt_to_gfn(v)		(pfn_to_gfn(virt_to_pfn(v)))
 #define gfn_to_virt(g)		(__va(gfn_to_pfn(g) << PAGE_SHIFT))
+#define virt_to_guest(v)  (phys_to_guest(XPADDR(__pa(v))))
+
+#define percpu_to_gaddr(v) \
+	(phys_to_guest(XPADDR(per_cpu_ptr_to_phys(v))))
=20
 static inline unsigned long pte_mfn(pte_t pte)
 {
diff --git a/include/xen/arm/page=2Eh b/include/xen/arm/page=2Eh
index e5c84ff28c8b=2E=2E1119bde2994c 100644
--- a/include/xen/arm/page=2Eh
+++ b/include/xen/arm/page=2Eh
@@ -24,8 +24,14 @@ typedef struct xpaddr {
 	phys_addr_t paddr;
 } xpaddr_t;
=20
+/* Xen guest physical address */
+typedef struct xgaddr {
+	phys_addr_t gaddr;
+} xgaddr_t;
+
 #define XMADDR(x)	((xmaddr_t) { =2Emaddr =3D (x) })
 #define XPADDR(x)	((xpaddr_t) { =2Epaddr =3D (x) })
+#define XGADDR(x)	((xgaddr_t) { =2Egaddr =3D (x) })
=20
 #define INVALID_P2M_ENTRY      (~0UL)
=20
@@ -54,6 +60,18 @@ static inline unsigned long gfn_to_pfn(unsigned long gf=
n)
 	return gfn;
 }
=20
+static inline xgaddr_t phys_to_guest(xpaddr_t phys)
+{
+	unsigned int offset =3D phys=2Epaddr & ~PAGE_MASK;
+	return XGADDR(PFN_PHYS(pfn_to_gfn(PFN_DOWN(phys=2Epaddr))) | offset);
+}
+
+static inline xpaddr_t guest_to_phys(xgaddr_t guest)
+{
+	unsigned int offset =3D guest=2Egaddr & ~PAGE_MASK;
+	return XPADDR(PFN_PHYS(gfn_to_pfn(PFN_DOWN(guest=2Egaddr))) | offset);
+}
+
 /* Pseudo-physical <-> BUS conversion */
 static inline unsigned long pfn_to_bfn(unsigned long pfn)
 {
@@ -82,9 +100,12 @@ static inline unsigned long bfn_to_pfn(unsigned long b=
fn)
 		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
 	})
 #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
+#define virt_to_guest(v)  (phys_to_guest(XPADDR(__pa(v))))
=20
 #define percpu_to_gfn(v)	\
 	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
+#define percpu_to_gaddr(v) \
+	(phys_to_guest(XPADDR(per_cpu_ptr_to_phys(v))))
=20
 /* Only used in PV code=2E But ARM guests are always HVM=2E */
 static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2f8.d083e86f72d0a7a2.1a145ae05ea.5ac65cbb0f451376=---

