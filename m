Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0D4F4369F
	for <xen-devel@archiver.kernel.org>; Fri, 17 Apr 2026 13:26:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1284277.1566100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjCx-0002Qu-U7; Fri, 17 Apr 2026 13:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284277.1566100; Fri, 17 Apr 2026 13:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjCx-0002Qn-QH; Fri, 17 Apr 2026 13:26:07 +0000
Received: by outflank-mailman (input) for mailman id 1284277;
 Fri, 17 Apr 2026 13:26:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e234ec.v1-13888a4284754813a4320b3d89ce7d09@bounce.vates.tech>)
 id 1wDjCw-0002Qe-QQ
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:26:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjCw-00H0yR-7H
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:26:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e234ec.v1-13888a4284754813a4320b3d89ce7d09@bounce.vates.tech>)
 id 69e234e0-bab6-0a2a0a5309dd-0a2a4509c7d8-44
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:26:06 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e234ec.v1-13888a4284754813a4320b3d89ce7d09@bounce.vates.tech>)
 id 69e234ec-2497-0a2a45090019-c602890b9f39-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:26:05 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fxwcr1B8zzDRXtxP
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 13:26:04 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 13888a4284754813a4320b3d89ce7d09; Fri, 17 Apr 2026 13:26:04 +0000
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
	s=mte1; t=1776432364; x=1776702364;
	bh=yOS4SBQdL2rVMR1pZqlGorF4AN8726MhdosMKOtMbH0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vL7sjw+VBliuRum8dfcGnkuLQ4Rn4eqTIGWfDkdtzV9P2ZFYbyajvKFKwo94ciW3a
	 KUjvlZzTEGo7f+zmpnYXOvkaOHqHgkxaxBuVcnUJ247XisuQVpTDctxkS22PRWrpY2
	 tQYvWKmvqNkMVlwfS7W9dR+/+K3M/V0b/CVlnU9gYg7r9DqkX3wgKtPoibytctJ1dW
	 2dWDWKNQfa7jKHPjqZsZDiTM5Q/wqQQ3PD4LUZdmGQr68bAVwxOE6u70ioj4lu1Go+
	 JfLdjY4S1NXaDUCEJolFYHaJSOmAPYsZ5+HHBgryINckWvATFoaKrxagR9+5Sd+ZTS
	 dUcVBYm+HH8mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776432364; x=1776692864; i=anthony.perard@vates.tech;
	bh=yOS4SBQdL2rVMR1pZqlGorF4AN8726MhdosMKOtMbH0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ECA3TNpbYK+4N/9untMWWtu71c5vGpcavM2ExBtT8HY1ze5Y1bVGB/wFnQxmwRzy+
	 iVYyuASm48va9HtubGrLetJmcm+kDViwMYdHeLkRn4rFrrh9ELaZgBc9E5B0LmL0FW
	 Xxtp9zmN7TtZnCPvad++KaQw+dRg/DpABYCiZLlRzJbeR25sHSBnPcz+0KghOmD595
	 MNe8JG/oVICwVOJW22dm6fSYjPvCka5eoZCowv2aclCgaJtrc/Q01mli0O5Wt5hv4+
	 x/QV3erV9fEndKIOFS9jGeChyB+hud63Pb+XnoMp5Cd/gPLp3uxITPll5G1T9bLIkO
	 IUxmAEroNEYaQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=205/6]=20CI:=20setup=20SSH=20key?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776432357951
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <aeI05YM_NkyGj4Q6@l14>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com> <5d11a521db04134f8917c990a494ba8ce44548b9.1774999414.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <5d11a521db04134f8917c990a494ba8ce44548b9.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13888a4284754813a4320b3d89ce7d09?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260417:md
Date: Fri, 17 Apr 2026 13:26:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1776432366-48AAEA53-A369B1EC/0/0
X-purgate-type: clean
X-purgate-size: 506

On Wed, Apr 01, 2026 at 01:24:54AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Generate fresh key for a job, and add its public part to dom0's
> authorized_keys file.
> This allows the test controller to use SSH without any password prompt.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



