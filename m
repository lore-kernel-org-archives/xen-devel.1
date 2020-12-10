Return-Path: <SRS0=O1tB=FO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C49C3526A
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 19:42:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6DD23D23
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 19:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6DD23D23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.49701.87909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRph-0007dr-N6; Thu, 10 Dec 2020 19:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49701.87909; Thu, 10 Dec 2020 19:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRph-0007de-Gd; Thu, 10 Dec 2020 19:42:33 +0000
Received: by outflank-mailman (input) for mailman id 49701;
 Thu, 10 Dec 2020 19:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRpg-0007NY-HN
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:42:32 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2184410b-89a9-439f-b41e-9435301c810d;
 Thu, 10 Dec 2020 19:42:20 +0000 (UTC)
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
X-Inumbo-ID: 2184410b-89a9-439f-b41e-9435301c810d
Message-Id: <20201210194042.967177918@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=gYsowh6i1mqGXNg6FrEIlf+Px9WkTuZjYPGZA4AoQf4=;
	b=gQRR2ovC6G1wG0/hHfvHA26mBklNiMZtkvMBYZWjgQshlf7o+cIXoD11qJjLT48W0LHgJA
	5Zvfg1News0uQs48erbM5kmDtHengxfmuqG2DKGnaIJ04vg1FJ7jnVpZXG8cNwMy19OeFP
	iPFhPWqfd87RfMeVK3ZgF11+LhI8jQI6rRQAPId6pBGrjdbz5+dRwipziIghpyTp0+nYcu
	/rMQolvJykCdajiQdhpg5/73/PAnO6jEv3XXq/Rv9w9yxTGzkAvSFeWdlWRlX1S05CmH1R
	pxA14gUUPV2LrG7qMC56g75TqBVjQeX4kqlFmRI413CglTnFsrbWRi0PstpOew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=gYsowh6i1mqGXNg6FrEIlf+Px9WkTuZjYPGZA4AoQf4=;
	b=rxr0RqK5G71Mdyjh0pmNkfya7BLBal4i+pBNw5B4iIspa3uaIBOFXW7QFkpv0Ae/Yof/mz
	NtSLBAk6jBeGNuDQ==
Date: Thu, 10 Dec 2020 20:25:40 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 04/30] genirq: Provide irq_get_effective_affinity()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Provide an accessor to the effective interrupt affinity mask. Going to be
used to replace open coded fiddling with the irq descriptor.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irq.h |    7 +++++++
 1 file changed, 7 insertions(+)

--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -907,6 +907,13 @@ struct cpumask *irq_data_get_effective_a
 }
 #endif
 
+static inline struct cpumask *irq_get_effective_affinity_mask(unsigned int irq)
+{
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	return d ? irq_data_get_effective_affinity_mask(d) : NULL;
+}
+
 unsigned int arch_dynirq_lower_bound(unsigned int from);
 
 int __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,


