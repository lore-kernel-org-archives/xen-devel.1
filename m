Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B894DF5A8C1
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286480.1567579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBL-00033E-CV; Mon, 20 Apr 2026 20:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286480.1567579; Mon, 20 Apr 2026 20:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBK-00030H-W7; Mon, 20 Apr 2026 20:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1286480;
 Mon, 20 Apr 2026 19:50:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue1-0006In-TJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-00C1UM-AE
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-e002-0a2a0a5209dd-0a2a45099984-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-2497-0a2a45090019-22cac1c5875a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:52 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=ZfRbcmN7j4RW4dTVDZPstZ52p5xuNQyJkowqmjLG7VTyYNxugUPBUj9yDrvIw3BvahQvlL5kQiYvvoSdtFJ17E8ieLE5kq7TScI7xLkqhaDMBxqNcWZp5Lxy92eUjsEqhFo/FyAxraBJCTEU/cxuBMNilRtxcVdl34nMXxSoth0iTmLUhc7D3CH6ToSlNOixxVVwieKzhvtrsiBadPVjeKyr2qeurljwDM/KuRZKwS0KxJSEMNDR/oJ07sTg1FX6yyzMapY+gbj5hYtTdTzTZqWEGUUsZHitUSQ8NILccgAWE9sGK59VBypDy4L/ZWqXbh9hcT9rZmUp/NePUMgUjw==; s=purelymail1; d=purelymail.com; v=1; bh=Hus8g9FcCxBCtWlrCzMkC4ORYsW88lGiIhFMrIDvnqs=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 11/43] arm/altp2m: Add support for HVMOP_altp2m_get_domain_state
Date: Mon, 20 Apr 2026 15:50:10 -0400
Message-Id: <20260420195042.207624-12-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-bad1c0/1776714657-8BF7EA53-C04C92A3/0/0
X-purgate-type: clean
X-purgate-size: 1279

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds support for the altp2m_get_domain_state HVMOP on ARM. All
code used in the command implementation already works on ARM, so no further
changes beyond moving the #ifdef are necessary.

This is commit 1/1 of the get_domain_state phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    This commit can be squashed into the previous commit for the actual
    submission if that would be preferred, but I thought it might be easier
    to understand the command #ifdef gate approach by splitting this into a
    separate patch.
---
 xen/common/altp2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 6481fae1ed12..3a3283f0860a 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -124,12 +124,12 @@ int do_altp2m_op(
=20
     switch ( a.cmd )
     {
-#ifdef CONFIG_X86
     case HVMOP_altp2m_get_domain_state:
         a.u.domain_state.state =3D altp2m_active(d);
         rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
=20
+#ifdef CONFIG_X86
     case HVMOP_altp2m_set_domain_state:
     {
         struct vcpu *v;
--=20
2.34.1


