Return-Path: <SRS0=5TPE=LD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EC8C48BCD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 23:50:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9DD613EA
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 23:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9DD613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.139589.258121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr7y6-0002L3-Q1; Wed, 09 Jun 2021 23:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139589.258121; Wed, 09 Jun 2021 23:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr7y6-0002Kw-N4; Wed, 09 Jun 2021 23:50:42 +0000
Received: by outflank-mailman (input) for mailman id 139589;
 Wed, 09 Jun 2021 23:50:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y+9=LD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lr7y5-0002Kp-8R
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 23:50:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c65a232-ec1b-4586-a98a-ee313c040ebf;
 Wed, 09 Jun 2021 23:50:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A06BE613EA;
 Wed,  9 Jun 2021 23:50:39 +0000 (UTC)
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
X-Inumbo-ID: 2c65a232-ec1b-4586-a98a-ee313c040ebf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623282639;
	bh=yEJO2DI/IKbhJ4+Dt/QgSklrpmtCt/IWx3ftV032t9I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PwNh5zRH09/pnEhCt/REsgAGKABBMpS4dcGGnIZWfIcDXCgTjGM+ofXaEdlOEj7q5
	 0sbqSlvdwqvFbjxxi8fCpoBj7+SA0nK2gH3j0xfOVnNh1U/pIigp21Q+lLZit2ygFC
	 M5mHn9dNUdA8Ws+6oOVf6MrCOa0+Ce56zeA4bJUwZB4MMb7M9/KaggJ/62Rw/OorvE
	 fgvXhOwuR1ewdn2WG3sjHD7Sd4yA1IyUc8lX6NZQiGNfYUkko9WYEeFyD1btKg8zdv
	 i+D2kUj9RLjPEbAgmE/0BAEBYLhIg5RZZB1i2mbE5RUKD/Ly0/t0yVi4RkRylFlHAH
	 1JiDL6bA4YMDA==
Date: Wed, 9 Jun 2021 16:50:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr_Babchuk@epam.com, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Michal.Orzel@arm.com, edgar.iglesias@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm32: SPSR_hyp/SPSR
In-Reply-To: <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
Message-ID: <alpine.DEB.2.21.2106091647100.24906@sstabellini-ThinkPad-T480s>
References: <20210609174324.6621-1-sstabellini@kernel.org> <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Jun 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/06/2021 18:43, Stefano Stabellini wrote:
> > SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
> > trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
> 
> Please provide a reference to the spec. This helps reviewer and/or future
> developper to figure out quickly where this comes from.
> 
> > 
> > This fixes booting Xen/arm32 on QEMU.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> With the reference added:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

I added: ARM DDI 0487D.b page G8-5993 and committed it



