Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD56C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 09:10:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348567.1606294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUTU-0000i3-V0; Tue, 30 Jun 2026 09:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348567.1606294; Tue, 30 Jun 2026 09:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weUTU-0000hw-Rr; Tue, 30 Jun 2026 09:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1348567;
 Tue, 30 Jun 2026 09:09:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 1weUTT-0000hq-Vg
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:09:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weUTT-0055Hg-6w
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:09:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 6a4387d6-bab6-0a2a0a5309dd-0a2a45098c4e-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:09:47 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@swg.vates.tech>)
 id 6a4387da-97e6-0a2a45090019-b9ff1c128981-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 11:09:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f17ca9170000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 30 Jun 2026 09:09:39 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8221886AB6;
 Tue, 30 Jun 2026 11:09:38 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2QoCeG1LvFRIzn8MHvc0E/BI6Q5ItNlox/vRAxZXeMQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=MS5oNJI0RHuXhGran0MEG0Yc6n4jnKp7eJFRB75yuZnLIREVlI3knTGQiMTnYqKxpz5EScE1H
 DO8zmLXI40LmRDKaqRd0KRuprcfno25hPG8AN1IFDDNVX/ged7mhA9wJj4m6CPYHBgF+FP7qCDa
 JSCUeL/tbWw8MipVCM4wgq6PWId93u5aPLTzedEMPiteuBeekiIkN3T9gy06dw2iy7XoIAGnRgs
 zCPlWxi3DSJKV6sDdD9QAc2SzUQXVcU6Qf6erUwaiQRlneIF59SrStvja6M8oaEF/gR9lnqwJFS
 AWsgUVRV1GQyNLipgx8NYjDQl9+6L+3karOqRExs9/hg==
X-Zone-Loop: fdc810e50b6861565024c0abcc5c15f32c8e8996d8f5
x-campaign-type: default
x-transaction-id: fe0c18d1-126c-4230-aba2-5109a764815b
x-swg-uid: 01-d2c62ef2-420c-403f-94e3-9dda8a3434b5
X-Mailer: Sweego
Message-ID:
 <1782810579.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b@vates.tech>
x-swg-bid: 1782810579.8631fc262581453bbf619ec5b2062170.19f17ca9170000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 30 Jun 2026 11:09:38 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 00/18] PCI SBDF Refactoring
References: <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
 <3cb85058-ad02-4233-930a-a397fb67daa9@suse.com>
 <1782809635.8631fc262581453bbf619ec5b2062170.19f17bc2c48000701b@vates.tech>
 <fe2a6a17-9742-4387-9664-271934f93ab4@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe2a6a17-9742-4387-9664-271934f93ab4@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782810578696
X-purgate-ID: tlsNG-bad1c0/1782810586-4713E986-74A42F6A/0/0
X-purgate-type: clean
X-purgate-size: 780

---=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 09:57:35AM +0100, Andrew Cooper wrote:
> How are you sending the series?=C2=A0 Your old double-delivery problem (=
now
> fixed) I can see being the intermediate infrastructure, but I don't see
> how that would apply to this kind of issue=2E

It's the SMTP server that `@vates=2Etech` uses that mangle with
message-id, so `git send-email` can't make proper email thread and the
cover-letter appear isolated=2E


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.89a.1910bfce05f213f.19f17ca8f08.b4124361e83b0921=---

