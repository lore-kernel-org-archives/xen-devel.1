Return-Path: <SRS0=Pc9a=EP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A15EC388F7
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E1C2083B
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2020 12:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6tl/cpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E1C2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.22467.48782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6d9-0003vi-3H; Mon, 09 Nov 2020 12:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22467.48782; Mon, 09 Nov 2020 12:50:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6d8-0003vY-VG; Mon, 09 Nov 2020 12:50:42 +0000
Received: by outflank-mailman (input) for mailman id 22467;
 Mon, 09 Nov 2020 12:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6d7-0003tf-G8
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:41 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65cd7055-ea58-471e-ab4b-c97dca5b8bec;
 Mon, 09 Nov 2020 12:50:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a25so3369148lfb.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:35 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:34 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6d7-0003tf-G8
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:41 +0000
X-Inumbo-ID: 65cd7055-ea58-471e-ab4b-c97dca5b8bec
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 65cd7055-ea58-471e-ab4b-c97dca5b8bec;
	Mon, 09 Nov 2020 12:50:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id a25so3369148lfb.2
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1rzuTCzz2KF+DRZQjteexLeZTdzBj+314YEg3qH31eU=;
        b=S6tl/cpgNDnUIxTskwzefT2OcCf0wYW5IaEF+pGqwIKBOuIcCUH2BcvRYHPqlqI1aR
         1gNG2n/XcW+n1z1aieFzT7m+uHrSmtUL13xhONepAHj5uGGxGOo5mSulraPtUUGNXdk4
         PkaDGOrmV9iy8I8+zqBUlZ8uffd8lGDHyWmlB5LicP9KJIgbexggybZvxyCKvMe4NvKW
         h6ckFRAlbFgjOKxl68B2wYdQuyJm5BpX+zER0tvHBh1EaurrT9hMLlGYFxiKM1v2m2f+
         XyTGI8XpTj5SSzvLIYWYAz6+MRpvmi1QXJ6wD/el3bR9kVwg7HK8WzMlYWRyBQGmsgHg
         sxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1rzuTCzz2KF+DRZQjteexLeZTdzBj+314YEg3qH31eU=;
        b=mYeJFBoBR5FDMmsimYRnYPmz70vxnEueiAZRQjD9rF8x3F72OmzqYTwS4sXnSNItOf
         Rw7wQPI6D8AXk+e5ReKoqYAUocvJxylww7l/1Jlbt9Yvr+h93sqwS5Zz/vwExiw2BEk7
         Ei4E/MByNMuiy6qvWqcTcLPmZ2RcyxGfYloo8wrqZTwA8ng1I171NlMUmZtAdsQfpO3O
         Wv3RjC9co1Yc5g/KunQV3nEWht5fmoKU19rJK6brHloXFQh+8dAgKzAi3EaEBrcI0K0K
         FHghbKkXY8aOdlM+xYn7BieSQS1m+WTvVVGurUY/HV1qt11uWozVGGiWvrcsVG/q4vGk
         75Ug==
X-Gm-Message-State: AOAM5311aL+pNemyRvPcJnREPY0u2j9du3lTfzsQMiwLCMMVhpJTvUT/
	xTTZC1nYmE16kwZhvAY9Lf4T/fSsxaSd7j7B
X-Google-Smtp-Source: ABdhPJxDFoHXaz68fLZTaNjkSD8UMocF3QfpIF4hXTbn9tp8pmsusBJgEQvGxDLl+4M/wzGd4N7iMA==
X-Received: by 2002:a19:90b:: with SMTP id 11mr6026088lfj.316.1604926234923;
        Mon, 09 Nov 2020 04:50:34 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:34 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 01/10] pci/pvh: Allow PCI toolstack code run with PVH domains on ARM
Date: Mon,  9 Nov 2020 14:50:22 +0200
Message-Id: <20201109125031.26409-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

According to https://wiki.xenproject.org/wiki/Linux_PVH:

Items not supported by PVH
 - PCI pass through (as of Xen 4.10)

Allow running PCI remove code on ARM and do not assert for PVH domains.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/libxl/Makefile    | 4 ++++
 tools/libxl/libxl_pci.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 241da7fff6f4..f3806aafcb4e 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -130,6 +130,10 @@ endif
 
 LIBXL_LIBS += -lyajl
 
+ifeq ($(CONFIG_ARM),y)
+CFALGS += -DCONFIG_ARM
+endif
+
 LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
 			libxl_dom.o libxl_exec.o libxl_xshelp.o libxl_device.o \
 			libxl_internal.o libxl_utils.o libxl_uuid.o \
diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index bc5843b13701..b93cf976642b 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -1915,8 +1915,10 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
             goto out_fail;
         }
     } else {
+        /* PCI passthrough can also run on ARM PVH */
+#ifndef CONFIG_ARM
         assert(type == LIBXL_DOMAIN_TYPE_PV);
-
+#endif
         char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pcidev->domain,
                                      pcidev->bus, pcidev->dev, pcidev->func);
         FILE *f = fopen(sysfs_path, "r");
-- 
2.17.1


