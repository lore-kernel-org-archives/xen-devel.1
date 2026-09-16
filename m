Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8948C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 07:47:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422426.1647839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6kMD-0001gP-MN; Wed, 16 Sep 2026 07:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422426.1647839; Wed, 16 Sep 2026 07:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6kMD-0001gI-Is; Wed, 16 Sep 2026 07:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1422426;
 Wed, 16 Sep 2026 07:47:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mripard@kernel.org>) id 1x6kMC-0001gC-FH
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6kMB-00FgqG-CS
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 09:47:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mripard@kernel.org>)
 id 6aaa496f-2eae-0a2a0a5409dd-0a2a4508b68c-22
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 09:47:03 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mripard@kernel.org>)
 id 6aaa4976-f659-0a2a45080019-ac6904fe86c6-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 09:47:03 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 685B66020C;
 Wed, 16 Sep 2026 07:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAF61F000FF;
 Wed, 16 Sep 2026 07:47:00 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789544821;
	bh=0joaZXkFzvHsMPXxvnQrk/bZSSnjHuyjzDW4e7lSU7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nc+M2tZwVJsixOM56NLEFYEzQkaMNDIiByci6H3lph5WSy/sEnP/SvbP6NTlniikG
	 Ewmocn8mbkhzZl9xv2kVMDBr9tzV6fTxVdxlVlUs7jGzcaKO2mFJVVhpduKi44oong
	 sHtZYmooyLnIcMDIU55vEXNcmGKmkaxT2821zwOmgb3Efs5H3NrjmHxgoHWATRdia5
	 KNsXvB16dSqeGTjIGJunLyXRJRAL3W18yGfPBId94h5QLA//ndBGRfh3HO0XR5ZLsF
	 ZZfrrn52BOrmvfzleaLFXxmfmxJIZnjEVpiunf5J+VIySiejvQLBNbUK5GOMjqX3Eh
	 +6UMsYsqAvK1w==
Date: Wed, 16 Sep 2026 09:46:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Marian Cichy <m.cichy@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
Message-ID: <aqpJKSSKunElnQ3o@houat>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com>
 <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3s4tplx46ij6zcs2"
Content-Disposition: inline
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
X-purgate-ID: tlsNG-c1860d/1789544823-D7B5987B-42074652/0/0
X-purgate-type: clean
X-purgate-size: 1205


--3s4tplx46ij6zcs2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
MIME-Version: 1.0

On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs = {
> > +	.update_plane		= drm_atomic_helper_update_plane,
> > +	.disable_plane		= drm_atomic_helper_disable_plane,
> > +	.destroy		= drm_plane_cleanup,
> > +	.reset			= drm_atomic_helper_plane_reset,

Also, this needs to be drm_atomic_helper_plane_create_state

> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs = {
> > +	.reset			= drm_atomic_helper_crtc_reset,

 and drm_atomic_helper_crtc_create_state

Maxime

--3s4tplx46ij6zcs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaqpJcAAKCRAnX84Zoj2+
doCwAXoC9/rqP3SJq9eA3TmbsgUL1dNQBlXU005d6LFRuERn952eYKYsEdnw0oH7
sS3Ms8EBfiZnSTC8Whf1zsDguMj/m/bcSyfEzHV6wM8Ix8qPXjNRdKfvP1twZo2V
tHED8pYuFg==
=LKtN
-----END PGP SIGNATURE-----

--3s4tplx46ij6zcs2--

