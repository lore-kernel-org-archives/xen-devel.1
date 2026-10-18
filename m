Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D2ECCF2C9
	for <xen-devel@archiver.kernel.org>; Sun, 18 Oct 2026 14:40:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1453647.1667415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIS3N-00016N-1l; Sun, 18 Oct 2026 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1453647.1667415; Sun, 18 Oct 2026 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIS3M-00016F-Sw; Sun, 18 Oct 2026 14:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1453647;
 Sun, 18 Oct 2026 14:40:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14f746f150008425@swg.vates.tech>)
 id 1xIS3L-000169-Cp
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2026 14:39:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIS3K-006ZGb-FO
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2026 16:39:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14f746f150008425@swg.vates.tech>)
 id 6ad4da04-e002-0a2a0a5209dd-0a2a450ac0b4-26
 for <xen-devel@lists.xenproject.org>; Sun, 18 Oct 2026 16:39:58 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a14f746f150008425@swg.vates.tech>)
 id 6ad4da3d-f2d2-0a2a450a0019-b9ff1c23ae8d-3
 for <xen-devel@lists.xenproject.org>; Sun, 18 Oct 2026 16:39:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a14f746f150008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 18 Oct 2026 14:39:53 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1485281D23;
 Sun, 18 Oct 2026 16:39:52 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2c7MhbuinXrsyQ60cfFMuRsHi+omEwex80iZcKhchJw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GwFOIDys81TLJi+tf6J5E+QkjbiYPIYwRpC8PpFQKLCltIKsRbiB4k+JaKSeZK6SvnJ7/XLMB
 QGKCYsfUsuTfMjglGif+fIQJq7cSf7TPoulDgvI0p6g70zr3HPWk8fOc0rfYbaRPWdOgJU5NALo
 Y+L46SdYj2T6ARHbiOQXZ0kEwfDoAm9RM+Hqz/DV9eipRgQfRkb/Bk52+eGmgQEgRxNHKmp1haN
 Dn6tA+zkT/bCziFTG8VwI/jIwhhH/kBD2B0Q8Px8VGzLNThiQnrACJ3Iq9i07SlT6aRBO6qkoJA
 QFLpsLLRToHY/L5l2MtMk2O8KW4cKWpj9YyhMxfUuDjg==
X-Zone-Loop: b8ccee5780c948bc6ffb1cfad58aea3a0f3827287173
x-campaign-type: default
x-transaction-id: ecc9e603-4fe6-476d-b78c-01499450b3eb
x-swg-uid: 01-ec338487-10b8-4277-bf15-b2c89863f62b
X-Mailer: Sweego
Message-ID:
 <1792334393.8631fc262581453bbf619ec5b2062170.1a14f746f150008425@vates.tech>
x-swg-bid: 1792334393.8631fc262581453bbf619ec5b2062170.1a14f746f150008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 3/3] tools/libxenstat: fix output initialisation in parseNetDevLine()
Date: Sun, 18 Oct 2026 14:39:34 +0000
In-Reply-To: <1792151746.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@vates.tech>
References: <20261016091259.1254879-1-olivier.lambert@vates.tech> <1792142038.8631fc262581453bbf619ec5b2062170.1a143fd56420008425@vates.tech> <1792151746.8631fc262581453bbf619ec5b2062170.1a14491772e0008425@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.30a.c2e917628eab9432.1a14f746ba1.d4e487ca09f829ed=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792334392229
X-purgate-ID: tlsNG-4011c0/1792334398-510C9CFC-3CCF9484/0/0
X-purgate-type: clean
X-purgate-size: 1165

---=Part.30a.c2e917628eab9432.1a14f746ba1.d4e487ca09f829ed=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 16/10/2026 13:55, Baptiste Le Duc wrote:
> The subject says "fix", but the body says no functional change=2E Either
> it's a bug fix and wants a Fixes: tag, or it isn't, and then I'd use
> Amends: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use
> network bonding") and drop "fix" from the subject=2E Based on the change=
s, I think the latter=2E

Agreed, it isn't a bug fix: the only caller passes NULL for rxMcast,
and the other two changes don't alter behaviour=2E All three come from
1fd93d4f8cb8, so Amends: fits=2E

In v2 the subject will be "tools/libxenstat: clean up output
initialisation in parseNetDevLine()", with the tag added=2E I'll wait a
bit for other comments before sending it=2E

Thanks for the review,
Olivier


-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.30a.c2e917628eab9432.1a14f746ba1.d4e487ca09f829ed=---

