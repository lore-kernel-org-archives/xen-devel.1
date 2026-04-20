Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEBAF5A8BD
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:26:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286522.1567735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBs-0001VA-Qv; Mon, 20 Apr 2026 20:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286522.1567735; Mon, 20 Apr 2026 20:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBr-0001Ki-6L; Mon, 20 Apr 2026 20:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1286522;
 Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEv6h-0001fC-7T
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 20:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEv6g-008aEX-6N
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a5b-bab6-0a2a0a5309dd-0a2a4502ab90-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68a91-af86-0a2a45020019-22cac1c5b4e4-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 22:20:34 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1875363766; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 20:20:31 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=PdndTnfHQ94xnfzXvTReUPZH9BuTxVxJjJfMOnrvVAJpp2crXPdzH7ncAQh+hUcWQEH99tB6zDa0jJxUiZlUnauDxErDjr1on984ww83jTh1+UBefY/uOjmXIDmBvsulNiwtzOOY73NUpAQFV08yu3OZ3pD99wAlnSFDRVnxc8vcgxSgUPSDpw62a/hLP0J3yqQ1cfUkrtJTPzYPsVhrk1DXkoaygccPCk19q/3Q8nvMZPHLTkIYt/AhBNodIYez11A85hQ7m2J0sj3Jv+w50Z0jQG1ojapYfIiqX0Aiz5p2z/SpxM3ITT7+1KFgbdwK+XlZf2V2teg6zH63vIB/XA==; s=purelymail1; d=purelymail.com; v=1; bh=6JpqCKE14Ko8dp6uJ3eg+NGvA3AnOZiNuyDPfwkQfOU=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 29/43] arm/altp2m: Add support for altp2m_vcpu_{initialise,destroy}
Date: Mon, 20 Apr 2026 16:20:12 -0400
Message-Id: <20260420202026.208110-1-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-720697/1776716434-8077A161-152131EC/0/0
X-purgate-type: clean
X-purgate-size: 3276

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds support for the altp2m_vcpu_initialise and
altp2m_vcpu_destroy functions on ARM. The x86-specific function calls,
altp2m_vcpu_disable_ve and altp2m_vcpu_update_p2m, are gated with #ifdef
CONFIG_X86.

This is commit 2/2 of the altp2m_vcpu_{initialise,destroy} phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.

    The equivalent to this patch in the v4/v5 was originally part of the
    patch named "arm/altp2m: Add HVMOP_altp2m_set_domain_state". In that
    patch, the check that the VCPU passed to altp2m_vcpu_initialise isn't
    the current CPU was removed. This was because ARM only implements the
    external altp2m mode, meaning the current VCPU could never be a VCPU of
    the guest for which altp2m is being initialized for. Therefore,
    skipping this check was a slight optimization. I've removed that here
    because altp2m_vcpu_initialise is only called during an HVMOP, and
    skipping this check on ARM (especially when x86 also implements the
    external altp2m mode) causes more confusion than the slight
    optimization is worth in my view.
---
 xen/common/altp2m.c      | 14 ++++++++++----
 xen/include/xen/altp2m.h |  2 --
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index e699b64678d8..7b80426c7798 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -11,6 +11,7 @@
 #include <xsm/xsm.h>
=20
 #if defined(CONFIG_X86) && defined(CONFIG_HVM)
+#include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
 #endif
=20
@@ -59,7 +60,6 @@ void altp2m_teardown(struct domain *d)
     XVFREE(d->altp2m_p2m);
 }
=20
-#ifdef CONFIG_X86
 void altp2m_vcpu_initialise(struct vcpu *v)
 {
     if ( !v->domain->nr_altp2m )
@@ -68,10 +68,12 @@ void altp2m_vcpu_initialise(struct vcpu *v)
     if ( v !=3D current )
         vcpu_pause(v);
=20
-    vcpu_altp2m(v).p2midx =3D 0;
+    altp2m_set_vcpu_idx(v, 0);
     atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
=20
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
=20
     if ( v !=3D current )
         vcpu_unpause(v);
@@ -90,15 +92,19 @@ void altp2m_vcpu_destroy(struct vcpu *v)
     if ( (p2m =3D altp2m_get_altp2m(v)) )
         atomic_dec(&p2m->active_vcpus);
=20
+#ifdef CONFIG_X86
     altp2m_vcpu_disable_ve(v);
+#endif
=20
-    vcpu_altp2m(v).p2midx =3D INVALID_ALTP2M;
+    altp2m_set_vcpu_idx(v, INVALID_ALTP2M);
+
+#ifdef CONFIG_X86
     altp2m_vcpu_update_p2m(v);
+#endif
=20
     if ( v !=3D current )
         vcpu_unpause(v);
 }
-#endif
=20
 /*
  * altp2m operations are envisioned as being used in several different
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 7defe6126563..37c875a52327 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -24,11 +24,9 @@ int altp2m_init(struct domain *d);
 /* Free altp2m views */
 void altp2m_teardown(struct domain *d);
=20
-#ifdef CONFIG_X86
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
-#endif
=20
 #ifdef CONFIG_ALTP2M
=20
--=20
2.34.1


