Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD654C43327
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 07:49:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351323.1608529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCAv-0001ME-F1; Thu, 02 Jul 2026 07:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351323.1608529; Thu, 02 Jul 2026 07:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCAv-0001M7-CP; Thu, 02 Jul 2026 07:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1351323;
 Thu, 02 Jul 2026 07:49:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 1wfCAt-0001M1-OO
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:49:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCAs-00D4wd-3v
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:49:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 6a461807-2eae-0a2a0a5409dd-0a2a45048326-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:49:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 6a461809-a01d-0a2a45040019-b9ff1c22a145-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:49:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f21cddaf000080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 07:49:26 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2ADE08078E;
 Thu,  2 Jul 2026 09:49:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=z8acwMs0RoUZwSPsP//PIk2dCVY8ioVGU3CXmoXVDiw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LnfK1AEhWJ8lZV22XZOKslPVHAJW+wid1/K9TSYRNy6TJZgjLlBEv9kUuP1XIPLr4EvkFHGq0
 5o33ymhAQZ+9b7nQlpAj3PEXMIB3w/WqPGrt2UtzkgLpIwg0IckNr1S06qgjXpL2XXCLiEaI4JK
 xn1e7k2AJ3hKbodmbIfH0cSM1B+BVvQ/vOSsa9XlsBpPkm+EQ8rxrwP2am8icX/zydNBB0iav3b
 6LiOtCcvqTS7IN/SqZ9mf4jK65zjAl6DfEetfnS8ekwym7cGobCvYV25+FJzw6J7AeBnyy8x5OV
 ckKnuq3f8ItRjq/CPt1tbrJuB1Eib5Ko76Qn57A7N+DA==
X-Zone-Loop: 060998b047c4324b69275eab5ebbc0ed7f7e3edfa9f9
x-campaign-type: default
x-transaction-id: b86dc9e0-945d-4035-9d95-d72967eb17c3
x-swg-uid: 01-ee351179-8bfa-4446-a477-5ecbe552e781
X-Mailer: Sweego
Message-ID:
 <1782978566.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@vates.tech>
x-swg-bid: 1782978566.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 2 Jul 2026 09:49:25 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/2] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782978566294
X-purgate-ID: tlsNG-ebf023/1782978569-2E3A41CC-2699A41C/0/0
X-purgate-type: clean
X-purgate-size: 807

---=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 04:47:52PM +0200, Jan Beulich wrote:
> Nul-terminated strings are passed in all cases, so the strlen() can very
> well be invoked by the function itself=2E In preparation for a hyperviso=
r
> change also include the nul terminator in the size calculation=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=---

