Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF3606A338
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=Gn1gVqTs;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pSbdnjUM
Received: from list by lists.xenproject.org with outflank-mailman.1492640.1693042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTKQF-0001Nn-9Q; Tue, 17 Nov 2026 14:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492640.1693042; Tue, 17 Nov 2026 14:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTKQF-0001Ng-6B; Tue, 17 Nov 2026 14:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1492640;
 Tue, 17 Nov 2026 14:44:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xTKQD-0001Na-7E
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 14:44:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTKQC-001NhN-GJ
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 15:44:32 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6afc684e-2eae-0a2a0a5409dd-0a2a450ce0fc-2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:44:32 +0100
Received: from [103.168.172.146] (helo=fout-a3-smtp.messagingengine.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6afc684a-f479-0a2a450c0019-67a8ac92cc41-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:44:27 +0100
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 1CAA8EC08A7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:44:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 17 Nov 2026 09:44:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 09:44:23 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794926666;
	 x=1795013066; bh=jFAPquhLCBk1ZgOf+jAhUmlcqdeCU5r4QS0v8+3Ronk=; b=
	Gn1gVqTssb0erNawHZM/XjF7qYUf5tM6upRt0Z+IYGbLVqXoYfIRudaic23BiscY
	94va4wkVNQ2pQ0GIzfkR57A0oJ07qSxJ489XpM+gs0ap1NmXM+DajoW2QyF1c/sl
	b7sFSmlc38PFyXajhmQFoOTlhuRQmrBB0bBBMKnKrfbbgonsNCfRPWLtJ4cZnywY
	5+tl1Whbi3ogc+JEytjsq2kFStUKKhDiQc2vnU8ZnIwhBnSd+Z3TNd2pNtmlMfun
	76wuFKWYrcXDb5m1uVp0PdOzc4PWNIM2hon3+eTJzoCpVsv/ZTVocy5skP1jPzhM
	tDncCy08atBITt1hL6k4MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794926666; x=1795013066; bh=jFAPquhLCBk1ZgOf+jAhUmlcqdeCU5r4QS0
	v8+3Ronk=; b=pSbdnjUMOZXOD+6xnT56NO1GifueBzJ4dodaQVRL50qXQ1NJ6vm
	2bxW59EJDXGcSZphDPY70KOP1CxX4PGkvqcZUR1UgIRXFXqk03b/dcEBVaBloaRE
	BfDC7bxOty9HMusvG72gGghlZ1uMu7apIj3EITJ2Z7pwS7My2ZjkukcO6wlid6+3
	JaC5xHJ9QxBSdlxQ1V9sCwv6OfI6Xh0FtEOL004OrEm7XPiqhyNEmyi4QILxChDD
	jMBLGMh9LAvog59iQFlsLd+Xt5O7YfqiQmHyWNP/WuNYB7hpOHec9KdoXKAK8MhX
	x8LlDl6FpzZF5Hz7hrhoIYBfz0rie269n5A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794926666; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm3:rsa-sha256:MV89knqkCkgM07l1VJuHCrVEgCt9bS/iddfUp0nmPbD90/+
	SsSL5EBXaoONZTUNuJcdUAeFDZiOcgDOhOKMimBP9invPEIFbNnF8ACuvh+qYmtF
	w+7CUxRbx8Nnak9Wkcg/M08Ht3TJ8AKpyRffTOFe2s0luZYS/b08Cjo4MoTyKh39
	V3dZI4HWN0gGN5WOiZl5QVbDjxz3prDAB9yQ9hQU4vJ5Mz03yygX4WfkZkqVTIpy
	kXHol8/KyjKmF3FfzmYIOZd2YfY4yglE2zCoxdpMbmiCRJVw4EpPWgucRn8geMZF
	3lI94AHrYgqyjLMppH8rqD+EJQNcUamDOiCjeqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SD5SXMCn4xnUWaZgxhH1T9tV18ybgCKAZBAU4/4Y5Ro=:EJsme7I5DbVfU8UpBy3aNydo+fEYjlWHwvAavUKP+Vg=;
X-ME-Sender: <xms:SWj8amWyRN6wqycfPurdtWzDiB8Q2fHpXLNLnZxgMS6Rn_q1lMj-Dw>
    <xme:SWj8auYd1CMuR-pAhZMNRBQNRgdY-r3RxvLvPw-At6Fc58GJcTKLVcwxmNxfR3ZjC
    KG8IYIjx0SXIqQ3MaTK4JaJfx4x_dZSRByv4Z2YrzLXZr1X>
X-ME-Received: <xmr:SWj8alyYhqDn-ijNTmkQQubAJY8_bHf-w2L--6l-iamdE6Iaz4o5UJ2_bVU9O7FYcfiFMh_EOQFyDST0SOQVpCJgXxiriGKr9DbUDDWdbAw>
X-ME-Proxy-Cause: dmFkZTGun92xhcy/hqfSc7qhredarrI6QFJvXc4ru1ARbWZxeov1klM8aXXnnxQr5aUzPG
    XC+ATaDPfkwTna2C26oDZfxRZxjuPtlbzQhvI+81WACptKKIoVB2pqV7jWzSxzVYGqB/7f
    ahiBi7+N1Ar3sdUuvgDkl6pxLfjlMwyNGoFDrgXBPEXougpqtOKWlO1cQ/wotlthUztrcH
    lnyjpfjlvsdU329TsaT2SytunZbKA7IRKD4zmLbIDsg3O60tGWSnMj5fdEE//UAgXYtR+E
    y3bIhI6OVb9OgA3fUUUKSLEQlACvzzGI+arbDn6UhF7WB/nH/RQC8k5LZzWQ9TdfS3rABA
    2acS5EIC2AV4ciP0fDaY1sosYyvCQ5wA1dG+ru+96TQEZYZ9TLhUxHeneDh0vvMh0eyiLR
    n22F1vvAw9BjutE/H0VM/iybzuRTJgUOI/Np2hTO7cXyaP0/KUpoijltbCeXv4WnOSYPhn
    +OF+lntwPF5ehiYXyHNu/LUR7czBpQJCsQLUaPaMh1URdoNoWBL3eSHWRCz/eGfadUCGLU
    fbNcEgQtCVDDqXx4bqIanXG/SF3cB45YyePD2+im7aVGB13Abq3+GaE88E2Fj0GgaZVEeU
    Sn98T+hnAuzGhgKKbPd5OxzRRPWReHxCCVyhlWfFx3xGd9AoXE8TEkoYM5+A
X-ME-Proxy: <xmx:SWj8am3Er7UU0hWOliM59Gj8PCGKPdAyfQTzrrX0wAqXolILYjnV5g>
    <xmx:SWj8aukmVydoOs6l9UgKDbKJpL9DbN4J27qV9cCPmMwcqLFLYlQ1ZA>
    <xmx:SWj8at-42yQ5Cm-8gTbnr0UnM5kfPiKI6rxgZ9KSpFco8aXQoR-1dA>
    <xmx:SWj8asIe07JYdNuYnnBYskWtE3V7_M1osfytfgU0CjnkNzgdDqvlcA>
    <xmx:Smj8apY68N23M3qkRY17kXoJcRyyFAPdWkHHDjprfx3pTO2XKwKFgjT3>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 17 Nov 2026 15:44:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
Message-ID: <avxoRfWuynbmX6eg@mail-itl>
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
 <864762ac-64c4-499c-aacf-5527390bd95d@amd.com>
 <f48effca-510a-4ec3-8e2d-cd6c879aa182@suse.com>
 <81193399-c673-464a-b58a-979c3bae4691@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m+73OVzf4L624/6B"
Content-Disposition: inline
In-Reply-To: <81193399-c673-464a-b58a-979c3bae4691@suse.com>
X-purgate-ID: tlsNG-d25034/1794926672-03CD3A5B-B7156C1C/0/0
X-purgate-type: clean
X-purgate-size: 4064
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--m+73OVzf4L624/6B
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:44:21 +0100
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself

On Tue, Nov 10, 2026 at 04:16:49PM +0100, Jan Beulich wrote:
> On 10.11.2026 16:14, Jan Beulich wrote:
> > On 10.11.2026 15:42, Jason Andryuk wrote:
> >> On 2026-11-10 03:42, Jan Beulich wrote:
> >>> On 07.11.2026 00:18, Jason Andryuk wrote:
> >>>> --- a/xen/arch/x86/efi/efi-boot.h
> >>>> +++ b/xen/arch/x86/efi/efi-boot.h
> >>>> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buff=
er(UINTN map_size)
> >>>>       return ebmalloc(map_size);
> >>>>   }
> >>>>  =20
> >>>> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
> >>>> +{
> >>>> +    unsigned long load_base;
> >>>> +
> >>>> +    /* RIP-relative address is the current Xen load address. */
> >>>> +    asm("lea __image_base__(%%rip), %0" : "=3Dr" (load_base));
> >>>> +
> >>>> +    return ptr - load_base + XEN_VIRT_START;
> >>>> +}
> >>>
> >>> There's nothing specific to the mmap in this function, hence it's nam=
e is
> >>> a little odd.
> >>
> >> It is paired with efi_arch_allocate_mmap_buffer() above, so I wanted t=
he=20
> >> name to indicate that it is converting mmap_buffer to a virt address.=
=20
> >=20
> > Hmm, right.

If the current name is confusing, maybe name it
efi_arch_mmap_buffer_to_virt()? But IMHO the current version is clear
enough.

> > And this is entirely different between x86 and Arm. So common
> > code wants to call a function of this name, but on x86 this may then wa=
nt
> > to be a thin wrapper around ...
> >=20
> >> Having said that, I am open to renaming if that is desired.=20
> >> Alternatives could be:
> >> efi_arch_xen_phys_to_virt()
> >> or
> >> efi_arch_image_phys_to_virt()
> >> or
> >> efi_arch_xen_image_to_virt()
> >=20
> > ... a function of any of these names (which in turn would be possible to
> > use for other purposes). Marek - thoughts?

efi_arch_image_phys_to_virt() for a helper function sounds okay
(efi_arch_xen_image_to_virt would work too, but IMO a little less
clear).

> > With this constraint on the x86 side, wouldn't you then better add an
> > ASSERT()-like construct to the actual translation function?
>=20
> Or use the existing (and Arm) logic when the pointer isn't within the Xen
> image. (There can be ambiguous cases, though, I fear.)

Automatic fallback I fear could hide some issues and make them harder to
debug (like the original issue this patch attempts to fix). But an
assert for the argument may be a good idea.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--m+73OVzf4L624/6B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmr8aEUACgkQ24/THMrX
1yw/RQf+LZ5SUlxoAZrOj+j6h5nqmCoqkEAOnC16HmjtDwfGykDnE2D1C7aTDDsu
6q3Lk27KCHnWg9/roXCdDBYD6WWGWwx+obgXr75PlPuneEeIOPMQ2bljXqQssbrX
PN8Vk59Z8wKJsaWURIAVsrbbw3tsqjDh3JznfRLK2iTd3Y19Rk8f7McTbBID/aiY
mQeuwxw+oarnsN0HpiTCMXMV6Re+kd/WCGYMx/gY/kSi8gZrl2bsds+EYRdv0AWb
wYmXSNZE11SMeMV3qSA8f9zlGjZD+7J1bl0f1Lezy9izsmAjBPYKAn1TMXCckyyQ
3tyQsmANhXuIGZOqlXAqR3KI52jnEQ==
=L6kF
-----END PGP SIGNATURE-----

--m+73OVzf4L624/6B--

