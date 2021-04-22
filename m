Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F270DC4360C
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 08:16:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D41613DC
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 08:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D41613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115132.219559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUW3-0002pQ-Go; Thu, 22 Apr 2021 08:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115132.219559; Thu, 22 Apr 2021 08:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZUW3-0002pH-D2; Thu, 22 Apr 2021 08:16:51 +0000
Received: by outflank-mailman (input) for mailman id 115132;
 Thu, 22 Apr 2021 08:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqrU=JT=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lZUW2-0002Na-CN
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 08:16:50 +0000
Received: from mail-pf1-x434.google.com (unknown [2607:f8b0:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ce1f53c-7d9e-4976-b3e0-bf86ec83555e;
 Thu, 22 Apr 2021 08:16:45 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id h15so13458424pfv.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Apr 2021 01:16:45 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:1a8e:1bde:f79e:c302])
 by smtp.gmail.com with UTF8SMTPSA id u20sm1609788pgl.27.2021.04.22.01.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:16:44 -0700 (PDT)
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
X-Inumbo-ID: 1ce1f53c-7d9e-4976-b3e0-bf86ec83555e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mJ/TkgMbos7HDgzEvAyBSSssik5oYm9C9TjgiTYpXv4=;
        b=fyVWiuO//zdOOIo4SNTiuA/vCunrGgmzPak8fgrlfn9FPjJtgikPITZX5MyU4Hcylj
         tgKqZuvWduZLAhM+rwSwIdzf6cV8Ibpo2L8LCLq3qaaOJec+GA7MgH1YQyREX968hpEE
         gwnKW1kbzKADPcPn9LNFq1IfmA/7hwp+Ov4LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mJ/TkgMbos7HDgzEvAyBSSssik5oYm9C9TjgiTYpXv4=;
        b=YSUod+43WWHDPsVD8Fwb+tEXx1FHl6Effs7xQpMzrpiRl77P/72QByEj6TLwFjfAxk
         s2O87m55aGCSaXMQnFKoTH9HqTikhYxt1UAywo1Pkf+StLq8z/Hpv0Xt90JedpynU5Kq
         8Pao5+C6MebHZE5Gwy6niPntnRRGesYWyDUsrazaxSK1m1q2AyhkVn0A+qZvaG2GEUKA
         vo3GJB7Tcs4eM+qwFH78iKpGvxKxk1fdmmkctrNSt6jCQcrmwW7O87SVv8Q8HPy1XpKy
         Q72OJK17uBph/yCac1XdDYLCLRBWGzTzer9t8UwPUG5ZTUWOppJNPJwXX8qcEGbFBpcG
         HU+w==
X-Gm-Message-State: AOAM531E6mu45YiuvLtjlym/m/UtpIjEv8n7SYqS4nGeucAq+9bVaft+
	SXZl9aIeqz0zsN+QAagfWz8UIA==
X-Google-Smtp-Source: ABdhPJy4vYC2gsYRFQJC6RH0GCA/bYSUMJf7hfMB4cYSbbJiyMgDRqknqyiPj0fvHGhXeIZCrRTI2A==
X-Received: by 2002:a62:8cd0:0:b029:256:a7a9:2a3a with SMTP id m199-20020a628cd00000b0290256a7a92a3amr2221884pfd.69.1619079404706;
        Thu, 22 Apr 2021 01:16:44 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Joerg Roedel <joro@8bytes.org>,
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
	nouveau@lists.freedesktop.org,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 10/16] swiotlb: Move alloc_size to find_slots
Date: Thu, 22 Apr 2021 16:15:02 +0800
Message-Id: <20210422081508.3942748-11-tientzu@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210422081508.3942748-1-tientzu@chromium.org>
References: <20210422081508.3942748-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the maintenance of alloc_size to find_slots for better code
reusability later.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 96ff36d8ec53..b7d634d7a7eb 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -479,8 +479,11 @@ static int find_slots(struct device *dev, phys_addr_t orig_addr,
 	return -1;
 
 found:
-	for (i = index; i < index + nslots; i++)
+	for (i = index; i < index + nslots; i++) {
 		mem->slots[i].list = 0;
+		mem->slots[i].alloc_size =
+			alloc_size - ((i - index) << IO_TLB_SHIFT);
+	}
 	for (i = index - 1;
 	     io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
 	     mem->slots[i].list; i--)
@@ -535,11 +538,8 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * This is needed when we sync the memory.  Then we sync the buffer if
 	 * needed.
 	 */
-	for (i = 0; i < nr_slots(alloc_size + offset); i++) {
+	for (i = 0; i < nr_slots(alloc_size + offset); i++)
 		mem->slots[index + i].orig_addr = slot_addr(orig_addr, i);
-		mem->slots[index + i].alloc_size =
-			alloc_size - (i << IO_TLB_SHIFT);
-	}
 	tlb_addr = slot_addr(mem->start, index) + offset;
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
-- 
2.31.1.368.gbe11c130af-goog


