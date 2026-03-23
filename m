Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D303F46126
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 14:08:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259362.1552666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fx2-0007vH-Bx; Mon, 23 Mar 2026 14:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259362.1552666; Mon, 23 Mar 2026 14:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fx2-0007v9-85; Mon, 23 Mar 2026 14:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1259362;
 Mon, 23 Mar 2026 14:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bM9v=BX=bounce.vates.tech=bounce-md_30504962.69c1494a.v1-957883b1f64e4d54a824bee1de0fa786@srs-se1.protection.inumbo.net>)
 id 1w4fx1-0007v3-6t
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 14:08:15 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d095ce-26c1-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 15:08:12 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffZky4tz3zPm0Pl3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 14:08:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 957883b1f64e4d54a824bee1de0fa786; Mon, 23 Mar 2026 14:08:10 +0000
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
X-Inumbo-ID: b9d095ce-26c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774274890; x=1774544890;
	bh=8SpwDAYyVgJhLuuTGS6lyDQdY2q+Rps9z9YUurxNcEM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T0YZUtXL8KsTvHOUFJfPwnUWmI7IQBIzU+4FeOGKMtF/P6SUFeJrR28UV05zYmOAg
	 6aCxGDkAh/WtwIQoImVK53XS7e2ugJDepTUNJdrYIuUj93D1MgY+/Eg81MMn9bYIcg
	 q3H4nU6/DQQx0cVLl2PGvcMWr0jGt/HgACiuQE8iviv/tPByEfpt2Zi7fNCWPOy5PT
	 DaIhFBxQc6hWdm2BABJA1PHpRcRnBCLXWgd9/wxmoU5X/kGPcFo7uy1eJxsLHTPje7
	 QS8UssMD8jSK5fj1x/OPOuX4Pz5Z9B7+hAujTydPltU9uGjJlrCgDzJX7/QeLwfG4Q
	 BG2IyGgOEIwgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774274890; x=1774535390; i=anthony.perard@vates.tech;
	bh=8SpwDAYyVgJhLuuTGS6lyDQdY2q+Rps9z9YUurxNcEM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=a6MrSDiJ2hvfCBQULP9FMc31gE2BYk5VX1qOjFOdPVH5xMzH+OvgFP5LFzIN0KOL0
	 L9rJVPe8Yx8nFcbD/VqTy9YmFqbAz+Vsw2srDhT7YzEpyGCx8bTcgf0JIw/ZFPhi6D
	 ZU/hFAqHTTvGlUnDVuINT2h393gunzWwg4cBt+0GEQ5gSckIggx5tM1RxBDY0+2G0h
	 2B5LxiIXPgY69XLa1VzE5XW5TaQTCgWokd0wft3kxulVVat5FYlOuAD2u+mSSXKaZ8
	 vvoivkn5gsITfJQpya32/CaCRqy3Jt5mmQ85I7p54ocWnDapYHPg8eq9/1t4qDrOjx
	 QfyAqAPF/81BA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2011/12]=20tools/xl:=20add=20xl=20commands=20for=20xenstore=20quota=20operations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774274889967
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <acFJSR0obXau258l@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-12-jgross@suse.com>
In-Reply-To: <20260320150120.874878-12-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.957883b1f64e4d54a824bee1de0fa786?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 14:08:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 20, 2026 at 04:01:19PM +0100, Juergen Gross wrote:
> Add "xl xenstore-quota-get" and "xl xenstore-quota-set" commands for
> retrieving and setting global and per-domain Xenstore quota.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - s/quota data/quotas/ in cmdtable (Anthony Perard)
> - test for quota value to fit into type (Anthony Perard)
> - use libxl_xs_quota_list_init() (Anthony Perard)
> - use xcalloc() (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


