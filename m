Return-Path: <SRS0=hjEX=LK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AF9C49EA2
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 03:53:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5358861055
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 03:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5358861055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.142481.262897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltMc5-0006ms-2s; Wed, 16 Jun 2021 03:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142481.262897; Wed, 16 Jun 2021 03:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltMc4-0006mh-W4; Wed, 16 Jun 2021 03:53:12 +0000
Received: by outflank-mailman (input) for mailman id 142481;
 Wed, 16 Jun 2021 03:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR6m=LK=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltMc3-0006l9-LN
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 03:53:11 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5c076c7-9fe0-4354-9d61-0b06ba03f23e;
 Wed, 16 Jun 2021 03:53:10 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id k6so1069150pfk.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 20:53:10 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:3d52:f252:7393:1992])
 by smtp.gmail.com with UTF8SMTPSA id k19sm557774pji.32.2021.06.15.20.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 20:53:09 -0700 (PDT)
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
X-Inumbo-ID: c5c076c7-9fe0-4354-9d61-0b06ba03f23e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U6ZYMbmpZtiKwFDcQ7JFrtewUpbfgXD5Ls9ZoD2Zrzg=;
        b=RZd9rxgKkVABYLQTSq6F5uS2C29CsSdg36ip3FvrlN8FR4TLMNlm3ETn/gcglxg0VH
         +1WxkUy7ZqMrM1JYwzaBTnnUjGVHlY6H2dMNBKQlvyd/XPL2EbpKZBPFjCBcKqXScjgL
         sO86XIdkFZpgufpRs2QMpcNH/rozerebhjh1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U6ZYMbmpZtiKwFDcQ7JFrtewUpbfgXD5Ls9ZoD2Zrzg=;
        b=Px/H6RUKo+T2gEADW/PuevQFh/Xlpm75HH4dEwvEV7egQzKh+MguGVayMbUQd7jliZ
         6Q1FD1na1Id3pZHii5KDN+oz+Lw+QJm+VmQu9wfka4NEnybsphNk1M872y49t5utWojl
         J17GHf4UcKTUPJkmigiH7b2vQmH0RY5lWf2hGJEbpE8/dFO++8d7WI2T/zzhongGb10/
         sbHdgtguSRsKZgEvSj2wy2H1bn5GqLCBSY7q6D863AHfdgzdOBi3fBVNB8HWD5lqxIxG
         3wmWwYyt/NA/PiAk3EfKexoKUIz5mv+hsmqgC6td5mqqpcNETENun1xKY2ax/khguyJl
         1B5w==
X-Gm-Message-State: AOAM531kgSKpc3YzrhgXXLmFc3YEt+z4q2JM4/mq6lHv64ipmb+tKICh
	m3jvj6AYHgOwx9oJ4WCuYUKOYw==
X-Google-Smtp-Source: ABdhPJwmduDhMHaz4gp1KWw9pFkGmBZM/DTXojEyWC2D7eYdCuhZ3NXD60A0zg3fj181Q33R/6IAmA==
X-Received: by 2002:a63:a805:: with SMTP id o5mr2939730pgf.328.1623815590191;
        Tue, 15 Jun 2021 20:53:10 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org,
	paulus@samba.org,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	sstabellini@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	grant.likely@arm.com,
	xypron.glpk@gmx.de,
	Thierry Reding <treding@nvidia.com>,
	mingo@kernel.org,
	bauerman@linux.ibm.com,
	peterz@infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	heikki.krogerus@linux.intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	tfiga@chromium.org,
	bskeggs@redhat.com,
	bhelgaas@google.com,
	chris@chris-wilson.co.uk,
	tientzu@chromium.org,
	daniel@ffwll.ch,
	airlied@linux.ie,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com,
	jxgao@google.com,
	joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v11 02/12] swiotlb: Refactor swiotlb_create_debugfs
Date: Wed, 16 Jun 2021 11:52:30 +0800
Message-Id: <20210616035240.840463-3-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210616035240.840463-1-tientzu@chromium.org>
References: <20210616035240.840463-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the debugfs creation to make the code reusable for supporting
different bounce buffer pools.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 3ba0f08a39a1..af416bcd1914 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -670,19 +670,26 @@ bool is_swiotlb_active(void)
 EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
+static struct dentry *debugfs_dir;
 
-static int __init swiotlb_create_debugfs(void)
+static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
 {
-	struct io_tlb_mem *mem = io_tlb_default_mem;
-
-	if (!mem)
-		return 0;
-	mem->debugfs = debugfs_create_dir("swiotlb", NULL);
 	debugfs_create_ulong("io_tlb_nslabs", 0400, mem->debugfs, &mem->nslabs);
 	debugfs_create_ulong("io_tlb_used", 0400, mem->debugfs, &mem->used);
+}
+
+static int __init swiotlb_create_default_debugfs(void)
+{
+	struct io_tlb_mem *mem = io_tlb_default_mem;
+
+	debugfs_dir = debugfs_create_dir("swiotlb", NULL);
+	if (mem) {
+		mem->debugfs = debugfs_dir;
+		swiotlb_create_debugfs_files(mem);
+	}
 	return 0;
 }
 
-late_initcall(swiotlb_create_debugfs);
+late_initcall(swiotlb_create_default_debugfs);
 
 #endif
-- 
2.32.0.272.g935e593368-goog


