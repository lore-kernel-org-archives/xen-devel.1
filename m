Return-Path: <SRS0=zGdd=PX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1932AC433F5
	for <xen-devel@archiver.kernel.org>; Thu,  4 Nov 2021 23:04:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5AF6120D
	for <xen-devel@archiver.kernel.org>; Thu,  4 Nov 2021 23:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC5AF6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.221946.383887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milmG-0003xD-JD; Thu, 04 Nov 2021 23:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221946.383887; Thu, 04 Nov 2021 23:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1milmG-0003x6-FY; Thu, 04 Nov 2021 23:04:12 +0000
Received: by outflank-mailman (input) for mailman id 221946;
 Thu, 04 Nov 2021 23:04:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqP1=PX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1milmF-0003x0-Hc
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 23:04:11 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8480d98f-3dc3-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 00:04:10 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A284D6120D;
 Thu,  4 Nov 2021 23:04:08 +0000 (UTC)
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
X-Inumbo-ID: 8480d98f-3dc3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636067048;
	bh=9jt+BSwma52OmORglvvPLalIKhSMuZ8Hu1UoyeOmbVc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B+CuFtvjddzJLG6A7WVAdMoS2Q5IQKRsDPf6am8KzOphsl9bv64emhW4E4XaON8cF
	 knCORQ8HHEvRrN+Cot9HjwOh67bdIIjQscqbnIK+GBClyfomzOl1G6kVIEJA3IWrVs
	 aa1JfxfidWJUkuK4HpsfHH1d5Y/GRV+P4pXx+gPF79hDmykcy9EcPUp68KENs3cGKl
	 dNUJ+9I+oNiryT/ZaUg6oo9mpUUqiT/7daniHoKQojY8SffW1ukEvHDgeRAlPAdg5g
	 n/NH+HV2AmGxlgjwCtjWfyj2rnbpuMV9RxZiANoT74lTbg+tUSM5SVoo2xvnjPu6w1
	 r5vnuXeGOwsqA==
Date: Thu, 4 Nov 2021 16:04:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH] MAINTAINERS: add Bertrand to the ARM reviewers
In-Reply-To: <9f3208df-f3a8-e5ed-ee30-aed152d32ad5@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111041601390.284830@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2111041357580.284830@ubuntu-linux-20-04-desktop> <9f3208df-f3a8-e5ed-ee30-aed152d32ad5@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Nov 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 04/11/2021 21:00, Stefano Stabellini wrote:
> > 
> > Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> I am not sure where the Acked-by is coming from. Can Bertrand confirm on the
> ML that the is happy to be a reviewer?

Yes, he gave it to me verbally but I was assuming Bertrand would also
confirm on xen-devel.


> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> There is a missing signed-off-by on the patch.
> 
> I am happy with the proposal, although I will wait for the two remarks to be
> resolved before giving my acked-by.

Ahah oh man I somehow forgot it

