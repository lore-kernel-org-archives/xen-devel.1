Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9970F5A8BF
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286508.1567688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBh-0007DF-7B; Mon, 20 Apr 2026 20:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286508.1567688; Mon, 20 Apr 2026 20:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBf-0006y2-40; Mon, 20 Apr 2026 20:25:43 +0000
Received: by outflank-mailman (input) for mailman id 1286508;
 Mon, 20 Apr 2026 19:55:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEui0-0006Ti-LD
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:55:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEui0-00C0mN-1r
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:55:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68466-5cb7-0a2a0a5109dd-0a2a4501c7ca-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:55:04 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a6-c1f2-0a2a45010019-22cac1c5e34a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:03 +0200
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
DKIM-Signature: a=rsa-sha256; b=ka8fHWy78Y8Am3DZ+DOWFlUlI8NsfFGLMVGXLLSLHp2kp/XVRQX7fNlA+vH3ochrPLpSUxQZQMkngqzd2KIegerlEJVr1lhhPC2zCn61k32n5TlmqEJ19sEnjfbfaiSmJ7DXGwgBY5IDthd7HS/LJH/NV1/IwUDH0HDAv4cllxy/i3NXNq+6Xir2EXYAjjjNrKB1XR6lQ6ErVqgNbugrOrKfBaRXinGyJocEuMzu0mzsqZ2wkyDcH2K62tG41gscBoD5MEGOfIQCj7mRcX5BXWNvtkVkYW5vcx1ENTKBBnD0rKxNJfVOMPBtg1lFw20RfjrMDOMAUVWO5OmqLtabUw==; s=purelymail1; d=purelymail.com; v=1; bh=jide0Bu43AqjkQJCMlxee9HKevJGR4BOO3MM8yiGrIs=; h=Feedback-ID:Received:From:To:Subject:Date;
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
Subject: [RFC PATCH v6 21/43] arm/p2m: Change func prototype and impl of p2m_{alloc,free}_vmid
Date: Mon, 20 Apr 2026 15:50:20 -0400
Message-Id: <20260420195042.207624-22-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d62444/1776714663-B6460FF4-34C17615/0/0
X-purgate-type: clean
X-purgate-size: 4021

From: Sergej Proskurin <proskurin@sec.in.tum.de>

This commit changes the prototype and implementation of the functions
"p2m_alloc_vmid" and "p2m_free_vmid". The function "p2m_alloc_vmid" does
not expect the struct domain as argument anymore and returns an
allocated vmid. The function "p2m_free_vmid" takes only the vmid that is
to be freed as argument.

This is commit 10/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v3: Changed function prototypes and implementation of the functions
    "p2m_alloc_vmid" and "p2m_free_vmid".

    Changes in "p2m_alloc_vmid":
    This function does not expect any arguments. Also, in this commit,
    the function "p2m_alloc_vmid" returns either the successfully
    allocated vmid or the value INVALID_VMID. Thus, it is now the
    responsibility of the caller to set the returned vmid in the
    associated fields.

    Changes in "p2m_free_vmid":
    This function expects now only the vmid of type uint8_t.
---
 xen/arch/arm/include/asm/p2m.h |  4 ++--
 xen/arch/arm/mmu/p2m.c         |  8 ++++----
 xen/arch/arm/p2m.c             | 23 ++++++++---------------
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 5c6dfe4a9789..62261d41e780 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -195,8 +195,8 @@ static inline bool arch_acquire_resource_check(struct d=
omain *d)
 void p2m_restrict_ipa_bits(unsigned int ipa_bits);
=20
 void p2m_vmid_allocator_init(void);
-int p2m_alloc_vmid(struct domain *d);
-void p2m_free_vmid(struct domain *d);
+uint8_t p2m_alloc_vmid(void);
+void p2m_free_vmid(uint8_t vmid);
=20
 /* Second stage paging setup, to be called on all CPUs */
 void setup_virt_paging(void);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index f546f63f2489..0d37760ef5d5 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -1519,7 +1519,7 @@ void p2m_free_one(struct p2m_domain *p2m)
=20
     p2m->root =3D NULL;
=20
-    p2m_free_vmid(p2m->domain);
+    p2m_free_vmid(p2m->vmid);
=20
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
=20
@@ -1570,9 +1570,9 @@ static int p2m_initialise(struct domain *d, struct p2=
m_domain *p2m)
      */
     p2m->domain =3D d;
=20
-    rc =3D p2m_alloc_vmid(d);
-    if ( rc )
-        return rc;
+    p2m->vmid =3D p2m_alloc_vmid();
+    if ( p2m->vmid =3D=3D INVALID_VMID )
+        return -EBUSY;
=20
     rc =3D p2m_alloc_table(p2m);
     if ( rc )
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 2c43b6033360..3342fafcc8a7 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -282,11 +282,9 @@ void p2m_vmid_allocator_init(void)
     set_bit(INVALID_VMID, vmid_mask);
 }
=20
-int p2m_alloc_vmid(struct domain *d)
+uint8_t p2m_alloc_vmid(void)
 {
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
-
-    int rc, vmid;
+    uint8_t vmid;
=20
     spin_lock(&vmid_alloc_lock);
=20
@@ -296,28 +294,23 @@ int p2m_alloc_vmid(struct domain *d)
=20
     if ( vmid =3D=3D MAX_VMID )
     {
-        rc =3D -EBUSY;
-        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain=
_id);
+        vmid =3D INVALID_VMID;
+        printk(XENLOG_ERR "p2m.c: VMID pool exhausted\n");
         goto out;
     }
=20
     set_bit(vmid, vmid_mask);
=20
-    p2m->vmid =3D vmid;
-
-    rc =3D 0;
-
 out:
     spin_unlock(&vmid_alloc_lock);
-    return rc;
+    return vmid;
 }
=20
-void p2m_free_vmid(struct domain *d)
+void p2m_free_vmid(uint8_t vmid)
 {
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
     spin_lock(&vmid_alloc_lock);
-    if ( p2m->vmid !=3D INVALID_VMID )
-        clear_bit(p2m->vmid, vmid_mask);
+    if ( vmid !=3D INVALID_VMID )
+        clear_bit(vmid, vmid_mask);
=20
     spin_unlock(&vmid_alloc_lock);
 }
--=20
2.34.1


