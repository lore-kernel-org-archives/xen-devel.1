Return-Path: <SRS0=Dhlx=NZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8D0C433FE
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 08:34:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BDA60FDA
	for <xen-devel@archiver.kernel.org>; Fri,  3 Sep 2021 08:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00BDA60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177837.323566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eA-0007LT-Nx; Fri, 03 Sep 2021 08:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177837.323566; Fri, 03 Sep 2021 08:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4eA-0007LH-KJ; Fri, 03 Sep 2021 08:34:02 +0000
Received: by outflank-mailman (input) for mailman id 177837;
 Fri, 03 Sep 2021 08:34:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM4e9-0006kQ-Ce
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:34:01 +0000
Received: from mail-ej1-x629.google.com (unknown [2a00:1450:4864:20::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24e6dbd2-53dd-4a2f-b109-cd7d7a4e1bc1;
 Fri, 03 Sep 2021 08:33:52 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id mf2so10484692ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 01:33:52 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id i7sm2311932ejx.73.2021.09.03.01.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:33:51 -0700 (PDT)
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
X-Inumbo-ID: 24e6dbd2-53dd-4a2f-b109-cd7d7a4e1bc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e6QStZ2WIeXjyjg6BwJ+X2ETh+SFauYaLcc7bbXleUI=;
        b=nWqFogticuAbAM8eSH4t1N6ThkVzCw+SXxxF9K1ll2yiZMh1ba0KqHkEcuIICyZxA+
         SzrMGymV0AEdKm8ZZ/3WuQ6zOTDzu3Qxl2rYf1kjguYpIH6KYlhCyq4IRG8TfcKBRTEa
         iMEDEVpEa1K4k9kdeisup0kiYmqigISQlt8BUksAZ9OhIz75hqYC7L9u4YBATeJvnifO
         b13khRAluSa+dJjLlvArcmT+T3oNHIcHa6lln6cGdZNaR3DGxhgy9yz1WLBpn0CaTKgf
         JKlqdN0FSVOjxPDLSx+rh4zcWbdqnO+Fq6F81ZteVy6jV9HuhiWHdOcfUqqsdjHTdnlT
         suoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e6QStZ2WIeXjyjg6BwJ+X2ETh+SFauYaLcc7bbXleUI=;
        b=DqfUBp3HYqyVJuvEWaAbOqwC+iP0kKM/BtDXEVHjL6xQ2EfXLT3VuN0ZFMiZ+SAzPs
         Moa683XQnMe0Xi8Erj6k69B5Pu6kd3hQVL0vD9jcAB4EQ6oK4YdrGWTsJ+3UUyVIazwE
         Xqgl56ITOKzRi0jItqS/W/TYqs7KWadXopTG5Dx0nrJVFWiEAxQMH3xKU8fsg805fRNV
         O9mUCJ2o4vAYxzTxCWuaRdUDiD93AVNdlAnPKG/SEzv5GO18QwEGM17T2hR8/G9SVUpp
         H1/an6zN52wDlP+iAFUudlGDxdULP1maooWYPv/L0au+vpqZJO/8+VJVl/XPVVvzOMZT
         C1dQ==
X-Gm-Message-State: AOAM532EVpJhMEJNMXKgNeiEuN+lD15r3Kf80L4/AiQdmRGklpph2xqw
	J6gNBPYL4kU14A7sBvyYlg0FOW8cayg=
X-Google-Smtp-Source: ABdhPJyTGMDmf4scjKeBebTeFdkThiwTB1tUX8NLSvZRs7ZtFuZfBJOLUJ5uJ8kRB25bkqYfTjUf0g==
X-Received: by 2002:a17:907:2721:: with SMTP id d1mr2923277ejl.24.1630658031656;
        Fri, 03 Sep 2021 01:33:51 -0700 (PDT)
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
Subject: [PATCH 02/11] xen/arm: Add dev_to_pci helper
Date: Fri,  3 Sep 2021 11:33:38 +0300
Message-Id: <20210903083347.131786-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903083347.131786-1-andr2000@gmail.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add a helper which is when given a struct device returns the
corresponding struct pci_dev which this device is a part of.

Because of the header cross-dependencies, e.g. we need both
struct pci_dev and struct arch_pci_dev at the same time, this cannot be
done with an inline. Macro can be implemented, but looks scary:

 #define dev_to_pci_dev(dev) container_of((container_of((dev), \
                        struct arch_pci_dev, dev), struct pci_dev, arch)

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/pci.c    | 10 ++++++++++
 xen/include/asm-arm/pci.h |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index dc63bbc2a2c1..6573f179af55 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -26,6 +26,16 @@ int arch_pci_clean_pirqs(struct domain *d)
     return 0;
 }
 
+struct pci_dev *dev_to_pci(struct device *dev)
+{
+    struct arch_pci_dev *arch_dev;
+
+    ASSERT(dev->type == DEV_PCI);
+
+    arch_dev = container_of((dev), struct arch_pci_dev, dev);
+    return container_of(arch_dev, struct pci_dev, arch);
+}
+
 static int __init dt_pci_init(void)
 {
     struct dt_device_node *np;
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 2d4610a23a25..e1aa05190bda 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -27,6 +27,13 @@ struct arch_pci_dev {
     struct device dev;
 };
 
+/*
+ * Because of the header cross-dependencies, e.g. we need both
+ * struct pci_dev and struct arch_pci_dev at the same time, this cannot be
+ * done with an inline here. Macro can be implemented, but looks scary.
+ */
+struct pci_dev *dev_to_pci(struct device *dev);
+
 /* Arch-specific MSI data for vPCI. */
 struct vpci_arch_msi {
 };
-- 
2.25.1


