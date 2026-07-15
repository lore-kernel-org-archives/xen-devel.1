Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DDEC44507
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 09:22:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362837.1614547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjvo7-000394-M4; Wed, 15 Jul 2026 09:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362837.1614547; Wed, 15 Jul 2026 09:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjvo7-00038x-JC; Wed, 15 Jul 2026 09:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1362837;
 Wed, 15 Jul 2026 09:21:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6514cc99000edb5@swg.vates.tech>)
 id 1wjvo5-00038r-5X
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 09:21:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjvo4-00ARlL-As
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 11:21:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6514cc99000edb5@swg.vates.tech>)
 id 6a575111-5cb7-0a2a0a5109dd-0a2a4503a18e-48
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 11:21:32 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6514cc99000edb5@swg.vates.tech>)
 id 6a57511b-fae8-0a2a45030019-b9ff1c23abb3-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 11:21:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6514cc99000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 09:21:29 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EAD98822DC;
 Wed, 15 Jul 2026 11:21:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=WDh/ttfnnuz5C/DyzqJRGD6ci8fLLIEcwOWx+8a+02s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GUokjIQR6q9CDURRGLmkPvTCkXFMbW2k/9f5hbnP8hHpsBfqn4YjUY+ddpz8XpVi0gQXY3n8z
 56e2zOFppy9NAYSLk9JroNgidIt9xjbG5cjyvXMrf0boPOdxX2fvtka+lqpPvGEMHnuWlRq2BBx
 q+v3yAPRiynfPPMFKjpRyDHFAcAkubpQgOC1CXQSRCOMsyT0YnyMgX5CcMniKLYGuVcCgxqeZqG
 KxftQUa2e3RBwuzsVsknXHLBCcO53WM9ilreXu02yfXMU4io4M8MmpskgcxtNn6qgz1RpYSSbP8
 hn+qGdHaMsTLo7wiPgbdEoyCd+q2UdgOliFOY4BWiCxQ==
X-Zone-Loop: 684d33fdfb6e01cf5e3e5cb62ba883bbb2098b5b8eea
x-campaign-type: default
x-transaction-id: c751403d-7fec-41dd-b11d-f36e5204321e
x-swg-uid: 01-0a8b20cb-c121-4581-882c-762fe9ac08ce
X-Mailer: Sweego
Message-ID:
 <1784107289.8631fc262581453bbf619ec5b2062170.19f6514cc99000edb5@vates.tech>
x-swg-bid: 1784107289.8631fc262581453bbf619ec5b2062170.19f6514cc99000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 11:21:28 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Edwin =?iso-8859-1?B?VPZy9ms=?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v9 3/4] libs/guest: allocate various migration arrays
 just once
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
 <20260713204802.105115-4-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713204802.105115-4-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.81d.ddc5bc79ec70dd0a.19f6514ca0f.342b20155e628d32=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784107289103
X-purgate-ID: tlsNG-33051d/1784107292-754844E9-53CABF43/0/0
X-purgate-type: clean
X-purgate-size: 810

---=Part.81d.ddc5bc79ec70dd0a.19f6514ca0f.342b20155e628d32=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 09:48:01PM +0100, Frediano Ziglio wrote:
> From: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
>=20
> Allocate these array just once at the start of migration,
> using the maximum batch size, and free them at the end=2E
>=20
> Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin=2Etorok@citrix=2Ecom>
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.81d.ddc5bc79ec70dd0a.19f6514ca0f.342b20155e628d32=---

