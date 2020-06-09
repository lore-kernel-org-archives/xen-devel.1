Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D90C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 12:33:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9536C2074B
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 12:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQcHlHxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9536C2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jidRW-0003gT-Qu; Tue, 09 Jun 2020 12:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eBKE=7W=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jidRV-0003gO-Sj
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 12:33:25 +0000
X-Inumbo-ID: 6977fb30-aa4d-11ea-8496-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6977fb30-aa4d-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 12:33:25 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i27so13860923ljb.12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U8Eb2mLb5U/+FkB5qnpVGhGGBV1jxFTMfBhLagA3qt4=;
 b=FQcHlHxxW4ElxyJlfW3MDGdOjSJQMW5MAnSgYAxLksRJTiN4o44cSDc3i0OGM9xE9u
 0k6MvhSZq/RSEAHralDqMToAMSewtFq2/nPysTMazkjdgqJw3ajFnEnPiNze9+aHWke3
 opPyap3mAis/QMs2IkYi3X3DI94I79mqBHGAp9p6uc84zbPWpCbKiSkLA0UFIUk2kfib
 1eWQwuwD4ek3Pk37DeqAicrsInJhO4wqCJZVSE7IYt33lqnphZu4czCbKLjBIKqt9BbA
 s0ZXtkgMcdxlCwztitCOgV4EOCKvLApmGC82ztq4TDc80QtYWkIhotxQZWYUyaWdV8I7
 5GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U8Eb2mLb5U/+FkB5qnpVGhGGBV1jxFTMfBhLagA3qt4=;
 b=PJOeN+ss/4NYqyFgnOrQ8IPAiEsGZeNnL38AuG5wOmAsU0jvvVQdBj9PrN5he5LLGb
 YyvxdlAxfXjKMzMXxNyaTJJQzAsIEqBSanPA/Wl/azQgFRDngnXHmDC7o876rvJyR/vM
 IMUgTcazUBFT1Iw9BmyKP/s2rMMXHNw0wAvh80DaMVzPet/3uevdzrixOY6edDd2exyy
 9laC31LEmQ+Ve2WpgFPiaq8HYeTDB8AWOjrrW8xZqyoYVmE2WVhG+B4FoYZdl5UAlinY
 CyO4VDm3SARH9hd3K0tCki8etgMrs6qrWYGZgm0i4bdK/vlPHYtQcEAGMnqlJF4FPkUm
 i05g==
X-Gm-Message-State: AOAM532e7hp7YK8SnaWge9wwP7/8mwB/ybHfx0cbco9VEWLPuo8f+YrZ
 2NvF5yG8fuoXTPAAOCcZtOeNqDELydtMmXzs8aNkNw==
X-Google-Smtp-Source: ABdhPJwzzj6KxQ7V7tvAausIZrT3l6YmTBYOldxoNicSCnwD56SOpdxC3+ErMoiDp00xoaMWYeDj7Oi4ioeIR4b4W5Y=
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr578947ljj.114.1591706004138; 
 Tue, 09 Jun 2020 05:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200608072855.26589-1-olaf@aepfle.de>
 <20200608100051.16be834e.olaf@aepfle.de>
 <24286.6790.983312.672969@mariner.uk.xensource.com>
 <CAKf6xpusrQaMb3ET_HJyrreSPvvogEQORSWUG1X2H5oa-HUZiA@mail.gmail.com>
 <20200608161111.26c2cdd4.olaf@aepfle.de>
In-Reply-To: <20200608161111.26c2cdd4.olaf@aepfle.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 9 Jun 2020 08:33:12 -0400
Message-ID: <CAKf6xptNnyEvOu-skpf0Hh_n4d-9LpYKX_5Z7vmA5uoe4oF7Hw@mail.gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
To: Olaf Hering <olaf@aepfle.de>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 10:11 AM Olaf Hering <olaf@aepfle.de> wrote:
>
> Am Mon, 8 Jun 2020 08:43:50 -0400
> schrieb Jason Andryuk <jandryuk@gmail.com>:
>
> > I added a length check in this patch:
>
> gcc will not recognize such runtime checks and will (most likely) complai=
n about the strncpy usage anyway, just as it does now in libxl__prepare_soc=
kaddr_un. While the usage in libxl__prepare_sockaddr_un is fatal due to -We=
rror, libvchan is apparently built without -Werror.

gcc complaining about strncpy after the length check is unfortunate.
Do you know if gcc would complain if strcpy is used?  It would be okay
since we just checked the length.

What version of gcc are you using?  I was using 9.x and it didn't warn
from what I can remember.

Regards,
Jason

