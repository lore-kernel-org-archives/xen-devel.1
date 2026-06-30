Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD76C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 15:19:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349128.1607005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaEY-0006cz-Q2; Tue, 30 Jun 2026 15:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349128.1607005; Tue, 30 Jun 2026 15:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaEY-0006cs-NI; Tue, 30 Jun 2026 15:18:46 +0000
Received: by outflank-mailman (input) for mailman id 1349128;
 Tue, 30 Jun 2026 15:18:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 1weaEX-0006cm-D7
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:18:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaEW-006Njz-QF
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:18:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 6a43de47-5cb7-0a2a0a5109dd-0a2a4502acd2-48
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:18:44 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@swg.vates.tech>)
 id 6a43de54-5a27-0a2a45020019-b9ff1c129417-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:18:44 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f190a6e19000701b.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 14:59:01 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFCB386A75;
 Tue, 30 Jun 2026 16:59:00 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YW5X7zRusNTwbnnKwJj/CtWjJoHj9/tPDJBCg7nrmYk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VhYxEz+JsuK6/gJtTYE2HAa4wXUrAnOjok/jljcHQOhmu3naxVTWZoIgwoDEjU6R+Se+eqpfX
 HfnLfgC3PRLRQuzhBTffNK9HfGnE/4ikcKkJId/4WxBkqXTPp5io9G8MJwYSbvfP7FOMtluD67n
 jJMHNAg58u1GyMf8preORVjs1NBzCSj4oMunEd3Qjh7/hcNc5wLJOHLPP5l4mg/fo8qDiKAZAPQ
 dfs8Y20pXtG7lDLCLv9oLxanXIa2nOPFD30h/MMBFTcIjKiGkh8XGfMD0QCaE3Ctynt3ohvEeqM
 cGvT8yAHvouWtB6LwPMYuTsN2cYhs/OCjpx7Bq/alxFQ==
X-Zone-Loop: 8fb4b8a9488150c4d678d496e75030c7c3122f7d0d75
x-campaign-type: default
x-transaction-id: 8d1b0e7d-a500-410e-942f-10f74df76edb
x-swg-uid: 01-1cd52609-1fba-482f-a0bb-035cc0b87663
X-Mailer: Sweego
Message-ID:
 <1782831541.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b@vates.tech>
x-swg-bid: 1782831541.8631fc262581453bbf619ec5b2062170.19f190a6e19000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 16:59:00 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/4] libxc: adjust string size calculations in
 xc_{,de,test_}assign_dt_device()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <8adede4b-f25d-4a77-9fec-bd099119b005@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8adede4b-f25d-4a77-9fec-bd099119b005@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782831540904
X-purgate-ID: tlsNG-720697/1782832724-77D187C5-DCA9C914/0/0
X-purgate-type: clean
X-purgate-size: 639

---=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:00:54AM +0200, Jan Beulich wrote:
> In preparation for a hypervisor change also include the nul terminator i=
n
> the size calculations=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.93c.5d343de3e24a5943.19f190a6aa8.4de00f4c82dc6110=---

