Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4BCD98CF
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 13:27:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338224.1599218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7L0-0000pr-5X; Mon, 15 Jun 2026 13:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338224.1599218; Mon, 15 Jun 2026 13:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ7L0-0000pk-2u; Mon, 15 Jun 2026 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1338224;
 Mon, 15 Jun 2026 13:26:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@swg.vates.tech>)
 id 1wZ7Kz-0000pe-3S
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ7Kx-006Kmh-NZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:26:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@swg.vates.tech>)
 id 6a2ffd92-e002-0a2a0a5209dd-0a2a4505802c-14
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 15:26:47 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@swg.vates.tech>)
 id 6a2ffd96-aaa8-0a2a45050019-b9ff1c129633-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 15:26:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ecb7675d9000701b.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 15 Jun 2026 13:26:38 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id ABBD386688;
 Mon, 15 Jun 2026 15:26:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SIAdfxsfqZQGs6Nv8qfuG2pfAXDrWbeBkwBqcPrOTME=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=G4itn6QfqsqNAIymIeK2pTjZggMsRLrBsxRr+16b8nreRdg7dshcW0YIrdNIV9DDxxTPrll6L
 vaqXQEofpQPvXcYm0DIzhAgxsb0OZOpfMURb4QlnmNI+bALScpCln05zbi+1idR8GMqfFrlUIiu
 TlzGkNzVcyF+W//0j3tnsceW/feJAoHRci4NjaGnA97khjY3dmwOXxM9gKVODUL+FL53wdHwk/W
 P2IzLphdpoUWE5CRqj7z4xf/bkLHC6QpfsrdHp0soe8oSxn2DALamTSU5pwAA25GdKJiM+eMOCt
 yZ3r+SJ2AxVvrkzhZMUjhFm7RcO6PcHJMERGlznIOApw==
X-Zone-Loop: 1b44276f2e636ac638421be988aef5cb5df27a37272c
x-campaign-type: default
x-transaction-id: db4a48e3-d36b-4c6d-beda-9faf9557a89e
x-swg-uid: 01-88f72b76-69eb-44c6-a2db-2f6e1b7019ea
X-Mailer: Sweego
Message-ID:
 <1781529998.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b@vates.tech>
x-swg-bid: 1781529998.8631fc262581453bbf619ec5b2062170.19ecb7675d9000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 15 Jun 2026 15:26:37 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/7] Config.mk: Update QEMU to include pip-25.2 bugfix
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
 <20260612230924.3181154-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612230924.3181154-3-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.26f.ba5153379b0955c1.19ecb767223.7aff87b6aefde79a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781529997860
X-purgate-ID: tlsNG-c201ff/1781530007-E0063443-1F9ACE19/0/0
X-purgate-type: clean
X-purgate-size: 1390

---=Part.26f.ba5153379b0955c1.19ecb767223.7aff87b6aefde79a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 12:09:19AM +0100, Andrew Cooper wrote:
> Specifically:
>=20
>   commit 6ad034e71232c2929ed546304c9d249312bb632f
>   Author: Sv=2E Lockal <lockalsash@gmail=2Ecom>
>   Date:   Mon Aug 11 20:01:59 2025
>=20
>       mkvenv: Support pip 25=2E2
>=20
>       Fix compilation with pip-25=2E2 due to missing distlib=2Eversion
>=20
>       Bug: https://gitlab=2Ecom/qemu-project/qemu/-/issues/3062
>=20
> which cherrypicks cleanly onto qemu-xen=2Egit master
>=20
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
>=20
> This needs putting into main qemu-xen=2Egit first, and then the override=
 of
> QEMU_UPSTREAM_URL dropping=2E

Done, you can use 0edeb44c093bea39f0fe4d936ee363b99113ffe1 as
QEMU_UPSTREAM_REVISION=2E

The only difference with you qemu-xen tree is that I've used
`cherry-pick -x` to have the commid id of the original commit=2E

With QEMU_UPSTREAM_URL change drop, and QEMU_UPSTREAM_REVISION
updated: Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.26f.ba5153379b0955c1.19ecb767223.7aff87b6aefde79a=---

