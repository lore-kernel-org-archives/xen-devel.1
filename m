Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6407C4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 00:13:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366082.1616011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlbcg-0000t7-NJ; Mon, 20 Jul 2026 00:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366082.1616011; Mon, 20 Jul 2026 00:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlbcg-0000sz-KT; Mon, 20 Jul 2026 00:12:42 +0000
Received: by outflank-mailman (input) for mailman id 1366082;
 Mon, 20 Jul 2026 00:12:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wlbce-0000st-Ge
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 00:12:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlbcc-00E5qI-W2
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 02:12:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d67ab-2eae-0a2a0a5409dd-0a2a450b8f74-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:12:38 +0200
Received: from [103.168.172.149] (helo=fout-a6-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a5d67f5-b7e8-0a2a450b0019-67a8ac95e293-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:12:38 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 0F1FEEC0073;
 Sun, 19 Jul 2026 20:12:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sun, 19 Jul 2026 20:12:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jul 2026 20:12:35 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1784506357; x=1784592757; bh=dzwiZvwfBNEyaxYoXCE94XEdZopGtEVY
	z3iMynT4Ijo=; b=CNYaMB2MwgmkHwSGQvD7YmJDA1mR9lTCgxIaMweWcXpvXiGU
	iZYglHP+Z12wEgfuRQ9pjKx/AFXiPr0KqkHjh+l7aUQMEX8DQMixk4Q6PyRHK63U
	YIAB3oJdpdjolIs8pgDFRzybynyT/KOdKtTUKFRr3R1dKcFulmkHKd/zaI//Kw4J
	Jh+Dm9V2nE8B1mXtM6RWN5k4EJimIQhsEaLITNW587NpcpjFpswTImj89oppQMa5
	Vvv89DxDHschpWvGA06RIJrG6S/h9C1I10Lcbxu4PXPPPe6z48nhSV8oaPB0D7Ww
	94AFExam07dIlizmnJSncXOp/BIpJypXKIrmhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1784506357; x=1784592757; bh=dzwiZvwfBNEyaxYoXCE94XEdZopG
	tEVYz3iMynT4Ijo=; b=m9fgHrie98cNWN/BWIoT5qS04W6KkJkEG8N8d5Qp5wUC
	kv0BfJ93QZDLlauoojRVga/zolMWRGxun4oi6csKe6JYRc1B5eOJmybnbM6qr5eZ
	TONTmCBr5+NdWhZnwbSbIKTP/Cry/Q5GyndaodnW4qmyAYvQeH5wJyZvwCBk+BP/
	I1X2PKZ4rS+r8YG2k5SbkoknPvWrD/Iqm4fWc+aiUlljdw6NyNzc1vbV4nvSO4vw
	Ouk8nr/myh4AG5KbTlciGIABuuCRPSwt0GDfl3mR8AZ9gnrXSMzJgH6oHW4pBSTi
	jlOvigS9mpzT4R6bE4s31GgcZQOudDofSWSi2HLwGg==
X-ME-Sender: <xms:9GddamA5SqeYaesZBXORE9eLjM2zFG66yw_VeoaNx5DT1HI6htigYg>
    <xme:9GddakPvFwYh24sARc_0vINhq1dFP5rHCrK2WCVBbvbNOu-AtsA6Jt2uBmB7GlmNJ
    7Hr1DiA5_ZtRX_05GLn9Rimjqog7ReNIl_kzHJMxsLI8CESuA>
X-ME-Received: <xmr:9GddajZsrg1JfHLl-1DJ67OEa7cFD4USUgFaJW-_zjWku4mdGa_dJggsYblhXkgFqx5yVbuHaLuSNvnklip2qJldW9a2bN8pFiqxYmRNdXg>
X-ME-Proxy-Cause: dmFkZTFtuSUmutw5AO4TgaRlea4KuQJ3KVZWAf5qprd1JNS/qSFj0TirKfEsQKDKpm4dys
    GGwZeTypmfM4/SN592GGSNZC47zMVWS8vX3d+5FYwERfFbazUvY2CIypuK9FoIptzvt6ss
    QCVe7OEnx3eTKoTqFPfKV4wBPmA6yxVfpFr8Ss3bVGTpAhdvfh6CqybIVRT8fF49FLt7Oc
    rYc8G0ej+oY8CFeGoKwxbGiJZJioz5Zx5xlHEn8dYaL2f+gRft2kaRZ8WRhribTQa0Zg/L
    sLrUw466UJdtjPA/hdQC/HcLbgbEkJX9TWutsF/P8O8xoG/t/uupksPGYDu7DILhTsYOPv
    axVC0wsPYczDgJjFaDg6ZGNw5Lv0XTraXbhGk6aSxRe/PhG3Ac+txxbGTDqi+frHkKjaOb
    6b379DZfWaWnOqrMOHdLkp+HLpX1I3bikQEH8ahA/ByVIF377GlgC8hIhR2Hd6t0+WUwSn
    GXF6vz94diM1zLmE02FclHJahX3RIdnaQEMbieocT2WdG2DDnvzW/Rx1Vl5s/mACkK3+dI
    NHCQBREzGwSeG30QQRdQRl4FwoE8QwC+YJJrrh2rwh3Jzlm5aYs0sfSZdSF/hneiXC/Scl
    iXPecuCceY6Zgm1yq8iolHfrDAUObKTsxRQFt5CjqSSdc4ojQM/0v0wGaNag
X-ME-Proxy: <xmx:9GddarsGMgKaQRpCGVR3QhMfa7ORTvU-qGJN6Xl8tLpTgiQb_aLZ6g>
    <xmx:9GddatOuMqZUK3kREIOzsbI5eGGN6JYYPpAq9CnJkXbfLQhMi5rzMw>
    <xmx:9Gddaq4gWgBac45IwMuGF4gaPJUNVPxjOhhEb7hAaXrWiDf3kx-kMw>
    <xmx:9GddarS0LDLcRzslbrixM9dtuAYmNO193usIz3O-YfKrxqp-eugbcA>
    <xmx:9WddamcFSCSS3RYC9vaIx0S71O8NeK56QjuxjD_ZBVCUnWiCmJWudVZW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/domctl: restore all registers in arch_{get,set}_info_guest()
Date: Mon, 20 Jul 2026 02:12:18 +0200
Message-ID: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784506358-186CA9EA-BB2D4E1C/0/0
X-purgate-type: clean
X-purgate-size: 2805

Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
converted memcpy() of the cpu_user_regs structure to explicit copy of
its fields. In the compat case, it intentionally missed few of them,
named in the commit message. But the 64bit case missed also r8-r15
registers, which was not intentional. This, at least, caused Linux
6.18.x crash when resuming PVH domU.

Fix it by adding missing assignments.

Fixes: 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/domain.c | 8 ++++++++
 xen/arch/x86/domctl.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 1d458f1372e5..ba7244ccc513 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1255,6 +1255,14 @@ int arch_set_info_guest(
 
     if ( !compat )
     {
+        v->arch.user_regs.r15               = c.nat->user_regs.r15;
+        v->arch.user_regs.r14               = c.nat->user_regs.r14;
+        v->arch.user_regs.r13               = c.nat->user_regs.r13;
+        v->arch.user_regs.r12               = c.nat->user_regs.r12;
+        v->arch.user_regs.r11               = c.nat->user_regs.r11;
+        v->arch.user_regs.r10               = c.nat->user_regs.r10;
+        v->arch.user_regs.r9                = c.nat->user_regs.r9;
+        v->arch.user_regs.r8                = c.nat->user_regs.r8;
         v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
         v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
         v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 07f712a0a40d..3ea4c650eee0 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1481,6 +1481,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     if ( !compat )
     {
         /* Backing memory is pre-zeroed. */
+        c.nat->user_regs.r15               = v->arch.user_regs.r15;
+        c.nat->user_regs.r14               = v->arch.user_regs.r14;
+        c.nat->user_regs.r13               = v->arch.user_regs.r13;
+        c.nat->user_regs.r12               = v->arch.user_regs.r12;
+        c.nat->user_regs.r11               = v->arch.user_regs.r11;
+        c.nat->user_regs.r10               = v->arch.user_regs.r10;
+        c.nat->user_regs.r9                = v->arch.user_regs.r9;
+        c.nat->user_regs.r8                = v->arch.user_regs.r8;
         c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
         c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
         c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
-- 
2.54.0


