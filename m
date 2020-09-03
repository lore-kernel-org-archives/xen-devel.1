Return-Path: <SRS0=byym=CM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD72C433E2
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2020 18:12:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EACB2083B
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2020 18:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yn1ERvJR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dsVN9RWD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EACB2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDtiY-0007aF-5X; Thu, 03 Sep 2020 18:12:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhjX=CM=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kDtiX-0007aA-K3
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 18:12:13 +0000
X-Inumbo-ID: 74454f9e-1bdc-4698-9ef6-9b115196af43
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74454f9e-1bdc-4698-9ef6-9b115196af43;
 Thu, 03 Sep 2020 18:12:11 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1599156730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kNaEs04RarZatwvnCZYp8Xyjij0m0qzMj73pUrlORw4=;
 b=yn1ERvJRi3Ap+fUwpE6YE6QEJw75JqHwztjGLfuIu5Vhx3ylMcPaeZMvt5r7IvXcWh2dAh
 7+z/aBykT9nJNYFo4QDegWd1mhgggaPOZ01qE8hyd4uY+QT0PBl3pkiYuzKw4KK3iGrXUr
 14y2LCk2YypciaSpx/mGkXvE0yiU5PSMcNx6TYqrk1t9NAuNFM6JknEl8Xbx7SEbi8u2zu
 ThkvHpDONagjoyMhBYJuQeMvMbIjXzsUhAvsaYpyYEJPejQesbQQGHFRQP2bHdcIklQKao
 rCqIVG7cJWCK1a7UyFdTjAaJOvn/BS6CkMvwnJ9pnqFjjru6qQ8dggQ04IJkjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1599156730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kNaEs04RarZatwvnCZYp8Xyjij0m0qzMj73pUrlORw4=;
 b=dsVN9RWDW8rGNqnULQccYNxG7P4DgVJRNir2mvhT2bTe8IjmmCK2zcbya02NGrTVlYkNdL
 1dML9FSRvccDMDDw==
To: "Raj\, Ashok" <ashok.raj@intel.com>
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
 <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, Baolu
 Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan Williams
 <dan.j.williams@intel.com>, Ashok Raj <ashok.raj@intel.com>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <20200903163516.GA23129@araj-mobl1.jf.intel.com>
References: <20200826111628.794979401@linutronix.de>
 <20200903163516.GA23129@araj-mobl1.jf.intel.com>
Date: Thu, 03 Sep 2020 20:12:09 +0200
Message-ID: <87eeniybk6.fsf@nanos.tec.linutronix.de>
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

Ashok,

On Thu, Sep 03 2020 at 09:35, Ashok Raj wrote:
> On Wed, Aug 26, 2020 at 01:16:28PM +0200, Thomas Gleixner wrote:
>> This is the second version of providing a base to support device MSI (non
>> PCI based) and on top of that support for IMS (Interrupt Message Storm)
>
> s/Storm/Store
>
> maybe pun intended :-)

Maybe? :)

>> based devices in a halfways architecture independent way.
>
> You mean "halfways" because the message addr and data follow guidelines
> per arch (x86 or such), but the location of the storage isn't dictated
> by architecture? or did you have something else in mind?

Yes, the actual message adress and data format are architecture
specific, but we also have x86 specific allocation info format which
needs an arch callback unfortunately.

>>    - Ensure that the necessary flags are set for device SMI
>
> is that supposed to be MSI? 

Of course, but SMI is a better match for Message Storm :)

Thanks,

        tglx

