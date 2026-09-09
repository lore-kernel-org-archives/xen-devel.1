Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A21AC79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:01:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412705.1643077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EB0-0004If-5X; Wed, 09 Sep 2026 09:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412705.1643077; Wed, 09 Sep 2026 09:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EB0-0004IY-2P; Wed, 09 Sep 2026 09:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1412705;
 Wed, 09 Sep 2026 09:01:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085662958000c4f3@swg.vates.tech>)
 id 1x4EAy-0004IQ-VS
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:01:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4EAx-001auO-Ut
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:01:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085662958000c4f3@swg.vates.tech>)
 id 6aa1204f-8faa-0a2a0a5109dd-0a2a45018fb8-6
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:01:03 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085662958000c4f3@swg.vates.tech>)
 id 6aa1204f-5984-0a2a45010019-b9ff1c23a10f-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:01:03 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a085662958000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 09:01:00 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9E82481013;
 Wed,  9 Sep 2026 11:00:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yiA8qUMkmKgdXDhxRU1HTaWcJZ6ST41EmhPuoXyPNyg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sYrWCzXuJurcejsfLqEuReIRsSvkayJPi9QwWdpy8ukNcW0YawIylyNBfdotrjd7n3IGx5UtW
 Qdlie9KD+UBT/Yutvs3lg0ifQPIQujBv0iyatfpSF61NbC7RuHUZJTvKuo6x/4fiFHBbIemCH7m
 2CBiOU2fzHujFOdFPguAljwl/XAEtPTOh86WFzX/PdIL2EHyadHF+1/XfQi0ARoUdTAfD9n5z+k
 6NO4y/zCgWtQID4R7Q27suksAUukS61eXb8MebNg1ynw4FbdVi5RYKKchJcPinEyk2cVKkwPHio
 TXv8waUxukRlGw96pf1pfMVM/gXEUV8AqHbl9uEdlkwg==
X-Zone-Loop: 3e4384984ceecacb8e3380b6218184d147acdc5003af
x-campaign-type: default
x-transaction-id: c7ebb5bd-b1ac-4e02-a45d-8a5ebeacf7c1
x-swg-uid: 01-4d20a89c-3281-4182-b694-84e1555d0e2c
X-Mailer: Sweego
Message-ID:
 <1788944460.8631fc262581453bbf619ec5b2062170.1a085662958000c4f3@vates.tech>
x-swg-bid: 1788944460.8631fc262581453bbf619ec5b2062170.1a085662958000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 9 Sep 2026 11:00:57 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
References: <cover.1787042017.git.mykyta_poturai@epam.com>
 <c1f410ccb1469f1c46d2df94cd76546bf3db00b9.1787042017.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1f410ccb1469f1c46d2df94cd76546bf3db00b9.1787042017.git.mykyta_poturai@epam.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a.42c3cb8910d3e9bd.1a085661ff5.d0e6a0c84c99f504=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788944457721
X-purgate-ID: tlsNG-d62444/1788944463-1DE78757-B86C331A/0/0
X-purgate-type: clean
X-purgate-size: 977

---=Part.a.42c3cb8910d3e9bd.1a085661ff5.d0e6a0c84c99f504=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 08:48:31AM +0000, Mykyta Poturai wrote:
> With CPU hotplug sysctls implemented on Arm it becomes useful to have a
> tool for calling them=2E
>=20
> According to the commit history it seems that putting hptool under
> config MIGRATE was a measure to fix IA64 build=2E As IA64 is no longer
> supported it can now be brought back=2E So build it unconditionally=2E
>=20
> Operations specific to x86 architecture are moved into a separate file
> and only built on x86=2E
>=20
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.a.42c3cb8910d3e9bd.1a085661ff5.d0e6a0c84c99f504=---

