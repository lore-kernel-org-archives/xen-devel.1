Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBDCD5BB0
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 13:55:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316874.1586206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQKu-0001iJ-Kg; Fri, 22 May 2026 13:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316874.1586206; Fri, 22 May 2026 13:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQKu-0001iC-Hb; Fri, 22 May 2026 13:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1316874;
 Fri, 22 May 2026 13:54:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@swg.vates.tech>)
 id 1wQQKs-0001i6-Vw
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:54:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQQKs-00HK6w-1W
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:54:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@swg.vates.tech>)
 id 6a106012-2eae-0a2a0a5409dd-0a2a4502aed6-18
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:54:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@swg.vates.tech>)
 id 6a106025-af86-0a2a45020019-b9ff1c22afe9-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:54:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4ff78945000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:54:43 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 72CBC869C1;
 Fri, 22 May 2026 15:54:42 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=3KZw4NbUAnuHoQnUOjqRkQ91RSCgZZzUWQMygOc1QGU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Fadol7ik8MTa/vAWKKVIow0RthO4HgDDZyChwCAR1pduc5a/kMAzrh5jOBr3CLQexunNR6dk3
 v+FS/zi9cZfPJEOcYyCPaEl3nWbZW9CvMuNFDrZ8NcUHXdgk9AF0W5ebefCnT7mm1tKfmSMaxYz
 WXTTqYK1R3r9FDrI8ZGBMdezQcfJTCk65LTUdnTJI2Kz4aiKYa4cooxQsiF6+k9KpY1yGUpPTwD
 W4lp1kZqbApVpk11xrPX7gozo1q2E+7glehUyQCiy/JEAuolm2xMYsBYU/vVFdjAyJtyybVYXQ1
 iA3wqxiReZhcXA0/4ifQB7KROyBdDZbcZ4Q4sQV+d5mw==
X-Zone-Loop: 246c80240835eaaddb9b3c1fdc44285763f2d05383aa
x-campaign-type: default
x-transaction-id: 49138ccb-4cf8-4b79-b995-7bf929966894
x-swg-uid: 01-9ab0dd6a-d102-4ef2-add9-e4b973f12632
X-Mailer: Sweego
Message-ID:
 <1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373@vates.tech>
x-swg-bid: 1779458083.8631fc262581453bbf619ec5b2062170.19e4ff78945000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:54:42 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 13/13] Setup ssh access to test systems
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13f837cd9f394d3b4eddb4849156b8ed5d06d31b.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1257.e0e040b592ee1554.19e4ff7871d.8d7df2745447e190=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779458082589
X-purgate-ID: tlsNG-720697/1779458086-80F7E161-093B22B0/0/0
X-purgate-type: clean
X-purgate-size: 967

---=Part.1257.e0e040b592ee1554.19e4ff7871d.8d7df2745447e190=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:52PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> For this add also bridge package, so xenbr0 can be configured with
> /etc/network/interfaces=2E
> This allows extracting more logs out of the test system=2E
>=20
> Create empty /etc/network/interfaces, so the 'networking' service starts
> cleanly even if no interfaces are configured this way=2E This is
> necessary, as dropbear service depends on networking=2E
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1257.e0e040b592ee1554.19e4ff7871d.8d7df2745447e190=---

