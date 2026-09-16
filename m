Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C640C982C4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 14:37:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423232.1648458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qlK-0002ds-9H; Wed, 16 Sep 2026 14:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423232.1648458; Wed, 16 Sep 2026 14:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6qlK-0002dl-6h; Wed, 16 Sep 2026 14:37:26 +0000
Received: by outflank-mailman (input) for mailman id 1423232;
 Wed, 16 Sep 2026 14:37:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x6qlJ-0002df-A6
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:37:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6qlI-006AYu-NM
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 16:37:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aaaa998-e002-0a2a0a5209dd-0a2a45098080-18
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:37:23 +0200
Received: from [18.216.144.57] (helo=yurei.relay-egress.a.mail.umich.edu)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aaaa9a1-be1a-0a2a45090019-12d89039d6de-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 16:37:22 +0200
Received: from ecstatic-alux.authn-relay.a.mail.umich.edu
 (ip-10-0-74-47.us-east-2.compute.internal [10.0.74.47])
 by yurei.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AAAA9A1.1E50635C.618204D5.233540; Wed, 16 Sep 2026 10:37:21 -0400
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com
 [74.125.229.205])
 by ecstatic-alux.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AAAA9A0.2E70A683.26708D96.1774539;
 Wed, 16 Sep 2026 10:37:21 -0400
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b5e4f16f15so998934e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:37:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-1 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-1; t=1789569441;
	bh=vP+kDBT3fDlaM1JatwsC88YOWaDz4s5Z7/lGCUT6FhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ky+OuugVuJ0MzL1iA14kHDvNtgz+hP01ZLALPKmTkDqzjwEJPbU1imxDtcUIdpCny
	 dZrC1sIfF+x8suEgLwZZDhuGzyS1o9ltW+0AuIPV89sdQWAfSPtw+J02JaaX6M+nxD
	 Rzt/3wFjvOG+ta9KtshzJ454WCYDHGTcU/uaLbVfq93/W9RQGf7m3WzWuqDvX2J0NJ
	 3QIL0R1wL8Z2hvzFaUoOKkzUHHsFIA+e284ESF0rWZocxsgMo0XP0UxwfzqAitPEUg
	 TTNFY0myNVwtiUVfLENr58fdEanFV4FyF8+OrLTlNedBZv8t+yKCsWXEdYCEbUFATK
	 a2h0ZZEMzBmiw==
Authentication-Results: ecstatic-alux.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=74.125.229.205 (mail-lf2-f13.google.com);
	auth=pass smtp.auth=dunlapg
X-Gm-Message-State: AFuF++mXaWBLQvidhG78lTosF0z1P0AEMVGnyRr6xiUt57n8UUAnSjku
	vkmTJVOh5PoQ6FCDTjTjM8lMFs994Y7FLFVtDlaQ4THFyN3dTJiPHk4QzGqoSvRPY+ZRcQu5VSo
	5psyEchdWflVJ88ogkUpeGHvawCgNZis=
X-Received: by 2002:a05:6512:1318:b0:5b6:6af:4e0e with SMTP id
 2adb3069b0e04-5b8b661a3edmr1650433e87.3.1789569438962; Wed, 16 Sep 2026
 07:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <aa19318c-c91a-4cda-b36f-d2049914c42c@suse.com> <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
In-Reply-To: <f0cd81c0-81d2-4273-a2c8-736ce976670a@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 16 Sep 2026 16:37:07 +0200
X-Gmail-Original-Message-ID: <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
X-Gm-Features: AcwNN1X5QMHHfcnSweQ5rKXLNR7hvpsajkA_-RQeX4gjj6EBXTUkoQKndkEGB-s
Message-ID: <CAFLBxZbhF8=1RC4-6jXnaVYjxxk6aGTadA_kaCLbfop2xqYyuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] EFI: avoid OOB config file reads
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Marek Marczykowski <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1789569443-BF4D3034-779651D1/0/0
X-purgate-type: clean
X-purgate-size: 1104

On Wed, Mar 25, 2026 at 2:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> @@ -878,6 +882,23 @@ static bool __init read_section(const EF
>
>      file->ptr =3D ptr;
>
> +    /* For cfg file, if necessary allocate space to put an extra NUL the=
re. */
> +    if ( file =3D=3D &cfg && file->size && !iscntrl(file->str[file->size=
 - 1]) )
> +    {
> +        EFI_PHYSICAL_ADDRESS addr;
> +        EFI_STATUS ret =3D efi_bs->AllocatePages(AllocateMaxAddress,
> +                                               EfiLoaderData,
> +                                               PFN_UP(file->size + 1), &=
addr);

efiapi.h lists the Memory parameter as OUT, but that seems to be a
mistake; the UEFI spec [1] says this is IN OUT; and the other two
callers of AllocatePages in Xen initialize the value before passing it
in.  So we should probably fix both efiapi.h, and initialize this to
an appropriate value, rather than passing in stack rubble.

Discovered by sashiko+Opus.

 -George

[1] https://uefi.org/sites/default/files/resources/UEFI%20Spec%202.8B%20May=
%202020.pdf

