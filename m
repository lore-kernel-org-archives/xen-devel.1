Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79DFCCF2C2
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:06:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452487.1667325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOH-00070V-3r; Fri, 16 Oct 2026 17:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452487.1667325; Fri, 16 Oct 2026 17:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlOH-00070K-1F; Fri, 16 Oct 2026 17:06:45 +0000
Received: by outflank-mailman (input) for mailman id 1452487;
 Fri, 16 Oct 2026 17:06:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0a4a0008425@swg.vates.tech>)
 id 1xHlOG-0006vu-HF
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:06:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlOF-006YfJ-Tz
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:06:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0a4a0008425@swg.vates.tech>)
 id 6ad25989-8faa-0a2a0a5109dd-0a2a4502d3c0-28
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:43 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ae0a4a0008425@swg.vates.tech>)
 id 6ad2599e-6ca4-0a2a45020019-b9ff1c12837f-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:06:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ae0a4a0008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:06:36 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 98B7F81C51;
 Fri, 16 Oct 2026 19:06:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=PuEaAxriDCY/GSogovlT27z16bTwyhoDo4b6m7gADKw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=eG/8gq9+J3Klh0gS9QhoSf678kIvI0R/zFUuMmWqO7w9rtLHIseW1pn2BqRV5qmSjiV6g32Dq
 KT0xXr+pl+PitaH2munH/sern8mCGjEjneoG5mINtG2iy7c/5xFYRD9cectgT0wWCk8pu8P2eLE
 djNqDh8pon3Nzqwf0/7Wid9SRUcVKb5CFmmQl3+Sw/g8NFXGiCBo2Oqi1LmN6mzWL3GplaoGk2I
 oOUiIfYPcTL4oGXb3pUpofZYoORJRiqenTx1/Tdrt8RrpcswpgYxkWw6FpqxJs5E3tuBV3E/D3T
 WGRJWIpBTiRKnNgPzy5jy3ig9H8SlOThNnIGJRlbT89g==
X-Zone-Loop: ec3a83c7039c0cc1b37dd70a6cdb60f2f9c14e3d589e
x-campaign-type: default
x-transaction-id: 6ebb36e5-740f-4d91-88cd-cfe4d4d01940
x-swg-uid: 01-4cc33359-792e-4a6a-beba-308e91ad3fef
X-Mailer: Sweego
Message-ID:
 <1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0a4a0008425@vates.tech>
x-swg-bid: 1792170396.8631fc262581453bbf619ec5b2062170.1a145ae0a4a0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] x86/xen/time: Correct xen_save_time_memory_area() failure message
Date: Fri, 16 Oct 2026 19:06:09 +0200
In-Reply-To: <20261016170613.173406-2-teddy.astie@vates.tech>
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <20261016170613.173406-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f9.ab99fe497216475c.1a145ae08a2.6220ae13ecb99cad=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170395810
X-purgate-ID: tlsNG-720697/1792170403-66CB22AC-4FF9EB57/0/0
X-purgate-type: clean
X-purgate-size: 1731

---=Part.2f9.ab99fe497216475c.1a145ae08a2.6220ae13ecb99cad=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

We actually didn't fail to "save secondary vcpu time info" but
just to unregister the mapping of it=2E

Reported-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

 arch/x86/xen/time=2Ec | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/time=2Ec b/arch/x86/xen/time=2Ec
index 5c7822254a01=2E=2E2656b3a08553 100644
--- a/arch/x86/xen/time=2Ec
+++ b/arch/x86/xen/time=2Ec
@@ -407,8 +407,7 @@ void xen_save_time_memory_area(void)
=20
 	ret =3D HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_time_memory_area, 0, &t)=
;
 	if (ret !=3D 0)
-		pr_notice("Cannot save secondary vcpu_time_info (err %d)",
-			  ret);
+		pr_notice("Cannot unregister vcpu_time_info (err %d)\n", ret);
 	else
 		clear_page(xen_clock);
 }
@@ -435,7 +434,7 @@ void xen_restore_time_memory_area(void)
 	 * call for a reliable timestamp=2E
 	 */
 	if (ret !=3D 0)
-		pr_notice("Cannot restore secondary vcpu_time_info (err %d)",
+		pr_notice("Cannot restore secondary vcpu_time_info (err %d)\n",
 			  ret);
=20
 out:
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2f9.ab99fe497216475c.1a145ae08a2.6220ae13ecb99cad=---

