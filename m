Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68C1F5A8BB
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286483.1567608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBN-0003fY-9p; Mon, 20 Apr 2026 20:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286483.1567608; Mon, 20 Apr 2026 20:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBM-0003bJ-QU; Mon, 20 Apr 2026 20:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1286483;
 Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue2-0006Iv-8S
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-009YnP-LX
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68374-bab6-0a2a0a5309dd-0a2a450ab436-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-56b3-0a2a450a0019-22cac1c5d228-3
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
DKIM-Signature: a=rsa-sha256; b=L+19iyv+EUeaGWGFsg/BWJiBVxeE/no+P5K1P6qeD1YfVN0hoZLm9oaLIw6VWXRXAUpq/+f4X1tX/9pPrs/LCvAUWLJuWJpuofTpMMIi2KWtHiEIbwiYy618cbKCfOeMiNBqbOqmV433K3tYmJWbz4SrMySSCYWLfIuOMMgZxx752i4ZdVSJYfbUg47mkpzSXf9MyXxp13UwHeBMgqX4SuuBoLcWvi/Lkf0R8q9R2YzRvM+T6wLpmvCv3IjHXGidnHQgYJx83PsQxhjadG0baQ0Hw0UonKx/H7Fxo+Z4ABSs4r9bY+xpYAgOWWoRGPflw+8rsvXOnBqHM9R30lo8IA==; s=purelymail1; d=purelymail.com; v=1; bh=UaefyhWKaHg0ZXhca3L3b/zEeIpQmNz0OQTE/cAPZp8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [RFC PATCH v6 12/43] x86/p2m: Move p2m_{init,free}_one declarations to arch header
Date: Mon, 20 Apr 2026 15:50:11 -0400
Message-Id: <20260420195042.207624-13-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-4011c0/1776714657-CF3738B7-D404BC4A/0/0
X-purgate-type: clean
X-purgate-size: 1681

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit moves the p2m_init_one and p2m_free_one declarations from the
x86-only p2m.h header file to the asm/p2m.h header. This makes it possible
to use these functions in the common altp2m init/teardown routines.

This is commit 1/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/p2m.h | 3 +++
 xen/arch/x86/mm/p2m.h          | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.=
h
index 5110b3e77807..ce8eeb751ee9 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -592,6 +592,9 @@ int p2m_alloc_table(struct p2m_domain *p2m);
 void p2m_teardown(struct p2m_domain *p2m, bool remove_root, bool *preempte=
d);
 void p2m_final_teardown(struct domain *d);
=20
+struct p2m_domain *p2m_init_one(struct domain *d);
+void p2m_free_one(struct p2m_domain *p2m);
+
 /* Add/remove a page to/from a domain's p2m table. */
 int p2m_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                  unsigned int page_order, p2m_type_t t);
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 64218878067e..be8ed85c2aba 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -6,9 +6,6 @@
 #ifndef __ARCH_MM_P2M_H__
 #define __ARCH_MM_P2M_H__
=20
-struct p2m_domain *p2m_init_one(struct domain *d);
-void p2m_free_one(struct p2m_domain *p2m);
-
 void p2m_pod_init(struct p2m_domain *p2m);
=20
 #ifdef CONFIG_HVM
--=20
2.34.1


