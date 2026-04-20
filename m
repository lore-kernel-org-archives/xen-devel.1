Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0A5F5A8CB
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286502.1567661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBW-0005Mp-4S; Mon, 20 Apr 2026 20:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286502.1567661; Mon, 20 Apr 2026 20:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBT-0005Ic-M7; Mon, 20 Apr 2026 20:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1286502;
 Mon, 20 Apr 2026 19:54:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhu-0006SQ-JZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhu-008XH6-0R
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:54:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68454-bab6-0a2a0a5309dd-0a2a45079f0a-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:54:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-229c-0a2a45070019-22cac1c59abe-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:54 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=F9MbV6ACJ4uu8xz4nBiYL+aJEaI7vNYgek40kUHpvesIb6Iaboxo61gh+uvAXEzLMJLkNoVW4PQhgcq/Nf3Gpvq4bPtaOW5TmF/HnTF4goJZnO44JqyaTHYLQJpz6b5CUpSz/1JOBSamtbwsGKYfY0pmkmxSKpfYWmH+WWw1cOqnapmEzR0OyBRIrAd8NEnivQuoKbwEjUIi879wTLBDus0BvqoiV76eZCkCuLyAevRI+ixmQ3kla0ordVy/vImR8d0vgS6YP8f9vvoKMxGaSfdxQsZY8Jwh4ElMQurIU3Zo7XU4m/Mh4xy9IIVhyfVRc7qrCyKkZ0AIoefoYzQMhA==; s=purelymail1; d=purelymail.com; v=1; bh=J3+KXe+q3SuG3x2Q+RtXcVoXETWE7y6frhf/lsuIM/c=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 16/43] arm/p2m: Cosmetic fix - substitute _gfn(ULONG_MAX) for INVALID_GFN
Date: Mon, 20 Apr 2026 15:50:15 -0400
Message-Id: <20260420195042.207624-17-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-ef75cf/1776714657-ADB68C48-575F2930/0/0
X-purgate-type: clean
X-purgate-size: 1020

From: Sergej Proskurin <proskurin@sec.in.tum.de>

In ./xen/arch/arm/p2m.c, we compare the gfn's with INVALID_GFN
throughout the code. Thus it makes sense to use the macro INVALID_GFN
instead of a hard coded value to initialize "p2m->lowest_mapped_gfn".

This is commit 5/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
 xen/arch/arm/mmu/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 3ecb969a0369..1009f10e5db4 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1517,7 +1517,7 @@ static int p2m_initialise(struct domain *d, struct p2=
m_domain *p2m)
=20
     p2m->vmid =3D INVALID_VMID;
     p2m->max_mapped_gfn =3D _gfn(0);
-    p2m->lowest_mapped_gfn =3D _gfn(ULONG_MAX);
+    p2m->lowest_mapped_gfn =3D INVALID_GFN;
=20
     p2m->default_access =3D p2m_access_rwx;
     p2m->mem_access_enabled =3D false;
--=20
2.34.1


