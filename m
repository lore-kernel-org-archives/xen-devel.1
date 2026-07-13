Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD5FC43458
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2026 13:55:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361697.1613838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjH7q-0005dx-LD; Mon, 13 Jul 2026 13:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361697.1613838; Mon, 13 Jul 2026 13:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjH7q-0005dq-I2; Mon, 13 Jul 2026 13:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1361697;
 Mon, 13 Jul 2026 13:55:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5bc2a26f000edb5@swg.vates.tech>)
 id 1wjH7p-0005dk-5b
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 13:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjH7o-008RHG-Fs
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 15:55:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5bc2a26f000edb5@swg.vates.tech>)
 id 6a54ee3f-e002-0a2a0a5209dd-0a2a4508c99a-4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:55:12 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f5bc2a26f000edb5@swg.vates.tech>)
 id 6a54ee3f-ee29-0a2a45080019-b9ff1c238a59-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 15:55:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f5bc2a26f000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 13 Jul 2026 13:55:10 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 254AB821D3;
 Mon, 13 Jul 2026 15:55:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=JxuKTnw+3Scd+jD1piFqi7kwZau9ERw4HH3WfPsNKw0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RjLOoHRhsqikMz7MOcH2v4qMjT11P18Zs2T9kwiLVT2uXTav2MjwU2+xXP8uT0tzck7Mb1qR4
 9j2Lb1y7Sm97+hjXqe+05fLhboF69s2dXwSgyM+f/SexWQrI5Y3mFdy8HPSuEa+kbe/QhDqszkq
 H7QD1+sCMF/vGV0dbhg5oTRjNTnIgm+OX9g2eO48SbaLmHAKCRCzLGHEMqaYANktMrA9vZum9Vu
 wEotzrql13+V/RbduGnwFpRPvZ0BatHTErM1TzeL7hI2MSf6cUaHTjvf/dnIV7paCSPTJPr5+cY
 73CXHegzFzIXbGB8TPEpPBZhRn9PprixUJepDc+t3BRw==
X-Zone-Loop: 1998f095f7be434c49f1e0ccd2733a25d2e4bae33f85
x-campaign-type: default
x-transaction-id: 782d4732-8626-4bc0-af0b-def8b46ac434
x-swg-uid: 01-7f039a60-91e6-428d-945e-222fffbe3ebb
X-Mailer: Sweego
Message-ID:
 <1783950910.8631fc262581453bbf619ec5b2062170.19f5bc2a26f000edb5@vates.tech>
x-swg-bid: 1783950910.8631fc262581453bbf619ec5b2062170.19f5bc2a26f000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 13 Jul 2026 15:55:08 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 2/4] libs/guest: move batch_pfns into a separate
 structure
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
 <20260711212128.505727-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711212128.505727-3-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.70e.83b9eed0e9994db4.19f5bc29fa4.2da22b2ecd2a5056=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783950909348
X-purgate-ID: tlsNG-c1860d/1783950911-12D6A01C-A5FCA712/0/0
X-purgate-type: clean
X-purgate-size: 2191

---=Part.70e.83b9eed0e9994db4.19f5bc29fa4.2da22b2ecd2a5056=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 10:21:26PM +0100, Frediano Ziglio wrote:
> Prepare for following change=2E

The "following change" is likely going to be unrelated, as patches of a
series can be committed at different time=2E So you need to name the patch
for which this is a preparatory change=2E Something like:

    Preparation for a followup patch "libs/guest: allocate various
    migration arrays just once"=2E

> diff --git a/tools/libs/guest/xg_sr_save=2Ec b/tools/libs/guest/xg_sr_sa=
ve=2Ec
> index 84fdbe4140=2E=2Ee7c22e6500 100644
> --- a/tools/libs/guest/xg_sr_save=2Ec
> +++ b/tools/libs/guest/xg_sr_save=2Ec
> @@ -75,7 +75,7 @@ static int write_checkpoint_record(struct xc_sr_contex=
t *ctx)
> =20
>  /*
>   * Writes a batch of memory as a PAGE_DATA record into the stream=2E  T=
he batch
> - * is constructed in ctx->save=2Ebatch_pfns=2E
> + * is constructed in ctx->save=2Ebuffers->batch_pfns=2E
>   *
>   * This function:
>   * - gets the types for each pfn in the batch=2E
> @@ -95,6 +95,7 @@ static int write_batch(struct xc_sr_context *ctx)
>      void *page, *orig_page;
>      uint64_t *rec_pfns =3D NULL;
>      struct iovec *iov =3D NULL; int iovcnt =3D 0;
> +    xen_pfn_t *const batch_pfns =3D ctx->save=2Ebuffers->batch_pfns;
>      struct {
>          struct xc_sr_rhdr rec;
>          struct xc_sr_rec_page_data_header page_data;
> @@ -110,6 +111,8 @@ static int write_batch(struct xc_sr_context *ctx)
>      };
> =20
>      assert(nr_pfns !=3D 0);
> +    assert(nr_pfns <=3D MAX_BATCH_SIZE);
> +    assert(ctx->save=2Ebuffers);

This second assert is a bit useless, we already used the pointer, so we
know it's valid=2E

With that removed, and the commit message adjusted, which could be done
while committing:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.70e.83b9eed0e9994db4.19f5bc29fa4.2da22b2ecd2a5056=---

