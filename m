Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC1ACD8CB9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 09:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334075.1597171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFIN-0005VI-V8; Wed, 10 Jun 2026 09:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334075.1597171; Wed, 10 Jun 2026 09:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXFIN-0005VB-SA; Wed, 10 Jun 2026 09:32:23 +0000
Received: by outflank-mailman (input) for mailman id 1334075;
 Wed, 10 Jun 2026 09:32:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@swg.vates.tech>)
 id 1wXFIM-0005V4-OW
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 09:32:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXFIM-00GYGU-1W
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:32:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@swg.vates.tech>)
 id 6a292f21-bab6-0a2a0a5309dd-0a2a4504c9e8-32
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:32:22 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@swg.vates.tech>)
 id 6a292f25-1dec-0a2a45040019-b9ff1c12a5ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 11:32:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eb0e00eac000701b.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 10 Jun 2026 09:32:14 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9E05C813C7;
 Wed, 10 Jun 2026 11:32:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=hur9DcvtqW8IGC4KS9cpWtMmupPLoykzOrNT5tRiDUA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OvEU3eOFIyd0vohcOrkiCSXRn39lsbijh8iqQFWScpvtTBkj85OXtKR4/s0vJrNx6RQzCy3CA
 YlGN/oUc8Y51cwCsZXpn78oZSzTMDdBRbDhso9s0niloZzNVR/GcmIS763JqtEmzWW05GstCrnB
 rVWvyK5xL8gtp8Ff0DxsRfFald4ZNYVdhS+10MljJlsdgcOqCM1dDpdT4x7Y92UksbE6fH7WrrA
 3Bz9CTxWICn4iF//PwXrbshcC58cmdTs2YmtmuUmNrR4D0nfrNgmufPjqPi50UNFHiGDKt72LgM
 l+A9RsSWCVSZwxKY9zYL2qtXoeCgFxA9hAPEP24T0g/g==
X-Zone-Loop: b85fa4eb9e08f88df8559c19144400de3e37994b62e3
x-campaign-type: default
x-transaction-id: fe242ddf-de61-4ba5-b3f1-10be0bcbd0bd
x-swg-uid: 01-f0adf4a8-902d-4f61-b05a-9279b7b7a2ab
X-Mailer: Sweego
Message-ID:
 <1781083934.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b@vates.tech>
x-swg-bid: 1781083934.8631fc262581453bbf619ec5b2062170.19eb0e00eac000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 10 Jun 2026 11:32:13 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/4] CI: Rename xenial-xilinx to xilinx-hw-runner
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609173102.2908514-3-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2549.901c8ec704b0167.19eb0e00c6d.c5fce72eb44cbb06=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781083933805
X-purgate-ID: tlsNG-ebf023/1781083942-415783FF-C5FE0203/0/0
X-purgate-type: clean
X-purgate-size: 952

---=Part.2549.901c8ec704b0167.19eb0e00c6d.c5fce72eb44cbb06=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 06:31:00PM +0100, Andrew Cooper wrote:
> The container is tied to the runner, not a version of Ubuntu=2E  Intenti=
onally
> give it a generic name so it need not change in the future=2E
>=20
> Apply standard cleanup to the dockerfile, except that it must continue t=
o be a
> root container to drive real hardware=2E  Explicitly install ca-certific=
ates to
> compensate for --no-install-recommends=2E
>=20
> No practical change=2E
>=20
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2549.901c8ec704b0167.19eb0e00c6d.c5fce72eb44cbb06=---

