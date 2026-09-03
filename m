Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0C3C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:55:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407024.1640200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x262g-0001cw-Dq; Thu, 03 Sep 2026 11:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407024.1640200; Thu, 03 Sep 2026 11:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x262g-0001cp-B6; Thu, 03 Sep 2026 11:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1407024;
 Thu, 03 Sep 2026 11:55:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671fd55a000c4f3@swg.vates.tech>)
 id 1x262f-0001cd-HV
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:55:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x262e-00Ecnd-UW
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:55:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671fd55a000c4f3@swg.vates.tech>)
 id 6a99602f-e002-0a2a0a5209dd-0a2a4503a1fa-36
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:55:40 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0671fd55a000c4f3@swg.vates.tech>)
 id 6a99603c-fae8-0a2a45030019-b9ff1c238fc3-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:55:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0671fd55a000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 11:55:34 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id B197F8215D;
 Thu,  3 Sep 2026 13:55:33 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fj77rrklpv28SnTWnT75XZ81Gv89/dYHDb4FdexKTGo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ItnmyiRx6NpAtF30V8psL/GvubOCNjV9AvvqTxrHXXz/YQ8C9QCP9JC3HkF304d1vjF0rf1/D
 D5y0h0WI09TM0M/kJQob8Lya0TuS8hSn4xo/ecHgkCXz1pIGvLF6bD6SE2CAraeRPdY7lxT15tu
 5DfSxrQ01U2Ud8hB4Ob/gCRqD414roh1RvMwc1MWS2a0x4wFDsll/9EWHboFoD+gkhmo0pJMplB
 t2WQL4zNUTe50w4ikEe8byjmgEMebrSdXGWiNxYgPze1z/0oWBM0c89+sOUOgjT2sab87YklY/Z
 CUSAQrrYq2gzNramktoSqM2yYMD6My4u2jxq68r9dJjQ==
X-Zone-Loop: 38f5ba981f6bec0a06eb3fffe7071c02b1c282c46293
x-campaign-type: default
x-transaction-id: 3b3246e3-9428-467a-b88e-0aaf0abd0031
x-swg-uid: 01-64519f47-0aee-4619-8577-5a81aae277e5
X-Mailer: Sweego
Message-ID:
 <1788436534.8631fc262581453bbf619ec5b2062170.1a0671fd55a000c4f3@vates.tech>
x-swg-bid: 1788436534.8631fc262581453bbf619ec5b2062170.1a0671fd55a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 3 Sep 2026 13:55:33 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>
Subject: Re: [PATCH v2 6/7] build: move $(compare-symbol-tables)
References: <9a78fdea-08ba-4e04-bfa1-ba09730a300b@suse.com>
 <f569f2ea-cf1f-4e28-8097-f81397368e73@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f569f2ea-cf1f-4e28-8097-f81397368e73@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3502.9bd76891818bfad8.1a0671fd24f.8b2b4ca9f404d1c2=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788436533839
X-purgate-ID: tlsNG-33051d/1788436540-6DAD44E9-17671A7C/0/0
X-purgate-type: clean
X-purgate-size: 704

---=Part.3502.9bd76891818bfad8.1a0671fd24f.8b2b4ca9f404d1c2=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:03:26PM +0200, Jan Beulich wrote:
> With the final linking logic now consolidated in scripts/Makefile=2Elink=
,
> $(compare-symbol-tables) also doesn't need setting anymore in
> Kbuild=2Einclude=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3502.9bd76891818bfad8.1a0671fd24f.8b2b4ca9f404d1c2=---

