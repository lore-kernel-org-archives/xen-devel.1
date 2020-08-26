Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2402C433E1
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 19:48:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9424F207BC
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 19:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EfWyyyYv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lwTtm5+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9424F207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kB1OY-0002ky-On; Wed, 26 Aug 2020 19:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kB1OX-0002kr-8V
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 19:47:41 +0000
X-Inumbo-ID: 197dfb38-ba77-433a-836f-9cf56ac06a1f
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 197dfb38-ba77-433a-836f-9cf56ac06a1f;
 Wed, 26 Aug 2020 19:47:40 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598471258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lyh+OM9Dem9Z/kcK7+gNQJTzyczEFOEY6bG0/Arpun0=;
 b=EfWyyyYv7YWdGg6ZlsB2Gvul0V5au5smJUJLpNMYZSeBiiHKLri6m/Tv5rd3ih560hoGVx
 nzH0lvvST7eWiS1oI2n1KsOHqXKtzHTxLZKpI9SJMhuG+jI5LovFGtPMOPIS2OeEiw7isO
 tmHV0B3teBdD8CSsdyyCabr4Y3t9FTxtENq7B0e0cMS6jhcUUVWnX0K+s+ywdP/VhxrhzZ
 AvJFcEhdDRbeNtKQ1LbQq2JWDBLeMZ2p9QqkeojW3Ekaz6euFWW9jBElfBZUz5/VBdDbaW
 wxAj9R70KvXLkL4n184+rXcNFpLiSbh7hiA6EXnDFal4H8EYpyU37gQ+3u6LTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598471258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lyh+OM9Dem9Z/kcK7+gNQJTzyczEFOEY6bG0/Arpun0=;
 b=lwTtm5+nHxlSQCA2aszVTEr9Qr/quwfcz0JOyWbmJI+tlH+mPCSRq5hNRIajB+9Hp6kRhm
 8ERxa7qPC4M270AA==
To: Marc Zyngier <maz@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, Joerg Roedel
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl
 <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson
 <rja@hpe.com>, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jacob Pan
 <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 29/46] irqdomain/msi: Allow to override
 msi_domain_alloc/free_irqs()
In-Reply-To: <87blix2pna.wl-maz@kernel.org>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.526797548@linutronix.de> <87blix2pna.wl-maz@kernel.org>
Date: Wed, 26 Aug 2020 21:47:38 +0200
Message-ID: <87zh6htcit.fsf@nanos.tec.linutronix.de>
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

On Wed, Aug 26 2020 at 20:06, Marc Zyngier wrote:
> On Wed, 26 Aug 2020 12:16:57 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>>  /**
>> - * msi_domain_free_irqs - Free interrupts from a MSI interrupt @domain associated tp @dev
>> - * @domain:	The domain to managing the interrupts
>> + * msi_domain_alloc_irqs - Allocate interrupts from a MSI interrupt domain
>> + * @domain:	The domain to allocate from
>>   * @dev:	Pointer to device struct of the device for which the interrupts
>> - *		are free
>> + *		are allocated
>> + * @nvec:	The number of interrupts to allocate
>> + *
>> + * Returns 0 on success or an error code.
>>   */
>> -void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
>> +int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>> +			  int nvec)
>> +{
>> +	struct msi_domain_info *info = domain->host_data;
>> +	struct msi_domain_ops *ops = info->ops;
>
> Rework leftovers, I imagine.

Hmm, no. How would it call ops->domain_alloc_irqs() without getting the
ops. I know, that the diff is horrible, but don't blame me for it. diff
sucks at times.

>> +
>> +	return ops->domain_alloc_irqs(domain, dev, nvec);
>> +}
>> +
>> +void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
>>  {
>>  	struct msi_desc *desc;
>>  
>> @@ -513,6 +525,20 @@ void msi_domain_free_irqs(struct irq_dom
>>  }
>>  
>>  /**
>> + * __msi_domain_free_irqs - Free interrupts from a MSI interrupt @domain associated tp @dev
>
> Spurious __.

Yup.

Thanks,

        tglx

