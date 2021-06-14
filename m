Return-Path: <SRS0=X5bA=LI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411AAC2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 19:18:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD4361076
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD4361076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141772.261766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lss6O-0000k7-LD; Mon, 14 Jun 2021 19:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141772.261766; Mon, 14 Jun 2021 19:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lss6O-0000k0-H2; Mon, 14 Jun 2021 19:18:28 +0000
Received: by outflank-mailman (input) for mailman id 141772;
 Mon, 14 Jun 2021 19:18:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l3uV=LI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lss6N-0000jt-3N
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 19:18:27 +0000
Received: from mail-ej1-x632.google.com (unknown [2a00:1450:4864:20::632])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c2e3039-eb96-4587-ac0f-143d8df5fee9;
 Mon, 14 Jun 2021 19:18:26 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id c10so18385782eja.11
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jun 2021 12:18:26 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id kf3sm6982622ejc.8.2021.06.14.12.18.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:18:24 -0700 (PDT)
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
X-Inumbo-ID: 8c2e3039-eb96-4587-ac0f-143d8df5fee9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yTgT3JGer71oJVOBpozTYEvIZBlnONWD7ReHwJ7SrLA=;
        b=jR9pdArvs+K1bVY2VXoSCCtB3m3ob2wjBua6dR6uHh6Y/+Kl1p40tPv3BTbS9Y5EAz
         eoLcXNgW919CeSu9XFVC0dmgfLfqUOrzwBAZdqpnhvbcYSe5E4YfniRKHqw10M/8Wtv8
         PYmuA2QDBZkcl3FnyTvUhHfzJ7b8dOSSZTPGeELmbBc3A9B6qmQpsxoiLi/WoRVyijbI
         FHvP6ZLOsN3P45DlFWhd2LqeFC502PyWdleM4kSwuU4yoZSf+1amnv3VyWeoMHEsbAti
         xdK0zxNu37nP05zsFlYOnk+dKYs4TZHn/s+djXYK+lYibgYRcg1eOAm+k3iiKS4FcmNk
         UG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yTgT3JGer71oJVOBpozTYEvIZBlnONWD7ReHwJ7SrLA=;
        b=IE/uQLiP59sVgsQqujzzogXQjLp90ymY3tdNYpkvjt1EDJgIP1ltKsErJaJR2ykCjO
         CIHqOd0/fuutyMWNrvNfn7yrch5f15clr67qa38MS2kqUv09+eNxYCJiLag46xrx7LRa
         lP7lrCodujQZBX2Fp29ccyVaeSFK6hfLrtU2YFDTCzY7CAPdD1BTYav+bxrKsMMwVAGP
         5KGFYTXKauLVYZKre1B2MwsAtExFW/DSuQtNAXnn2PBxFLETI/PiRs0E9VSjMoQH8uuu
         nUDOQj3APkrFqQktUi4xn9tuVd7bLQtQ+HZiy+aP03OL2bBIfR3pCss1nhnPJrZ8MFd8
         Mzkw==
X-Gm-Message-State: AOAM530CIBgfQ9xibmegBKCRFNaG93ECpnxKPXyOcCDa9MUJHRZiOgEw
	vtRc/qlOgT4tWvV44gDF65sZirVq3mtLEQ==
X-Google-Smtp-Source: ABdhPJy8xF1ewy9/xlZGn5kyOabzu953ogISXaSgA7ldllXJWryjp2QYvE0abO+7+YaW2U6Pu2axGg==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr16916448ejx.72.1623698305179;
        Mon, 14 Jun 2021 12:18:25 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] iommu/arm: ipmmu-vmsa: Add compatible for Renesas R-Car M3-W+ SoC
Date: Mon, 14 Jun 2021 22:18:12 +0300
Message-Id: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The "renesas,r8a77961" string identifies M3-W+ (aka M3-W ES3.0)
instead of "renesas,r8a7796" since Linux commit:
"9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car M3-W+".
Add new compatible to the Xen driver.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 8b8e3a0..1255b0d 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1316,6 +1316,7 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
     DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7795"),
     DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77965"),
     DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7796"),
+    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77961"),
     { /* sentinel */ },
 };
 
-- 
2.7.4


