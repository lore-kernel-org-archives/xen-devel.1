Return-Path: <SRS0=ZtLg=IN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DF9C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 20:01:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2449E64DDF
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 20:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2449E64DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98110.185969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtOx-0006B4-Ca; Mon, 15 Mar 2021 20:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98110.185969; Mon, 15 Mar 2021 20:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtOx-0006Ax-9g; Mon, 15 Mar 2021 20:01:19 +0000
Received: by outflank-mailman (input) for mailman id 98110;
 Mon, 15 Mar 2021 20:01:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KFh+=IN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lLtOv-0006As-Iv
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 20:01:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e58bf83-4a0b-4822-9ae9-07b4b82eb3b3;
 Mon, 15 Mar 2021 20:01:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4097F64E83;
 Mon, 15 Mar 2021 20:01:11 +0000 (UTC)
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
X-Inumbo-ID: 6e58bf83-4a0b-4822-9ae9-07b4b82eb3b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615838471;
	bh=5zCDEeEQ4HUmsoTFLwNHrSDDax9OLrpOT79hlauQfuw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hbG5T1H7SK/sE5DyN5A2RwZfcyyeiJTSOptybqszKc/s4djbdUXRRvNMzs8yyci4I
	 Zn3rVn7cJkKuqHrumsq3ibWkCsd3maiyTrigc8lrRk00s1w+HZpqDptcevp2/Vj1ny
	 oml3I/a/Sr2twXNGxYbia2C07eGs8CmMq9uyqyzuId3mfzhqGDiQH+6shYuahsznY+
	 JQm6Mx2nff2aCxZrVxcftwh97FMfVshpwFgXXLKBFUz+4g5StzlD2fQuC1k3pMEtyB
	 YzTlE4IRL9PpBTTTBUEU/1vvBFPEBXqKC9BzmSc9d990YwQlWOOfogSVq79/oTo2Bb
	 sqekb4mrjLcJA==
Date: Mon, 15 Mar 2021 13:01:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com>
Message-ID: <alpine.DEB.2.21.2103151259550.5325@sstabellini-ThinkPad-T480s>
References: <20210312231632.5666-1-sstabellini@kernel.org> <0e35a613-fd93-0805-10b9-5ecee73bb15d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Mar 2021, Jan Beulich wrote:
> On 13.03.2021 00:16, Stefano Stabellini wrote:
> > Introduce two feature flags to tell the domain whether it is
> > direct-mapped or not. It allows the guest kernel to make informed
> > decisions on things such as swiotlb-xen enablement.
> > 
> > The introduction of both flags (XENFEAT_direct_mapped and
> > XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> > guesswork if one of the two is present, or fallback to the current
> > checks if neither of them is present.
> > 
> > XENFEAT_direct_mapped is always set for not auto-translated guests.
> > 
> > For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> > see is_domain_direct_mapped() which refers to auto-translated guests:
> > xen/include/asm-arm/domain.h:is_domain_direct_mapped
> > xen/include/asm-x86/domain.h:is_domain_direct_mapped
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: jbeulich@suse.com
> > CC: andrew.cooper3@citrix.com
> > CC: julien@xen.org
> 
> Any particular reason my previously given R-b isn't here?

Hi Jan,

I reworded part of the comment in the public header, and I decided to
err on the side of caution and not add your R-b given this change
compared to the previous version.

