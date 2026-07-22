Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2885C44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 15:11:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368520.1617853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmYbd-0000fR-Rk; Wed, 22 Jul 2026 15:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368520.1617853; Wed, 22 Jul 2026 15:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmYbd-0000fK-Nc; Wed, 22 Jul 2026 15:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1368520;
 Wed, 22 Jul 2026 15:11:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f8a61a772000edb5@swg.vates.tech>)
 id 1wmYbZ-0000fE-GZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 15:11:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmYbY-004owV-EG
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 17:11:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f8a61a772000edb5@swg.vates.tech>)
 id 6a60dd99-bab6-0a2a0a5309dd-0a2a4509d0d4-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 17:11:28 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f8a61a772000edb5@swg.vates.tech>)
 id 6a60dd9f-be1a-0a2a45090019-b9ff1c239b6d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 17:11:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f8a61a772000edb5.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Jul 2026 15:11:23 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A6E9C82ABB;
 Wed, 22 Jul 2026 17:11:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=x4GopKbLX6t9iL/V2VHI+Y++eV4UU4Sv7+H8jzGJpZE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Q4NipT45HEKcv4h2ZGImpv9rGc4Cx23G5ikbM6Xl5yJNP/ZhJ0Nn72OXiaiQCeLMIhdt8NrM1
 BYmqxZVgjE+E3H5kzy7aXPglnHalT3Uw1248b1O0Ysj4bgJVGR98GrDRzdn1O5BO1tGS+O2DGlX
 amqzxWDb6nDMmOkXTC+JhqTHvPp/QnhYgn9UBWZvBzO9xB+cUyPjCyjiQfVKkxf5mxIN+McMyI0
 qdCg/iZenzVjeAFUQhdaRWM7ks78FF476+bbAqR2d3zGAFUUgly58CEgcRDGRIofzwzNLa664pw
 kWvelJS53f8bvhz4szP7qSrH7Irc0wht3tZl5zcVJPNw==
X-Zone-Loop: 8c6e4fe4936984b46f1b4fb8f059dbb58133e57a0ced
x-campaign-type: default
x-transaction-id: f6207e17-c8c2-4d5a-af0f-fc684569d85d
x-swg-uid: 01-293f4970-eefb-4e8f-8e38-ed52d9f619c5
X-Mailer: Sweego
Message-ID:
 <1784733083.8631fc262581453bbf619ec5b2062170.19f8a61a772000edb5@vates.tech>
x-swg-bid: 1784733083.8631fc262581453bbf619ec5b2062170.19f8a61a772000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Jul 2026 17:11:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Ryoji Okamoto <okamoto@valinux.co.jp>
Cc: xen-devel@lists.xenproject.org, Ryo Takakura <takakura@valinux.co.jp>,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] tools/xentrace: decode RTDS priority in repl_budget
 records
References: <20260710064352.343914-1-okamoto@valinux.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710064352.343914-1-okamoto@valinux.co.jp>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1054.b775598c215a5a5e.19f8a61a4cd.61a9d23d7a474aee=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784733082829
X-purgate-ID: tlsNG-bad1c0/1784733088-3A6DA034-D301F9F7/0/0
X-purgate-type: clean
X-purgate-size: 960

---=Part.1054.b775598c215a5a5e.19f8a61a4cd.61a9d23d7a474aee=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 03:43:52PM +0900, Ryoji Okamoto wrote:
> The RTDS repl_budget trace record now contains the vCPU priority
> level=2E Update xenalyze to account for the additional field and print
> it when dumping the trace event=2E
>=20
> Without this change, xenalyze interprets the record using the old
> layout, causing the deadline and budget fields to be decoded from the
> wrong offsets=2E
>=20
> Fixes: 463b95831778 ("xen:rtds: towards work conserving RTDS")
> Signed-off-by: Ryoji Okamoto <okamoto@valinux=2Eco=2Ejp>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1054.b775598c215a5a5e.19f8a61a4cd.61a9d23d7a474aee=---

