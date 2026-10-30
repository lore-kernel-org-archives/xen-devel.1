Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05A606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=mpXlaIMy
Received: from list by lists.xenproject.org with outflank-mailman.1465511.1676030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjBJ-0004HP-Gd; Fri, 30 Oct 2026 09:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465511.1676030; Fri, 30 Oct 2026 09:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMjBJ-0004HI-Dv; Fri, 30 Oct 2026 09:45:53 +0000
Received: by outflank-mailman (input) for mailman id 1465511;
 Fri, 30 Oct 2026 09:45:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@swg.vates.tech>)
 id 1xMjBI-0004Gw-1Y
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 09:45:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMjBH-0017hu-40
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 10:45:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@swg.vates.tech>)
 id 6ae46749-bab6-0a2a0a5309dd-0a2a4503e03c-22
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:45:50 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@swg.vates.tech>)
 id 6ae4674e-fae8-0a2a45030019-b9ff1c22b21d-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:45:50 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18c337b6e000cae1.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 09:45:46 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7AFAE8279E;
 Fri, 30 Oct 2026 10:45:45 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=wqO1UgNdwJ9EoOMNCjkXFiohe5izNhb3KkYp0DfjGrg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=mpXlaIMyZM4bY4rheZUtXs/TVH8vlfrFE616QuaibXXJOSUnUPmLev8Ftlb4QVl3LQD2gxZlZ
 xFKP3MzgSodlRADGXkQ77PFItYBoNpvPfb6LdmWMVE1WgfCNvMEKdgpp6LHtZ+1X8FZHmnOo79l
 wzT8I83uHjs6LRIrens8KNxbmkF9naWQ967Kuvdjpk7rFLV3j52tjK5aFRLw6rchknMsNMztxqI
 4jEe7lghAQscRb3/8D93SC9wzWfi6husnBZL0Aj8Fo52TDTd7BNuHrtMTIFfSgdaX/GDq3gVKDs
 FyC1yhUVY6FnSTmYzNsgy/ms4ZgQrMLI/RnXVUlHsPmQ==
X-Zone-Loop: 94b74e54d6bb88b4e0d7de560141b257df29659af11f
x-campaign-type: default
x-transaction-id: 3d682fc2-95f0-4f59-89ee-7c65051fee8d
x-swg-uid: 01-0462a8db-5c33-4341-adfa-12c19d26f8f5
X-Mailer: Sweego
Message-ID:
 <1793353546.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1@vates.tech>
x-swg-bid: 1793353546.8631fc262581453bbf619ec5b2062170.1a18c337b6e000cae1
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v3 0/1] xen/arm: populate a default P2M pool for new domains
Date: Fri, 30 Oct 2026 10:45:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.311.fa1bda8342d9022b.1a18c3378e2.220c8c85418590b8=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793353545955
X-purgate-ID: tlsNG-33051d/1793353550-754844E9-CB016A3B/0/0
X-purgate-type: clean
X-purgate-size: 1072
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.311.fa1bda8342d9022b.1a18c3378e2.220c8c85418590b8=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michal,
thanks again for your review=2E As you suggested, I went with a fixed
default of 256 pages (1MByte), as x86 HAP does in hap_enable()=2E This
keeps the allocation bounded and seems like a sane value=2E The
toolstack or dom0less, anyway set the full size later=2E

Then my new helper domain_p2m_default_kb() goes away, which then also
addresses your other two comments=2E The patch now only touches
xen/arch/arm/mmu/p2m=2Ec again, just like v1=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (1):
  xen/arm: populate a default P2M pool for new domains

 xen/arch/arm/mmu/p2m=2Ec | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.311.fa1bda8342d9022b.1a18c3378e2.220c8c85418590b8=---

