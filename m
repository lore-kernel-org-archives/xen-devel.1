Return-Path: <SRS0=JVsS=MF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9414AC07E95
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 20:53:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7E561006
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 20:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7E561006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155785.287529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3PP3-00087o-07; Tue, 13 Jul 2021 20:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155785.287529; Tue, 13 Jul 2021 20:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3PP2-00087h-TA; Tue, 13 Jul 2021 20:53:16 +0000
Received: by outflank-mailman (input) for mailman id 155785;
 Tue, 13 Jul 2021 20:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3PP1-00087b-0m
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 20:53:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56a480d3-e41c-11eb-87a8-12813bfff9fa;
 Tue, 13 Jul 2021 20:53:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C707461361;
 Tue, 13 Jul 2021 20:53:12 +0000 (UTC)
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
X-Inumbo-ID: 56a480d3-e41c-11eb-87a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626209593;
	bh=15ztVRw4fL4NoOfnw2UqTKcOMLRZiU9h0eKF8KSinwg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IC5ZQAsPlxBwygOKzqiXitl/E1RUiHRzqlic8TuFPXejCcwZJkHbF7qKTV1cZXY6g
	 1V3HOhDK+aqg13JvmkmRCBKaK2rg8ls0VGEKfIWyXiTogdfS9CAXQz+8oFwQPGQRs1
	 TpQTMrGQnhK4cT1ENQkToJSfZNB9eL1/VVWXUchau379BfQItZGurj2iw6+9vB5evG
	 mGMUq7AcXdvJ1xdcx7V4gHY4nokp18BOCiTCa8gtd0hg2zWMnPNlKVbMGs29zLOc2s
	 JAvvSBgXPdRnFMMTzKyr3NkEAb1yPd4DLF1UVivHgC04mNuNACDrh13z+0MjVcalsJ
	 RJLVqG7F5oSpQ==
Date: Tue, 13 Jul 2021 13:53:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 02/15] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
In-Reply-To: <9397d94d-5a22-c026-7c66-400b7397c2fa@xen.org>
Message-ID: <alpine.DEB.2.21.2107131353000.23286@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-3-julien@xen.org> <alpine.DEB.2.21.2105111515470.5018@sstabellini-ThinkPad-T480s> <94e364a7-de40-93ab-6cde-a2f493540439@xen.org> <alpine.DEB.2.21.2105121425500.5018@sstabellini-ThinkPad-T480s>
 <e834b447-46c2-14fe-a39c-209d4d6ca5fe@xen.org> <alpine.DEB.2.21.2105131533070.5018@sstabellini-ThinkPad-T480s> <9397d94d-5a22-c026-7c66-400b7397c2fa@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 3 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> Sorry for the late answer.
> 
> On 13/05/2021 23:44, Stefano Stabellini wrote:
> > On Wed, 12 May 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 12/05/2021 22:30, Stefano Stabellini wrote:
> > > > On Wed, 12 May 2021, Julien Grall wrote:
> > > > > > > +#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
> > > > > > > +#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
> > > > > > > +#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> > > > > > > 
> > > > > > > +#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> > > > > > > +#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> > > > > > > +#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> > > > > > > +#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> > > > > > 
> > > > > > I would avoid adding these 4 macros. It would be OK if they were
> > > > > > just
> > > > > > used within this file but lpae.h is a header: they could end up be
> > > > > > used
> > > > > > anywhere in the xen/ code and they have a very generic name. My
> > > > > > suggestion would be to skip them and just do:
> > > > > 
> > > > > Those macros will be used in follow-up patches. They are pretty useful
> > > > > to
> > > > > avoid introduce static array with the different information for each
> > > > > level.
> > > > > 
> > > > > Would prefix them with XEN_ be better?
> > > > 
> > > > Maybe. The concern I have is that there are multiple page granularities
> > > > (4kb, 16kb, etc) and multiple page sizes (4kb, 2mb, etc). If I just see
> > > > LEVEL_ORDER it is not immediately obvious what granularity and what size
> > > > we are talking about.
> > > 
> > > I am a bit puzzled with your answer. AFAIU, you are happy with the
> > > existing
> > > macros (THIRD_*, SECOND_*) but not with the new macros.
> > > 
> > > In reality, there is no difference because THIRD_* doesn't tell you the
> > > exact
> > > size but only "this is a level 3 mapping".
> > > 
> > > So can you clarify what you are after? IOW is it reworking the current
> > > naming
> > > scheme?
> > 
> > You are right -- there is no real difference between THIRD_*, SECOND_*
> > and LEVEL_*.
> > 
> > The original reason for my comments is that I hadn't read the following
> > patches, and the definition of LEVEL_* macros is simple, they could be
> > open coded. It looked like they were only going to be used to make the
> > definition of THIRD_*, SECOND_* a bit easier. So, at first, I was
> > wondering if they were needed at all.
> > 
> > Secondly, I realized that they were going to be used in *.c files by
> > other patches. That's why they are there. But I started thinking whether
> > we should find a way to make it a bit clearer that they are for Xen
> > pages, currently at 4KB granularity. THIRD_*, SECOND_*, etc. are already
> > generic names which don't convey the granularity or whether they are Xen
> > pages at all. But LEVEL_* seem even more generic.
> > 
> > As I mentioned, I don't have any good suggestions for changes to make
> > here, so unless you can come up with a good idea let's keep it as is.
> 
> I am thinking to use the following naming (diff on top of this patch):
> 
> -#define LPAE_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
> -#define LPAE_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
> -#define LPAE_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> +#define XEN_PT_SHIFT          LPAE_SHIFT_GS(PAGE_SHIFT)
> +#define XEN_PT_ENTRIES        LPAE_ENTRIES_GS(PAGE_SHIFT)
> +#define XEN_PT_ENTRY_MASK     LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
> 
> -#define LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> -#define LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> -#define LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> -#define LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_SHIFT(lvl)    LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_ORDER(lvl)    LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_SIZE(lvl)     LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
> +#define XEN_PT_LEVEL_MASK(lvl)     (~(LEVEL_SIZE(lvl) - 1))
> 
>  /* Convenience aliases */
> -#define THIRD_SHIFT         LEVEL_SHIFT(3)
> -#define THIRD_ORDER         LEVEL_ORDER(3)
> -#define THIRD_SIZE          LEVEL_SIZE(3)
> -#define THIRD_MASK          LEVEL_MASK(3)
> -
> -#define SECOND_SHIFT        LEVEL_SHIFT(2)
> -#define SECOND_ORDER        LEVEL_ORDER(2)
> -#define SECOND_SIZE         LEVEL_SIZE(2)
> -#define SECOND_MASK         LEVEL_MASK(2)
> -
> -#define FIRST_SHIFT         LEVEL_SHIFT(1)
> -#define FIRST_ORDER         LEVEL_ORDER(1)
> -#define FIRST_SIZE          LEVEL_SIZE(1)
> -#define FIRST_MASK          LEVEL_MASK(1)
> -
> -#define ZEROETH_SHIFT       LEVEL_SHIFT(0)
> -#define ZEROETH_ORDER       LEVEL_ORDER(0)
> -#define ZEROETH_SIZE        LEVEL_SIZE(0)
> -#define ZEROETH_MASK        LEVEL_MASK(0)
> +#define THIRD_SHIFT         XEN_PT_LEVEL_SHIFT(3)
> +#define THIRD_ORDER         XEN_PT_LEVEL_ORDER(3)
> +#define THIRD_SIZE          XEN_PT_LEVEL_SIZE(3)
> +#define THIRD_MASK          XEN_PT_LEVEL_MASK(3)
> +
> +#define SECOND_SHIFT        XEN_PT_LEVEL_SHIFT(2)
> +#define SECOND_ORDER        XEN_PT_LEVEL_ORDER(2)
> +#define SECOND_SIZE         XEN_PT_LEVEL_SIZE(2)
> +#define SECOND_MASK         XEN_PT_LEVEL_MASK(2)
> +
> +#define FIRST_SHIFT         XEN_PT_LEVEL_SHIFT(1)
> +#define FIRST_ORDER         XEN_PT_LEVEL_ORDER(1)
> +#define FIRST_SIZE          XEN_PT_LEVEL_SIZE(1)
> +#define FIRST_MASK          XEN_PT_LEVEL_MASK(1)
> +
> +#define ZEROETH_SHIFT       XEN_PT_LEVEL_SHIFT(0)
> +#define ZEROETH_ORDER       XEN_PT_LEVEL_ORDER(0)
> +#define ZEROETH_SIZE        XEN_PT_LEVEL_SIZE(0)
> +#define ZEROETH_MASK        XEN_PT_LEVEL_MASK(0)
> 
> I don't plan to modify the nameing for ZEROETH*, FIRST*, SECOND*, THIRD*.
> 
> Let me know if you prefer it over the currrent naming.

Yes, I think it is better, thanks!

