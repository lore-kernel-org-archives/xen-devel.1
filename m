Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E27CD5BD1
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 14:06:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325078.1590608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPlM-0003Jj-Tr; Tue, 02 Jun 2026 14:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325078.1590608; Tue, 02 Jun 2026 14:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUPlM-0003Jc-R4; Tue, 02 Jun 2026 14:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1325078;
 Tue, 02 Jun 2026 14:06:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wUPlK-0003JW-HV
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:06:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUPlJ-003cgl-Fv
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:06:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1ee35f-5cb7-0a2a0a5109dd-0a2a4501856e-22
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:06:33 +0200
Received: from [202.12.124.156] (helo=fhigh-b5-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a1ee368-c1f2-0a2a45010019-ca0c7c9cd043-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 16:06:32 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 758047A0065;
 Tue,  2 Jun 2026 10:06:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 02 Jun 2026 10:06:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 10:06:29 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780409191;
	 x=1780495591; bh=NxhHW4RlSXipbf6n4D8C2Vd2/PW8EQwUOKuRXbT5drE=; b=
	A20RlxZvXvnvHcxQXDyplg5GHfjRISIaxcagKIjRmRL5w7qTAYmoHmCivWz4KHpG
	U/JnXa30BdJG6kb40QMzKpdukpZPxPQIny8++pv337Mg8cZhJVZN2Eo6/2pRQLq2
	8MVWyOCWu1G6jg3RcLY3XBq/hJxPwMU23lcpLWd2kzogyQFRKvl0Kpbx32pl98Ee
	38mIMiLBujA+G5jv00ylCprVcNAl8lMDBiswQcRKqXSqhOkgNO9goN64YE4Gt5PN
	5SimrllK1cGZKdVlf46PAGEpphMlavN6DxGcdIxKQQVs18D0zrjhwSVP8pF859c8
	sC0ytibKotIqY1c5cOawAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780409191; x=1780495591; bh=NxhHW4RlSXipbf6n4D8C2Vd2/PW8EQwUOKu
	RXbT5drE=; b=YhTMqe8i8MBdREjhgRRtorPK2tSrdawBWdwGzyTfm5dqvLjoLqA
	hYbFTs4mx3dfPMTrQNr1DuwPa1hQBdNZNs0i/fXvocqXorQfBQhJ4U4tVSybessZ
	xEnug4o+p5iA8Go1Dk74xeTcIDTZ3l3/0ccOtb7n9VDuylCjN0ZcBFcWjOJ+iVse
	vk6/+oohq6vNbtqFqFzlmAjuIlou3PF2htAFskSFZGa+X8KnYccB744MAgROP5iM
	X8FZbw63DFplfUTYZkNcy18xa2s+y+vKTJztB4+93ZausJR2xiO6Q0U8bbMjgmjb
	LUvIOqCGEoKeywRB7JN0QqnqVmw67GfTMsQ==
X-ME-Sender: <xms:ZuMeaqQfE2cdJAKWFfLeefefy0QRfDpFoQhZ3ci4I_PXclbfqzLSeA>
    <xme:ZuMeamq37o9iXALb5eEa6fav4kfNSJZYEgcgRb9GAKYftOKea5RuJZRxQyLzkJEHT
    Gj0tN8BqaZRvWuiFsHTAADfSSThRTP9QMWBokV8NEly9ZJVww>
X-ME-Received: <xmr:ZuMeagLnN2bOo8MpCgwp6jvH9NGSlZVrSLAUSt38WNCbXXXIbevw3ox2hKkx>
X-ME-Proxy-Cause: dmFkZTEv2kXT1SsQgJDVq8gvP6QzegqpY0uKjx20bB9rq0lhqpeEdxm8udai2uGCVXpJyL
    ixCKhoovdIWlP52c6B+gRqwixm7Xsk444BR0PZFLNtjhD9sn3QnO08zsIDvk7dO2FlTrf+
    5Q6zezeoBDiXdPJpOcadMYUHU6wcbXPpL2r/qNaOBgVj6IMZoSMjsoPveS1AhEkhfdPtN1
    9aM3QcrETE5IKSKt9b4jePzHD870mItOAPyKAcHUAxKmWhVbI991pAIbiFyQdHEpUc0tXl
    cmUPnuuqmlJt3od2bSVhlRK0iYD2meDJpdGQ8Gm6JZ8bBkHyCPViwn5R6MCdEj6uV1gKtg
    9+Bofahu+wSAnIh6Ibfqe47AOxGJzll9/H1WUjEpVji2UD3pyFcUbAdoZ74SCuzetA3fEC
    HvInxS9XFRbOFHfVchatAwWbYeZ8tMMxGpUOuo88NdElkprS3i93cgAj0TCIGQUwz5ZfGo
    6f9gfe2ldugMak1En9dBXNUEuGEPzpdSYilWuZVLszIjwJwEJFUGSp5piX1eu2rpvHhooI
    OGF4jAs2iCjDn5v4k7mBXCEOotEFOqglUDh9AfV6hT0J73bLGeUC3Dh+3Gedf+AamuSV4U
    +kiKNTOpSGnmwpFOkCLnhMOCuD0F4S9Zw6vSBGcZfXJaK+w07B2CiaKPlH9A
X-ME-Proxy: <xmx:ZuMeahpS0vYwrzleH5hWbFA9SxBKBj-ImwBo5OIhK78SCAz89K9DIQ>
    <xmx:ZuMeagwOXn6bIm6_c7N8mLV4P4TsDjQH2ql5RjV4eIVIfmZ996I4cQ>
    <xmx:ZuMeatMct63dIt2Xblggr6EBOL2Hzr3n88UY1ZKB8Le9GWFXPefPYw>
    <xmx:ZuMeat4fml1MLkhSAI7onNWZn-FRKxnecXnPDlNOeft1JtXm8qRVYw>
    <xmx:Z-MeaoD7jKiQc3SjiEl068HZdaRn8RBcXtm77FKwp-0V5Cg8njfpJlr_>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 2 Jun 2026 16:06:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] xen/efi: Use blexit() instead of BUG_ON() in
 read_file()
Message-ID: <ah7jY_HT5sIAkOOa@mail-itl>
References: <20260602131737.2983084-1-accek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5aATZ4M0NycjqIUJ"
Content-Disposition: inline
In-Reply-To: <20260602131737.2983084-1-accek@invisiblethingslab.com>
X-purgate-ID: tlsNG-d62444/1780409193-ACC53FF4-800084BF/0/0
X-purgate-type: clean
X-purgate-size: 2944


--5aATZ4M0NycjqIUJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 Jun 2026 16:06:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] xen/efi: Use blexit() instead of BUG_ON() in
 read_file()

On Tue, Jun 02, 2026 at 03:17:37PM +0200, Szymon Aceda=C5=84ski wrote:
> Follow-up to 880e40b187aa, which added a BUG_ON() guard in read_file().
>=20
> But as Jan pointed out, before ExitBootServices BUG_ON()
> is not functional. It results in a hang with no message.
>=20
> On the other hand blexit() prints a message and returns back
> to the bootloader.
>=20
> Fixes: 880e40b187aa ("xen/efi: Fix boot from a device without a file syst=
em")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Szymon Aceda=C5=84ski <accek@invisiblethingslab.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes in v2:
> - Drop the Link: tag; use Reported-by: and Fixes: instead. (Jan)
>=20
> blexit() has been chosen over PrintErrMesg(), as the latter
> is predominantly used in cases where an EFI call fails
> (and it prints the status).
>=20
>  xen/common/efi/boot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 2971ea8696d1..8f24df9bc23a 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -849,7 +849,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> =20
> -    BUG_ON(!dir_handle);
> +    if ( !dir_handle )
> +        blexit(L"BUG: !dir_handle in read_file()");
> =20
>      what =3D L"Open";
>      ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> --=20
> 2.53.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5aATZ4M0NycjqIUJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoe42MACgkQ24/THMrX
1yyIPAf/XlSd6eOCi7NM38cWP8CTFM+KmSbZZWsYOtESphWZlmXiTPMvxUdi4jCd
jDvnkP/xCLTQEIp0SnXWhKkxaI0e5iXxmDbBfXF/yZxNn5OylLq7+aQkfa35wHuD
s7E9gmMXWZ1BY5BcfeeCuxS2Ymaqps8lB5QAGEWui51oo6JQNiGIch6va3TMb3Li
H0l+0eJCse32tPpKyNQ5uJaizV3q9KtaiTLmXaKimcXdU5wkF0xG7vQOeBIYlq38
rA5BPpey5CiwUQvMrd2u2sSnF+m8VOLXZ9mj3sd17xZsov1nrv9upS51BsqlEMNt
zrTMsQ+AKWnpDMZO5uc/V3fNLHTpMQ==
=1vhJ
-----END PGP SIGNATURE-----

--5aATZ4M0NycjqIUJ--

