Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6456C433EF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 12:55:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B49C6103D
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 12:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B49C6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194100.345755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFW-000509-0P; Thu, 23 Sep 2021 12:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194100.345755; Thu, 23 Sep 2021 12:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOFV-000500-S2; Thu, 23 Sep 2021 12:54:49 +0000
Received: by outflank-mailman (input) for mailman id 194100;
 Thu, 23 Sep 2021 12:54:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOFU-0004it-2X
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:54:48 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a43ebe10-5e3d-4e6b-8c3b-afdab9aaf67b;
 Thu, 23 Sep 2021 12:54:43 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b20so26419291lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:43 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:41 -0700 (PDT)
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
X-Inumbo-ID: a43ebe10-5e3d-4e6b-8c3b-afdab9aaf67b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EgRiuJEADNLL58SEJDtb5O15xXHVo2JGSl0INXd+hf8=;
        b=OHBuwCKvEwlz64M6VDqvzUwbFE1xKQ+yi2WtKkHOkUZqgsJhfJMgmmD1FLTCshj50Q
         IGYcBkgbqefI4o+3v+vNixJ/NSQl4OXe21pZJeQvcrkIc7lkV9Fs3BSUuxLVmTFCibuy
         SyA2XW6bmP2vVIgFeqVNVR20h+ybhv+H+aTvtl3Rgpn6vnbF/QTsTI9wLB37Yz2QTtdA
         chANcReMP40acuUNsXl0L3CHCJi0dGz4e5DXnSqsESfPyC2uD1dqR0PFX44nCbI+iti9
         ZzGsaNQ67D0LwEXAWif/Jn98J0+wgRKoe1eJe5gpOUMQGesoKbrdN5aX3NkNVbir+qW5
         Wyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EgRiuJEADNLL58SEJDtb5O15xXHVo2JGSl0INXd+hf8=;
        b=0kzRIKgGQuQCSj+w+qvTv+D1lccgryMEqRFUJ67uOHt2CHMYIGeNeIJgpNvrtjry0I
         iuaiYdHce24LVydxg534LUcvF9sNQmJZGDyZlwNupytJOx1zO6juZFo5suCeGTdWssOt
         d6ot7qBW4kibR7OQ1ft9dZxPtHLnZ90PFjQAEVVmcZUfTwz2LSE0cnvJm38GnWRffE/C
         ETriOTClW21Mk+HynmBThXORtXf1ZabTEczEIYWDs9A6isJ0YxkFSmOFE943u4Gt3R3Q
         G9pphvITV52764Ln1gdRCrRXTp4IHhU3DaOUYYFXmuS3o3gZ3B9VwJJo5YogKcVoaig2
         Hoqg==
X-Gm-Message-State: AOAM532FZ924/80aTb6YVPudISjskuEZkE7yiyxPbzWRfZbTBGRPUVmG
	C7npKfCjoaPot0SUps8Km8xQIND6PTgNfw==
X-Google-Smtp-Source: ABdhPJw9P0SMBu4FSQsqJndfx88wYC/ICJ7gNtz6XIKsYk6jZ6KYpgUuUvOI+j9Xo6N4JZZ0xRqugg==
X-Received: by 2002:a05:6512:3452:: with SMTP id j18mr4170512lfr.435.1632401681958;
        Thu, 23 Sep 2021 05:54:41 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 01/11] xen/arm: Fix dev_is_dt macro definition
Date: Thu, 23 Sep 2021 15:54:28 +0300
Message-Id: <20210923125438.234162-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This macro is not currently used, but still has an error in it:
a missing parenthesis. Fix this, so the macro is properly defined.

Fixes: 6c5d3075d97e ("xen/arm: Introduce a generic way to describe device")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
New in v2
---
 xen/include/asm-arm/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 582119c31ee0..64aaa2641b7f 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -29,7 +29,7 @@ typedef struct device device_t;
 
 /* TODO: Correctly implement dev_is_pci when PCI is supported on ARM */
 #define dev_is_pci(dev) ((void)(dev), 0)
-#define dev_is_dt(dev)  ((dev->type == DEV_DT)
+#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
 enum device_class
 {
-- 
2.25.1


