Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73E606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=oq9v0sN7
Received: from list by lists.xenproject.org with outflank-mailman.1465715.1676189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHv-0000B3-2S; Fri, 30 Oct 2026 14:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465715.1676189; Fri, 30 Oct 2026 14:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHu-0000AA-Rz; Fri, 30 Oct 2026 14:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1465715;
 Fri, 30 Oct 2026 14:08:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24619c000cae1@swg.vates.tech>)
 id 1xMnHu-0008Rs-Cr
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:08:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMnHt-003DNt-IZ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:08:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24619c000cae1@swg.vates.tech>)
 id 6ae4a4f6-e002-0a2a0a5209dd-0a2a4508e452-14
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:57 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24619c000cae1@swg.vates.tech>)
 id 6ae4a4f9-f659-0a2a45080019-b9ff1c22a4e9-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:57 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18d24619c000cae1.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 14:08:54 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4252E82F34;
 Fri, 30 Oct 2026 15:08:53 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=o8TQ1P+wa0K8JL4R/1ysdsCGqdnNB6/v7Ew2w/ReJkA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=oq9v0sN7MfJQY9qzHGqmMuJ7AqkrSB94v67yTMb0pDBEgO78vdDuvZ0dPBY+KqzLYlVYfEL1M
 SHjDInjc8gZzpzXcAXIklrp91pD2aYQ+Mr0fL37aluSBNzWjleb4pfdRIgyJYAv9WUCQLK9X30E
 99ejrld9kzUzb48ZSv3ngN/SNN2S1RQ09Xa/R8St6vvhMgiptyLK7TXFZ/8JqQb3h7IxlgOKVCE
 Yv/ycp4i5LwUSjHwreKVAG6YoJQAgIvZReG7Y2F/vjhOwbJkaDqX63CCiZER0twys9ofkHkiMgq
 hKtihEVOFondYIgkM2rVAjoeoSgQBSwZbB1tCsbj2L6g==
X-Zone-Loop: 1d7ce52e3cd5272d3e7e1565dfb9c714c9d91c70a5f8
x-campaign-type: default
x-transaction-id: f55b60e1-8ad0-4ca6-a326-cbd06090976f
x-swg-uid: 01-97ce384e-d3dc-4328-97b3-d89d795e1be6
X-Mailer: Sweego
Message-ID:
 <1793369334.8631fc262581453bbf619ec5b2062170.1a18d24619c000cae1@vates.tech>
x-swg-bid: 1793369334.8631fc262581453bbf619ec5b2062170.1a18d24619c000cae1
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 3/4] x86/paging: allow the paging mempool size domctls for PV domains
Date: Fri, 30 Oct 2026 15:08:46 +0100
In-Reply-To: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
References: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.335.19dd3c1b8ec5f8d1.1a18d245ff7.2292b32db68e63d3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793369333751
X-purgate-ID: tlsNG-c1860d/1793369337-CCB7187B-7DA21E8F/0/0
X-purgate-type: clean
X-purgate-size: 2243
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.335.19dd3c1b8ec5f8d1.1a18d245ff7.2292b32db68e63d3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

To have a more generic interface for sizing a domain's paging pool,
replace XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION by
XEN_DOMCTL_{get,set}_paging_mempool_size=2E These functions works on both
x86 and ARM, and take an exact size in bytes instead of whole MBytes=2E

But on x86, the paging mempool domctls currently reject PV domains with
-EOPNOTSUPP=2E Toolstacks use SHADOW_OP_SET_ALLOCATION to size the shadow
pool of PV domains too=2E So, as long as this restriction exists, x86
toolstacks can't switch to the new interface=2E

The check is only needed on builds without CONFIG_SHADOW_PAGING, where
shadow_set_allocation() is a stub containing ASSERT_UNREACHABLE()=2E So,
only reject PV domains without CONFIG_SHADOW_PAGING=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 xen/arch/x86/mm/paging=2Ec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/paging=2Ec b/xen/arch/x86/mm/paging=2Ec
index 4bb8d169de=2E=2E2ea7a472ab 100644
--- a/xen/arch/x86/mm/paging=2Ec
+++ b/xen/arch/x86/mm/paging=2Ec
@@ -959,7 +959,7 @@ int arch_get_paging_mempool_size(struct domain *d, uin=
t64_t *size)
 {
     unsigned long pages;
=20
-    if ( is_pv_domain(d) )                 /* TODO: Relax in due course *=
/
+    if ( is_pv_domain(d) && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
         return -EOPNOTSUPP;
=20
     pages  =3D d->arch=2Epaging=2Etotal_pages;
@@ -976,7 +976,7 @@ int arch_set_paging_mempool_size(struct domain *d, uin=
t64_t size)
     bool preempted =3D false;
     int rc;
=20
-    if ( is_pv_domain(d) )                 /* TODO: Relax in due course *=
/
+    if ( is_pv_domain(d) && !IS_ENABLED(CONFIG_SHADOW_PAGING) )
         return -EOPNOTSUPP;
=20
     if ( size & ~PAGE_MASK ||              /* Non page-sized request? */
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.335.19dd3c1b8ec5f8d1.1a18d245ff7.2292b32db68e63d3=---

