Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268D0C433E1
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 12:06:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EADE72087C
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 12:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zIN8rRtD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ICrYp1XT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EADE72087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCV-0002BS-K7; Wed, 26 Aug 2020 12:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu9I-000821-Ax
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:03:28 +0000
X-Inumbo-ID: cf71050b-2286-4bb3-8d71-ae7377f0f256
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf71050b-2286-4bb3-8d71-ae7377f0f256;
 Wed, 26 Aug 2020 12:01:49 +0000 (UTC)
Message-Id: <20200826112334.889315931@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=cykkSf24RUQJOTwuG0VyPRnlzcI597ZZ2erY9w7Z858=;
 b=zIN8rRtDstwLjSbYqoe/Wc9kD7YWmQX95g6LuqqnKZeIXL7ixEiCyQPMyyYmpK7bLDOv6a
 CgkPN1a/yxGmVb6l7wya9/+xgLgs1ILCFlVdtx/TWRP1eJHmEdFFwWDl5XqTm9f0TPMfRZ
 tw8tcz3fZEbqTuhbOutbbgGiDfdG+gMiYSlxV0vFanbSDowqFpFS1LKNWSOOr43T6mHN2Y
 hpSKYgnX+YKs5f0emn4766Na/CrJdM4iI/cGUnqVztLRfOEpSQoYP0sA+DAKMe3ykn/i6E
 aNRDbWt9tyHlJrG8TMXJ3ambkrVnYLMrF+BJ+OMDFwOJ+K+PO3VbOMIlC6vvrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=cykkSf24RUQJOTwuG0VyPRnlzcI597ZZ2erY9w7Z858=;
 b=ICrYp1XTC5U4lIY5xh2joAmFwqxVGQeU3Yoo/fhXIC7eLLf62NUoErEyKCXtf8lK82iEDf
 xbeyrCK376q7yiDg==
Date: Wed, 26 Aug 2020 13:17:11 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch V2 43/46] genirq/msi: Provide and use
 msi_domain_set_default_info_flags()
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MSI interrupts have some common flags which should be set not only for
PCI/MSI interrupts.

Move the PCI/MSI flag setting into a common function so it can be reused.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 drivers/pci/msi.c   |    7 +------
 include/linux/msi.h |    1 +
 kernel/irq/msi.c    |   24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1469,12 +1469,7 @@ struct irq_domain *pci_msi_create_irq_do
 	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
 		pci_msi_domain_update_chip_ops(info);
 
-	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
-		info->flags |= MSI_FLAG_MUST_REACTIVATE;
-
-	/* PCI-MSI is oneshot-safe */
-	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+	msi_domain_set_default_info_flags(info);
 
 	domain = msi_create_irq_domain(fwnode, info, parent);
 	if (!domain)
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -410,6 +410,7 @@ int platform_msi_domain_alloc(struct irq
 void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
 			      unsigned int nvec);
 void *platform_msi_get_host_data(struct irq_domain *domain);
+void msi_domain_set_default_info_flags(struct msi_domain_info *info);
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -70,6 +70,30 @@ void get_cached_msi_msg(unsigned int irq
 EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+void msi_domain_set_default_info_flags(struct msi_domain_info *info)
+{
+	/* Required so that a device latches a valid MSI message on startup */
+	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
+
+	/*
+	 * Interrupt reservation mode allows to stear the MSI message of an
+	 * inactive device to a special (usually spurious interrupt) target.
+	 * This allows to prevent interrupt vector exhaustion e.g. on x86.
+	 * But (PCI)MSI interrupts are activated early - see above - so the
+	 * interrupt request/startup sequence would not try to allocate a
+	 * usable vector which means that the device interupts would end
+	 * up on the special vector and issue spurious interrupt messages.
+	 * Setting the reactivation flag ensures that when the interrupt
+	 * is requested the activation is invoked again so that a real
+	 * vector can be allocated.
+	 */
+	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
+		info->flags |= MSI_FLAG_MUST_REACTIVATE;
+
+	/* MSI is oneshot-safe at least in theory */
+	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+}
+
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {


