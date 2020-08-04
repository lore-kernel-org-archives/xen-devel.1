Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82818C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 12:03:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541582086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 12:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJD76uf1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541582086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2veY-00084K-Cx; Tue, 04 Aug 2020 12:02:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kk9D=BO=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1k2veW-00084C-MU
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 12:02:44 +0000
X-Inumbo-ID: be2d07c0-4786-4108-b4a7-80c90ac08f18
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be2d07c0-4786-4108-b4a7-80c90ac08f18;
 Tue, 04 Aug 2020 12:02:43 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id b22so10150937oic.8
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yoKmKiR2TJ74eR2Wzmi7g0ckceS6f1XmFqfjMXSAC0E=;
 b=EJD76uf1qlnEbnbsSXcCjiR1dwF63Eymy4O3vdUuxerJGrjkx8QmybzJ3s7f0BtRaA
 AJQMd2jWYVcLD7Q9+ET5jGb/RzyjdlWE1qbNFSWwkdvB7sa1fGpxIqPF5WLWDJz+EHVI
 BgHBMoZtVg5G6iWt+KPjMJgLgdGWV7NjEcR1yc2O9fDeIGk0bC/1lo81odjohmF32WZ2
 gtQduwbXt96PWkauMBsGmvODCtFhxx4obfWoW0QUJjPsb6a9T0CzHWk/r8BGF1hw2YOs
 XudmYvMvo8I2nDzAch+QRxWvA+PuGI8kC5GuSFnlSFuYQqd0Bf39m47a9Q34hdgWvgZU
 mu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yoKmKiR2TJ74eR2Wzmi7g0ckceS6f1XmFqfjMXSAC0E=;
 b=jPtJSwucClxMgvRWcxW5FkXr0e8kdci9Hy7tIVGc98JXfaBAAab6F1h59O/T4PC6Xn
 t+kVJI2KHKX1vxlzdiVtUeyN/NfmGN6McN36tbi5DiSzr3DmYsBAyqdnMcCuWdvR16Jy
 4H6AfySgCYC4d+Gvepd629as6o78ECi6AgS3qkSYdhmnXbHYOCVfLNUjMBS5qPO64VFA
 x7AD6ZzhqGcBcR425/lF06JgUWUf3RzaNQR/pWXgbLME+MMIBzmJd7l0TYnERVrgCSWT
 HvGbV9O8ftTEyLD1DHqrIKDKNL5TpNov/Tw37lJLg7VEA7K7spmXX0v6EvJDOyydPnu7
 zLHw==
X-Gm-Message-State: AOAM533W1Zt0PEqJZ5G8eo/GOp2F+w1kS0K6D5clxdtPFO6f7Ecjb9TP
 tTx+RvBTlahNhRuqcnZeVxN2cTDi92t+qUslX+Q3OQ==
X-Google-Smtp-Source: ABdhPJwh89DKXqLZiAeMyV9LAFWrB/U0YIK3LfYvYk9eY4qJFGJuRx/INllEMvIAujSto2az2g/8kBZ0ao02G4dSGnE=
X-Received: by 2002:aca:50c4:: with SMTP id e187mr2897725oib.146.1596542563240; 
 Tue, 04 Aug 2020 05:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200804092624.1126013-1-anthony.perard@citrix.com>
In-Reply-To: <20200804092624.1126013-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2020 13:02:32 +0100
Message-ID: <CAFEAcA8c9w7iKy5UA=jS47mQrK7SZTkta8OktBNvH3crTs=rYw@mail.gmail.com>
Subject: Re: [PULL 0/1] xen queue 2020-08-04
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 4 Aug 2020 at 10:26, Anthony PERARD <anthony.perard@citrix.com> wro=
te:
>
> The following changes since commit 5c1c3e4f02e458cf280c677c817ae4fd1ed9bf=
10:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
00803' into staging (2020-08-03 20:34:26 +0100)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-x=
en-20200804
>
> for you to fetch changes up to 8e0ef068942e4152f0d23e76ca1f5e35dc4456f7:
>
>   accel/xen: Fix xen_enabled() behavior on target-agnostic objects (2020-=
08-04 10:21:35 +0100)
>
> ----------------------------------------------------------------
> xen patch
>
> Bug fix.
>
> ----------------------------------------------------------------
> Philippe Mathieu-Daud=C3=A9 (1):
>       accel/xen: Fix xen_enabled() behavior on target-agnostic objects


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

