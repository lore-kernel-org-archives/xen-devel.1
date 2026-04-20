Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3AF5A8C0
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286506.1567675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBc-000690-HJ; Mon, 20 Apr 2026 20:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286506.1567675; Mon, 20 Apr 2026 20:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBZ-00060B-2i; Mon, 20 Apr 2026 20:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1286506;
 Mon, 20 Apr 2026 19:55:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhz-0006TW-GR
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhy-001DqV-S8
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6844b-e002-0a2a0a5209dd-0a2a450aa842-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:02 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a5-56b3-0a2a450a0019-22cac1c59618-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:02 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:55 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=Lxhym/cOQ4qYy9GgreYlWhVreh6oiF53H10JumcP6H06uRDLwJLk0s0KpRoWZzOZPdbu8PQ7CxqFX4QZIRnnEjDpywuAMg9skBImiwABLsR+7E/dGlMayS/taxre2B9cuk35ujy4yQGDrQA5uNm7JAHTIc27AVOd1JMjTameBBl24iYZfrf4f0u8erjx5niUBScDxGd0Dp+923XIIPP6ogUenTrTJzT8pI8A8H8LE6gqyyAZXFav6mkhwKVN3UKvPXKY1PN3nA2Idj67nv7nqLlu0ZdH82vuz92hAwfdr72zYN2Wn6Y/23b1zFNcum5SIC/1ZPIx16OFtivSBPysAg==; s=purelymail1; d=purelymail.com; v=1; bh=wx+7amyQeojfvKKlVkM7oqIEEdzw0LZWV6YBeYQcTbg=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Sergej Proskurin <proskurin@sec.in.tum.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [RFC PATCH v6 19/43] arm/p2m: Change function prototype of p2m_alloc_table
Date: Mon, 20 Apr 2026 15:50:18 -0400
Message-Id: <20260420195042.207624-20-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-4011c0/1776714662-8087E8B7-C9B41944/0/0
X-purgate-type: clean
X-purgate-size: 1608

From: Sergej Proskurin <proskurin@sec.in.tum.de>

The function "p2m_alloc_table" should be able to allocate 2nd stage
translation tables not only for the host's p2m but also for alternate
p2m's.

This commit is a refactor and contains no functional changes.

This is commit 8/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
Acked-by: Julien Grall <julien.grall@arm.com>
---
v2: Removed altp2m table initialization from "p2m_table_init".

v3: Removed initialization of the field d->arch.altp2m_active in
    "p2m_table_init" to avoid altp2m initialization throughout different
    files.

    Merged the function "p2m_alloc_table" and "p2m_table_init".
---
 xen/arch/arm/mmu/p2m.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51753bb2c34d..f546f63f2489 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1426,10 +1426,8 @@ static struct page_info *p2m_allocate_root(void)
     return page;
 }
=20
-static int p2m_alloc_table(struct domain *d)
+static int p2m_alloc_table(struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
-
     p2m->root =3D p2m_allocate_root();
     if ( !p2m->root )
         return -ENOMEM;
@@ -1576,7 +1574,7 @@ static int p2m_initialise(struct domain *d, struct p2=
m_domain *p2m)
     if ( rc )
         return rc;
=20
-    rc =3D p2m_alloc_table(d);
+    rc =3D p2m_alloc_table(p2m);
     if ( rc )
         return rc;
=20
--=20
2.34.1


