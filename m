Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF6C43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 09:08:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356705.1611250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOGM-00019H-8C; Wed, 08 Jul 2026 09:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356705.1611250; Wed, 08 Jul 2026 09:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOGM-00019A-5M; Wed, 08 Jul 2026 09:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1356705;
 Wed, 08 Jul 2026 09:08:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fc185300080a8@swg.vates.tech>)
 id 1whOGL-000190-2E
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:08:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOGK-009DrZ-F5
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:08:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fc185300080a8@swg.vates.tech>)
 id 6a4e137a-5cb7-0a2a0a5109dd-0a2a4507ba92-20
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:08:12 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f40fc185300080a8@swg.vates.tech>)
 id 6a4e137b-9c8e-0a2a45070019-b9ff1c239959-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:08:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f40fc185300080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jul 2026 09:08:10 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 73FCD81EE5;
 Wed,  8 Jul 2026 11:08:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=C9p5uWwht5/Apv6rfVaiZHJuChMDyv1qJKcOkQMPR0E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NbzRVuujo/Tm29YM5nd5vy6BfRNtnYKGTkrVngLatKshMfJFWYQ5Du4hII+Z3Va//ludjp/fD
 RFbk5X07sUDEtJlZ5Fbsy0mOxrMGt+NNr5kShgfRFlfGlqeCqFKSIpia4PfWhf+oR1uvwKcXwuF
 WLW+AZ8n1bYssDmym+p5sG3omEmH6EAjAZW84gv3q2Jp9DvBAsKFHgqEwqCSvSom+4U1CUqJgNX
 B3rmgNm+xYfkMRCdmnhzPOdqnVCkdnn672LACrqOxwEG6BoFWFUL2WHbQlhJAHAQAtqpZcm8D3g
 o5+cTTY6MWZ+6iSu/caiysm4ak9WTsmhhXUIPRMoqAmQ==
X-Zone-Loop: 5ac7b4b1189226be4ce3eb6e8c4cc2f1bcdbf46167b7
x-campaign-type: default
x-transaction-id: 5a8640bf-7aaf-4321-916d-56526ecf0f38
x-swg-uid: 01-7eef6bee-bee4-4240-b4f6-c62dd0f6b9e2
X-Mailer: Sweego
Message-ID:
 <1783501691.8631fc262581453bbf619ec5b2062170.19f40fc185300080a8@vates.tech>
x-swg-bid: 1783501691.8631fc262581453bbf619ec5b2062170.19f40fc185300080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 8 Jul 2026 11:08:10 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: Re: [PATCH v6 1.9/16] libs/guest: Allocate rec_pfns earlier in
 write_batch()
References: <20260619130501.272832-3-frediano.ziglio@citrix.com>
 <20260701135230.794306-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701135230.794306-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3e1.65c377d4501c7490.19f40fc16b3.3a4d7fcc9d687702=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783501690548
X-purgate-ID: tlsNG-ef75cf/1783501692-7DB2325E-AC5FD501/0/0
X-purgate-type: clean
X-purgate-size: 826

---=Part.3e1.65c377d4501c7490.19f40fc16b3.3a4d7fcc9d687702=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 02:52:30PM +0100, Andrew Cooper wrote:
> For reasons which escape me, rec_pfns are allocated separately to the re=
st of
> the batch allocations=2E
>=20
> Allocate them all together=2E  This will allow for future simplification=
s to be
> performed in an incremental mannor=2E
>=20
> No functional change=2E
>=20
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3e1.65c377d4501c7490.19f40fc16b3.3a4d7fcc9d687702=---

