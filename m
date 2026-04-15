Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEFAF419A6
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 13:18:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282433.1565013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD07o-0005mj-7Q; Wed, 15 Apr 2026 13:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282433.1565013; Wed, 15 Apr 2026 13:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD07o-0005mc-3W; Wed, 15 Apr 2026 13:17:48 +0000
Received: by outflank-mailman (input) for mailman id 1282433;
 Wed, 15 Apr 2026 13:17:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df8ff8.v1-fd547845742743ca86a5e54dbe50272d@bounce.vates.tech>)
 id 1wD07n-0005mW-LG
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:17:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD07m-009cId-Ak
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:17:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df8ff8.v1-fd547845742743ca86a5e54dbe50272d@bounce.vates.tech>)
 id 69df8ff3-2eae-0a2a0a5409dd-0a2a45048df8-22
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:17:46 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df8ff8.v1-fd547845742743ca86a5e54dbe50272d@bounce.vates.tech>)
 id 69df8ff8-bb33-0a2a45040019-c602bb0e9b6a-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:17:45 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fwhX84VpVz8XTRtg
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:17:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd547845742743ca86a5e54dbe50272d; Wed, 15 Apr 2026 13:17:44 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259064; x=1776529064;
	bh=vft3hscYBCsif/rRX+2OMXfzz+6WO4w3xXn7Q/U4/KI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Z0S/ysZWGDVvTUs9KUsTUJemkVyjUONCKPBy6NPlR86fHnmoArat5/YzArGQnMEFZ
	 xI2e+36bc72ahmjUUU+ewImQj2TCM+iT4qHtPZuiBG8Qurl2HKyLXphte7HqHYaDQg
	 qUPG/E/S6jLBHtdX7VrF7ppPKzh2OKw25DWIoHkoPfZhUkUZgX/8Az81dgXZV+5g6M
	 78BwJtc2qMwZl8eyqLdKAa9hEugnB11sWrbH8PVXRdpvGzsVCzS+z9GCvB/6Fnrre/
	 wLJE/sq2yUobTS0vtx4evBoJCIZWommYwBrX4Axu9vfV3dGAPMwEf5GIjACbVru2UI
	 vUyMApaQnwapw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259064; x=1776519564; i=anthony.perard@vates.tech;
	bh=vft3hscYBCsif/rRX+2OMXfzz+6WO4w3xXn7Q/U4/KI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=F5oKBKCsCZBqCGb5y7N8vGQZCFEteQ7QrRGgevr2Wnfuncs4vQOF5jDSIDXPlo8VO
	 f8lGlybV1tFIg/u2UlCUMSEemlsTHrtUUv9F2hOZyei1DdAcYY4P7TQf2/pTXr1LoO
	 ENvtk1D1aKt/u861lxkcLO17+2ILnPQy5oOnWk5tLBMrxsP8IiwOUXuPbLpNzMzdSc
	 feKlKRdfJkUdRKwy8oWFkeKrNhWMZrkbPdHJztc3Wr3ORujV88SKNwzRyLKSJVkMEE
	 4OF2kHljFTFbncbWGi8mM63T82nUHXboQEkz1rNkujmZH2An84ROdxWJhnh2/nhWw5
	 xGSLQvmS2XphA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2007/13]=20Support=20building=20arbitrary=20Linux=20branch/tag/commit?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259063364
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ad-P9s8enOeHWFyL@l14>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com> <b616361a3464b221a342dab11cd21ca76454a957.1774999132.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <b616361a3464b221a342dab11cd21ca76454a957.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd547845742743ca86a5e54dbe50272d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:17:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1776259066-3072A51B-3BF21ADD/0/0
X-purgate-type: clean
X-purgate-size: 1552

On Wed, Apr 01, 2026 at 01:21:57AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 58f7571f5366..62b2a24e7faf 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -49,9 +53,13 @@ alpine-3.22-arm64-rootfs:
>  
>  linux-6.6.86-arm64:
>    extends: .arm64-artifacts
> -  script: ./scripts/build-linux.sh
> -  variables:
> -    LINUX_VERSION: 6.6.86
> +  script: ./scripts/build-linux.sh "6.6.86"

Is it crazy to think we could grab the linux version from the job name?
:-D

linux-6.6.86-arm64:
  script:
    - linux_version=3D"$CI_JOB_NAME"
    - linux_version=3D"${linux_version#linux-}"
    - linux_version=3D"${linux_version%%-*}"
    - ./scripts/build-linux.sh "$linux_version"

That would avoid having a job building a version of linux that is
different than the expected one, which can happen easly when duplicating
an existing job for building a new version of linux.

> diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
> index cf0e744bd232..882bac2189a6 100755
> --- a/scripts/build-linux.sh
> +++ b/scripts/build-linux.sh
> @@ -1,5 +1,8 @@
>  #!/usr/bin/env bash
>  
> +LINUX_VERSION=3D"$1"
> +LINUX_GIT_URL=3D"$2"
> +
>  if test -z "${LINUX_VERSION}"

With LINUX_VERSION been set just before, this test doesn't make sense
anymore, or the error message is wrong.

>  then
>      >&2 echo "LINUX_VERSION must be set"; exit 1

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



