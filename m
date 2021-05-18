Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2602DC433B4
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 00:37:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C566461369
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 00:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C566461369
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128555.241324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linjm-0006Bz-4O; Tue, 18 May 2021 00:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128555.241324; Tue, 18 May 2021 00:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linjm-0006Bs-0I; Tue, 18 May 2021 00:37:30 +0000
Received: by outflank-mailman (input) for mailman id 128555;
 Tue, 18 May 2021 00:37:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1linjk-0006Bm-D4
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 00:37:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad5faf4a-0344-439e-b3e1-8bb8d6a67239;
 Tue, 18 May 2021 00:37:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E3EE61369;
 Tue, 18 May 2021 00:37:26 +0000 (UTC)
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
X-Inumbo-ID: ad5faf4a-0344-439e-b3e1-8bb8d6a67239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621298246;
	bh=/M5LhQjF5T2pAAu/brxavGChh15xMLHZFxXULsJvDOA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HFV2o0YPT9s35MLRr0aO622YEdUN40Kh/F5ah9jpPHlK2nYqeM42M7QcVTGFVj5M+
	 5NquKipzijCa7TsA7XX8iIg+tgmbF/dT+aCSg/LxCM49ta7a6cOtXfReBWCl0FEo/9
	 cHrxdeULToU3C0oVOWRR0NkSl7WY9OgF2/0DbBjN8v6vdjnQLi+MLIsrQxdCCSTqUJ
	 F50eDjDIesL1f1jjzAzs6wth7KCOGSVdC2xsxrNH/DbVvQRLh41GAyHnaP3Rc1afUn
	 mz7AUkgszdvl8cilU2g07mrAoEuDM+fWORxJG7MLEdg516EzwEmPFvwVbT6iJXuesN
	 V2m3mJPe0y/8A==
Date: Mon, 17 May 2021 17:37:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 10/15] xen/arm: mm: Allocate xen page tables in
 domheap rather than xenheap
In-Reply-To: <602bea61-9db2-a27d-1fed-001e2b5b2176@xen.org>
Message-ID: <alpine.DEB.2.21.2105171736450.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-11-julien@xen.org> <alpine.DEB.2.21.2105121529180.5018@sstabellini-ThinkPad-T480s> <9429bec0-8706-42b9-cda6-77adde961235@xen.org> <alpine.DEB.2.21.2105131522030.5018@sstabellini-ThinkPad-T480s>
 <602bea61-9db2-a27d-1fed-001e2b5b2176@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 13/05/2021 23:27, Stefano Stabellini wrote:
> > On Thu, 13 May 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 12/05/2021 23:44, Stefano Stabellini wrote:
> > > > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > > > From: Julien Grall <jgrall@amazon.com>
> > > > > 
> > > > > xen_{un,}map_table() already uses the helper to map/unmap pages
> > > > > on-demand (note this is currently a NOP on arm64). So switching to
> > > > > domheap don't have any disavantage.
> > > > > 
> > > > > But this as the benefit:
> > > > >       - to keep the page tables unmapped if an arch decided to do so
> > > > >       - reduce xenheap use on arm32 which can be pretty small
> > > > > 
> > > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > > 
> > > > Thanks for the patch. It looks OK but let me ask a couple of questions
> > > > to clarify my doubts.
> > > > 
> > > > This change should have no impact to arm64, right?
> > > > 
> > > > For arm32, I wonder why we were using map_domain_page before in
> > > > xen_map_table: it wasn't necessary, was it? In fact, one could even say
> > > > that it was wrong?
> > > In xen_map_table() we need to be able to map pages from Xen binary,
> > > xenheap...
> > > On arm64, we would be able to use mfn_to_virt() because everything is
> > > mapped
> > > in Xen. But that's not the case on arm32. So we need a way to map anything
> > > easily.
> > > 
> > > The only difference between xenheap and domheap are the former is always
> > > mapped while the latter may not be. So one can also view a xenheap page as
> > > a
> > > glorified domheap.
> > > 
> > > I also don't really want to create yet another interface to map pages (we
> > > have
> > > vmap(), map_domain_page(), map_domain_global_page()...). So, when I
> > > implemented xen_map_table() a couple of years ago, I came to the
> > > conclusion
> > > that this is a convenient (ab)use of the interface.
> > 
> > Got it. Repeating to check if I see the full picture. On ARM64 there are
> > no changes. On ARM32, at runtime there are no changes mapping/unmapping
> > pages because xen_map_table is already mapping all pages using domheap,
> > even xenheap pages are mapped as domheap; so this patch makes no
> > difference in mapping/unmapping, correct?
> 
> For arm32, it makes a slight difference when allocating a new page table (we
> didn't call map/unmap before) but this is not called often.
> 
> The main "drop" in performance happened when xen_{,map}_table() was
> introduced.
> 
> > 
> > The only difference is that on arm32 we are using domheap to allocate
> > the pages, which is a different (larger) pool.
> 
> Yes.
> 
> Would you be happy to give you acked-by/reviewed-by on this basis?

Yes

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

