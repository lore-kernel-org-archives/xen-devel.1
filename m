Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEB410D14AD
	for <xen-devel@archiver.kernel.org>; Mon, 30 Mar 2026 13:04:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1267605.1557070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CHq-0000O6-NE; Mon, 30 Mar 2026 13:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267605.1557070; Mon, 30 Mar 2026 13:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CHq-0000Nz-Ka; Mon, 30 Mar 2026 13:04:10 +0000
Received: by outflank-mailman (input) for mailman id 1267605;
 Mon, 30 Mar 2026 13:04:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69ca74c7.v1-13f2a4e58d4041a1a932ee0616fd37ca@bounce.vates.tech>)
 id 1w7CHp-0000M5-6N
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:04:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7CHo-00EQZX-I3
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:04:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69ca74c7.v1-13f2a4e58d4041a1a932ee0616fd37ca@bounce.vates.tech>)
 id 69ca74bb-5cb7-0a2a0a5109dd-0a2a4509eab0-48
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:04:08 +0200
Received: from [198.2.179.37] (helo=mail179-37.suw41.mandrillapp.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69ca74c7.v1-13f2a4e58d4041a1a932ee0616fd37ca@bounce.vates.tech>)
 id 69ca74c7-e484-0a2a45090019-c602b325203c-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:04:08 +0200
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4fkrzq0PLLzG0CBNF
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:04:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 13f2a4e58d4041a1a932ee0616fd37ca; Mon, 30 Mar 2026 13:04:07 +0000
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
	s=mte1; t=1774875847; x=1775145847;
	bh=OpnNCie1+X46hSYHJy3bjZaeFwsCA4q7T2ADeDx038k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Lf++vvEkBQa5R1fY67ct7qRYQ+sNTXbpogHrIDEFTeXXLs6ra1SMNf6W9tcL2Pnsj
	 aiJVHaIi2Kp68w8y1LT8F6sISOCtSqcaNztWZNKIUo3JRv0t+b8Lml5M4TFXr45OEL
	 rkVV+2G1fu5y6EceKsSqmQRHpatwjTvbVEVhJ3ymsGfgFJxSWCoHUgmd7Dkck3FOzu
	 hmTsq42GesQOgzSdT75y4cVH91gaIoLd0+BvadB9227/I/rBCfxVG6KItko72FYVwm
	 HamLgpEFmfeInG77WqAr7cEatyt7Euvbzfza7wY7VKyhyByxA+L7SdY1WwZxagPE3r
	 3Bt3CafeXKgFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774875847; x=1775136347; i=anthony.perard@vates.tech;
	bh=OpnNCie1+X46hSYHJy3bjZaeFwsCA4q7T2ADeDx038k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Q9v7lIm+Up9ygHWiDsPZJR8/nE0z7pqJQOoqI/kaWkQG0G/cb46yj/1aav7k4QyW/
	 g4SUEYyBumyYD6sGKmnWWHXhZLfLyvuw7ujP63/JNOScmJQofBRhPp35egzmSrWbkH
	 OOpXC8ThuV6smHcuZqi4n/UyTj0k/1Zd86Ekkl0y34EV4b/GThRh6Qx/05f57ctdiV
	 +tsH1tVn7Nn9wTIyXxWkavi/A1FdvlwEjhCrBpSJdYvdSs2HC2/STrPpOU/vX/ROfs
	 DqK1OON7BGctPTOeuO95mDjDdeg4xN9TNG4Eaa2aRRdjRcVwR09X+Mo8+OMB6vFCc8
	 LajdqJlp8/wUg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v9=202/3]=20xenpm:=20Use=20EXIT=5F{SUCCESS,FAILURE}=20instead=20of=20errno=20as=20=20exit=20codes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774875846505
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <acp0xvKOvI78-01W@l14>
References: <d7d0fa8ca02d59d34bd3be7ecfacd5c0376fafc0.1773671343.git.teddy.astie@vates.tech> <cafb3c93e212a20e314517418dc2ab9f316708b1.1773671343.git.teddy.astie@vates.tech>
In-Reply-To: <cafb3c93e212a20e314517418dc2ab9f316708b1.1773671343.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13f2a4e58d4041a1a932ee0616fd37ca?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260330:md
Date: Mon, 30 Mar 2026 13:04:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774875848-6974BA73-87C02114/0/0
X-purgate-type: clean
X-purgate-size: 618

On Mon, Mar 16, 2026 at 02:34:07PM +0000, Teddy Astie wrote:
> errno is not unified accross platforms, which makes error codes actually
> platform specific. C standard defines EXIT_SUCCESS and EXIT_FAILURE
> (respectively 0 and 1) as standard errors codes, even though it only reports
> whether it failed or not.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


