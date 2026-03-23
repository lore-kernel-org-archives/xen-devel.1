Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7AF4610F
	for <xen-devel@archiver.kernel.org>; Mon, 23 Mar 2026 13:22:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1259342.1552648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fE4-0000Cb-QE; Mon, 23 Mar 2026 13:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259342.1552648; Mon, 23 Mar 2026 13:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4fE4-0000CU-NK; Mon, 23 Mar 2026 13:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1259342;
 Mon, 23 Mar 2026 13:21:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c13e6a.v1-33c5301cf1314178811d3a23cda0d1b3@bounce.vates.tech>)
 id 1w4fE4-0000CO-B0
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 13:21:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4fE3-00Ardz-N2
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 14:21:47 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c13e6a.v1-33c5301cf1314178811d3a23cda0d1b3@bounce.vates.tech>)
 id 69c13e66-5cb7-0a2a0a5109dd-0a2a450b9786-18
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 14:21:47 +0100
Received: from [198.2.180.47] (helo=mail180-47.suw31.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c13e6a.v1-33c5301cf1314178811d3a23cda0d1b3@bounce.vates.tech>)
 id 69c13e6a-ef63-0a2a450b0019-c602b42f5b4e-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 14:21:47 +0100
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ffYjQ0xFyzPm0Z0p
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 13:21:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 33c5301cf1314178811d3a23cda0d1b3; Mon, 23 Mar 2026 13:21:46 +0000
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
	s=mte1; t=1774272106; x=1774542106;
	bh=LC/ReU2hsrMf13apk+f9xRZm1UAz9MWmFywd2c0wNow=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vlep/Cm/U4q9PLicHmrI4bAlAGGH6Q2q1/u3jz9LalJB0g8cjAmvrhCVdXrNYm52W
	 77BhbEJ4RVkKHhUUwKus3zwyUJIFZkilPtguyzppug30413oK+TIqeD41pWh3+R163
	 XxwwoIG0raaVEPran2rcdOZD/JObct1/6fI7DqRVczYfxPSNRmJDbf8vZoxDTq+wK1
	 FgFWLh4mjuY/laTSzoV5H8PWqQcymuMJesZRP+sPsl7sDy9DyN/8YFfcd39Wp0u8Gs
	 7E8YiIrrX0iIghqPdKHD+S6ICdvsSbRbtTggEdYSoeDiqr3a3kGqzMtuo15MLsQddd
	 tLj3NUjNrRY8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774272106; x=1774532606; i=anthony.perard@vates.tech;
	bh=LC/ReU2hsrMf13apk+f9xRZm1UAz9MWmFywd2c0wNow=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KXVngi2drWTVntoY7m87UKXw2ERuunRQHIflfDEqSt881b2MWDFRn3qp0Esp+lTga
	 KotnWZWJgjllKcmMb8/2klYtgTLTqfgH/VyANmd70F7wn9c6hlgLNtadWiDOyqpveT
	 U2f8ze2Xo3p1n3iUsZ2XJAi4ylMbMz4Fl1G2YMTW2YcTzR32emh8ZO+FcPZQoBWlBZ
	 myMgq2a0kgkwQB7Fq71dpxt3KZJtEWNDKvx0NnrYPnACVYCOJP3oqPgObgDg2pl7RK
	 YjSxRc032SA+LDR5FtW9c6LHUTlr048jLxjDLYFfT9ZtUal/lc7+sCKIbzsRfZwhf9
	 dyO6qEtU29DAg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2010/12]=20tools/libxl:=20add=20support=20for=20xenstore=20quota=20in=20domain=5Fconfig?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774272105554
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Nick Rosbrook" <enr0n@ubuntu.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <acE-aa5H070ZA9Cm@l14>
References: <20260320150120.874878-1-jgross@suse.com> <20260320150120.874878-11-jgross@suse.com>
In-Reply-To: <20260320150120.874878-11-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.33c5301cf1314178811d3a23cda0d1b3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260323:md
Date: Mon, 23 Mar 2026 13:21:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774272107-BB2A8112-38943692/0/0
X-purgate-type: clean
X-purgate-size: 647

On Fri, Mar 20, 2026 at 04:01:18PM +0100, Juergen Gross wrote:
> Add support for xenstore quota in the struct domain_config. Initially
> it will be used only for migration of a domain.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # golang stuff
> ---
> V2:
> - use LOGED() for error logging (Anthony Perard)
> - mention additional struct member xenstore_quota in libxl.h
>   (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


