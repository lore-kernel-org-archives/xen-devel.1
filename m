Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C599F5A8BC
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:26:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286518.1567720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBp-0000j7-Jk; Mon, 20 Apr 2026 20:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286518.1567720; Mon, 20 Apr 2026 20:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBn-0000cG-5y; Mon, 20 Apr 2026 20:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1286518;
 Mon, 20 Apr 2026 19:57:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEukO-0006fo-UJ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEukO-009ZPW-7Y
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:57:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68517-2eae-0a2a0a5409dd-0a2a4502a0c0-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:57:32 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6852b-af86-0a2a45020019-22cac1c5b4b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:57:32 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -626512684; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:57:30 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=M9/4NdUWyqAtK8Fit69+Bnm9xMy1eY3nSbgT1azTD34Nz6w9xYF1aHLdFQfZ35Xu6weINH+m1la/vntFnvLJcfXocQNybKobxFyF6xus6MhPtDGS5KopeCrw6BcU0Vq105SxVwd36ICTf8PFVS+R5BzWLqaMYwW8D5BUzkLb9Ewq09RQTYHVP2LefJ5r3NsTj0mwShz4Qk+wUMpeC3VZ5e7OIQLM1LB0xkl+6BOHI1kY/CEMscuwPMwHQXcutRR70LTANhn3XfXywS1KaIbvm/BKzIcF71QosB1YS9TKHzQtkw8o10LLenTAzMM2+GzYV85orU4oRzxXiBGPuXgTnw==; s=purelymail1; d=purelymail.com; v=1; bh=Bo0/+fpXPbC761YoL2O6hN3iZ/zaUJH+bSYJFMyq0KU=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 27/43] arm/altp2m: Add support for altp2m_{get,set}_altp2m
Date: Mon, 20 Apr 2026 15:57:10 -0400
Message-Id: <20260420195726.207764-1-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-720697/1776715052-88EC8161-383666E4/0/0
X-purgate-type: clean
X-purgate-size: 1886

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds support for altp2m_get_altp2m and altp2m_set_altp2m on
ARM. The x86-specific VCPU accesses have been replaced with the
architecture independent functions altp2m_vcpu_idx and altp2m_set_vcpu_idx.

This is commit 4/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/include/xen/altp2m.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 58e74be6deb0..f5a4d0e60562 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,7 @@
=20
 #include <public/hvm/hvm_op.h>
=20
+#include <asm/altp2m.h>
 #include <asm/p2m.h>
=20
 #define INVALID_ALTP2M  0xffff
@@ -31,11 +32,10 @@ static inline bool altp2m_active(const struct domain *d=
)
     return d->altp2m_active;
 }
=20
-#ifdef CONFIG_X86
 /* get current alternate p2m table */
 static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
 {
-    unsigned int index =3D vcpu_altp2m(v).p2midx;
+    unsigned int index =3D altp2m_vcpu_idx(v);
=20
     if ( index =3D=3D INVALID_ALTP2M )
         return NULL;
@@ -52,19 +52,18 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, un=
signed int idx)
=20
     BUG_ON(idx >=3D v->domain->nr_altp2m);
=20
-    if ( idx =3D=3D vcpu_altp2m(v).p2midx )
+    if ( idx =3D=3D altp2m_vcpu_idx(v) )
         return false;
=20
     orig =3D altp2m_get_altp2m(v);
     BUG_ON(!orig);
     atomic_dec(&orig->active_vcpus);
=20
-    vcpu_altp2m(v).p2midx =3D idx;
+    altp2m_set_vcpu_idx(v, idx);
     atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
=20
     return true;
 }
-#endif
=20
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
=20
--=20
2.34.1


