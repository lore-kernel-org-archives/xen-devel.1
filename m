Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FFFF5A8C7
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286498.1567648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBS-0004vD-JK; Mon, 20 Apr 2026 20:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286498.1567648; Mon, 20 Apr 2026 20:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBQ-0004rZ-Uh; Mon, 20 Apr 2026 20:25:28 +0000
Received: by outflank-mailman (input) for mailman id 1286498;
 Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEuhC-0006RK-5O
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:54:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEuhB-008XBJ-IS
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6842b-bab6-0a2a0a5309dd-0a2a4501dfd2-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:54:13 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683b0-c1f2-0a2a45010019-22cac1c5ed76-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:51:13 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:58 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=ckCzk1RLU5H7o8z98jVbNDtfQVfZx3Dgw741GYACJI5hgysSvN+Ozn9xSf0uu4iuwrQwTm3N6RmSleU2HQTtR0TDOAK2uI2ywKgBYLOA9nMN0bn8GSpOaKFgs5cDw8y/PGLJvnaMLR+pNzODuL8ep5d6RJu2L5wj4YppD1uk1gNKUQKbHobOUaebMEwE07nLyR5RAO0KM1dWc9LoO41CpL2+q5LSzoeeLurU6d44lXjJ8AcocwNoasw3nL0Lue0VE9e8xOPvvO2Dw8sCsB4DZJfzgsOIQJfa455onP1lGj0Cpp1Qau9P/AsKRQK946Kx2Gr1A1bsZVEE/q24lS696A==; s=purelymail1; d=purelymail.com; v=1; bh=sJtt5sv+KSdQzbFQSigMs7fjAJ9VYApzYG1/06R78L4=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: [RFC PATCH v6 25/43] arm/altp2m: Add altp2m index to arch_vcpu
Date: Mon, 20 Apr 2026 15:50:24 -0400
Message-Id: <20260420195042.207624-26-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d62444/1776714673-BEA61FF4-CC81A8CE/0/0
X-purgate-type: clean
X-purgate-size: 1940

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit adds ap2m_idx to the VCPU struct on ARM. This makes it possible
to track the current altp2m view being used by a VCPU.

This is commit 2/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Sergej Proskurin <proskurin@sec.in.tum.de>
---
v6: This patch was originally part of the "arm/p2m: Add
    HVMOP_altp2m_set_domain_state" patch from the v4/v5 patch series.
    It has been extracted into its own commit to make the patch series
    easier to follow. If it would be preferred, this commit can be squashed
    into another commit.

    Added support for the CONFIG_ALTP2M option.
---
 xen/arch/arm/include/asm/altp2m.h | 4 +---
 xen/arch/arm/include/asm/domain.h | 5 +++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index 5a217f48b103..bc695018e62c 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -26,9 +26,7 @@ static inline bool altp2m_supported(void)
 /* Alternate p2m VCPU */
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
-    /* Not implemented yet */
-    BUG();
-    return 0;
+    return v->arch.ap2m_idx;
 }
=20
 #else /* CONFIG_ALTP2M */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 9e69d62086cd..4d497a21b648 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -249,6 +249,11 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
=20
+#if CONFIG_ALTP2M
+    /* Alternate p2m index */
+    uint16_t ap2m_idx;
+#endif
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
--=20
2.34.1


