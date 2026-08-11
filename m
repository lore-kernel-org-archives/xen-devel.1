Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE9EC5CFC1
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 11:37:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388138.1629348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtkn9-0005wR-GS; Tue, 11 Aug 2026 11:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388138.1629348; Tue, 11 Aug 2026 11:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtkn9-0005wJ-D9; Tue, 11 Aug 2026 11:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1388138;
 Tue, 11 Aug 2026 11:37:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@swg.vates.tech>)
 id 1wtkn8-0005wD-9p
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 11:37:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtkn7-002mMV-3y
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:37:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@swg.vates.tech>)
 id 6a7b094f-8faa-0a2a0a5109dd-0a2a4508d310-48
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 13:37:09 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@swg.vates.tech>)
 id 6a7b0964-f659-0a2a45080019-b9ff1c12b5c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 13:37:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ff09caa3e000c4f3.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Aug 2026 11:37:06 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 18AC5836DF;
 Tue, 11 Aug 2026 13:37:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=HbKT3tjKmo2Wqu6bcz55wVTzl9OCGMakPKGimwVDDKU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rF/snwwMgKIg3PZvgsaKdHFLk475gdhoAK9OVwJoTzPGUhDNeliqWHpB01yK05cKD/dzS3Vff
 O2YN28Pmbr4Vb2NuVlZ2OzbKbzi46HhcB6tFFKEFW7ZawKPF0kCb2iVzAXKFLcKJcaIVyDDAh9l
 WZEqCZ/Em29zECPV6E03tiLKVVEtYFVEkFewto96FoycOulA9vkgToOvwpYSovThDlpNshSvHhY
 Ed1URNcXln4fGn+ptXg0Ve2Twhi7K+pVYaOa25cXZsuf4XsMKc04pqb8VeD2DvgA6Z24NlfvJQ4
 hUSgN8PCrFQWltebIsVtD0YLrB8DOpRN7mYYYlmzI15g==
X-Zone-Loop: 62c2916f754a8d01808af4afdaafaeb541c8b002e9f7
x-campaign-type: default
x-transaction-id: 1dbb7dab-c6b9-4cab-88b0-efd3a2a28ecc
x-swg-uid: 01-2d7a2f89-d12f-43ce-949f-fb2065a5d50d
X-Mailer: Sweego
Message-ID:
 <1786448226.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3@vates.tech>
x-swg-bid: 1786448226.8631fc262581453bbf619ec5b2062170.19ff09caa3e000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 11 Aug 2026 13:37:05 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10 0/10] xenguest optimisations
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.20dc.8a7aa5d03f4209ef.19ff09ca7b9.38730e8a748c5409=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786448226233
X-purgate-ID: tlsNG-c1860d/1786448228-CC57487B-073DFE6B/0/0
X-purgate-type: clean
X-purgate-size: 1426

---=Part.20dc.8a7aa5d03f4209ef.19ff09ca7b9.38730e8a748c5409=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 11:30:03AM +0100, Frediano Ziglio wrote:
> Edwin T=C3=B6r=C3=B6k (3):
>   libs/call: cache up to 4 pages in hypercall bounce buffers
>   libs/guest: allocate various migration arrays just once
> Frediano Ziglio (6):
>   libs/guest: move batch_pfns into a separate structure

I've committed these first three patches=2E

I've notice that `git am` will put the wrong author on your patch, it
would use the gmail addr instead of the citrix one=2E Could you fix your
config so that `git` does the right thing? I think it is just a matter
of changing the config:

    git config sendemail=2Efrom 'Frediano Ziglio <freddy77@gmail=2Ecom>'

(with maybe --global or with an identity added to the config option if
you use that)=2E

This will tell git that the email is send from a different email
address and it will format the patch appropriately=2E Otherwise, gmail
just overwrite the "From:" without telling git=2E The original "From:" is
still available in "X-Google-Original-From:" but it's not something git
should care about=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.20dc.8a7aa5d03f4209ef.19ff09ca7b9.38730e8a748c5409=---

