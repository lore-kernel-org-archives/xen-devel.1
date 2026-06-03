Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326AECD6E55
	for <xen-devel@archiver.kernel.org>; Wed,  3 Jun 2026 14:34:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1326714.1592072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmg1-0002fa-JC; Wed, 03 Jun 2026 14:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326714.1592072; Wed, 03 Jun 2026 14:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmg1-0002fT-G4; Wed, 03 Jun 2026 14:34:37 +0000
Received: by outflank-mailman (input) for mailman id 1326714;
 Wed, 03 Jun 2026 14:34:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@swg.vates.tech>)
 id 1wUmfz-0002eT-Ak
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:34:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmfy-007WWC-Nb
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:34:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@swg.vates.tech>)
 id 6a203b74-e002-0a2a0a5209dd-0a2a4506e34a-32
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:34:34 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@swg.vates.tech>)
 id 6a203b7a-7371-0a2a45060019-b9ff1c129d3d-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:34:34 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e8de8523b000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 14:34:33 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B903C86424;
 Wed,  3 Jun 2026 16:34:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TRFtJO2nUl94J9pR7VWBP9pjT2Ps2p72CoHMHWKg0d8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=YjPpao1o7qiEVzkoOnQhKX1Xm1xfQvJom3RCX1gAxGy8vHt9YFSIsjVLaNWP5RuIU+2sJtCt7
 x4tRLtJQmJBHwD6teNXP3+3DbqekCdzKQUcJxjiCHDITQAJQ3CMBCr3gwX9My1HueU72Ye4clJ8
 vtoYjWAZkxvXZJ0Imh3ISpeVwspABy2FHLWlAMduCBO4O9dzURB/V93DRaU6fgEbk+vLJfAm1QP
 5lD8N1eLI1PPcR1wrK8Yx6gBxEJ70b4+2pz/Viec5cQFuAJolGJmIYxIvbDqKfnsBA3PaUomrXL
 NneXJZ4BVOQU2BttxHqQ2bJuMmhoKNnO2kZRHeoB1VUA==
X-Zone-Loop: 423ae6d5c8cc08c07f492112f0ad2784e238765453d5
x-campaign-type: default
x-transaction-id: f62b2fea-8726-4f0c-848d-d05b2c21da14
x-swg-uid: 01-0f22dd8a-6acd-4dbf-834e-752f46539bb6
X-Mailer: Sweego
Message-ID:
 <1780497273.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@vates.tech>
x-swg-bid: 1780497273.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 3 Jun 2026 16:34:32 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.22 1/5] tools/bitops: adjust bitmap_or() interface
 to match hypervisor
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601154332.30797-2-roger.pau@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1cde.b2a7aa1e3bef5db3.19e8de85014.522a6210ce23f63e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780497272853
X-purgate-ID: tlsNG-16d1c6/1780497274-85D6AD75-216511CA/0/0
X-purgate-type: clean
X-purgate-size: 964

---=Part.1cde.b2a7aa1e3bef5db3.19e8de85014.522a6210ce23f63e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 05:43:28PM +0200, Roger Pau Monne wrote:
> Adjust the only toolstack caller to use the new interface=2E  No functio=
nal
> change intended=2E
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

> ---
> I'm tempted to rewrite bitmap_or() to use unsigned long (just like the
> hypervisor side), but that's outside the scope of this change=2E

You mean revert 11d0044a1689 ("tools/libxc: Modify bitmap operations to
take void pointers") ? Or maybe the hypervisor code when trough the same
path=2E

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1cde.b2a7aa1e3bef5db3.19e8de85014.522a6210ce23f63e=---

