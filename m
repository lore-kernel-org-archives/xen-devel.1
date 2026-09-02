Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD4C624D5
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:56:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405601.1639081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hhh-0003Uw-7V; Wed, 02 Sep 2026 09:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405601.1639081; Wed, 02 Sep 2026 09:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1hhh-0003Up-4g; Wed, 02 Sep 2026 09:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1405601;
 Wed, 02 Sep 2026 09:56:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x1hhf-0003Ui-Aw
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1hhd-00B3yq-FW
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:56:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a97f2b6-bab6-0a2a0a5309dd-0a2a450ae934-28
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:56:21 +0200
Received: from [103.168.172.146] (helo=fout-a3-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a97f2c4-f2d2-0a2a450a0019-67a8ac929a97-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:56:20 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id D9710EC0174;
 Wed,  2 Sep 2026 05:56:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 02 Sep 2026 05:56:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 05:56:17 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788342979;
	 x=1788429379; bh=xt6BTOetJ4DGyA8BYB5q7qZpM72Rp6oJyUrAUWCSVys=; b=
	b8Ln5iQy9osHA45BWKfSh1EBrbQE+W81eRNtdCdMIDCs1jO3rAcVWN987VAJUHbI
	C6GPIGxsfhQxk9I5fDhznYG8M1DzIVAlRec7245+pJXVlnrzgTBF84ZmdAQtvmCQ
	XvCjr6StzbieU/r1KYHmaMqsLZMWonZyLa5vTgH1lI32iWC1/qOgVh94NXON7LFX
	yl85kjtiAyxXDkFcWrBjGojeDtPcSsYSoIl98xK4KD+gt1UaXIHcBD+XjdK+wLPB
	mgDBkhPfx1wH1odPZPzLQde+ts/8VYzNH+KeK+isS0Apc/NLtP9vUnwD8inZ3Y0U
	waEGghIl+pXYuhLtsL1EEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788342979; x=1788429379; bh=xt6BTOetJ4DGyA8BYB5q7qZpM72Rp6oJyUr
	AUWCSVys=; b=d7qWCBXcyC8vQuRk/n62/PcHQMayEkhsKA8S5fDhp1TLRIfdnHw
	EenFb3t6c3th7JGI4lAZsoDJ1KmVDEZC5X+IO86u84fuco4vLVG1ohMJwYNQx+ez
	OIGdPXgRhLl3R07ewe8qLqaqAMj9PzflWE4wk5OSS57LmH2AhEpPPFFcSK8cKQE8
	s/+il/iMHxLMeTwA7dve5bTkzEEnVnVvz0qReC97TKRAxVsgG57XJ7Ib2q44KYRV
	jq+x1L6k1I4JYrVwP9n/On0lBvuTToyPVBRKeLb75g8FJpvJ7QFWIOEE0IMDG8xF
	4bhQpJGQeQN/w9xPXSbWQz3H+uZ35dAVyGw==
X-ME-Sender: <xms:w_KXavUIH8c0svpLw8V0i9bAxCrrVOz3h6VwzE2sVc15qapX5uIVVg>
    <xme:w_KXaqLO0pSB4ihDJJ9IFwilSYrHQMLmi9As-h9IM8ZOnfO9B6hUKigGGNMdULyVz
    3Om1FfumM6OpQ0RHjwUiXsbQAL042IAwW9aGtB13g5a0r73Tw>
X-ME-Received: <xmr:w_KXavBb3UOpiuzPmSJFeehmuwoHdLNOCmg6clZeXvIw3zAQCpvZBClbfocH6sxMWODiTOowOLly6Q-Gz0Q60y4B73mevz9mMM4>
X-ME-Proxy-Cause: dmFkZTFNTJ9/4/XdMg/ewdtzVWxcV2nETdKbSDB1QE4uGyJ5YStxLLYuK2Vn6Nrpd65u6Q
    4+hnRVBT35SY4WczieL0B96qTm5PwPhlSfrAbgmaOlZM6dEWh2LCPwjemzTMEMr1iUez61
    5KGvNYjjH5gRJvopGnFDesxQsDs7Tp8wyZFTxlsi/7SvhGW06A1qRgobdiMTkuN5pUHJXt
    EkeVBfi0zLHzV8Mewx0DnUHEzYBBOeCgPS488DosUifOVkEu0A+4zFsmFN5q7dO7KBPCeS
    9OSeMKEgNT7AxERSQKXna7um8wQKqBngl9lZx6OS6b2F5hburFiJtisg793+ICvNO/HMMg
    iPDwgYp/WXIn2SGXAH+lShkAgBUhd4g5/MZMCRvsCwMowJnRRNgkV+2uGmdk0Z1EBv3O6b
    iFK9If32nf8x44TDU4s2Fs3/9oH/qp/wbvdiqdQ9vABUXbP4Y9YpP+oWIxnbTgS2KLLCIK
    P/aTQ8GcixUu8pfERaEOzT6I85PGHuzN+eexkkz/OCGD/bTKwpRoOMI7W4XgNhPHbFmBSs
    m7c9Qqs3kKjM2stQyP91DpjdNtybH5VPbgp6556kIQTpMc500tKEIQBOgOC8j/+qnaiNOC
    wS9P5m/dVs8eMdZ+Or+qqXj1d3jMuDr12cK/llv3+dgRhJdw+1p9w//zI+ww
X-ME-Proxy: <xmx:w_KXaqd6prT-I0y30PBxTqhaw3jamdMZSoNri2eoK6C-Qql-iz7oOQ>
    <xmx:w_KXau1yiOIoKaIK0MDZgdEB9CXQ1gPjYE_IPuW2WblCH6VzGQAcrA>
    <xmx:w_KXahiTd5W451BdFxeHCzeXp9Gd9IYdYdAZzbPhykVPSwF7hdxzwA>
    <xmx:w_KXanktOEUNjuRy6fN0Iwl-fyR54GlRW2FsB9SakzeJgEOncAxPcg>
    <xmx:w_KXaqTHlPqeNHKFRxPIZDc7z9Vh020XrcjZQu7nrFs1_dUDNDJkS_FP>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 2 Sep 2026 11:56:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
Subject: Re: [PATCH 14/14] xhci-dbc: don't cast away const-ness in
 xhci_find_dbc()
Message-ID: <apfyv9eHKB4vR_L3@mail-itl>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <ffbc98e7-b74a-4188-8dc4-86aa8a962af7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="01QUMicPQRD8dsXa"
Content-Disposition: inline
In-Reply-To: <ffbc98e7-b74a-4188-8dc4-86aa8a962af7@suse.com>
X-purgate-ID: tlsNG-4011c0/1788342981-514C7CFC-D0F0DCB9/0/0
X-purgate-type: clean
X-purgate-size: 2752

--01QUMicPQRD8dsXa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Sep 2026 11:56:15 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?PT91dGYtOD9CP1RXOXVic09wPz0=?= <roger@xenproject.org>
Subject: Re: [PATCH 14/14] xhci-dbc: don't cast away const-ness in
 xhci_find_dbc()

On Wed, Sep 02, 2026 at 08:37:26AM +0200, Jan Beulich wrote:
> Doing so (at the return statement), besides being a bad idea anyway, is a
> violation of Misra rule 11.8.
>=20
> Make "xcap" have an initializer while adjusting the code anyway.
>=20
> No functional change intended.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -384,16 +384,15 @@ static bool __init dbc_init_xhc(struct d
>   */
>  static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
>  {
> -    const uint32_t __iomem *xcap;
>      uint32_t xcap_val;
>      uint32_t next;
>      uint32_t id =3D 0;
> -    const void __iomem *mmio =3D dbc->xhc_mmio;
> +    void __iomem *mmio =3D dbc->xhc_mmio;
>      const uint32_t __iomem *hccp1 =3D mmio + 0x10;
> +    uint32_t __iomem *xcap =3D mmio;
>      const uint32_t DBC_ID =3D 0xA;
>      int ttl =3D 48;
> =20
> -    xcap =3D mmio;
>      /*
>       * This is initially an offset to the first capability. All the offs=
ets
>       * (both in HCCP1 and then next capability pointer) are dword-based.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--01QUMicPQRD8dsXa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqX8r8ACgkQ24/THMrX
1yzLswgAhCU5fonKS2Jn6BHxUzFVduQ+ZY/u/IFsTz/bumAAGQCEu8bnL1FRKQGz
sS5zU4yv+OX3dnlazqVJyIZZ/JM0pBiDEvt4TTsGw9LOws9vF6dOxSMZ1/L+ep6L
pa6xwS24J2k5M1k440JabcrI1/5AjVUsFcEF59V6nkk7FzYyA7Ji9rWVtKTFIO4s
yHnafme+3Fqa8URCxt0C8kgoDsRlaJ0GhTSgLue+BEGCpwAWEqtyxmZJJ310EUdC
oHxRP9xBZYMJO8osPd8MPSG7rtePZg6uZxiIUoU/3dCb9Go4aL0QnPAWFJOP54O0
AK7SrV9IDoCx5Vu29HXqr/nn8R5eSA==
=NJdJ
-----END PGP SIGNATURE-----

--01QUMicPQRD8dsXa--

