Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACBDCD98C7
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 09:22:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334063.1597163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXF8R-0003V3-1h; Wed, 10 Jun 2026 09:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334063.1597163; Wed, 10 Jun 2026 09:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXF8Q-0003Uw-UK; Wed, 10 Jun 2026 09:22:06 +0000
Received: by outflank-mailman (input) for mailman id 1334063;
 Wed, 10 Jun 2026 09:22:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@swg.vates.tech>)
 id 1wXF8N-0003Uj-VE
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:22:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXF8N-001dKU-Bi
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:22:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@swg.vates.tech>)
 id 6a292ca9-2eae-0a2a0a5409dd-0a2a4508d28a-18
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:22:03 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@swg.vates.tech>)
 id 6a292cba-63b5-0a2a45080019-b9ff1c12acc7-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:22:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eb0d69a94000701b.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 10 Jun 2026 09:21:54 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0F9C982383;
 Wed, 10 Jun 2026 11:21:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yDfyDx6m4KyUc65qL2NGoQvI5QITUAISoEsvfJUi8Do=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=PM+cyw6ZTlv+t667M8NCfo0Li5bTIUEVbIGNQQXAMhUbPe3jNCt/KYytEEstwK6FZiAB8jioK
 TLWnbftSeRPTeEX5H38CJMUGGaErwiD2z3ZxBPvCOo13034y8pP5YokaAQO2fD8Xv9nR3pUvPzw
 iNguuGYGLbSrP5dqAJvfTqW8ibpY0qJWw0FfEzZ1b7PtsI3i3Ytn76njky33QldxbFi0EvcIiBs
 ajfHLVGYV6rhjQCbAmAInUE53EUW+0lMiQER4kp044pYtl610hZKWo9emPDt66jPTB1xuKuh6EC
 j5Rml/Pfl+6FUL5BCBdyjXCyw8HFshyGFlJuWzjryEVw==
X-Zone-Loop: 6ee5ca2749ed35aa879b4b917130b9554a6846fb6340
x-campaign-type: default
x-transaction-id: 6c6ad509-12bc-4c81-99f3-d8bb3ca88b50
x-swg-uid: 01-b1607f3a-c1b9-46c3-9c85-21595355ee35
X-Mailer: Sweego
Message-ID:
 <1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b@vates.tech>
x-swg-bid: 1781083314.8631fc262581453bbf619ec5b2062170.19eb0d69a94000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 10 Jun 2026 11:21:53 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/4] CI: Fixes to containerize
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609173102.2908514-2-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.253a.cda5263f327d7808.19eb0d69838.72266b7da08eed4c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781083314232
X-purgate-ID: tlsNG-c1860d/1781083323-C487BDB1-90671912/0/0
X-purgate-type: clean
X-purgate-size: 593

---=Part.253a.cda5263f327d7808.19eb0d69838.72266b7da08eed4c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 06:30:59PM +0100, Andrew Cooper wrote:
> These were missed from prior changes=2E
>=20
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.253a.cda5263f327d7808.19eb0d69838.72266b7da08eed4c=---

