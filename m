Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5787BC433DF
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 18:31:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED49322B4E
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 18:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4fDFMYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED49322B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2fEn-0001ZB-Rj; Mon, 03 Aug 2020 18:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6a-0008F4-7x
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:36 +0000
X-Inumbo-ID: 36cf2a99-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36cf2a99-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:57 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z14so3126925ljm.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Dr2Tb8xNL8Zd44BZpRkZWI6gE4U1QZUhIvG9zNQ9PsI=;
 b=S4fDFMYUo5BvRyBoYeUyXtrUL2wsl88uUzfLHup9REJqHQU6+5cxkMSy8GXKdCon0i
 L80wX4sKQDnu4EmrpVeh0MsK2uTWek4a7p4nU35hXmuZlH/WCSx/YXxzHrV9q/4nvqgj
 fIVLNzLCM4+8QqBoqUL3/z642rYSqAvQYcytvE7A/Q3JHR6UXO8b2vU+M6r+mGXatGUz
 /R0KKRA0+n4kSD8aXKKDDI01t+9iVRLWS0822Z3GfxMhtJx35KgVhiib7Xgwz5Vb08jN
 GyTGLWdC3/dRurzDFE0ONX/nvLoD3qxP/idC6x8jsZSAgFQfWeNDhoP6sTOUvrWKpZS+
 EHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Dr2Tb8xNL8Zd44BZpRkZWI6gE4U1QZUhIvG9zNQ9PsI=;
 b=k4HesusM6yhlO1QLpNYMu3g58ZiRk3uqkxGTzyNFKaZfPQVlavWAoJbD2RwM+TAZqz
 8oOltKzCDvGvaMBx/jQ3meijXDjlrvv0arlS0N0jj3kevRF8c6xafvlq3jp/UTE+5+az
 Za7MTw+Lv4qacvOCG8mTnHaFhkx70zr1XCU3q020PT/5W1cbDDyAlq/KrwDNOdjrWJr8
 PLFkfbRLkr75MyOvmB44MDb1ibLcki2J5/Pu1QJEU99gJTE9YuMVoizUvuYXqyzBYLFy
 iaSEL0R9sr3byjr7SSPO4OrIfUUZsMrlDngnfsuRxLCgxFUbnvCaWHiujcqoy2MU60QT
 5j6Q==
X-Gm-Message-State: AOAM531LHxm7nANe41MOhaYm7HQAtGKMMQzAsKG84rF+Q7Wq3ToznXb9
 8FCZG8DK4ZFNwtrSKCB5XdEuF+Qh2kc=
X-Google-Smtp-Source: ABdhPJx0T4FW5vY5u1CcVrgLb849G9GBkehpIIWB2wGYtYkUD+nzSAKb+0ckDVMOZMkooigwBd884Q==
X-Received: by 2002:a05:651c:201b:: with SMTP id
 s27mr8503674ljo.468.1596478916403; 
 Mon, 03 Aug 2020 11:21:56 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:55 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into
 virtio-mmio device node
Date: Mon,  3 Aug 2020 21:21:27 +0300
Message-Id: <1596478888-23030-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Without "dma-coherent" property present in virtio-mmio device node,
guest assumes it is non-coherent and making non-cacheable accesses
to the vring when the DMA API is used for vring operations.
But virtio-mmio device which runs at the host size is making cacheable
accesses to vring. This all may result in a loss of coherency between
the guest and host.

With this patch we can avoid modifying guest at all, otherwise we
need to force VirtIO framework to not use DMA API for vring operations.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxl/libxl_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 469a8b0..a68fb14 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -726,6 +726,9 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property_interrupts(gc, fdt, &intr, 1);
     if (res) return res;
 
+    res = fdt_property(fdt, "dma-coherent", NULL, 0);
+    if (res) return res;
+
     res = fdt_end_node(fdt);
     if (res) return res;
 
-- 
2.7.4


