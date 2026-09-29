Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8FACA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:33:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436559.1655219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalW-00063t-KL; Tue, 29 Sep 2026 16:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436559.1655219; Tue, 29 Sep 2026 16:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBalW-00063m-Hh; Tue, 29 Sep 2026 16:33:14 +0000
Received: by outflank-mailman (input) for mailman id 1436559;
 Tue, 29 Sep 2026 16:33:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBalV-00063A-Ex
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:33:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBalU-009fcQ-SD
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:33:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@swg.vates.tech>)
 id 6abbe841-8faa-0a2a0a5109dd-0a2a450abf7c-20
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:12 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@swg.vates.tech>)
 id 6abbe848-f2d2-0a2a450a0019-b9ff1c12a02d-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:33:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ee033eb9000b504.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Sep 2026 16:33:05 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 80C9E82374;
 Tue, 29 Sep 2026 18:33:04 +0200 (CEST)
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
 b=DIyRb6X+yo4JsYKBTuLxvF7JWhM1OTtkRjy/NcvAyzA+2uFg3xssMlI7KgmvZ7d00zvibNMDt
 YddoF+8OIMl6mJWX8tOiUR2jQ/Fcfo8mab6ni4ydoi6c7+wNpagVrXmtDWmvBuqvp4TmGoK2fvZ
 zPSBSXvKiTgCbP4aXNPXQ0qEfJjHE9cYxd5s97+3ZHgI6/oWlI+MEzP8MRf8RIvF3CVJcxQlPD/
 D713voIoDfKET0GO9wK+y5gDh1NgiQMGuNAwZ/V0fEiTe6IA32gpA7jXANDZxagzFZoDhSAqQZx
 +nUl7BulRP6YtxRJt2x4ljYIWvIZHqc0ItutTUJbhduA==
X-Zone-Loop: 123d37f5383964c31833018aef8ada642b2335e4c98d
x-campaign-type: default
x-transaction-id: ad4ede69-0294-42d7-ab40-3ad1cd9fc3f7
x-swg-uid: 01-5b7b0f5a-df1f-46bc-bcdf-2f2480a58410
X-Mailer: Sweego
Message-ID:
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
x-swg-bid: 1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504
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
Subject: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
Date: Tue, 29 Sep 2026 18:32:43 +0200
In-Reply-To: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790699289; l=3566;  i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;  bh=E3egDkZK6boHg/W2zoFtBVdv7bpvzgoKLJiNsjxQQqM=;  b=aR9MHvLXVP0bYgr0h5s1p0ZHi/v+npJaP+TrU9tTxJO97TK7/LJUyoRwM8duZSPRIeVVCaun5  SGEfakJJ+sSAD3txdvDyAr/oXJ4BzNDTdzm8KlW/+6LZb9TsIUImI0Z
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;  pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: quoted-printable
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790699584706
X-purgate-ID: tlsNG-4011c0/1790699592-538D5CFC-FB0F10A6/10/78276251493
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

