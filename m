Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB740C5AD55
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 13:32:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387477.1628735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ7K-00057L-T6; Mon, 10 Aug 2026 13:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387477.1628735; Mon, 10 Aug 2026 13:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQ7K-00057E-PV; Mon, 10 Aug 2026 13:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1387477;
 Mon, 10 Aug 2026 13:32:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtQ7J-000578-MX
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 13:32:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQ7I-00EVma-Ts
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 15:32:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febdfec57000e099@swg.vates.tech>)
 id 6a79d2f4-8faa-0a2a0a5109dd-0a2a4505d9b0-2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:32:36 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19febdfec57000e099@swg.vates.tech>)
 id 6a79d2f0-4cb1-0a2a45050019-b9ff1c228ecb-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 15:32:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19febdfec57000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 13:32:28 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CF80880611;
 Mon, 10 Aug 2026 15:32:27 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9T81Ju4UB2/Vn420Il4Co/BASrpk2PZLpayGASNpGIg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=kj8htTYBNhWfrmZuOk9batNxqHmH+h5+0tz9w1zCqi6GzVsz+LUZ2YdGGuxYegBePuGBjgExC
 E99QuhJlS/H6qOMOipraT7H8pBOd4t/NUKfIGRueZYHSZG1J1TpKwC75Mjy8jsvKanOrMXHpeXz
 FlDz06wARapPp4zSWQnta5Bpwqhb+ij/1D7tX8ihBFpaWNjjqD5v3YsMgXNbteDu1AUbxodE6vk
 Ppn21jc8QGBNbB0tB1FFcrr+cvQAIcnzhYIcxwO/F4QC1yvPNxWknXk/xOvW9QO6qKJbLJNY77q
 g22mLpNpV01MyIG70k3kL54YM/5dbqRcuEiHzFiVYDYA==
X-Zone-Loop: a6eedb683102cb253a4f04589759be9d313423c8b3e7
x-campaign-type: default
x-transaction-id: 7e602ab6-55e8-4678-9ee2-11771dbc2b49
x-swg-uid: 01-ef17d2ef-e34c-4b43-8045-07519d2a2185
X-Mailer: Sweego
Message-ID:
 <1786368748.8631fc262581453bbf619ec5b2062170.19febdfec57000e099@vates.tech>
x-swg-bid: 1786368748.8631fc262581453bbf619ec5b2062170.19febdfec57000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH v1 01/17] xen/riscv: manage IRQ_DISABLED flag in APLIC
 irq enable/disable callbacks
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <a6d85647d0d726ffb25708829813510421ed5234.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <a6d85647d0d726ffb25708829813510421ed5234.1784560663.git.oleksii.kurochko@gmail.com>
Date: Mon, 10 Aug 2026 15:32:21 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786368747; l=772;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=z02B9/tgz4LcVlE41Cj6lNYEwulnqWqQ/cFrEUrfPxI=;
 b=ocjRHBv4tBaTWtOhs11xzsQVxbm2E83P6NRd0rGksdzE+B3IXqDDd1nHNRk5T7A7kUc4bp9nJ
 gXCqLnMAk5yBbPSsLqWVTtVXkkprXt70UZFGw2KuHuZ6vwkkeWa/3QF
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2010.886a82330ba67ff7.19febdfea13.ce5d1f6ba744cb64=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786368748052
X-purgate-ID: tlsNG-c201ff/1786368752-F62AB2A1-828BBD7D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1148

---=Part.2010.886a82330ba67ff7.19febdfea13.ce5d1f6ba744cb64=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Jul 2026 18:01:59 +0200, Oleksii Kurochko <oleksii=2Ekurochko@gm=
ail=2Ecom> wrote:
> desc->status is only set once during setup_irq(), but interrupts can be
> enabled/disabled at runtime, so update it in the corresponding callbacks=
=2E
>=20
> For the purposes of the FENCE instruction, CSR read accesses are
> classified as device input (I) and CSR write accesses as device output
> (O), while the barriers used by spin locks (fence rw,rw) only order
> normal memory accesses=2E An explicit wmb() (fence ow,ow) is therefore
> added in aplic_irq_{enable,disable}() to order the desc->status update
> with respect to the IMSIC CSR write=2E
>=20
> [=2E=2E=2E]

Reviewed-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>

--=20
Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>


-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.2010.886a82330ba67ff7.19febdfea13.ce5d1f6ba744cb64=---

