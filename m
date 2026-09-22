Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FD2C98304
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 05:59:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428121.1650815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tWi-0003S3-Vd; Tue, 22 Sep 2026 05:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428121.1650815; Tue, 22 Sep 2026 05:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tWi-0003Rw-Ss; Tue, 22 Sep 2026 05:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1428121;
 Tue, 22 Sep 2026 05:58:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1x8tWh-0003Rq-56
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 05:58:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8tWe-008aJw-9r
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:58:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab2190a-e002-0a2a0a5209dd-0a2a4507bb50-6
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:58:44 +0200
Received: from [140.77.166.138] (helo=sonata.ens-lyon.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=//xF=HO=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 6ab21913-b4ea-0a2a45070019-8c4da68a9d3a-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:58:44 +0200
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A0251A1B39;
 Tue, 22 Sep 2026 07:58:43 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8216Fqrn58Z; Tue, 22 Sep 2026 07:58:43 +0200 (CEST)
Received: from end (unknown [212.133.41.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 30F47A1AB4;
 Tue, 22 Sep 2026 07:58:43 +0200 (CEST)
Received: from samy by end with local (Exim 4.100)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1x8tWc-00000005kqi-06Ue; Tue, 22 Sep 2026 07:58:42 +0200
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
	t=1790056723; bh=kB21aFMYP3Wne3A5TEiMM2DbLMErC5eSQEttNviZ/58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chz+wkXslWRW8Wj9Ol4P6vplS/tMsVh0ADnWHDSg49QFO2jJSaHbZkFOu1So18xQK
	 hQwUjlwFKhVcCKwnWBXc838/D8jEPNutG6oHPCYaJyQLtmDpmfSuN3xqh+Mha7zMnv
	 brAkv9CtXAHPk0UwcQRatRPsA1qvjrlhbaA44Zu9AFKXzRkoq1df5tQDx+5gzm9hwS
	 TG8k7dk1LkhbijO3WYmCTyxC2qw+D+32ZL6MzUXeXKedWynZwl21w77ET8A8rF/L/u
	 bv+rnqeRvrp38ant23myEpEvjlhj65cKaqCGinE0PHk6ScWt7iKN0H//26OqhSXbMO
	 ZQYbKfrpZDGQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790056723; bh=kB21aFMYP3Wne3A5TEiMM2DbLMErC5eSQEttNviZ/58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chz+wkXslWRW8Wj9Ol4P6vplS/tMsVh0ADnWHDSg49QFO2jJSaHbZkFOu1So18xQK
	 hQwUjlwFKhVcCKwnWBXc838/D8jEPNutG6oHPCYaJyQLtmDpmfSuN3xqh+Mha7zMnv
	 brAkv9CtXAHPk0UwcQRatRPsA1qvjrlhbaA44Zu9AFKXzRkoq1df5tQDx+5gzm9hwS
	 TG8k7dk1LkhbijO3WYmCTyxC2qw+D+32ZL6MzUXeXKedWynZwl21w77ET8A8rF/L/u
	 bv+rnqeRvrp38ant23myEpEvjlhj65cKaqCGinE0PHk6ScWt7iKN0H//26OqhSXbMO
	 ZQYbKfrpZDGQQ==
Date: Tue, 22 Sep 2026 07:58:41 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
Message-ID: <arIZEeYpAwSTUcrb@end>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <aq6_Cebyee8IHN8p@end>
 <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com>
Organization: I am not organized
X-purgate-ID: tlsNG-ef75cf/1790056724-368D9AE4-918F4A22/0/0
X-purgate-type: clean
X-purgate-size: 2389

Jürgen Groß, le lun. 21 sept. 2026 15:07:36 +0200, a ecrit:
> On 19.09.26 18:57, Samuel Thibault wrote:
> > I have submitted the pciutils MiniOS port to upstream (which I should
> > probably have done 18 years ago :)
> > 
> > https://github.com/pciutils/pciutils/pull/235
> > https://github.com/pciutils/pciutils/pull/236
> > 
> > Jan Beulich, le mer. 19 août 2026 08:40:37 +0200, a ecrit:
> > > On 18.08.2026 23:42, Samuel Thibault wrote:
> > > > Jürgen Groß, le mar. 18 août 2026 07:43:34 +0200, a ecrit:
> > > > > On 17.08.26 18:37, Samuel Thibault wrote:
> > > > > > Juergen Gross, le lun. 17 août 2026 10:24:02 +0200, a ecrit:
> > > > > What about adding a comment to the stubdom Makefile in a separate patch, like:
> > > > > 
> > > > > # pciutils support has been removed with commit <commit-id>, revert that patch
> > > > > # in case it is needed again.
> > > > > 
> > > > > I think this would be preferable over unused and probably bit-rotten code in
> > > > > the repository.
> > 
> > We can point people to pciutils through such a comment.
> > 
> > Jürgen Groß, le mer. 19 août 2026 09:12:00 +0200, a ecrit:
> > > On 18.08.26 23:42, Samuel Thibault wrote:
> > > > I don't see why it would be bit-rotten, since the pciutils version in
> > > > used is fixed, it's a library that has a quite stable API, and the pci
> > > > xen interface is supposed to keep backward compatibility.
> > > 
> > > Then I'd rather add it to Mini-OS (probably behind another CONFIG option) than
> > > having it in the Xen tree.
> > 
> > Mmm, but how? We don't really want to pull the whole pciutils build into
> > mini-os :)
> 
> TBH, I don't see why the whole Mini-OS specific stubdom maze should be in the
> Xen repository.

It used to be at least because Xen itself was using stubdom for ioemu.

Nowadays stubdom-ioemu is away, but stubdom/ still builds xenstore,
so it makes sense that it's xen that builds it along building the
non-stubdom version.

> Thinking about the hoops I had to jump through for doing some
> of the Mini-OS cleanups (especially regarding config options), having all of
> the stubdom stuff in Mini-OS or an extra repository would probably be cleaner.

I don't really see how that will help with the config options
management? It will however make its buildability checks less apparent
to xen developers.

Samuel

