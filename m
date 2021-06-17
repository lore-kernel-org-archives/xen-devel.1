Return-Path: <SRS0=2i39=LL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48306C2B9F4
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 06:31:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1041610A1
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 06:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1041610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.143669.264695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlYw-0008E8-Q4; Thu, 17 Jun 2021 06:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143669.264695; Thu, 17 Jun 2021 06:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltlYw-0008Dz-MW; Thu, 17 Jun 2021 06:31:38 +0000
Received: by outflank-mailman (input) for mailman id 143669;
 Thu, 17 Jun 2021 06:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3wh=LL=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ltlWE-0003Kj-C3
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 06:28:50 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d90548-3429-4c6d-88ca-849efa7e8a33;
 Thu, 17 Jun 2021 06:28:22 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id h16so3186610pjv.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jun 2021 23:28:22 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:e349:a6ae:d3d0:1621])
 by smtp.gmail.com with UTF8SMTPSA id o1sm3950751pjf.56.2021.06.16.23.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 23:28:21 -0700 (PDT)
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
X-Inumbo-ID: e9d90548-3429-4c6d-88ca-849efa7e8a33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPdZA059qJtBhHo92L+QtxB+I/HHPOi+M+A9tEqXqKY=;
        b=Myr0b5NJr1PyQ0pW9//q1QpUhnnMsBxVbgNFzqZKi6jRhYN3OXVXNzDbwwEnJ3vnIQ
         tGnTGpWMqJ5MxAv3CpCyi7gQ6p5P9yt5UwV7uci1/sAVn7FxhiIICuN7ffqDwVtmweoJ
         xnKMkVtNwRO3vARX46foyYNRbe69Lf2KTg2Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPdZA059qJtBhHo92L+QtxB+I/HHPOi+M+A9tEqXqKY=;
        b=ngtaioe0QxzhwLbOhTQnP2LPXbzoW/1twZ11a+EJUt1CIesvLYcilCK6tjvzPk7m7H
         yYMygl0W+8q7cx/nwuyvj1s0U7aDeGMEJQFeJApRbWcgvjoB3FDEk3CWOTMk4ZSSASCC
         xLYMpHkuOogeDukatSZxdej6fiuUaXrzHqS5ORwVTGkTbiamxoSUq4Li+UGwxOiUhUjB
         nF9MDKIBUoNUDAgnP2uhLPAbhTWy5F2OUtEHjjdh5HdNmoZ7AUCUyWYjKUug1wBUs8/e
         AaJE9reW8VbZobTEharKGvkl+Gbm5iGecK0/CvbTY5JhsfIHzUPZbp0BrrjfC1UhwQzs
         Lz5Q==
X-Gm-Message-State: AOAM533PGHqBsAIyhjkxN/wM9kAVnXHoVWlvRzDtOjbGfP3BwFXWLXgy
	FOrm7nUkq6C6wBjpFJboL9b03Q==
X-Google-Smtp-Source: ABdhPJy79i1TVMii//XQctad3ri2e3PEZ5kRZnre2T9swQRHDNRr2UXPLKrhAGeBBPSh8ySQDv1aNg==
X-Received: by 2002:a17:902:b609:b029:118:7acc:517a with SMTP id b9-20020a170902b609b02901187acc517amr3088068pls.67.1623911301959;
        Wed, 16 Jun 2021 23:28:21 -0700 (PDT)
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
Subject: [PATCH v13 11/12] dt-bindings: of: Add restricted DMA pool
Date: Thu, 17 Jun 2021 14:26:34 +0800
Message-Id: <20210617062635.1660944-12-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210617062635.1660944-1-tientzu@chromium.org>
References: <20210617062635.1660944-1-tientzu@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the new compatible string, restricted-dma-pool, for restricted
DMA. One can specify the address and length of the restricted DMA memory
region by restricted-dma-pool in the reserved-memory node.

Signed-off-by: Claire Chang <tientzu@chromium.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Will Deacon <will@kernel.org>
---
 .../reserved-memory/reserved-memory.txt       | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index e8d3096d922c..39b5f4c5a511 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -51,6 +51,23 @@ compatible (optional) - standard definition
           used as a shared pool of DMA buffers for a set of devices. It can
           be used by an operating system to instantiate the necessary pool
           management subsystem if necessary.
+        - restricted-dma-pool: This indicates a region of memory meant to be
+          used as a pool of restricted DMA buffers for a set of devices. The
+          memory region would be the only region accessible to those devices.
+          When using this, the no-map and reusable properties must not be set,
+          so the operating system can create a virtual mapping that will be used
+          for synchronization. The main purpose for restricted DMA is to
+          mitigate the lack of DMA access control on systems without an IOMMU,
+          which could result in the DMA accessing the system memory at
+          unexpected times and/or unexpected addresses, possibly leading to data
+          leakage or corruption. The feature on its own provides a basic level
+          of protection against the DMA overwriting buffer contents at
+          unexpected times. However, to protect against general data leakage and
+          system memory corruption, the system needs to provide way to lock down
+          the memory access, e.g., MPU. Note that since coherent allocation
+          needs remapping, one must set up another device coherent pool by
+          shared-dma-pool and use dma_alloc_from_dev_coherent instead for atomic
+          coherent allocation.
         - vendor specific string in the form <vendor>,[<device>-]<usage>
 no-map (optional) - empty property
     - Indicates the operating system must not create a virtual mapping
@@ -85,10 +102,11 @@ memory-region-names (optional) - a list of names, one for each corresponding
 
 Example
 -------
-This example defines 3 contiguous regions are defined for Linux kernel:
+This example defines 4 contiguous regions for Linux kernel:
 one default of all device drivers (named linux,cma@72000000 and 64MiB in size),
-one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB), and
-one for multimedia processing (named multimedia-memory@77000000, 64MiB).
+one dedicated to the framebuffer device (named framebuffer@78000000, 8MiB),
+one for multimedia processing (named multimedia-memory@77000000, 64MiB), and
+one for restricted dma pool (named restricted_dma_reserved@0x50000000, 64MiB).
 
 / {
 	#address-cells = <1>;
@@ -120,6 +138,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 			compatible = "acme,multimedia-memory";
 			reg = <0x77000000 0x4000000>;
 		};
+
+		restricted_dma_reserved: restricted_dma_reserved {
+			compatible = "restricted-dma-pool";
+			reg = <0x50000000 0x4000000>;
+		};
 	};
 
 	/* ... */
@@ -138,4 +161,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
 		memory-region = <&multimedia_reserved>;
 		/* ... */
 	};
+
+	pcie_device: pcie_device@0,0 {
+		reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
+		       0x83010000 0x0 0x00100000 0x0 0x00100000>;
+		memory-region = <&restricted_dma_reserved>;
+		/* ... */
+	};
 };
-- 
2.32.0.288.g62a8d224e6-goog


