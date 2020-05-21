Return-Path: <SRS0=0mHu=7D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B3CC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 18:13:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39CA207D3
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2020 18:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJdy/cjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F39CA207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbpgF-0003p9-9n; Thu, 21 May 2020 18:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqGm=7D=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbpgD-0003p4-Nd
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 18:12:29 +0000
X-Inumbo-ID: a17095f6-9b8e-11ea-ab47-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a17095f6-9b8e-11ea-ab47-12813bfff9fa;
 Thu, 21 May 2020 18:12:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AC8A20823;
 Thu, 21 May 2020 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590084748;
 bh=YV+FItUYezSQ7ZHcbNGENFz/MIrO0KddrFYZlCw3IsE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IJdy/cjOQYV2ETw3kOm32SIMSqO66krfMim2OrDkRRHYn7dpDokKYHSj624oFmZ8D
 AY8zaj1yoOTzWEMrws72jx8QtCSmlSJ0/geyhEyUaVxCOEcRJVxX/plpwNZJ9tyg8H
 nMaRdITCdViMmAaZI3iTzdZ3yxiCWikOKw9/YS3o=
Date: Thu, 21 May 2020 11:12:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi
 4
In-Reply-To: <687bea7e-ade9-8fd3-9a61-e3f5cd6d17be@xen.org>
Message-ID: <alpine.DEB.2.21.2005211112090.27502@sstabellini-ThinkPad-T480s>
References: <20200518113008.15422-1-julien@xen.org>
 <alpine.DEB.2.21.2005201512380.27502@sstabellini-ThinkPad-T480s>
 <687bea7e-ade9-8fd3-9a61-e3f5cd6d17be@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, minyard@acm.org, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 roman@zededa.com, George Dunlap <george.dunlap@citrix.com>,
 jeff.kubascik@dornerworks.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 21 May 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 20/05/2020 23:13, Stefano Stabellini wrote:
> > On Mon, 18 May 2020, Julien Grall wrote:
> > > From: Julien Grall <jgrall@amazon.com>
> > > 
> > > Hi all,
> > > 
> > > At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> > > only use the first GB of memory.
> > > 
> > > This is because several devices cannot DMA above 1GB but Xen doesn't
> > > necessarily allocate memory for Dom0 below 1GB.
> > > 
> > > This small series is trying to address the problem by allowing a
> > > platform to restrict where Dom0 banks are allocated.
> > > 
> > > This is also a candidate for Xen 4.14. Without it, a user will not be
> > > able to use all the RAM on the Raspberry Pi 4.
> > 
> > The series looks good to me aside from the couple of minor issues being
> > discussed
> 
> Thanks, I have sent the v2 yesterday but forgot to call add_maintainers.pl
> ([1]). Do you want me to resend it with you CCed?
> 
> Cheers,
> 
> [1] <20200519172028.31169-1-julien@xen.org>

No worries I found them now

