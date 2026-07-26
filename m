Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073EBC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 05:25:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371285.1618936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woDpm-0001Cr-KK; Mon, 27 Jul 2026 05:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371285.1618936; Mon, 27 Jul 2026 05:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woDpm-0001Cf-F7; Mon, 27 Jul 2026 05:25:02 +0000
Received: by outflank-mailman (input) for mailman id 1371285;
 Sun, 26 Jul 2026 20:32:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <linusw@kernel.org>) id 1wo5WK-0002Ii-CX
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 20:32:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wo5WI-009dZD-U8
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 22:32:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <linusw@kernel.org>)
 id 6a666ea5-e002-0a2a0a5209dd-0a2a450bc874-30
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 22:32:22 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <linusw@kernel.org>)
 id 6a666ed5-b7e8-0a2a450b0019-aceafc1fda68-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 22:32:22 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 92E6B439D7
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650DA1F00ADF
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-39c8ee87f7eso17667931fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 13:32:20 -0700 (PDT)
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
	s=k20260515; t=1785097940;
	bh=nkBZFniCUCzkEJIn51pXlmXmi8cVBb/p5U1a6qJ9Ixg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W4PHVQaN9xLoqX8eDXdj+/bdltzbpdrXuJcD/IwTHED/OAS43NtSi09Vq3d6U04b+
	 OZrfY1BdRBIr3/BvT4jphHKxshW4iPLq0SEQ9WJZ6UCiJXker7nVXzDJTQTJeSQmCJ
	 nqQTHDVkWE6CIw3XfTavcgeKi0qWFBHLD4jbLvVP/w0wy9EuQuHMdSUYi0WkY8Th+6
	 o3h8KWUIz3JqQ5OnPdjn8CRQ129kqIKO0RvU9aDDIqv2knEzTV6ddZotNnccrjNDf3
	 gD5p2j+s8qJDRnjJCabcz24JHju2UhLKMDmQz+l+lUVP9hxrlhIX6gKr3NzT1t2xHy
	 xsYC8WtlBRvmg==
X-Forwarded-Encrypted: i=1; AHgh+RrNlfmBsAPLjjB3imDUKdhqf2v3/0UdWWit5FKRh7mFLvQSgzLapaZG+Imb1yvhfz6/CHjAdxm+ZsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXxFi11jyjXwuyoJi1TPGpjSw2zkwKR5hvh9J/HHLsHn1vSy8e
	bOIacjgXnkqW0/GCkLl2T3DYmi7ZEBuUfIaUtZ4idaP8uqvy/j9YJ3XEkPfdfoyt5rEWtTFvDaL
	JFASRS7kL+CFJYTil043ywCn/Pq5Vxpk=
X-Received: by 2002:a2e:b8d5:0:b0:39c:99e9:da37 with SMTP id
 38308e7fff4ca-39f28779970mr10082271fa.1.1785097939063; Sun, 26 Jul 2026
 13:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 26 Jul 2026 22:32:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Gm-Features: AUfX_mwB4HUeh3S2YxcI83VgRSuUorQHaI7-JMSYPXy-LrwQZEzjVUoz5QHNF0A
Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with atomic helpers
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
X-purgate-ID: tlsNG-42698a/1785097942-190CD9EA-4E585A5B/0/0
X-purgate-type: clean
X-purgate-size: 575

Hi Ze,

On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.

Are these patches independent of other stuff so they can be tested on
top of v7.2-rc1 or do they need other stuff from drm-misc-next?

Yours,
Linus Walleij

