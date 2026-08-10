Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2315AC5B56A
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:24:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387522.1628788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvP-0007Zr-Iq; Mon, 10 Aug 2026 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387522.1628788; Mon, 10 Aug 2026 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtQvP-0007Zk-G1; Mon, 10 Aug 2026 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1387522;
 Mon, 10 Aug 2026 14:24:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f65df000e099@swg.vates.tech>)
 id 1wtQvO-0007ZB-Fl
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:24:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtQvN-003hT6-Sf
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:24:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f65df000e099@swg.vates.tech>)
 id 6a79defc-8faa-0a2a0a5109dd-0a2a4509b7d8-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec0f65df000e099@swg.vates.tech>)
 id 6a79df15-be1a-0a2a45090019-b9ff1c2298b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:24:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec0f65df000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 14:24:19 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4972583725;
 Mon, 10 Aug 2026 16:24:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=04I6Hu+440OeMPdcU+TDpogAnzI3pS1YCoJF4T84N+4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Iig7tMnTtsAQ1YfCjsshDExFGGfEw30lhyH1+hRLo5nmzcVnVTdQIz6G26q/XquHTAAMAodGh
 A+5xOuNF15+s0fDlg1fOZ9W1jccSX6S1UOnXxx1AQCP5JFe4UDITydmcJ+4EA/lES73BHhUdW6g
 6J8OSS1412myjXX2SWW/CkBsdxCQmI/6uZ9U1eSK7eag95wS9/KbF/RTrc+XFDO9dRBEAP8YYwW
 aMenGrJ2Fi6rM0kaXEh5nG5RC8Me7s2AMOoHOKPNOc3BE6bgMrYE74FziYb5j4NwbzeY7G94cKN
 E3M7OFGvzauhlUpWCo9KeFt3zhW2iF1vtakrPNkfyagw==
X-Zone-Loop: 9d0be436b5d9daf2dfb7e39491816da8b6c27f56a948
x-campaign-type: default
x-transaction-id: 0c5de289-a693-4dda-b2de-1c0f95263859
x-swg-uid: 01-6602d102-7a6f-4bfb-92f4-564e150c8a96
X-Mailer: Sweego
Message-ID:
 <1786371860.8631fc262581453bbf619ec5b2062170.19fec0f65df000e099@vates.tech>
x-swg-bid: 1786371860.8631fc262581453bbf619ec5b2062170.19fec0f65df000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 10 Aug 2026 16:24:19 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] xen/scripts: adapt gen_compile_commands.py to Xen
References: <20260810095056.29884-1-gwd@xenproject.org>
 <20260810095056.29884-3-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810095056.29884-3-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.202a.e62aed357f894a53.19fec0f63e6.8e7d40e4d9946ad=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786371859430
X-purgate-ID: tlsNG-bad1c0/1786371861-FC610034-4EC8FEAF/0/0
X-purgate-type: clean
X-purgate-size: 1320

---=Part.202a.e62aed357f894a53.19fec0f63e6.8e7d40e4d9946ad=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:49:44AM +0100, George Dunlap wrote:
> Two changes from the Linux original:
>=20
>  - Linux's compiler invocations end with the source file
>    ("=2E=2E=2E -c -o foo=2Eo foo=2Ec"), and the script's line pattern re=
lies
>    on that; Xen's cmd_cc_o_c places "-c $<" before "-o" and "-MQ",
>    so on a Xen object tree the unmodified script matches nothing and
>    produces an empty database=2E  Adjust _LINE_PATTERN to capture the
>    command up to and including "-c" plus the source file, dropping
>    the remainder, which database consumers do not need=2E
>=20
>  - Reword the docstring and help text to refer to Xen=2E
>=20
> The support for reading object lists from archives and modules=2Eorder
> is unused in Xen but retained to minimise divergence from the
> original=2E
>=20
> Assisted-by: LLM
> Signed-off-by: George Dunlap <gwd@xenproject=2Eorg>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.202a.e62aed357f894a53.19fec0f63e6.8e7d40e4d9946ad=---

