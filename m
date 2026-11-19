Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E913606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 01:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M2Cor8iJ
Received: from list by lists.xenproject.org with outflank-mailman.1495369.1694337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTqax-0006wC-Ox; Thu, 19 Nov 2026 01:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495369.1694337; Thu, 19 Nov 2026 01:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTqax-0006w4-Kq; Thu, 19 Nov 2026 01:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1495369;
 Thu, 19 Nov 2026 01:05:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTqaw-0006vy-GB
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 01:05:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTqav-00ALXT-LC
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 02:05:45 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afe4b15-e002-0a2a0a5209dd-0a2a450bd3a8-40
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:05:45 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afe4b67-b7e8-0a2a450b0019-aceafc1feace-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:05:45 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3510643CE6;
 Thu, 19 Nov 2026 01:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0D41F000C5;
 Thu, 19 Nov 2026 01:05:41 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795050343;
	bh=6BYjLH5ai33WYYrPdmW/W85e6ErKd70HuYCbIBHjpyo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=M2Cor8iJXxZAIRpxUDmrXdHDOZyaiJVgn8yKKNFHS9UtWVml5Hu7OJ6TZlxNBmTGP
	 tY6vqIGpTjO+n7m4ducra9Y3AV3SJV0kSKyTBmIKvpXtCpUCScf9oTBPK15aLkodyx
	 afzCXaplR4EfeEpMwO+Me0kz+dd3yR7CR8owm2jpbQSGhvyHFMbf68uW7s5mG5RgHK
	 SuXEGAs+lWd/oqH4ZhZJe1kiS3bfhOY+26kUVZynNWto7UmXFUc47PaKPPgTZZsM5p
	 1BP6hi899PUy+ZqnLnhARt0btmb/PXI2woXZLatDDQS4AE58esedtQK7at1srfp5z4
	 w5Qmh4N6ss3QA==
Date: Wed, 18 Nov 2026 17:05:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
In-Reply-To: <1e6283ce-bbe2-4ce9-8d17-22b15f24b3d4@suse.com>
Message-ID: <128715f1-7bc8-5f5b-c339-5f7805914a25@kernel.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com> <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com> <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com> <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
 <a2224fcb-e529-4b24-9ee2-2050511cb801@citrix.com> <0f36dd5e-eb09-411f-9ba0-8aa29b4c1e5f@kernel.org> <1e6283ce-bbe2-4ce9-8d17-22b15f24b3d4@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1194654915-1795050343=:2648157"
X-purgate-ID: tlsNG-42698a/1795050345-1A4DB9EA-9E3A60C8/0/0
X-purgate-type: clean
X-purgate-size: 4546
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1194654915-1795050343=:2648157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Nov 2026, Jan Beulich wrote:
> On 17.11.2026 23:35, Stefano Stabellini wrote:
> > On Tue, 17 Nov 2026, Andrew Cooper wrote:
> >> On 17/11/2026 8:01 pm, Dmytro Prokopchuk wrote:
> >>> On 11/4/26 13:24, Andrew Cooper wrote:
> >>>> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
> >>>>> Livepatch passes const-qualified pointers from struct payload to
> >>>>> xfree()
> >>>>> and vfree(), which take a 'void *' argument. The cast that removes the
> >>>>> const qualifier is a violation of MISRA C Rule 11.8.
> >>>>>
> >>>>> Such casts are safe.  The deallocation functions neither read nor write
> >>>>> the content of the object being freed, and the object is not accessed
> >>>>> after it has been freed.
> >>>>
> >>>> I have a very firm objection to this.
> >>>>
> >>>> It is impossible for any allocation from malloc()/calloc()/etc to point
> >>>> to read-only memory, which is why free() takes a mutable pointer, not a
> >>>> const pointer.  The same is true of any other heap implementation.
> >>>>
> >>>> It is impossible to make an object in read-only memory undefined.
> >>>> Objects in read-only memory by definition have a global lifetime, and it
> >>>> is absurd to argue that a specific heap implementation ought to permit
> >>>> making such objects undefined.
> >>>>
> >>>>
> >>>> The bug here is livepatch storing a heap allocation in a const pointer.
> >>>>
> >>>> This comes from deeper problem where some contributors/reviewers want
> >>>> the const keyword to mean something it doesn't.
> >>>>
> >>>> ~Andrew
> >>>
> >>> Jan, Andrew,
> >>>
> >>> thanks for the review.  Given the disagreement, I will drop this
> >>> deviation for now.
> >>>
> >>> If the preferred fix is to stop storing heap allocations in
> >>> const-qualified members of 'struct payload' (so the casts go away), I
> >>> can prepare a follow-up patch.  Please confirm that is the direction
> >>> you want for livepatch.
> >>
> >> Please remove the const qualification in struct payload.  The logic
> >> should not have been accepted in that state to begin with.
> >>
> >> This is the only course of action here which does not create a class of
> >> undefined behaviour, or permit said undefined behaviour to go unnoticed.
> > 
> > I agree with Andrew. xfree() does write into the freed block, so a
> > const parameter would be misleading.
> 
> Well, this is the point: Yes, xfree() modifies the underlying memory. But
> no, it does not modify the object a pointer to which was passed into it.
> That object simply ceases to exist. And what C is concerned about are
> objects, not the underlying memory.
> 
> I also still don't quite understand why Andrew considers such uses of
> const wrong: I don't think the spec says anything in this regard, and the
> C library's free() taking plain void * can easily be seen as heritage.
> Using const like this properly conveys to compiler and readers that post-
> allocation / -population such objects aren't supposed to be altered
> again. Together with forbidding the casting away of const-ness, this
> serves as an extra level of safety of the code overall.


From a theoretical perspective I don't disagree with you, but there are
two problems.

First, in this specific case the const in struct payload is wrong
regardless of the xfree() question: these fields are not read-only.
rw_addr and text_addr are owning pointers to mutable buffers.

Second, I would agree with you if free/unmap functions could take a
pointer-to-const without casting const away internally. That is the case
for vunmap() and unmap_domain_page(), which only use the pointer as an
address, and it would be the case for vfree(), since _vfree() already
takes const void *. It is not the case for xfree(). A const parameter
would just move the Rule 11.8 cast from the callers into the allocator.
This is not a good idea.

So I think we should remove the const from those livepatch fields, that
removes all six casts without any deviation. I don't mind adding const
to vfree(), xvfree(), or other functions where it doesn't require
casting const away in the implementation, but I don't think xfree()
should be one of them.
--8323329-1194654915-1795050343=:2648157--

