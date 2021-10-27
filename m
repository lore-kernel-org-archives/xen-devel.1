Return-Path: <SRS0=eAWX=PP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8524C433F5
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 23:57:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F95B600D3
	for <xen-devel@archiver.kernel.org>; Wed, 27 Oct 2021 23:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F95B600D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.217556.377657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsn3-0003Ni-VF; Wed, 27 Oct 2021 23:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217556.377657; Wed, 27 Oct 2021 23:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfsn3-0003Nb-RM; Wed, 27 Oct 2021 23:57:05 +0000
Received: by outflank-mailman (input) for mailman id 217556;
 Wed, 27 Oct 2021 23:57:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfsn2-0003NV-Ux
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:57:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9542014e-3781-11ec-848c-12813bfff9fa;
 Wed, 27 Oct 2021 23:57:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11D6660F9C;
 Wed, 27 Oct 2021 23:57:03 +0000 (UTC)
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
X-Inumbo-ID: 9542014e-3781-11ec-848c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635379023;
	bh=Z4vtCU4oJ7ft2D9z1b+lz+jTWGnf4/E/tC5BtXysHaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gIwRoyiqq65J1Zu6M/fuXqRFPJ51iZ+mePbIU2Dy+JiVfIElLyVTvurfYQ1loXW6W
	 3wCl5vLiEsvRNBJ9Pnb4gwfChZIaBaVOGhRjNHzBzixKSdOSoYLXv/RgGYVrmePVj/
	 JBAA3W6OtExsJvOPqHi+O2uy7Ots65TcB/1mJ0ptSuwac7QJE5y9uC33BBZb9BaMOy
	 omEWVOKDrLRtx6tmCpzs5peVbDZ8q0oKwZlx3iOni3Ef/3OdTSNd3XYLRe2mBivq8g
	 GB0kzZpnA6/jJkSg4UdAUCtwqg7j9647PUOjENnNlx2YOtB1q3vKWFYHMIGcdHTTNI
	 EJrQ0GGBzK3zw==
Date: Wed, 27 Oct 2021 16:57:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr Andrushchenko <andr2000@gmail.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, iwj@xenproject.org, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
In-Reply-To: <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
Message-ID: <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
References: <20211027083730.1406947-1-andr2000@gmail.com> <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Oct 2021, Julien Grall wrote:
> Hi Oleksandr,
> 
> On 27/10/2021 09:37, Oleksandr Andrushchenko wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > 
> > If a PCI host bridge device is present in the device tree, but is
> > disabled, then its PCI host bridge driver was not instantiated.
> > This results in the following panic during Xen start:
> > 
> > (XEN) Device tree generation failed (-22).
> 
> It would good to clarify in the commit message where the error is coming from.
> I think this is from pci_get_host_bridge_segment().
> 
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Could not set up DOM0 guest OS
> > (XEN) ****************************************
> > 
> > Fix this by not adding linux,pci-domain property for hwdom if it is
> > neither available nor device enabled.
> From my reading of the binding [1], the property should be present in all the
> hostbridges if one specify it. IOW, I think the property should also be added
> for hostbridges that are not available.

Just wanted to say that I think you are right:

"""
It is required to either not set this property at all or set it for all
host bridges in the system, otherwise potentially conflicting domain numbers
may be assigned to root buses behind different host bridges.  The domain
number for each host bridge in the system must be unique.
"""

and I am ready to believe device trees with disabled bridges might have
(incorrectly) ignored the rule.


> AFAICT, Linux will ignore hostbridge that are not available. But it feels to
> me we are twisting the rule. So, could we consider to allocate an unused
> number?

I think that would be fine but it doesn't look easy from the current Xen
code point of view because the allocation depends on the Xen driver,
which we don't have. But I'll let others comment on it. Otherwise
skipping the disabled host bridge node for Dom0 sounds OK.

