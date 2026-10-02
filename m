Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B039CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 14:09:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439162.1657599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCdx8-0003EO-69; Fri, 02 Oct 2026 14:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439162.1657599; Fri, 02 Oct 2026 14:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCdx8-0003EH-2v; Fri, 02 Oct 2026 14:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1439162;
 Fri, 02 Oct 2026 14:09:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fcf2b6fe0003f66@swg.vates.tech>)
 id 1xCdx6-0003Ds-EH
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 14:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCdx3-000GjU-MX
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 16:09:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fcf2b6fe0003f66@swg.vates.tech>)
 id 6abfbb06-8faa-0a2a0a5109dd-0a2a45058058-46
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 16:09:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0fcf2b6fe0003f66@swg.vates.tech>)
 id 6abfbb14-4cb1-0a2a45050019-b9ff1c229e9f-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 16:09:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0fcf2b6fe0003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 14:09:20 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1993381CB5;
 Fri,  2 Oct 2026 16:09:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fz0dclBg1ihwgNdSF2tokzF/Dcm7q2siJV46BNlZolI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Xepqx59RxaiRxLTfmMm6tuQFwp5cPj3Rmlyl7JNvyW/pFxG0IEFq41oDxH6YwU5Z1QIPU7Woy
 zG5zNPrshkDb21jX+z67+M5oSeIzxppLe+H/kZjMmAfiQ0VQn11puoYdLhXG0oAQTG0K5NF6qbI
 RRApbAfSJZJrbY2cwxohRzmc/jBltj9FF/77MSL5JubNWdGbxgXDqY6LsQvNmNBMEwrMHooU8Xn
 YgTiQb+/R5KbzfIQiqTt1E85LOb1JO6+QkWU8SqIDqIGLeTLcgWMfQoxh/4FpKy/HhhEDF01KN2
 yyONWn3MI/1Ja/KiR3Cf7CPrRTDbAAHX7CnzeAxHKuTA==
X-Zone-Loop: 7bf564b4b60eec917129e7060e22840c8b369bfa21a9
x-campaign-type: default
x-transaction-id: 6d788f86-8b6a-4853-91d5-7130ad62aaf8
x-swg-uid: 01-9ae8b784-7bcc-44e8-bc65-26385bcd2abf
X-Mailer: Sweego
Message-ID:
 <1790950160.8631fc262581453bbf619ec5b2062170.1a0fcf2b6fe0003f66@vates.tech>
x-swg-bid: 1790950160.8631fc262581453bbf619ec5b2062170.1a0fcf2b6fe0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 2 Oct 2026 16:09:18 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Furkan Caliskan <frn1furkan10@gmail.com>,
	xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, roger@xenproject.org
Subject: Re: [PATCH v2.1 5/5] tools: expose admission control toggle via xl
 sched-rtds
References: <20260918080935.35498-6-frn1furkan10@gmail.com>
 <20260918104106.53530-1-frn1furkan10@gmail.com>
 <c959d6e8-3eba-46a8-a486-20a76f7438a7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c959d6e8-3eba-46a8-a486-20a76f7438a7@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.5e0.4308b0e41f85da4f.1a0fcf2b3a8.6088f755c90867c3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790950159273
X-purgate-ID: tlsNG-c201ff/1790950165-71AAF2A1-BF70E853/0/0
X-purgate-type: clean
X-purgate-size: 960

---=Part.5e0.4308b0e41f85da4f.1a0fcf2b3a8.6088f755c90867c3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:45:28PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 18=2E09=2E26 12:41, Furkan Caliskan wrote:
> > Wire the per-cpupool admission-control switch through libxl
> > to xl sched-rtds, and document it=2E
> >=20
> > Add -s/--schedparam to list or set pool-wide RTDS scheduler
> > parameters, and -a/--admission to enable or disable admission
> > control for a cpupool ("-c pool -s -a 0/1")=2E
> >=20
> > Signed-off-by: Furkan Caliskan <frn1furkan10@gmail=2Ecom>
>=20
> Reviewed-by: Juergen Gross <jgross@suse=2Ecom>


Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.5e0.4308b0e41f85da4f.1a0fcf2b3a8.6088f755c90867c3=---

