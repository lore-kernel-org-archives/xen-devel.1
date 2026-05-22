Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B406CD5BB4
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 14:07:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316904.1586258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQWm-0005Bw-Bf; Fri, 22 May 2026 14:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316904.1586258; Fri, 22 May 2026 14:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQQWm-0005Bp-7B; Fri, 22 May 2026 14:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1316904;
 Fri, 22 May 2026 14:07:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ffc5040000f373@swg.vates.tech>)
 id 1wQQWl-0005Bj-9m
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:07:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQQWk-00HM8M-F8
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 16:07:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ffc5040000f373@swg.vates.tech>)
 id 6a106302-e002-0a2a0a5209dd-0a2a4501b31e-10
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:07:02 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4ffc5040000f373@swg.vates.tech>)
 id 6a106161-c1f2-0a2a45010019-b9ff1c228737-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 16:00:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4ffc5040000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:59:56 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A5EAB86883;
 Fri, 22 May 2026 15:59:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=trPP9zCnq/DNHH93lw4AzppJBhl01iJkUPZBcD91A4I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sScD1muRs9QPyWj+ZW907HiWbVa6UCGI8l6vpFTkxFzmFIzpRavdey4AoIcxeO0cSQhKzV83I
 y7x4pixPcWRldKsNI2V/amslD4hyXrdt1ubs3g1QTPmwYd41Ncyt62fpfaFJ2b9tJnFf6Qbsf+8
 hO7X9aGbqgPE2aTc8FUJn1oPdeZHbcfrgZ78rlmsq4KgjY4y8xUweolBydgkpnHn0eoKgKkrMgP
 squ4IeJMUqwISKo8UikBm0st6tQV50FsBqzhOJKDU5FLUyYbt7tfv/hFmpdj1D+QK0dsBSrjZZW
 Seriy0wzylzaFwmQzzgZ3B0QyBa21WZPJ+a1GMw7QtZA==
X-Zone-Loop: 2b5189212417b7aa3721f8c9ce1e449a627fd952e20a
x-campaign-type: default
x-transaction-id: 3b7559f0-3cd8-48a4-9a49-f35a90d96292
x-swg-uid: 01-48aa02c6-8360-47df-b35c-3c74cd8aaabd
X-Mailer: Sweego
Message-ID:
 <1779458396.8631fc262581453bbf619ec5b2062170.19e4ffc5040000f373@vates.tech>
x-swg-bid: 1779458396.8631fc262581453bbf619ec5b2062170.19e4ffc5040000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:59:55 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 12/13] Prepare grub for booting x86_64 HVM domU from a
 cdrom
References: <cover.30e6171ddf1c6a72eadf4af0a77c892d4f18d811.1777898148.git-series.marmarek@invisiblethingslab.com>
 <4aa490a4f8a26ec86397cef30091cdd3f3598c30.1777898148.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4aa490a4f8a26ec86397cef30091cdd3f3598c30.1777898148.git-series.marmarek@invisiblethingslab.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.125c.d0896bdb58dc422d.19e4ffc4e8e.e62b2899c3dec311=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779458395790
X-purgate-ID: tlsNG-d62444/1779458401-ADBA8FF4-5A5CC185/13/0
X-purgate-type: clean
X-purgate-size: 634

---=Part.125c.d0896bdb58dc422d.19e4ffc4e8e.e62b2899c3dec311=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 02:35:51PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> The stubdomain test will use it=2E
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
---=Part.125c.d0896bdb58dc422d.19e4ffc4e8e.e62b2899c3dec311=---

