Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6452EC43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 09:36:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356755.1611300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOhB-000777-6N; Wed, 08 Jul 2026 09:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356755.1611300; Wed, 08 Jul 2026 09:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOhB-000770-3i; Wed, 08 Jul 2026 09:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1356755;
 Wed, 08 Jul 2026 09:35:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f411579c300080a8@swg.vates.tech>)
 id 1whOhA-00076u-DU
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:35:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOh9-007jRj-Ph
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:35:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f411579c300080a8@swg.vates.tech>)
 id 6a4e19f7-2eae-0a2a0a5409dd-0a2a4503c730-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:35:55 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f411579c300080a8@swg.vates.tech>)
 id 6a4e19fb-ec1a-0a2a45030019-b9ff1c128c29-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:35:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f411579c300080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:35:54 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A809581F71;
 Wed,  8 Jul 2026 11:35:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=7iG1N2voAtfWktDcNlwyfPu9/zNlX6JEIm9b+9inHRU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GJ3pI0HwoJeN7J3C1ZFbBRC9/qIYQ7jBkjWT+0UV49LFCN/F9bfej/hlVCkpa51D2jthPraWl
 tgdskuPsA7CbYkITD8mYxUDt7rIYMgDQYxiD+6i5A80PapTz0mvkritHgKQoU2dh0WGQpuwA41f
 oJK3MKqM+ljIn/XMXNo5CbwCs5HvWLwI1xp2Uf6dYTtGlm0kRSSM4Cvp9ps73O/Da8rGp16HSZ4
 vfW9aU1WsPCKMW7MLfTrD6nzw0fpnVkaQGcRH/nK2U0Wmd4r8rsXEXY/JVvrMWba3hM9bSqQLwQ
 +CF5hOntLApKwWNg/ZWPoj2ErMH2qZtdlWA4oKoW7Bfw==
X-Zone-Loop: 813df6552400fb67d9be02cc00213eaf8e93c27f17fe
x-campaign-type: default
x-transaction-id: 355482db-7b7f-4973-8038-1fd7d95b72d8
x-swg-uid: 01-d41f8a0e-c0c8-4006-9954-1d995666430d
X-Mailer: Sweego
Message-ID:
 <1783503354.8631fc262581453bbf619ec5b2062170.19f411579c300080a8@vates.tech>
x-swg-bid: 1783503354.8631fc262581453bbf619ec5b2062170.19f411579c300080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:35:53 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 04/16] libs/guest: Use a single write_exact in
 write_headers
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-5-frediano.ziglio@citrix.com>
 <a05d32b0-464b-4ecd-8778-0f19101f5a86@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a05d32b0-464b-4ecd-8778-0f19101f5a86@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e9.68a19550c96c94fc.19f411577e5.52bdc0f388f558ea=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783503353829
X-purgate-ID: tlsNG-33051d/1783503355-B4D805D1-804E38A7/0/0
X-purgate-type: clean
X-purgate-size: 1079

---=Part.3e9.68a19550c96c94fc.19f411577e5.52bdc0f388f558ea=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 05:47:42PM +0100, Andrew Cooper wrote:
> On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> > diff --git a/tools/libs/guest/xg_sr_save=2Ec b/tools/libs/guest/xg_sr_=
save=2Ec
> > index eba33f861a=2E=2E8c31f9f86c 100644
> > --- a/tools/libs/guest/xg_sr_save=2Ec
> > +++ b/tools/libs/guest/xg_sr_save=2Ec
> > +    } hdrs =3D {
> > +        {
>=20
> =2Eihdr =3D {
>=20
> > +            =2Emarker  =3D IHDR_MARKER,
> > +            =2Eid      =3D htonl(IHDR_ID),
> > +            =2Eversion =3D htonl(3),
> > +            =2Eoptions =3D htons(IHDR_OPT_LITTLE_ENDIAN),
> > +        },
> > +        {
>=20
> =2Edhdr =3D {

With that: Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3e9.68a19550c96c94fc.19f411577e5.52bdc0f388f558ea=---

