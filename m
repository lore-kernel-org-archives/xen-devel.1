Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2870DC88E5C
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 23:34:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420317.1646707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5thy-0008Nz-Ra; Sun, 13 Sep 2026 23:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420317.1646707; Sun, 13 Sep 2026 23:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5thy-0008Nf-MD; Sun, 13 Sep 2026 23:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1420317;
 Sun, 13 Sep 2026 23:34:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <linusw@kernel.org>) id 1x5thy-0008NZ-2U
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 23:34:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5thw-001sao-MF
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 01:34:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <linusw@kernel.org>)
 id 6aa732e3-2eae-0a2a0a5409dd-0a2a4509c6ba-8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 01:34:00 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <linusw@kernel.org>)
 id 6aa732e7-be1a-0a2a45090019-ac6904fe9282-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 01:34:00 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BB0D16101B
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CEF1F00893
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b5e4f1651bso1130426e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 16:33:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789342438;
	bh=zng3/lheQcHYHRf6apSQbhsdybFIgxHykd4cCeRSALs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DIuwo+91E9j6P8gcffxeTWibtVYK84E/K0zWh6s/Yed5HdTiBGh4yJD4g8Yy7YMzp
	 Zmb9UrM8SFiukhfEjKlqn74cChv71bxCDBhiCj/l/UQfge2Dm3qkgzsFbSGyqVSqpp
	 Udm+lm2P+eabpV3YMbxtjsRr06pb7oVPf73ngoGqP6jy/KVGDLhpFrdPO/yuSXNhqF
	 P/mNOKNoJ2KD2X8EoD31TZAHK6RsTWpDJuSUh375d6tPe7PrV/jmdpTbTzJGdzxjb1
	 iEp1c93xdl5nZIFDK9qu4pTXYFgqdfiS/ApZ0qsmVcVZZzCDaVwmiBwLQzxdIQXZR+
	 f0lsIW/5EvTVw==
X-Forwarded-Encrypted: i=1; AKwUvBwNjz62Bw2CcTiU5HLAm59nqbqAe1R9fUULTmWYLyhBAZGDa06XjddaWy25vTLiv4VxFftJ82hFAFE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kgomAbfK0xV+tcc50biQYM3nwfInS8PxmJukPUFICxgzvBL7dJ
	GiG+6wA9KTOoHavgc2pgR84J/a7aEUFVRnMRCTQcjxDCntpMy+BvPCxjq++70UntaZgf6E87El1
	JZW5diflde9Qy371+g47xyp0AHudl5G0=
X-Received: by 2002:a05:6512:2204:b0:5b8:9a2d:38d with SMTP id
 2adb3069b0e04-5b8ae8a73aemr7507e87.56.1789342437102; Sun, 13 Sep 2026
 16:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 01:33:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
X-Gm-Features: AcwNN1XTt4ClabPMabRSeCfNHr3d8Y53WJSzGM-8HBGT1SAK6TVjQKD-jMPJbKA
Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1789342440-BDEC6034-4CD608EF/0/0
X-purgate-type: clean
X-purgate-size: 553

On Sun, Jul 26, 2026 at 9:46=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> Replace the PL111 simple display pipe with explicit plane, CRTC and
> encoder objects.
>
> Move the existing timing, format and pitch validation into explicit
> atomic check paths. Use commit-local plane state in the CRTC enable path
> when reading framebuffer format state.
>
> Move page-flip event handling to the CRTC commit path.
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

This patch 4/8 applied for next.

Yours,
Linus Walleij

