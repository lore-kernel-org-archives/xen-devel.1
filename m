Return-Path: <SRS0=cIP9=CB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1EDC433DF
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 08:03:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89AAB2075B
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 08:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OSUGo4PT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tMc6ZKpq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89AAB2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9ky9-0005fM-Rs; Sun, 23 Aug 2020 08:03:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bq9O=CB=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k9ky8-0005fH-SQ
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 08:03:13 +0000
X-Inumbo-ID: 35ac4af7-6976-4216-8513-ab2cae184936
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ac4af7-6976-4216-8513-ab2cae184936;
 Sun, 23 Aug 2020 08:03:09 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598169788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1r81LXAzLVDLyLks6MQQbnmtJ0OK+dyyaovYHtczdF8=;
 b=OSUGo4PT4Ot+VGZW7JgEcWsC8MLwYCCnwHNCt3TYiEzvYBVXe45Rvl3FX/Y0isC1ShdQQ3
 RIh/bv3QSwwzvd8iYJBo7gkkwrPBgPqWBWG0qyIj42/W8ULqyGPqdtcmY9SWXIe6qo1A1Q
 G8rQ4XqyV5X9tf+kKzjK0R1QN5bjpdFSWtGLnHuCi+FXplbjlm/gIBBAoZuWJKD4qsyf1+
 E4sJhAD2xn/VQyYp3NoK60i70Z16VK3CVNEGe2YhdqoIM5dCPu+czaZXI3Of9hT7hNOiiq
 KycdvEqCmdiPmuLVuylio+jeqSn+LdOfVq0686G5ly9H6MwoSrM+c5IPwwJFcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598169788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1r81LXAzLVDLyLks6MQQbnmtJ0OK+dyyaovYHtczdF8=;
 b=tMc6ZKpqYdgSdwXa7ZmkDUuCxCEpdWuXt4VgP89zL1RSX0c8gVXVItieBv1Rh/DCd8vqw0
 Q7nUMe69k9VLtDAQ==
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Marc Zyngier <maz@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jacob
 Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [patch RFC 38/38] irqchip: Add IMS array driver - NOT FOR MERGING
In-Reply-To: <20200822230511.GD1152540@nvidia.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002949.049867339@linutronix.de>
 <20200821124547.GY1152540@nvidia.com>
 <874kovsrvk.fsf@nanos.tec.linutronix.de>
 <20200821201705.GA2811871@nvidia.com>
 <87pn7jr27z.fsf@nanos.tec.linutronix.de>
 <20200822005125.GB1152540@nvidia.com>
 <874kovqx8q.fsf@nanos.tec.linutronix.de>
 <20200822230511.GD1152540@nvidia.com>
Date: Sun, 23 Aug 2020 10:03:07 +0200
Message-ID: <875z99ssas.fsf@nanos.tec.linutronix.de>
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

On Sat, Aug 22 2020 at 20:05, Jason Gunthorpe wrote:
> On Sat, Aug 22, 2020 at 03:34:45AM +0200, Thomas Gleixner wrote:
> As a silicon design it might work, but it means existing devices can't
> be used with this dev_msi. It is also the sort of thing that would
> need a standard document to have any hope of multiple vendors fitting
> into it. Eg at PCI-SIG or something.

Fair enough.

>> If you don't do that then you simply can't write to that space from the
>> CPU and you have to transport this kind information always via command
>> queues.
>
> Yes, exactly. This is part of the architectural design of the device,
> has been for a long time. Has positives and negatives.

As always and it clearly follows the general HW design rule "we can fix
that in software".

>> > I suppose the core code could provide this as a service? Sort of a
>> > varient of the other lazy things above?
>> 
>> Kinda. That needs a lot of thought for the affinity setting stuff
>> because it can be called from contexts which do not allow that. It's
>> solvable though, but I clearly need to stare at the corner cases for a
>> while.
>
> If possible, this would be ideal, as we could use the dev_msi on a big
> installed base of existing HW.

I'll have a look, but I'm surely not going to like the outcome.

Thanks,

        tglx

