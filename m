Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC34CCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:46:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437190.1656014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBthN-0001Dv-L8; Wed, 30 Sep 2026 12:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437190.1656014; Wed, 30 Sep 2026 12:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBthN-0001Do-H9; Wed, 30 Sep 2026 12:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1437190;
 Wed, 30 Sep 2026 12:46:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBthM-0001Db-Fp
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:46:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBthL-00CMgs-Sn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:46:11 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66@swg.vates.tech>)
 id 6abd048f-e002-0a2a0a5209dd-0a2a4508a8fc-16
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:46:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66@swg.vates.tech>)
 id 6abd0493-f659-0a2a45080019-b9ff1c228697-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:46:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f259d77b0003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 12:46:09 +0000
Received: from leducb.tail4c4a28.ts.net
 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5474482310;
 Wed, 30 Sep 2026 14:46:08 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=3zPdImH7iv8y5g60t32jUOCpFkVJaZ5SSHVr8/w4ycA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZCzI4ycdOSXmkPdLm8t5Tt2skT4K1LCP/D/p1KLsPQy5DbbnDj9jvjpRWIABkoMBaf8+OCufd
 U9hz8kqGOocovwJCHCpIcBOA+/56oAjGwrPHdtcRnN29h+d0A4IOVPZ1mlDvXJqdhdp280PWD5j
 C5/0/+ATmYGnwvWBBYb/wVCMiwqcjmhYYvJVymfwCw3dQLez3soNsKpajuW4Tu+b1vGEzwyWzzE
 a3CtGC2X1kFViIJKkAw9Mxz8j/9KqA2aR8vcqkjkd2TCV1Qx5bm7bWlpkwrSxGlh6MJIVfarnpL
 BV1Lg7URzPWmZrfStx2S8U3076BaIkGd6HS7Ls60wH9Q==
X-Zone-Loop: 24ce67338e0c24d6e3df4bc40a580dad3e530cce043b
x-campaign-type: default
x-transaction-id: 0e0296dc-b5c9-4164-8167-826121b34153
x-swg-uid: 01-cb438cf2-4e57-4315-a011-89fcd173ff9d
X-Mailer: Sweego
Message-ID:
 <1790772369.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66@vates.tech>
x-swg-bid: 1790772369.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3.1 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
Date: Wed, 30 Sep 2026 14:46:02 +0200
In-Reply-To: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
References: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=3566;  i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;  bh=E3egDkZK6boHg/W2zoFtBVdv7bpvzgoKLJiNsjxQQqM=;  b=aR9MHvLXVP0bYgr0h5s1p0ZHi/v+npJaP+TrU9tTxJO97TK7/LJUyoRwM8duZSPRIeVVCaun5  SGEfakJJ+sSAD3txdvDyAr/oXJ4BzNDTdzm8KlW/+6LZb9TsIUImI0Z
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;  pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: quoted-printable
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790772368538
X-purgate-ID: tlsNG-c1860d/1790772371-CD94A87B-70319A9D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3902

paddr_to_pte()'s "permissions" parameter, the matching local in=0D
setup_initial_mapping() and p2m_set_permission() don't only deal with=0D
permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and=0D
PTE_DIRTY.=0D
=0D
Rename them to "pte_flags" and p2m_set_pte_flags() respectively.=0D
=0D
No functional change.=0D
=0D
Requested-by: Jan Beulich <jbeulich@suse.com>=0D
Assisted-by: Claude:claude-opus-5=0D
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>=0D
---=0D
Changes since v2:=0D
- new patch=0D
---=0D
 xen/arch/riscv/include/asm/mm.h | 5 +++--=0D
 xen/arch/riscv/mm.c             | 8 ++++----=0D
 xen/arch/riscv/p2m.c            | 4 ++--=0D
 3 files changed, 9 insertions(+), 8 deletions(-)=0D
=0D
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h=0D
index 9e28c24954..1ac66283ec 100644=0D
--- a/xen/arch/riscv/include/asm/mm.h=0D
+++ b/xen/arch/riscv/include/asm/mm.h=0D
@@ -22,9 +22,10 @@ extern vaddr_t directmap_virt_start;=0D
 #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))=0D
 =0D
 static inline pte_t paddr_to_pte(paddr_t paddr,=0D
-                                 unsigned int permissions)=0D
+                                 unsigned int pte_flags)=0D
 {=0D
-    return (pte_t) { .pte =3D (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) | per=
missions };=0D
+    return (pte_t) { .pte =3D (paddr_to_pfn(paddr) << PTE_PPN_SHIFT) |=0D
+                            pte_flags };=0D
 }=0D
 =0D
 static inline paddr_t pte_to_paddr(pte_t pte)=0D
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c=0D
index 610d111945..0e26c5751f 100644=0D
--- a/xen/arch/riscv/mm.c=0D
+++ b/xen/arch/riscv/mm.c=0D
@@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_des=
c *mmu_desc,=0D
         case 1: /* Level 0 */=0D
             {=0D
                 unsigned long paddr =3D (page_addr - map_start) + pa_start=
;=0D
-                unsigned int permissions =3D PTE_LEAF_DEFAULT;=0D
+                unsigned int pte_flags =3D PTE_LEAF_DEFAULT;=0D
                 unsigned long addr =3D is_identity_mapping=0D
                                      ? page_addr : virt_to_maddr(page_addr=
);=0D
                 pte_t pte_to_be_written;=0D
@@ -149,13 +149,13 @@ static void __init setup_initial_mapping(struct mmu_d=
esc *mmu_desc,=0D
 =0D
                 if ( is_kernel_text(addr) ||=0D
                      is_kernel_inittext(addr) )=0D
-                        permissions =3D=0D
+                        pte_flags =3D=0D
                             PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;=0D
 =0D
                 if ( is_kernel_rodata(addr) )=0D
-                    permissions =3D PTE_READABLE | PTE_VALID;=0D
+                    pte_flags =3D PTE_READABLE | PTE_VALID;=0D
 =0D
-                pte_to_be_written =3D paddr_to_pte(paddr, permissions);=0D
+                pte_to_be_written =3D paddr_to_pte(paddr, pte_flags);=0D
 =0D
                 if ( !pte_is_valid(pgtbl[index]) )=0D
                     pgtbl[index] =3D pte_to_be_written;=0D
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c=0D
index 1cea86512c..f7b380b90a 100644=0D
--- a/xen/arch/riscv/p2m.c=0D
+++ b/xen/arch/riscv/p2m.c=0D
@@ -584,7 +584,7 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_c=
ache)=0D
     p2m_write_pte(p, pte, clean_cache);=0D
 }=0D
 =0D
-static void p2m_set_permission(pte_t *e, p2m_type_t t)=0D
+static void p2m_set_pte_flags(pte_t *e, p2m_type_t t)=0D
 {=0D
     e->pte &=3D ~PTE_ACCESS_MASK;=0D
 =0D
@@ -676,7 +676,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,=
=0D
             break;=0D
         }=0D
 =0D
-        p2m_set_permission(&e, t);=0D
+        p2m_set_pte_flags(&e, t);=0D
         p2m_set_type(&e, t, ctx);=0D
     }=0D
     else=0D
=0D
-- =0D
2.55.0=0D
=0D

