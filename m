Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C0F8D753
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2026 15:50:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1283737.1565873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOyz-0000VA-4v; Thu, 16 Apr 2026 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283737.1565873; Thu, 16 Apr 2026 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOyz-0000V2-2P; Thu, 16 Apr 2026 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1283737;
 Thu, 16 Apr 2026 15:50:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 1wDOyy-0000Uu-3g
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:50:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOyx-006MIj-GT
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:50:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 69e1052c-e002-0a2a0a5209dd-0a2a450baad6-42
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:50:19 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e10539.v1-85e8c2739d4043d4abe69bf7fc95e86c@bounce.vates.tech>)
 id 69e10539-212f-0a2a450b0019-c602890b188d-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:50:19 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxMsj33pYzDRSZM5
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:50:17 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 85e8c2739d4043d4abe69bf7fc95e86c; Thu, 16 Apr 2026 15:50:17 +0000
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
	s=mte1; t=1776354617; x=1776624617;
	bh=yNzeAHDQtjP0qF/KOsIk4v0+tmx3LTDv5o5PUVahFG0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FUTGnUmBPYcKl5Px7q4IhntcTTtjufZebQ6/9HQtLVUBr6ZDDA5IzmKaamV5gt7Ja
	 ye55VABhdeeMvMfpPTVo72Lpfkn6rWlNYyK2OoqCn6O2K4g0MBvYdnd1DbFlkA/pfL
	 MFGQfdOD82vTmKG3vvab1pYRYNvTZ6ohScmVk+nmfYqDAG/fsum+4lWMSNgxi1tG5Q
	 Je2HuEYelnByLJJjoNuGfmLb0q857+d/gYafn3A9pbhnbzJh5FvlMfnpVIamoK2BSz
	 cvmzBACY7nmg+A4m4TU2kc6tcb75CiBus7P3gIULSI8SL1/G92WsQu6Xy2RNiUyAlG
	 BGE0nr0v18r3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776354617; x=1776615117; i=anthony.perard@vates.tech;
	bh=yNzeAHDQtjP0qF/KOsIk4v0+tmx3LTDv5o5PUVahFG0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rCys1Hynnj3LhLzcld0X09/s3muRPSwaXn5abbiUrm70ZwywiSeY0+RYH1GOeLEps
	 pDInwFMdv9fqmLdCgA5sJyFjrekQGsa7gTmTLX/PrJIqgoXH6O6l5E9soGr1qNPasP
	 0t6Ftq0X2zkMZDtj4vMpEPxaxhVNkF7npS0iMbk99FbaihCzYrwoyLciCegW0XKJj2
	 rV/R7vrxCAE+CWzhAhuFWyGfU8sABFgeXfwe6u+A9zecBN21AF2qV6gQI+LI+NxX5D
	 ffnS1vm+TbYYo6j+tm+7E5WrAyveH9Gd3jLwBN9KnVyRp5fhjhSRTyCNwhYBTurfdK
	 4EUcVI1hY9vlw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=202/6]=20CI:=20make=20test-artifacts=20repo/branch/job=20customizable?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776354616209
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <aeEFNz_yebXqgyoi@l14>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com> <2d5d25d864058dcd9d139fd2115b88f82ba12424.1774999414.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <2d5d25d864058dcd9d139fd2115b88f82ba12424.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.85e8c2739d4043d4abe69bf7fc95e86c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 15:50:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1776354619-7D56BF3B-926FE146/0/0
X-purgate-type: clean
X-purgate-size: 940

On Wed, Apr 01, 2026 at 01:24:51AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Allow choosing which artifacts branch and job to use for Linux. This
> allows running the same tests for different Linux versions, without
> duplicating a lot of yaml sections.
> 
> Similarly, make the repo path itself configurable too. The main purpose
> is to ensure the test pipeline triggered from any repo will fetch linux
> artifact from the right repo. But with a minor change of using that
> variable for rootfs and microcode artifacts too, it allows testing
> test-artifacts repo changes without needing to modify gitlab-ci.yml in
> xen.git at all.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



