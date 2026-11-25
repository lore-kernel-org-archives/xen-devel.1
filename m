Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A3606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3 header.b=JZko7hiO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=y8igv/Bb
Received: from list by lists.xenproject.org with outflank-mailman.1502851.1698756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWKvE-0002It-5K; Wed, 25 Nov 2026 21:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502851.1698756; Wed, 25 Nov 2026 21:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWKvE-0002Im-2P; Wed, 25 Nov 2026 21:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1502851;
 Wed, 25 Nov 2026 21:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWKvC-0002Ig-HT
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 21:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWKvA-005b73-Sz
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 22:52:57 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b075855-2eae-0a2a0a5409dd-0a2a450bc330-46
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 22:52:56 +0100
Received: from [202.12.124.158] (helo=fhigh-b7-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6b0758b7-b7e8-0a2a450b0019-ca0c7c9ec0f3-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 22:52:56 +0100
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 06E037A04CE
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 16:52:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 25 Nov 2026 16:52:55 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 16:52:53 -0500 (EST)
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
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795643574;
	 x=1795729974; bh=w6Vzf/Zy4PxSy8gzpAFlbTHfPPXYHFzcNvsvcAR+9BU=; b=
	JZko7hiODdiVIgpxazou5UtXqijN6KPIWqf9pD3vw1fIoGG6vMJS68x3mw5nl0JM
	5hd3jgfADqlvyy45CnWa40n6kCsrxppLjwBqrmX5bMDZwCAB5id3H/bQNO7oxbGB
	wQdO9OnkUrqr0z+NK36iRodpbGBfsqtrGA9jMhaPdB0SoE+dmqT0AtDt2feDD/Ux
	y/m5HVCR51BxmzVnsQ1VghjWPwGjDLEsVQ97HQAr1NbNOA6NsnIj62StkmWMB05F
	tHVL9kXKku+YiLxBr6zpuN+KXSHw2M6qfklz2jMj+OJ4H1KhGC/sIYOfDO0mAS/v
	TK+bqShs2NnZRnFyD1WH2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795643574; x=1795729974; bh=w6Vzf/Zy4PxSy8gzpAFlbTHfPPXYHFzcNvs
	vcAR+9BU=; b=y8igv/BbdTuHh6jyY7O7dRcotgbT4EMTvuy/hm7cWIE+NmkjVtV
	Ma/wIknYtNiYS2+a/YGzB4AB4w5Jp1+wJQ/U55T+EZNnpyOLQtbRiCiEK+2JifGp
	TcwUTwnFVILVJs2cVKpe31RIa7LA9ZegHrAOXeDBwtIOEg05KYIgtxcqk0iw/boO
	zL0TP39Zy4fqpwbydvMlKG8k9tr1JnovcQV7lKnFqyUsoXPF77wHW9PjuTPzP4Ju
	Sd/bOzEqjgxodkj+gqKbXY7qL8LEv8awJXDC02HCU5OJ9KHP2x7xMVc7paSZ45ui
	JjBZv61GYs+DY7LNBR0QPa32VABKwx5vBSw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795643574; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm3:rsa-sha256:Q07tD5P5JTxzx+pZBnOBt9ocbao7AWpyJqHD+tlkMTJrjhL
	AoAsccL+1HMBa/MBLsz49n5ZnMV1zNhuNXFKENUsr1oJQX7Ex53iOrASfA2wDPzK
	TSux/CMMQZIwmwotWcsdncPTr+2qEZlaEN8sy+DTYTbqdjHS1QPkLSW5VtHpWfms
	RoWUCLAWpMrS4EKaBdewKwGuQM6K36UnXC1HUwwEbxWesO5FwWLPhg25MktbTiTw
	tlxej51tE9a3CO1AIlT9fENAZMvJIfGTV3ED/kIerXjl1Olv1A/FbHAwPdC5C/qQ
	GlP7LiDZF5Rh2B6SgWIJ5EPqhWQB5RVSxEhJKGg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MDHA5huV67gw3hv5z8SKIIG9lZISvBLf/2+GFNQ4ZgQ=:NC/K8ZmsF6K6I1ZTysN7iLn+I/ZmUGfmjAhoJ7UEiTI=;
X-ME-Sender: <xms:tVgHa-9jxbyjrYG-bDtSGy1yQGDBGrqUvm4_OM9dCvsM5LFgGaRP-w>
    <xme:tVgHa1sHV33JY7X7c1zddF-VRiA_DSHfX4mUHo6UBchmwAok8Gz6gQYUgAgco-kLQ
    uOLq1v-xLWVWXdb3_1XnITcTwlRr3Hneg2Zhokac3JMjfSqvHY>
X-ME-Received: <xmr:tVgHa5Dxd64OYbwSUzmX_yewxsMS0djPI_LRNfaj7NTkBvfDnMH-FJaj3cuX1pl_qnwhb8K9pWWFFqoxsbzG3ZA-_642YqIpFKLua7buwdQ>
X-ME-Proxy-Cause: dmFkZTEW1dGrm/KDFpNiHuJarX4n4BJSwKJFoi6iLoSfHlyMTzOxtdDJUGkXUMQZ7lF7So
    AMAiGDw3Rn/YjPF+C73h+jT+xNB/MlLM6j8b2okizx6yj181utVVycxmik9OW1ifxpiusA
    cKA+lQqo2kagIkbnJf4L31oHYDJuOWJEE0tlKETsu2OCOhyRW+WBGx74MgIAstfi5R/xCK
    ynbgVNepG8hZDR2H9huKjOut97/RzP3cv7dB9YouQAzA54ZLRQQdOUn6K8IJIz58ww3C1F
    ejb7u/1nvZ1Wp0gOUoiNxY+jpXBoL11L0ho+d3sZaOtErYZDFpuWOF4A5ruRZdhnjF1mBz
    MmjtmmV0t1Zz8iOe5TQUj4YO0NIt50yEVNm1T3jTbOK8d7PlX6uaCoP+r4lRyG+ree2gBJ
    f/PJOYeg9wVQEFqWVhyncoojddodysNCx4kKGMGFs2MHICfWSGiV7fks4P4Y05AYY+6RIH
    82Rk2EmXOjBz+DcqzyIm+VYC8JyUDVCjeX6nENauuqqxyiG5Rw5fxOb/PnBzLntpLAyMyK
    KnLSD4FQqWiJOGEyYxC8clkN11hjqbgLVexPDMRoHdxZ9DDojqY92o04n5RfuGBUTa5tSE
    J2NATfJIa9N9V6fnPtdM7WulbNIJcZj0S4rQr5sqW4b8nREpMwzxaAxszpIw
X-ME-Proxy: <xmx:tVgHa1VI-XXI9X66ALtIxJyCGYbQdVzxOEW0Gw7Pe9IL3Rvj2DxMVw>
    <xmx:tVgHa_BfvUNSxW8gt90GDE0nQOxu4O_C45brakGVN4AiQgHPdEULfA>
    <xmx:tVgHaw_HqdteBkRsY1K441fvvP-YDIkYbzNOEeyalQupqOADaq_CuQ>
    <xmx:tVgHa-FO4BsmgJZPIE3ZnWXBGZR9jx3jY3VM_ICJC2S3RT2pbmnd8Q>
    <xmx:tlgHawWFNKKssR028ILVgDrVKdT21fCstS7l3D4SUYrhkLn4KCVYho8c>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Nov 2026 22:52:51 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] EFI: avoid use-after-free when chaining config files
Message-ID: <awdYswqaTiaF6mgY@mail-itl>
References: <MA0PR01MB92175BB14F25D806EB78D171FD7A2@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
 <d9368119-12de-4fa7-b417-4c66bf9ad07e@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ht+PisGbuRs0uzOS"
Content-Disposition: inline
In-Reply-To: <d9368119-12de-4fa7-b417-4c66bf9ad07e@suse.com>
X-purgate-ID: tlsNG-42698a/1795643576-1B2DC9EA-A8D60B71/10/78276251493
X-purgate-type: spam
X-purgate-size: 5142
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--ht+PisGbuRs0uzOS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:52:51 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anandu Padinhare <Anandu.Padinhare@electrifex.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] EFI: avoid use-after-free when chaining config files

On Wed, Nov 18, 2026 at 09:02:39AM +0100, Jan Beulich wrote:
> On 18.11.2026 08:50, Anandu Padinhare wrote:
> > When following "chain=3D", efi_start() frees the buffer holding the
> > current config file (if it was allocated) and only afterwards converts
> > the chained file's name, which points into that buffer, with s2w().
> > The section name, when taken from "default=3D", also points there and is
> > used for the subsequent lookups in the chained file.
> >=20
> > read_file() may well get back the very pages just freed (as observed
> > with OVMF), so the section name may end up referring to arbitrary text
> > of the chained file, selecting the wrong section (or none).  With
> > firmware overwriting freed memory (e.g. Ubuntu's OVMF 2025.11, which
> > fills it with 0xAF), even the file name is garbage, and loading the
> > chained file fails with "Open failed for ...: Invalid parameter".
> >=20
> > Convert the file name before freeing the buffer, and duplicate a
> > section name taken from "default=3D" the first time round.  A
> > configuration relying on the stale pointer happening to refer to the
> > chained file's own "default=3D" value will now use the section named in
> > the original file instead.
> >=20
> > Fixes: 81da4016bfeb ("x86-64/EFI: allow chaining of config files")
> > Assisted-by: Claude
> > Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
> > ---
> > v2:
> >  - Introduce _strdup() and use it (Jan).
> >  - Duplicate the section name only once, and only when it was taken from
> >    "default=3D" (Jan).
> >=20
> > Tested in QEMU booting xen.efi directly (x86 with OVMF and a PV Dom0,
> > Arm64 with AAVMF up to Dom0 construction): chaining with and without
> > "default=3D", across several levels and (x86 only) with the section giv=
en
> > on the command line; booting without "chain=3D" is unaffected.
> >=20
> > A pre-existing issue is left for a separate change: "chain=3D" has never
> > detected cycles, so a config file chaining to itself makes Xen loop
> > silently (unless the firmware garbles the freed name first, as Ubuntu's
> > OVMF does).  I can send a patch limiting the chaining depth, if so
> > desired.
> >=20
> >  xen/common/efi/boot.c | 29 ++++++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 89b5831691..6db3573030 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -285,6 +285,17 @@ static char *__init w2s(const union string *str)
> >      return str->s;
> >  }
> > =20
> > +static char *__init _strdup(const char *s)
> > +{
> > +    size_t len =3D strlen(s) + 1;
> > +    void *ptr;
> > +
> > +    if ( efi_bs->AllocatePool(EfiLoaderData, len, &ptr) !=3D EFI_SUCCE=
SS )
> > +        return NULL;
> > +
> > +    return memcpy(ptr, s, len);
> > +}
>=20
> While I agree with the use of size_t and char here, the use of void (vs V=
OID)
> is a little questionable. The EFI maintainers will want to judge.

It seems like most other places use void too (IOW, it doesn't introduce
inconsistency), so I'm okay with leaving it this way.

> > @@ -1441,6 +1452,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >      UINTN gop_mode =3D ~0;
> >      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
> >      union string section =3D { NULL }, name;
> > +    bool section_in_cfg =3D false;
>=20
> This doesn't need to live at function scope, it can move into the more na=
rrow
> if()'s one.
>=20
> Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> (Perhaps the adjustment(s) could be made while committing if no other nee=
d for
> a v3 arises.)

Preferably with this movement,
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ht+PisGbuRs0uzOS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmsHWLMACgkQ24/THMrX
1yz0Ywf9HN2xLtIE3V/sNpokhXfl244+kOrw+KCw0ZvLg1zOl3VCsM7HQieJ8eY8
vSnYj9C7SYRgigcgFUOEY9ZvRE8W7Bsy0DS+C6X2TIitcwQkOTsOOLIHsYjA+uE5
8TCnRtqe2ekz8cdKYAyNnTRLE6oKpWlM0hTkoTiVog+rqTeqvSb25SIWX56+rLcz
ENEYz5Bqw4czABt3pGiTdO/ymDRB0OMp7gKJIogiAZ7zDLmdGaroGAWvwD5ZYcxh
F8UeDXomIaNTaAzxha0UQcvAGM2ddfzwKGx1OB3jacUkNaKFou2S1wW5jPcCRZgC
hCn24uYfSVow4MTPHZkr+sYvrqERiw==
=AZNJ
-----END PGP SIGNATURE-----

--ht+PisGbuRs0uzOS--

