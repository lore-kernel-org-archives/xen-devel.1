Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45C5C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 20:50:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AA6E2078D
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 20:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s4YbUFCt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aS6JntOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AA6E2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB2N9-0000mu-Oq; Wed, 26 Aug 2020 20:50:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kB2N7-0000mp-Mr
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 20:50:17 +0000
X-Inumbo-ID: 94131ae9-3929-40f8-bd7f-0683922523bc
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94131ae9-3929-40f8-bd7f-0683922523bc;
 Wed, 26 Aug 2020 20:50:16 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598475014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG/TkMq9NWC6OfHgPC/IbFpW4xr9Kt9L0ix/14aZbxc=;
 b=s4YbUFCtbJEMrLqgKd7OwtYh18vHyM4HfQLj0mVtwmVQVO9mPe+rbcu9/9RQcu7BDqxIXq
 4SC8x5F55ReokeL0LN8UUQFD5m3BjRCcVnOHVA++cJ3n9iGLghzLvQHLb6sr4Opghelyw7
 wtiHRsopz/7aQ7mxdNa4ubr9zMjw6kUfb9G723x0mquWT/8sbYu95BnkyTknE0X6c2XJfj
 G2IbL55VnbnoeT093T8n8BdlC4i9HNmIpjyrPxF0OWHJtvkDyBhZ80We7p7G5tVUd/JFYJ
 lndw1zv+U67ElbvOK78N7X9qxyNKvPXDl0P5nwVk071fVAGS++QK4AuCw0xoVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598475014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG/TkMq9NWC6OfHgPC/IbFpW4xr9Kt9L0ix/14aZbxc=;
 b=aS6JntODH9ZvZZJHE2vQuw6G8LnzzNi8bSa6D1XA+HMxu+eOePiLVi0SGkTN8Uz37jCbMJ
 TOeuyIqSX/IO5mCA==
To: "Dey\, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, Haiyang
 Zhang <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, Russ
 Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jason
 Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex
 Williamson <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>,
 Baolu Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan
 Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 15/46] x86/irq: Consolidate DMAR irq allocation
In-Reply-To: <878se1uulb.fsf@nanos.tec.linutronix.de>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.163462706@linutronix.de>
 <812d9647-ad2e-95e9-aa99-b54ff7ebc52d@intel.com>
 <878se1uulb.fsf@nanos.tec.linutronix.de>
Date: Wed, 26 Aug 2020 22:50:13 +0200
Message-ID: <87r1rtt9mi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Aug 26 2020 at 20:32, Thomas Gleixner wrote:
> On Wed, Aug 26 2020 at 09:50, Megha Dey wrote:
>>> @@ -329,15 +329,15 @@ static struct irq_chip dmar_msi_controll
>>>   static irq_hw_number_t dmar_msi_get_hwirq(struct msi_domain_info *info,
>>>   					  msi_alloc_info_t *arg)
>>>   {
>>> -	return arg->dmar_id;
>>> +	return arg->hwirq;
>>
>> Shouldn't this return the arg->devid which gets set in dmar_alloc_hwirq?
>
> Indeed.

But for simplicity we can set arg->hwirq to the dmar id right in the
alloc function and then once the generic ops are enabled remove the dmar
callback completely.

