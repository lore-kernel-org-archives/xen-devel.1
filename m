Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30563C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375401.1622555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17F-0004lC-SG; Wed, 29 Jul 2026 10:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375401.1622555; Wed, 29 Jul 2026 10:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17F-0004l5-Pl; Wed, 29 Jul 2026 10:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1375401;
 Wed, 29 Jul 2026 10:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad532fb2000e099@swg.vates.tech>)
 id 1wp17E-0004jj-CZ
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:02:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp17D-007PuO-IN
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:02:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad532fb2000e099@swg.vates.tech>)
 id 6a69cfa6-e002-0a2a0a5209dd-0a2a4501e8ec-36
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:19 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad532fb2000e099@swg.vates.tech>)
 id 6a69cfab-5984-0a2a45010019-b9ff1c1297ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:19 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad532fb2000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:02:17 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5944483243;
 Wed, 29 Jul 2026 12:02:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=6iTesjhW2f53P1OKO+SWMzCd/+1OxQCvrUH72nqgYRs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DNwngkk8Xr0SBWXjleDY6GEtXCPCJzsgcI4greru5gGuLx5gIq6HyWXLS+jzuDgHAgxnTgQhE
 FOSKup4Q+yqcFhMcVX8jex9/FGPFpe+8gao2FKwnnwfVxJSIQeMSU21RsUefDK2MM+wCKvAkacq
 EFPO+wzMftShIqfTFg+VQik/O3s85dIO+f/1iOGoBiYFX2ztmbaMkyGBHSMlNyDQCgOKIWRetep
 vQ5NmeCCLdYx7V2bAcmQ0Vg8v8Z40vALvN4vhx4ovOWHbKlmvlcsbUguK3PdvYjjwX2pj8VA6Ql
 pB2ECxY3++Kv1O/yE1gMhUM4ROP50QCzId3eZq6/Ee1A==
X-Zone-Loop: 02fa034c7c890c228b943f4bf0f05a0a548058f06a4e
x-campaign-type: default
x-transaction-id: 6a9bcb72-d3ed-4857-a891-1bcdc64f17e6
x-swg-uid: 01-4a3450bf-465a-438e-af10-69f445d41451
X-Mailer: Sweego
Message-ID:
 <1785319337.8631fc262581453bbf619ec5b2062170.19fad532fb2000e099@vates.tech>
x-swg-bid: 1785319337.8631fc262581453bbf619ec5b2062170.19fad532fb2000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 1/5] vtd: Ensure root entry is updated consistently
Date: Wed, 29 Jul 2026 11:59:43 +0200
In-Reply-To: <cover.1785316552.git.teddy.astie@vates.tech>
References: <cover.1785316552.git.teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.165d.daca0a7cecdffe8.19fad531e7f.6717db81b3fe671a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319333504
X-purgate-ID: tlsNG-d62444/1785319339-1F262757-862A6B68/0/0
X-purgate-type: clean
X-purgate-size: 2624

---=Part.165d.daca0a7cecdffe8.19fad531e7f.6717db81b3fe671a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Make sure the root entry is updated consistently such that the compiler
is not allowed to perform optimizations around setting present bit (and
i=2Ee set present bit before setting up the pagetable addresss, which woul=
d
cause the IOMMU to use a pagetable at address 0 instead)=2E

This issue can only occurs at boot time where present bit is initially cle=
ared
or when a bus is first introduced in the machine=2E

Fixes: ccfe4e08455f ("Intel vt-d specific changes in arch/x86/hvm/vmx/vtd=
=2E")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/iommu=2Ec | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu=2Ec b/xen/drivers/passthrou=
gh/vtd/iommu=2Ec
index 3d6f787b3c=2E=2Ec314ce1db8 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Ec
+++ b/xen/drivers/passthrough/vtd/iommu=2Ec
@@ -281,13 +281,13 @@ void free_pgtable_maddr(u64 maddr)
 /* context entry handling */
 static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
 {
-    struct root_entry *root, *root_entries;
+    struct root_entry root, *root_entries;
     u64 maddr;
=20
     ASSERT(spin_is_locked(&iommu->lock));
     root_entries =3D (struct root_entry *)map_vtd_domain_page(iommu->root=
_maddr);
-    root =3D &root_entries[bus];
-    if ( !root_present(*root) )
+    root=2Eval =3D ACCESS_ONCE(root_entries[bus]=2Eval);
+    if ( !root_present(root) )
     {
         maddr =3D alloc_pgtable_maddr(1, iommu->node);
         if ( maddr =3D=3D 0 )
@@ -295,11 +295,12 @@ static u64 bus_to_context_maddr(struct vtd_iommu *io=
mmu, u8 bus)
             unmap_vtd_domain_page(root_entries);
             return 0;
         }
-        set_root_value(*root, maddr);
-        set_root_present(*root);
-        iommu_sync_cache(root, sizeof(struct root_entry));
+        set_root_value(root, maddr);
+        set_root_present(root);
+        ACCESS_ONCE(root_entries[bus]=2Eval) =3D root=2Eval;
+        iommu_sync_cache(&root_entries[bus], sizeof(struct root_entry));
     }
-    maddr =3D (u64) get_context_addr(*root);
+    maddr =3D (u64) get_context_addr(root);
     unmap_vtd_domain_page(root_entries);
     return maddr;
 }
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.165d.daca0a7cecdffe8.19fad531e7f.6717db81b3fe671a=---

