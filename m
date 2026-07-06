Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656FC43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 08:22:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355128.1609905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeb4-0003IQ-Tw; Mon, 06 Jul 2026 08:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355128.1609905; Mon, 06 Jul 2026 08:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgeb4-0003IJ-Ql; Mon, 06 Jul 2026 08:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1355128;
 Mon, 06 Jul 2026 08:22:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <huang.ze@linux.dev>) id 1wgeb4-0003ID-0l
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 08:22:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgeb3-0090CM-CE
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:22:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a4b65c5-bab6-0a2a0a5309dd-0a2a450cd736-12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:22:32 +0200
Received: from [91.218.175.177] (helo=out-177.mta0.migadu.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <huang.ze@linux.dev>)
 id 6a4b65c8-f399-0a2a450c0019-5bdaafb148e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 10:22:32 +0200
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
Date: Mon, 06 Jul 2026 16:22:24 +0800
Message-Id: <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Alex
 Lanzano" <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
In-Reply-To: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-d25034/1783326152-91F23D51-6D59C8EC/0/0
X-purgate-type: clean
X-purgate-size: 2782

On Mon Jul 6, 2026 at 3:27 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>>
>> This series converts the following drivers:
>>
>>    - arcpgu
>>    - aspeed
>>    - imx lcdc
>>    - mcde
>>    - pl111
>>    - gm12u320
>>    - repaper
>>    - tve200
>>    - xen frontend
>>
>> Each patch replaces drm_simple_display_pipe_init() with explicit
>> primary plane, CRTC and encoder setup, and moves the old simple-pipe
>> callbacks into regular plane and CRTC helper callbacks named according
>> to local driver conventions.
>>
>> The conversions preserve helper behavior that used to be implicit in
>> drm_simple_kms_helper.c, including plane-state validation, CRTC
>> primary-plane checks, affected-plane propagation, framebuffer prepare
>> handling, and existing event/vblank flow where applicable.
>>
>> Result is less helper indirection and more explicit driver-side atomic
>> wiring, with no remaining simple-KMS dependency in these drivers.
>>
>> These changes are build-tested only. No hardware testing has been
>> performed on the affected devices.
>
> Thanks a lot for the series. That's quite a nice cleanup.=C2=A0 Did you u=
se=20
> any AI to create these patches?
>

Hi Thomas,

Yes, I did. I wrote the first two conversion patches (arcpgu and
aspeed) myself to understand the migration pattern. For the remaining
drivers, I used GPT-5.5 to help with the repetitive boilerplate
conversion.

I should have reviewed the generated code more carefully before sending
the series. The sashiko-bot feedback shows that I missed several important
details, including commit-local state handling, the implicit NULL fb /
visibility checks from simple-KMS, and vblank/pageflip event ordering.
I am now going through these issues more carefully and working out the
correct fixes before sending a v2.

Do you expect AI assistance to be mentioned in the cover letter or commit
messages in some specific form? If there is a preferred tag or wording
for this, I will use it in v2.

For issues that appear to be pre-existing but are exposed or carried over
by the migration, which is better?

1. Include them as separate prep/fix patches at the beginning of the v2
series, before the corresponding conversion patches; or
2. address those pre-existing issues in a separate follow-up series?

Thanks for your time and review. :)

> Best regards
> Thomas
>

Best regards,
Ze

