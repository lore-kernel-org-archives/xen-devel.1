Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB65C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:10:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91DC230F9
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91DC230F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65940.116888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzP31-0002LM-46; Tue, 12 Jan 2021 19:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65940.116888; Tue, 12 Jan 2021 19:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzP31-0002LF-1F; Tue, 12 Jan 2021 19:09:43 +0000
Received: by outflank-mailman (input) for mailman id 65940;
 Tue, 12 Jan 2021 19:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kzP30-0002L6-7f
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 19:09:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46eacc29-19f4-4d2a-ba9b-b43f340513f2;
 Tue, 12 Jan 2021 19:09:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 945B5230F9;
 Tue, 12 Jan 2021 19:09:39 +0000 (UTC)
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
X-Inumbo-ID: 46eacc29-19f4-4d2a-ba9b-b43f340513f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610478580;
	bh=41T5rpogzUmFkabtjEbSnxtUgy5ZLwwO0F919YRV4aw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mUIEOLPypEgFD85cjy92O5UOzPdnthGpJpgUbUDioaQ6sMLVrRSnRCICyFt+ptINL
	 Fhs3E3Z5QvJNVbYAVd9MUoe26slVhxg+yVkRxQ+csfiw09Lvys3Kpy7qLkRnfVdBHS
	 l6VGNB3TkezncR8OCER+p3VPY+dheFTAY2kZ393LSAmjPQwQw9ABzfJUsvalPOa5a4
	 YWl0L9yGP7Ob7Zjwt3S7oNe7mqGnlj6uzFpJHpp2i5bLKRPUbc3/rO/voB3+9iQQyx
	 eJYbKmeNnds7VQ99w2Fl9R4sJQY/kiLTLg7SPODW84Qy3yPwmZDVGloOOGeP65cLRS
	 GhGckeM+E9QVA==
Date: Tue, 12 Jan 2021 11:09:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
In-Reply-To: <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
Message-ID: <alpine.DEB.2.21.2101121015100.2495@sstabellini-ThinkPad-T480s>
References: <20210112001623.28421-1-sstabellini@kernel.org> <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Julien Grall wrote:
> > +    aarch32 = c->pfr64.el1 == 2;
> 
> This is checking that AArch32 is available in EL1. However, it may not be the
> case yet it would be available in EL0.
> 
> As a consequence, 32-bit userspace wouldn't work properly after this patch.
> 
> The Arm Arm mandates that if AArch32 is available at EL(n), then it must be
> available at EL(n - 1).
> 
> So we should check that AArch32 is available at EL0 because this would
> cover the case where AArch32 is enabled at EL1.

OK


> Furthermore, I would also like to avoid hardcoding value in the code as it is
> less readable. We already define cpu_has_el0_32 which use the boot CPU
> feature. Maybe we want to expand the macro or split it?

I agree

Technically, cpu_has_el0_32 works as is, because it is called after
boot_cpu_data has been updated. So we could just use it. What do you
think?


> >   #endif
> >   +    if ( aarch32 )
> I read this check as "If AArch32 is not available at any EL". But you are
> checking whether it is available at a given level. So I would suggest to
> suffix with the EL for clarification.
> 
> In this case, I think you will want to call it aarch32_el0.

OK

