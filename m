Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D1C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 21:42:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394448.1633224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRZv-0004ka-9V; Tue, 18 Aug 2026 21:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394448.1633224; Tue, 18 Aug 2026 21:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRZv-0004kT-6Y; Tue, 18 Aug 2026 21:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1394448;
 Tue, 18 Aug 2026 21:42:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1wwRZt-0004kN-Vs
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 21:42:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwRZs-00EUQs-R4
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 23:42:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a84d1b9-8faa-0a2a0a5109dd-0a2a45038056-22
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:42:36 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=bUIi=GL=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6a84d1cc-fae8-0a2a45030019-8c4da68ae8c6-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:42:36 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 128B1A200A;
 Tue, 18 Aug 2026 23:42:36 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyoXCDi8SP28; Tue, 18 Aug 2026 23:42:35 +0200 (CEST)
Received: from end (154.106.204.77.rev.sfr.net [77.204.106.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D3D35A1BDD;
 Tue, 18 Aug 2026 23:42:35 +0200 (CEST)
Received: from samy by end with local (Exim 4.99.4)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1wwRZr-0000000EP4U-0c6w; Tue, 18 Aug 2026 23:42:35 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"; dkim=pass header.s=dkim header.d=ens-lyon.org header.i="@ens-lyon.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787089356; bh=u0wtUDEHncuW6Fp1nGWZCWv2wCiM+0+Jb/QHUqajQ0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhDDzPMhBapBj9DChIF6WfWgYTrqDXqaXROCuv7CIz2/aqjh4aq/rJ5mSSPOn9NxI
	 6WkIu+NlxIYqW1zX7U9v/FfP1NsYoSaMkw7qEYrLof2KPbNxWvPPMmezVKxdfgsTRM
	 n2vivBGih3K0nE/NnxYCM9lQLT7A0fhWsI0oNrhoBmfL7KZjQhnia7guAc00cEZ7Jv
	 1+MkYkxPwPznFaLsPyNRa/dHeZOlImf01k+OkS/qOhoySC4r/j+plhS3OkoZDoub4Z
	 bLZA9b7rFlZsx6ANTjyf6zl7BLaNy1/JsKZQXb2gL1Uo9Pt8M8b/miPDfYZLZoMicT
	 UhDLKlOD9VQ4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1787089355; bh=u0wtUDEHncuW6Fp1nGWZCWv2wCiM+0+Jb/QHUqajQ0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BW89mVgO6/5z3w4dHv9QMWzk5es0v2YHwWXjQ21DYp+cEUnKlJd560NOokuOEeYj2
	 CkyTQQPdjSOHiMr2K/R/Y/IRsNkGozOx7ZRdmv4gwH4uKdDC6DglM7CbArNnxk5eWj
	 jIwz+MxQOG4wPpUKiTaDBeth+1ZDWR4rsnF7PrPk6BBDgE3TCv1knNA+rfeZmdi5Zr
	 0qvDdf/DvGLR752E25Hncjv6gOZBiSlkQCB0ksXv0yDszxNGVQqFYuQFukYaCrxpbv
	 CI+Fg9ydzQxKy+wD5Fj6NcIBwU6wvNMDdAtq5G/UNx2xQd1sZXsMPZQQNplKTEgFyn
	 Zk9ugf8tdbCAQ==
Date: Tue, 18 Aug 2026 23:42:35 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <aoTRyxN4gzsEwJa5@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com>
 <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com>
 <aoM4ufGg8QO51XB9@end>
 <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a9b5ae9-b37b-4a6c-8ee0-7e7571c99fb5@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-33051d/1787089356-6CADC4E9-77A26F84/0/0
X-purgate-type: clean
X-purgate-size: 1652

Jürgen Groß, le mar. 18 août 2026 07:43:34 +0200, a ecrit:
> On 17.08.26 18:37, Samuel Thibault wrote:
> > Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> > > On 17.08.26 09:48, Samuel Thibault wrote:
> > > > Juergen Gross, le lun. 17 août 2026 09:18:41 +0200, a ecrit:
> > > > > There is no user of libpci left in stubdoms.
> > > > > 
> > > > > Remove libpci from the stubdom build system.
> > > > 
> > > > Wouldn't it be useful to keep this for anybody who would want to drive a
> > > > PCI card from a stubdomain?
> > > > 
> > > > I mean, in the zlib case, it's really a mere question of build & link,
> > > > so we don't need to ship it, people can do it themselves easily like for
> > > > any other library.
> > > > 
> > > > But here there is actual porting work, that we'd better not lose but
> > > > keep shipping.
> > > 
> > > This is all still available via git.
> > 
> > No, it is not really.
> > 
> > I keep reading this argument, but people will not know that something
> > exists in the git history, and will just assume that it does not exist
> > and has to be written.
> 
> What about adding a comment to the stubdom Makefile in a separate patch, like:
> 
> # pciutils support has been removed with commit <commit-id>, revert that patch
> # in case it is needed again.
> 
> I think this would be preferable over unused and probably bit-rotten code in
> the repository.

I don't see why it would be bit-rotten, since the pciutils version in
used is fixed, it's a library that has a quite stable API, and the pci
xen interface is supposed to keep backward compatibility.

Samuel

