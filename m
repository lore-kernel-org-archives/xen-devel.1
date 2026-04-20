Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB87F5A8BC
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286507.1567683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBf-0006hp-Hr; Mon, 20 Apr 2026 20:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286507.1567683; Mon, 20 Apr 2026 20:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBd-0006Yt-1O; Mon, 20 Apr 2026 20:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1286507;
 Mon, 20 Apr 2026 19:55:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhz-0006Tc-SM
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhz-008XH6-9A
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6843f-bab6-0a2a0a5309dd-0a2a4505bfc4-40
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:03 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a5-aaa8-0a2a45050019-22cac1c5d9aa-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:02 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:56 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=KyDwv5OmmuLRC4ucXPhbnuUebxNOworiZxGrTOcDB/S/5+jSU3Rp2Xdd6LkMkjMjOO893MIVid+zQoa6y9sVfNfInJ2c/ETVwILYzoJEnK+mIVzoWTaQu5a9HBwNLjoJYrex+1u1WXH5Zt0r4Vslw1Q1z8aCV63rUPopyZ2HYzIJq9xcKNFfPTdAVAqgFYJxb/TeXix8zeqsW7VQkDRRrEmkMeFboDanjkijyZqz0Fn32sSrh2zY4O9G4jwTX/EFhXXVkOWKGT8OBd5ednQa2PbTbtZdCLvdlxdQN+Lisy7I70nZNa1KgTtQgpMOaoN3ykGfP5gA33hvL5m6JN8dxA==; s=purelymail1; d=purelymail.com; v=1; bh=rEbX4y8NSItxI+ya2K695AgqL2qzX4yowYtNn0i53K0=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Sergej Proskurin <proskurin@sec.in.tum.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v6 20/43] arm/p2m: Rename parameter in p2m_alloc_vmid
Date: Mon, 20 Apr 2026 15:50:19 -0400
Message-Id: <20260420195042.207624-21-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-c201ff/1776714662-2A56B443-0C4D73E0/0/0
X-purgate-type: clean
X-purgate-size: 1390

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit does not change or introduce any additional functionality
but rather is a part of the following commit that alters the
functionality of the function "p2m_alloc_vmid".

This is commit 9/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/p2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19af..2c43b6033360 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -286,24 +286,24 @@ int p2m_alloc_vmid(struct domain *d)
 {
     struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
=20
-    int rc, nr;
+    int rc, vmid;
=20
     spin_lock(&vmid_alloc_lock);
=20
-    nr =3D find_first_zero_bit(vmid_mask, MAX_VMID);
+    vmid =3D find_first_zero_bit(vmid_mask, MAX_VMID);
=20
-    ASSERT(nr !=3D INVALID_VMID);
+    ASSERT(vmid !=3D INVALID_VMID);
=20
-    if ( nr =3D=3D MAX_VMID )
+    if ( vmid =3D=3D MAX_VMID )
     {
         rc =3D -EBUSY;
         printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain=
_id);
         goto out;
     }
=20
-    set_bit(nr, vmid_mask);
+    set_bit(vmid, vmid_mask);
=20
-    p2m->vmid =3D nr;
+    p2m->vmid =3D vmid;
=20
     rc =3D 0;
=20
--=20
2.34.1


