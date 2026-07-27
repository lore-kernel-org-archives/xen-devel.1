Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20922C531F9
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 01:37:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371335.1618927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woAHa-0007MB-5S; Mon, 27 Jul 2026 01:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371335.1618927; Mon, 27 Jul 2026 01:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woAHa-0007M3-0h; Mon, 27 Jul 2026 01:37:30 +0000
Received: by outflank-mailman (input) for mailman id 1371335;
 Mon, 27 Jul 2026 01:37:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <huang.ze@linux.dev>) id 1woAHZ-0007Lx-4z
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 01:37:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woAHY-006fBH-F2
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 03:37:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a66b5eb-5cb7-0a2a0a5109dd-0a2a4502b9be-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:37:28 +0200
Received: from [91.218.175.183] (helo=out-183.mta0.migadu.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a66b64b-6ca4-0a2a45020019-5bdaafb7efc3-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:37:15 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:37:03 +0800
Message-Id: <DK8YVZNAFKSP.1JHSI6NI6LLYZ@oss.qualcomm.com>
Cc: "Alexey Brodkin" <abrodkin@synopsys.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel Stanley"
 <joel@jms.id.au>, "Andrew Jeffery" <andrew@codeconstruct.com.au>, "Frank
 Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans de Goede" <hansg@kernel.org>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with
 atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Linus Walleij" <linusw@kernel.org>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
In-Reply-To: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-720697/1785116235-317CA2AC-AF6CD10B/0/0
X-purgate-type: clean
X-purgate-size: 857

On Mon Jul 27, 2026 at 4:32 AM CST, Linus Walleij wrote:
> Hi Ze,
>
> On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.c=
om> wrote:
>
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>
> Are these patches independent of other stuff so they can be tested on
> top of v7.2-rc1 or do they need other stuff from drm-misc-next?
>
> Yours,
> Linus Walleij

Hi Linus, patches are independent and can be tested on v7.2-rc1.

I've seen others patches based on drm tree so I did the same. Would
switch to v7.2-rc1 if that's preferred :)

Thanks,
Ze Huang

