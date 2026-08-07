Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CD9C2A09B
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 05:22:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385725.1628151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsD2O-0002sa-UF; Fri, 07 Aug 2026 05:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385725.1628151; Fri, 07 Aug 2026 05:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsD2O-0002sS-Qg; Fri, 07 Aug 2026 05:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1385725;
 Fri, 07 Aug 2026 03:23:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dbgh9129@gmail.com>) id 1wsBBH-0001eF-Fl
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 03:23:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsBBG-00GxkT-5W
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 05:23:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dbgh9129@gmail.com>)
 id 6a754faf-e002-0a2a0a5209dd-0a2a450a958c-2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 05:23:34 +0200
Received: from [209.85.160.171] (helo=mail-qt1-f171.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dbgh9129@gmail.com>)
 id 6a754fb5-f2d2-0a2a450a0019-d155a0abe157-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 05:23:33 +0200
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-52b4e988c77so19005511cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 20:23:33 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d1663e9e1sm3438561cf.30.2026.08.06.20.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 20:23:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786073012; x=1786677812; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5tWYfkrSYEAFJzgjYou2Lj+31bzExLORMbEtdMFcLw=;
        b=K2tIR2uxsfa+PGMPzJQddWSF//kpOlHCmsCoaNIOjt/UrHoGlPzx/g8LsaRyV9nZiI
         HtUhp7xaUPKjLMWbNgkduFKWS4LDL9kiFQ5Dh12zCnH2pG6HNcuSYDKhsu7eWBciyh7e
         jk+ZRHXQgRgTT5U5iuuxj9Xs6BszIJSSbJwbBUm4AgJJM9Kp1iKUoUGMGMYVImjwBnPg
         ExoDppTRna+zCeTdQ0zGuHFlPzlRIARCrSzIoJyCZqMjRUYuJ8aQQZZINMQ0uKBEHGKR
         XgwUmviMsfNWNBvFDilE0w9FiEpEqJQlRlMqmMsQt41MosAd9nLU/mb/EKE5ByHqSICF
         FFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786073012; x=1786677812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5tWYfkrSYEAFJzgjYou2Lj+31bzExLORMbEtdMFcLw=;
        b=gD2IQQlTfn6UZbIh8j9W7SzmyLtn44TqzWv71evRS4kVDb5G3yyCHBev8z9Ute6Ngr
         Yvw74QPbkk73z4ZYyK0xEwJK10hU2q9YiVHiwdomTCZwED684ArGXKUoNO6EyW4xjktU
         QPOn3gp0hyLIM3+Csc4/4U/6bYp+lLhuRATJHqYppqZpYOJFgYiCh8DRHEGB8R8QyI2e
         mNACg7Yge2/+Mi6Ock6YqE2j9+oiZakQZa4uu7Qnvo9rlOPfgIzPru/8xOyHIn36hLDJ
         ao8Q2dtuHHHRSVICkUf1cSclhReAtq7hqtUZkN9ffUNdSGPnxv44gq3lJQ4qNKtRmc7+
         AZKA==
X-Forwarded-Encrypted: i=1; AHgh+RpcElaMLWmbEakA4zuqHOUDmj85H7drWTznBrHfP8liIBujiEBo3wEk3RVw02bZgBo/+Fe1yEbGQBc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyzAw0k9Jw2i4u5WmQBEGnRxmXi16yQ4eFLcrFsNjIsKisgx3o
	kEB3MdUy7evKl2/jspocY9QWJ4muRRLkLpMxZk99c2BP4cZcgAuESzH2
X-Gm-Gg: AR+sD13iYVBdptK2G5BYPyijNXD2ybPPdixxc5uMPPYCmd31E66ZoBCpm0MeHNf645d
	KSvEIKsJAPWuY3QgLaOjLGvMK3YMuP4PJrBNnzt0kqlNIDzRkDKFNttzbGvGTXQW2ZSagumzTmY
	XaSuywRXrLfviI8B9RMynOoy8caU7YrYIm8Jo3DMueuLEZySgFhwoHxvGvHq76Nx9+/1EJ+pVYs
	heRpXWiobNYIrx1j/MQnq6+7X7ZO7VpYu/2e1r1Q7qh/unfGHaa43mTck72WIMnWnz07wXo4c6Q
	Bnpyv608zJbSTuT6gKjl4gnjpUv/pavwsEaAfD5Mxz/RzMKjv+vzMBT+fwgxDCArZIO7dEZEFx5
	LUjL8Fqtuoo0pU06fy/pj0HBXJYFmkFb4ue4tGiS/SSMyPzcOEQ1JcXjE2WXqgWM+h8Xd61m2Cy
	ZWKTZNemXSRVdt9N+pB2VjpEVXd0RP5ai2WKvY8L01KWmGYUeWa7QkYn2yaIcdGPDsiX3A0PyK7
	LfOJiq+5w8WoXsJiP8U8c06FoO3e9flcQuo95oXb4476qhfxf1atg5B7S2HinI=
X-Received: by 2002:a05:622a:8cb:b0:51c:d1c:10e3 with SMTP id d75a77b69052e-52ce619a1c0mr217368161cf.35.1786073012343;
        Thu, 06 Aug 2026 20:23:32 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	thorsten.blum@linux.dev,
	jason.andryuk@amd.com,
	alhouseenyousef@gmail.com,
	kees@kernel.org,
	darwi@linutronix.de,
	jpoimboe@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	alhouseenyoursef@gmail.com,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] xenbus: Unregister reboot notifier on init failure
Date: Thu,  6 Aug 2026 23:23:26 -0400
Message-ID: <20260807032326.940377-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1786073013-502F0CFC-77C0471A/0/0
X-purgate-type: clean
X-purgate-size: 1551

xs_init() registers xs_reboot_nb before initializing XenStore
communications and starting xenwatch. If either operation fails, the
notifier remains registered and a later initialization attempt can hit a
duplicate registration.

Check the notifier registration result and unregister it on every
subsequent failure path.

Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple concurrent xenstore accesses")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/xen/xenbus/xenbus_xs.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index d1cca4acb6f3..62274d377b3a 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -915,19 +915,27 @@ int xs_init(void)
 	int err;
 	struct task_struct *task;
 
-	register_reboot_notifier(&xs_reboot_nb);
+	err = register_reboot_notifier(&xs_reboot_nb);
+	if (err)
+		return err;
 
 	/* Initialize the shared memory rings to talk to xenstored */
 	err = xb_init_comms();
 	if (err)
-		return err;
+		goto err_unregister_reboot_notifier;
 
 	task = kthread_run(xenwatch_thread, NULL, "xenwatch");
-	if (IS_ERR(task))
-		return PTR_ERR(task);
+	if (IS_ERR(task)) {
+		err = PTR_ERR(task);
+		goto err_unregister_reboot_notifier;
+	}
 
 	/* shutdown watches for kexec boot */
 	xs_reset_watches();
 
 	return 0;
+
+err_unregister_reboot_notifier:
+	unregister_reboot_notifier(&xs_reboot_nb);
+	return err;
 }
-- 
2.43.0


