Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CDC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:54:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407013.1640193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x261h-00012Q-5b; Thu, 03 Sep 2026 11:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407013.1640193; Thu, 03 Sep 2026 11:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x261h-00012J-1i; Thu, 03 Sep 2026 11:54:41 +0000
Received: by outflank-mailman (input) for mailman id 1407013;
 Thu, 03 Sep 2026 11:54:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671eea1c000c4f3@swg.vates.tech>)
 id 1x261f-0000zc-Kw
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:54:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x261f-003YVd-1k
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:54:39 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671eea1c000c4f3@swg.vates.tech>)
 id 6a995ffe-e002-0a2a0a5209dd-0a2a45019da2-0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:54:38 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671eea1c000c4f3@swg.vates.tech>)
 id 6a995ffe-5984-0a2a45010019-b9ff1c238c8f-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:54:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0671eea1c000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 11:54:34 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id BBE4683201;
 Thu,  3 Sep 2026 13:54:33 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=PTTe91P5vC5tyBRcoyF+Vov74RZqp+9k0MML3LUnyY0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qJjj4pFRjgMMsMKG6gtfr7VxhC0fJQE7OngNsF0/I+YJbkf/RmoFFju794GfpQz6Az08a1HJ7
 wggxkB1MgKRNN/YEFYO+eaaOcC4bp6RdG6nimtDENNo6qR32MaII8v/C3WL29C2BaPh7xiq5Ftc
 0DFeHueY4TG4RZ8AMio7su1Sw+MPksXZy1VkQ91JM4RlrPGXZsnN0RalpqynYZNng4V88or1pry
 toIi7/2a/zhCQ6waUQNkDK5lBcMOMUg+9Rwh1BgXM7kFs0Kk6HEx3DHpYcE7RESSaovTLUfxR+C
 5eEipMWsAq7KidaGqY4qqjoHz5poLjJtAg3hMc0Uz7sA==
X-Zone-Loop: 638599f3dd12429a482c9d37adf9d919c9a4c3f84fd9
x-campaign-type: default
x-transaction-id: eb933437-0805-41b9-b060-e532b1d7d7b6
x-swg-uid: 01-1fc55639-b01d-4c01-8a0c-616f91a1f206
X-Mailer: Sweego
Message-ID:
 <1788436474.8631fc262581453bbf619ec5b2062170.1a0671eea1c000c4f3@vates.tech>
x-swg-bid: 1788436474.8631fc262581453bbf619ec5b2062170.1a0671eea1c000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 3 Sep 2026 13:54:33 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 5/7] build: move $(all-symbols-*)
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <af402588-3a7d-4923-96e1-f5761b445889@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af402588-3a7d-4923-96e1-f5761b445889@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3501.25240ac73f40bfb0.1a0671ee82b.d239f7e1bdcf7930=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788436473899
X-purgate-ID: tlsNG-d62444/1788436478-BD87F757-684E84F9/0/0
X-purgate-type: clean
X-purgate-size: 726

---=Part.3501.25240ac73f40bfb0.1a0671ee82b.d239f7e1bdcf7930=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:02:57PM +0200, Jan Beulich wrote:
> With the final linking logic now consolidated in scripts/Makefile=2Elink=
,
> $(all-symbols-*) also doesn't need setting anymore in (and passing down
> from) the top level Makefile=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3501.25240ac73f40bfb0.1a0671ee82b.d239f7e1bdcf7930=---

