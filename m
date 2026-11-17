Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFD606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 22:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqBxY+PA
Received: from list by lists.xenproject.org with outflank-mailman.1493326.1693372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRlo-00071T-07; Tue, 17 Nov 2026 22:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493326.1693372; Tue, 17 Nov 2026 22:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRln-00071M-TX; Tue, 17 Nov 2026 22:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1493326;
 Tue, 17 Nov 2026 22:35:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTRlm-00071G-Vz
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:35:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTRll-00DbRC-Qm
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:35:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcd689-2eae-0a2a0a5409dd-0a2a450ae12c-16
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:35:17 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcd6a4-f2d2-0a2a450a0019-ac6904fee638-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:35:17 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AB5DD61D11;
 Tue, 17 Nov 2026 22:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21011F000C4;
 Tue, 17 Nov 2026 22:35:12 +0000 (UTC)
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
	s=k20260515; t=1794954915;
	bh=KCiCw37Ji+/nCeVmBlwJ+uZBN4WSD8WG43C0TLEadx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=SqBxY+PA9nzPpFXYV8l2uJIc8dNwUm9rZu43flI8chB2YPR61tYsrwXeYIxQf9Q6K
	 3algxRJZ7knx4XUTA90ArRhXkQqHBG61v3ppEMkl3WkNutLQh5q9ZtFpcWmGO9IPfx
	 f6934BxMckILSS9d6yrZ5xYvdsONDgivVw0cZUm9Nl5fI2iStIIcpMjYblf26W/1BJ
	 ikaKg+Vp0sNpjBeuMYYrslprnFxDLE9yYMs0Lgq4KGWQqyIkjPu80CTmD9UTOGjJ3M
	 sa69UlG023PdI/rwOYoCYb2T//LUsybUqpPkKoNehsxxnaMC6UyVlp6Ug8bV/Ecwcu
	 nqMpQ/b8GpA/w==
Date: Tue, 17 Nov 2026 14:35:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
In-Reply-To: <a2224fcb-e529-4b24-9ee2-2050511cb801@citrix.com>
Message-ID: <0f36dd5e-eb09-411f-9ba0-8aa29b4c1e5f@kernel.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com> <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com> <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com> <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
 <a2224fcb-e529-4b24-9ee2-2050511cb801@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-69202773-1794954915=:1952475"
X-purgate-ID: tlsNG-4011c0/1794954917-51CC3CFC-75590A7B/0/0
X-purgate-type: clean
X-purgate-size: 3218
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-69202773-1794954915=:1952475
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 17 Nov 2026, Andrew Cooper wrote:
> On 17/11/2026 8:01 pm, Dmytro Prokopchuk wrote:
> >
> >
> > On 11/4/26 13:24, Andrew Cooper wrote:
> >> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
> >>> Livepatch passes const-qualified pointers from struct payload to
> >>> xfree()
> >>> and vfree(), which take a 'void *' argument. The cast that removes the
> >>> const qualifier is a violation of MISRA C Rule 11.8.
> >>>
> >>> Such casts are safe.  The deallocation functions neither read nor write
> >>> the content of the object being freed, and the object is not accessed
> >>> after it has been freed.
> >>
> >> I have a very firm objection to this.
> >>
> >> It is impossible for any allocation from malloc()/calloc()/etc to point
> >> to read-only memory, which is why free() takes a mutable pointer, not a
> >> const pointer.  The same is true of any other heap implementation.
> >>
> >> It is impossible to make an object in read-only memory undefined.
> >> Objects in read-only memory by definition have a global lifetime, and it
> >> is absurd to argue that a specific heap implementation ought to permit
> >> making such objects undefined.
> >>
> >>
> >> The bug here is livepatch storing a heap allocation in a const pointer.
> >>
> >> This comes from deeper problem where some contributors/reviewers want
> >> the const keyword to mean something it doesn't.
> >>
> >> ~Andrew
> >
> > Jan, Andrew,
> >
> > thanks for the review.  Given the disagreement, I will drop this
> > deviation for now.
> >
> > If the preferred fix is to stop storing heap allocations in
> > const-qualified members of 'struct payload' (so the casts go away), I
> > can prepare a follow-up patch.  Please confirm that is the direction
> > you want for livepatch.
> 
> Please remove the const qualification in struct payload.  The logic
> should not have been accepted in that state to begin with.
> 
> This is the only course of action here which does not create a class of
> undefined behaviour, or permit said undefined behaviour to go unnoticed.

I agree with Andrew. xfree() does write into the freed block, so a
const parameter would be misleading.

The real issue is livepatch keeping owned heap allocations in const
pointers. text_addr, symtab and strtab all come from non-const
allocations, so dropping const from those three fields of struct
payload removes all six casts, with no deviation needed.

If the issue were more widespread I would also consider a deviation but
with wording like:

Casting away the const qualifier from the argument of the memory
deallocation functions xfree() and vfree() is safe. The pointer always
refers to memory obtained from the corresponding allocator, which is
never an object defined as const, and the object's lifetime ends with
the call, so no access through a const-qualified lvalue can follow.
--8323329-69202773-1794954915=:1952475--

