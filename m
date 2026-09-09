Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C481C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 11:54:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412848.1643168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4GsX-0007jY-Tt; Wed, 09 Sep 2026 11:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412848.1643168; Wed, 09 Sep 2026 11:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4GsX-0007jR-RL; Wed, 09 Sep 2026 11:54:13 +0000
Received: by outflank-mailman (input) for mailman id 1412848;
 Wed, 09 Sep 2026 11:54:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1x4GsW-0007ho-Li
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:54:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4GsV-007MMj-Q7
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:54:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aa148d2-bab6-0a2a0a5309dd-0a2a4509b5f6-28
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:54:11 +0200
Received: from [103.168.172.155] (helo=fhigh-a4-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6aa148e1-be1a-0a2a45090019-67a8ac9bc37d-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 13:54:10 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A769A14000F4;
 Wed,  9 Sep 2026 07:54:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 09 Sep 2026 07:54:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 07:54:08 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1788954849;
	 x=1789041249; bh=GAXFhXvRC6+vGyqr4aNL560qyE7fHFaTxZb+EtyBrt8=; b=
	HbEewaqUoSeJxUG4vVJ+UQ8cFk+Cy/T+N2dbjupo+DC60saaZfsAMicM+1JFuTkj
	vkK81n77dQFYWK6etpzazRANhzAEMUIE7U05avJHo2ROdf1rr2ifg8kmMAp1SXfm
	vGZFgPr2hypMYbmnHaT0Z8w2ZdpWg8diEPkWruzJSTYYTKPgOad0jaXdGXC16f8F
	g/EGkPREjI0m6R1ytaFh5lEBUq6koDQxzGy+zMPTvrjw54QOMjGvIS17njQ3KxyD
	IT/HHqof6zZkFzC8BO7obz9zGfzkrwh2YNeixbtMXlomjXsFdBq6tDZq3AZlnddd
	GZgGLgIiuzYE4+jJTd0CXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788954849; x=1789041249; bh=GAXFhXvRC6+vGyqr4aNL560qyE7fHFaTxZb
	+EtyBrt8=; b=BPX/gkYEO7zYnBxXzMX5lkQWVzQrEK/RGE+aAt2T4Iw7yLqF1Jq
	FI6fOU6c3OIRv2BLei4bSDtrPCDwz1CoQBfNX0md5j9M946nBmwFKXzAVbjf8zpW
	WGNaaBJuHHstECkF9VR4UeGJx7oDe/TfA/jdDW+V9uXr6PYcIEX7Td39bZhovUzB
	kIMLtZJHT32f6GoXUsWnPBj6kvkmV5I1vkpBYGYdOappCUp1+UcPTAsSw537l1Y3
	v1ISfBgp4AHJJi+7SU+Ryji+jyWHjR/cTc0UWuMOtuXl0TzT3YPlojbyshloTaPx
	N/ii30egw+XtVqYPKQsbgis2qcp+yljY6OQ==
X-ME-Sender: <xms:4UihammkjLczRzWWlJAGPKfyxyc2RGguDFtMH29zhIdY5WmLmeCFjg>
    <xme:4UihaoZkTo80BsympUQWKM8TzqJN1s4_RN7xfAACuoM9Yo4u2OB29RVvamULILmiT
    fk1_j559r0Eki8pTVfPbGKBKdXZCKG09Wxqdm2QtOROeHyzD-M>
X-ME-Received: <xmr:4UihahM_WSs_9UUAOLw4gT6qr74wcvFrHBAgGI1smcgTR_3o2Q6mmp8xqO2e46Zv5OCvavaU7G50HuP2wW3W2HYEkTaOvTOPDq4>
X-ME-Proxy-Cause: dmFkZTE1c10p/68Ffk0RTi6beBp3tyoAS8TRAOTWjm8THH6rnTE+ZHyf+mDP7Hag7oZFWq
    VfX5ahJPNWPCfSegu5BIqnfApqUTuvbL0Sj8lk/BnOs9ZZQlurSxDaR+ATr1bMy/6tVTPy
    JPFSKcQLYaD/F5uZ+FCOWM5qag6j57XoNSJy5iWeZ38wer4iWRmTheGYK/DSWXUmieegDK
    PGlIifvoazem/1FXp2TZDFHnwwAMMLhzk85iIKMZojuDag9yszgppadXnBnz3KWSxmYm/5
    CwyEkrzVf78EbQ9RGB+HMFXvwtRlgsqNuKECiUFK0pktSQwtKS88BqbrLJJJfbJcGyZfA8
    OR7fzKf9MPYrYQmWrm0HA4VDhaQBy91cjcsoDQYRZeuQXgfQosM1QLxohbzL7f9glJO/yI
    rHj85SGXmNnZavzqYQvBXWZiGiHfX7JxGHJmFuZJvhQxL3Nt28yGtg7+hjnKymJT4dtVm7
    qVAW7Zt3bwvO+23Wn4GLGUe3RnXtl3UxSF0MC5juJCTtXO+fmE09dEjjMB6yOLim2sYC+n
    Xz2s3FE6XqUaTGlhHu0Lwyf8d1AfYeKFIVfBHwMzsq/Q/jEKSwVN/wa1uLY/Tasl2Latw0
    FKDu4zO/EslGmIx4yFA73AKflfl3Wb1205QollsAFJKPBy59xa+413HzHk/Q
X-ME-Proxy: <xmx:4UihatYicPCkzUm3jmnI-oaG4UURGnCbfAVTGhtAramMnikwK71wPQ>
    <xmx:4Uihav1m6R68UN3BRDzK5x6X7OYRZusfBoKYi1vVJ_jGz4JX2Qe4jA>
    <xmx:4Uihajc7D7tTgSRyIZDQCnuYNd_JvosIPHtyeWoR_wcfKknE5TjTyQ>
    <xmx:4UihagGHkLgPW9P9kNxCSe0s8mF_YsQnpybJQC77wp8ZwkkC-ffuEw>
    <xmx:4UihavOu7CXY9W-bUazAM-7vImItpH7l9RsisDi6qfSxEvvXpSDq5OoM>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Sep 2026 13:54:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] EFI: don't use alias attribute for compat hypercall stubs
Message-ID: <aqFI3pV6PAVtbr_L@mail-itl>
References: <4326ea69-572c-4a1a-ba89-147fab55b2d5@suse.com>
 <5a3b475d-6c1f-47da-89be-ae45e34c4e49@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QBWwqiG9Zif3r5q8"
Content-Disposition: inline
In-Reply-To: <5a3b475d-6c1f-47da-89be-ae45e34c4e49@citrix.com>
X-purgate-ID: tlsNG-bad1c0/1788954851-BD8C1034-BBACB9D0/0/0
X-purgate-type: clean
X-purgate-size: 1688

--QBWwqiG9Zif3r5q8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Sep 2026 13:54:06 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] EFI: don't use alias attribute for compat hypercall stubs

On Mon, Sep 07, 2026 at 04:15:54PM +0100, Andrew Cooper wrote:
> On 07/09/2026 4:14 pm, Jan Beulich wrote:
> > Recent Clang objects to types differing between alias and aliasee. Acce=
pt
> > the unnecessary overhead and make the two compat stubs real functions.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QBWwqiG9Zif3r5q8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmqhSN4ACgkQ24/THMrX
1yw/AwgAhx0PCWUmKc7kw1RlcVuOh9vwWofpBY0IciGiQb0vkaU2tXcQtwgoy26z
g4mIwG+ia6v2ZpnQ/HjtL487JBpqYpMTLQu9g4AMcHmgBjthRMf1+joYEZyYrjY6
waH2FUb6mtwLD9f7gryFeZn3hVdRQRd30nforwRjmHlKg9hcXQBbIgL3bdMbxCId
PLLjIFxwNAuTkQWR4wsfQ5Qkl9NFIlePROeU/ZQL2sOKQp2j1ftoa3n85kUnLuL1
rOWocAjRMeIQqwA9mOcmtVUhhv61gfyO27Fep/dUrl+nNWTwl4L4AkmCze73s4Zw
yMx7uEw406/WM6l/klk57R5bR/1bug==
=Ul4G
-----END PGP SIGNATURE-----

--QBWwqiG9Zif3r5q8--

