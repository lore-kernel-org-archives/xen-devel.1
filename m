Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E72C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394302.1633163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvW-00068E-UU; Tue, 18 Aug 2026 15:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394302.1633163; Tue, 18 Aug 2026 15:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvW-000684-PZ; Tue, 18 Aug 2026 15:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1394302;
 Tue, 18 Aug 2026 15:40:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwLvV-00063D-1C
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:40:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLvU-00DoR5-DT
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:40:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847ce0-2eae-0a2a0a5409dd-0a2a4507d21e-32
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:32 +0200
Received: from [209.85.216.43] (helo=mail-pj1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cee-b4ea-0a2a45070019-d155d82be94f-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:32 +0200
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso63725a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:40:31 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d2de41dsm6247737a91.5.2026.08.18.08.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 08:40:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787067630; x=1787672430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GnPo4KAZWnrGy/rpIMN59vgyD7cezvUOyXwJsPUekw=;
        b=TXRObutIKkDq+zX4W/Ur8hm45LMqy5RLh7/gpWiwRdiGelEuYMETc9Ku4dttf3WUqj
         +1U86ezQcjFtr6RDUA4eUTK/mpe62ZkewXSc0jb8NLy26pSeIzVf6N7vqFhZcE2UoNqf
         dsmREfpe/P4Q3ap2DptagKSBAZhvKmZ/HSVWViGlZ7ZtuwPJplq1b0cNMjZhnzAa3reA
         sejHJHbyVe7mbgqPuzzaBnkkPha3BcD7bQ+yaK0E0CmWGdngBdwm6HxCJMASUTyKNIU4
         GnoTXge/nVK/UMeuHCcXCHvkRz+1di0V0Lgm9m3gh9JxY+C1GYcJf9jjfj/up2VyIPvi
         aViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067630; x=1787672430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GnPo4KAZWnrGy/rpIMN59vgyD7cezvUOyXwJsPUekw=;
        b=FTj8yy7ORDVXw/xwYgdscP6TVCT4vEDiDy57mk4lmVnQ0GA26Wwi+2vynqt7z/1grI
         c3eYz7ZwQbxNtG9Z4K7MvwSnqA7kMF234RlWWGB/jj1aZ3ipi6BKcbbwwBYfqIHblAEc
         gKOJKj+sdhWFS3O4ihfoY2un/jD3i3nzgExJ+kb2bCyvBVNQ630wla88Uf/Nm3zaRRaz
         BpQ6dKERhk9hI+PFTgpmb4vxCAzeVNNl+CDl7ubv0jcm8ujHh4+SUc4Lh6bSGnuR9FG8
         oAXsCVzXp1EdS/hXSOO9DdlvP7v217be+5W8emVSy28qXuw+/tH+i5lNrlx/jseJISCj
         ySMA==
X-Gm-Message-State: AOJu0YxKHFSYSt3hnuAybrW4ioCmrACCSWneG7X6e6O5yvCzr/JWY3Ul
	axIXGucwTHYJAbWFYWlcPjbENSbzF6VuFeVMs8MAfadI7y5fpjqPhj/1wbW+BcaW
X-Gm-Gg: AR+sD11/c9cZuBqiKtmaUCUQzxgLfJbO3us7D3D1RKfzJg392KHJv6PmG+1m5VziYmF
	hOqD2UTCZfXCpZfUroYrgJSX0q8SzbjA9lNA6CFk7pFAEI9IL/gtPjncDjQ3DWCQEmkAjWRcYJn
	P0zymbWkz8Ct0wuZD/2VeQn3lkxP75APNbzYLp30obzuMzWK4ckjVV0JEtMo6TNiPtEkYOlvgXQ
	W+yiGsINFIeuAScffbAhfkgcnFTtu+qbPbNfJK5e5MQh9/R8Oe1SQ8CchazTw58kNGle67YQGKK
	NWbcowFBIr7OHPZHSbxl4GjBQ9HiAtu3TU0mOgyPO1jJHdx9tJDdcpw7+WJWBd270aU4KXK/Q4K
	DtaoYrVJTgTfy+kk5HEiGMYzckdYD38Cg+kJa5DukMZ97wzy7wik48iOaKcaassLfbs2Txy1P/3
	EL+phHaLzXnPmPior23B65a9sk61unDiPhs3tzHhLte42IE51rswPUhMFcNCh4VkaMe8NWZEkhE
	XsbtkzBZEbfhpL+0hJ3OwqrMcDV4x+b
X-Received: by 2002:a17:90a:ec83:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-3933b8c1041mr39437789a91.16.1787067629975;
        Tue, 18 Aug 2026 08:40:29 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add myself as reviewer of i.MX8M related patches
Date: Tue, 18 Aug 2026 23:39:46 +0800
Message-ID: <20260818153946.1635464-5-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818153946.1635464-1-onlywig@gmail.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787067632-34CCFAE4-583081B3/0/0
X-purgate-type: clean
X-purgate-size: 867

I wrote the i.MX8M platform and UART support and can help review
patches touching these areas.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- No changes; picked up Michal's Reviewed-by.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4dd97ffcad..c60afc93a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -365,6 +365,13 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
+IMX8M SUPPORT
+R:	Wig Cheng <onlywig@gmail.com>
+F:	xen/arch/arm/arm64/debug-imx-uart.inc
+F:	xen/arch/arm/include/asm/imx-uart.h
+F:	xen/arch/arm/platforms/imx8m.c
+F:	xen/drivers/char/imx-uart.c
+
 IMX8QM/QXP SUPPORT
 R:	John Ernberg <john.ernberg@actia.se>
 F:	xen/arch/arm/platforms/imx8qm.c
-- 
2.43.0


