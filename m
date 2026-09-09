Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86051C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:47:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413129.1643373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Ie7-0000w6-Nn; Wed, 09 Sep 2026 13:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413129.1643373; Wed, 09 Sep 2026 13:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Ie7-0000vz-L3; Wed, 09 Sep 2026 13:47:27 +0000
Received: by outflank-mailman (input) for mailman id 1413129;
 Wed, 09 Sep 2026 13:47:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0866c5bfe000c4f3@swg.vates.tech>)
 id 1x4Ie6-0000vt-5Q
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:47:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Ie5-007u7Q-I9
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:47:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0866c5bfe000c4f3@swg.vates.tech>)
 id 6aa1636d-e002-0a2a0a5209dd-0a2a4503eca4-2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:47:25 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0866c5bfe000c4f3@swg.vates.tech>)
 id 6aa1636d-fae8-0a2a45030019-b9ff1c238095-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:47:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0866c5bfe000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 13:47:23 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 92BC281D2F;
 Wed,  9 Sep 2026 15:47:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=30FDC8+SyZ8JvOgAC8CWDsrwu0Mz5znm0ZmniOiLZ2Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RwPTFOFpIH32R4ZS1A/8RxnAcESF1T0iKGc5P8tY5IsRbDOvW8Bllb34ASHyOqkprZKGQJM47
 vU5+1FxLMEHuD+taO/c2NZ9lvtqZH6qKRJ+jdx+WSK08dWaCOEw2AKB6cNflzGIyC29ogFyfOQJ
 0438WUGdDPr9JlSmHVIOP+wY/iIEtFyDGvqScbU2uq4VLtWWC3v0f8kD2pGQohv1USSrmBui7Yk
 5A+46kOBZmgSJH1i8ezWXe6cSwVy8JMPxY8TPiD+ipx+NORRnyJl55D4lUL5ZkJu5ty8oaspz7m
 kPk7Vcqz0G/F1ooYxXFm7ar8J/BPS71duVl94v1qoyjA==
X-Zone-Loop: 13474b69ce2261f95457bcd23a0374c6ef00aeaa4519
x-campaign-type: default
x-transaction-id: 0bc88b75-d9a1-48fe-bc60-09de4a5adae1
x-swg-uid: 01-08037513-d8df-4681-92df-9b999cb01863
X-Mailer: Sweego
Message-ID:
 <1788961643.8631fc262581453bbf619ec5b2062170.1a0866c5bfe000c4f3@vates.tech>
x-swg-bid: 1788961643.8631fc262581453bbf619ec5b2062170.1a0866c5bfe000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 9 Sep 2026 15:47:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 1/6] x86: split xen-syms/xen.efi linking rules
References: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
 <fa4251ce-4e78-4724-836f-0b46cf37a25f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa4251ce-4e78-4724-836f-0b46cf37a25f@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.40.8ad13e28d3b61d08.1a0866c58f1.730368a99bde9348=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788961642738
X-purgate-ID: tlsNG-33051d/1788961645-75C804E9-A8FAD571/0/0
X-purgate-type: clean
X-purgate-size: 1131

---=Part.40.8ad13e28d3b61d08.1a0866c58f1.730368a99bde9348=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 02:28:07PM +0200, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations=2E For xen-syms move re-usable helper rules to a new
> scripts/Makefile=2Elink=2E
>=20
> While doing so, re-order =2Emap file creation (which can in principle fa=
il)
> and check-endbr=2Esh invocation ahead of putting in place the final imag=
e
> (which is now the result of a simple rename)=2E
>=20
> Also drop --source-name=3D from the tools/symbols invocation which has
> --empty passed, for being meaningless there=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.40.8ad13e28d3b61d08.1a0866c58f1.730368a99bde9348=---

