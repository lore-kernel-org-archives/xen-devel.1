Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A219C44501
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 09:09:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356712.1611259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOHG-0001e6-GD; Wed, 08 Jul 2026 09:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356712.1611259; Wed, 08 Jul 2026 09:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOHG-0001dz-Dg; Wed, 08 Jul 2026 09:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1356712;
 Wed, 08 Jul 2026 09:09:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fceeca00080a8@swg.vates.tech>)
 id 1whOHE-0001di-Lo
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:09:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOHD-00GqBP-Uk
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:09:08 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fceeca00080a8@swg.vates.tech>)
 id 6a4e13a2-bab6-0a2a0a5309dd-0a2a4505dd2c-46
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:09:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fceeca00080a8@swg.vates.tech>)
 id 6a4e13b3-3cb2-0a2a45050019-b9ff1c23935b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:09:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f40fceeca00080a8.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:09:05 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EA91381F3C;
 Wed,  8 Jul 2026 11:09:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/bAR6JPXry9nepncBFYa9aG85zbINNXGxfCJ6SiGoLs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=X21QJplLzVlypsZAtU+5sOj9xd0yl230xx27iSkrbTWEnj++iy5AdgmVs9+aLquWXPoGwm5Vc
 gncsT/Q1x+NLOvz8WSJGQZGFXSv0HYz/7CgwvaS9gkJpSdp/DmPUBsVOkBkqg/eSQGDAlLTjLFf
 mMVA6K88lImazgXa9J0uwSwDzx3E4rZ4iXGeHTFD+/Lf/SC+ljqRRvTd/Z3huswyKdsvCLJ1vQD
 Ao6MGbCORAXRScy7BrG1uXchL1hvjf0Zykz/gCXcSGn68nz6D/Vtz8budcd3GMI8wiR6uOAwd65
 3SUVi5gc15YNdshg96PY4V+bVJyy0Ltk4QUCIg8ZxSaQ==
X-Zone-Loop: 7fcca927dba75fb7011115090cc62c4911957136aabe
x-campaign-type: default
x-transaction-id: 9935fd07-a460-4686-9290-4f7216b0a6ee
x-swg-uid: 01-c0e2a85d-e57e-4ccb-b39a-e66cd90f2890
X-Mailer: Sweego
Message-ID:
 <1783501745.8631fc262581453bbf619ec5b2062170.19f40fceeca00080a8@vates.tech>
x-swg-bid: 1783501745.8631fc262581453bbf619ec5b2062170.19f40fceeca00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:09:04 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v6.1 02/16] libs/guest: Reduce number of iovecs in
 write_batch()
References: <20260619130501.272832-3-frediano.ziglio@citrix.com>
 <20260701135747.797083-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701135747.797083-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e2.d1f2b23ebbfdcf7.19f40fceb95.9326219e6c2dd7ff=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783501745045
X-purgate-ID: tlsNG-c201ff/1783501747-553E72B8-7798200E/0/0
X-purgate-type: clean
X-purgate-size: 945

---=Part.3e2.d1f2b23ebbfdcf7.19f40fceb95.9326219e6c2dd7ff=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 02:57:47PM +0100, Andrew Cooper wrote:
> From: Frediano Ziglio <freddy77@gmail=2Ecom>
>=20
> Construct all of the headers together in one block, rather than a field =
at a
> time=2E  Initialise as many of the fields as possible at declaration tim=
e=2E
>=20
> Start filling in iov[] earlier, to allow for future simplifications=2E
>=20
> No practical change=2E
>=20
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3e2.d1f2b23ebbfdcf7.19f40fceb95.9326219e6c2dd7ff=---

