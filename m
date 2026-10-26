Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBE606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=e0P5exl/
Received: from list by lists.xenproject.org with outflank-mailman.1461430.1672437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLfK-0002aU-CU; Mon, 26 Oct 2026 14:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461430.1672437; Mon, 26 Oct 2026 14:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLfK-0002aN-9w; Mon, 26 Oct 2026 14:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1461430;
 Mon, 26 Oct 2026 14:27:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1789b9cee000f79f@swg.vates.tech>)
 id 1xLLfJ-0002aH-4u
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:27:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLLfI-003Tx6-8y
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:27:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1789b9cee000f79f@swg.vates.tech>)
 id 6adf6336-2eae-0a2a0a5409dd-0a2a45019c3a-26
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:27:08 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1789b9cee000f79f@swg.vates.tech>)
 id 6adf633b-5984-0a2a45010019-b9ff1c238c99-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:27:08 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1789b9cee000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 14:27:06 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9AAE0815DF;
 Mon, 26 Oct 2026 15:27:05 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=nG5rk/XCmLLCdy72Z2Rxc8o8MJJTUEimEtqQOHP1kl4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=e0P5exl/rOhMjPFOHKPSbIUaI89mHW8+f21nEFYosL7yyRBAuglp/xoWg5CuMX/4wuJLfUaYW
 9uz4vRVEmm3dlKTZUxNGuiAM2w1S62ngQVemUqquLfmw+2ZJAbHCWVN/qseeK2pKuA1KC5LtpAJ
 fp1BC1+KiMie7qnRM2TXx93bfQ1bjSfatyteyAF8UD0No7BP3VS12jhEeFEsq6vptSQqCopHZ4F
 mqpf3EUuNPj5E04EQXQNcZwSzhnXA3Vanv+y9N+tbDKiPqvMp71hr3OCJboj+kbTNZTZLLEdQn7
 wNkE/HFrtDg9+iOQ8TfJkKVp0oFDJezxceI3gDHS7Yrg==
X-Zone-Loop: de4719b29853a81784b2b3c27fdb095bded3d3337d60
x-campaign-type: default
x-transaction-id: 751cd7c4-e334-4ce3-8d86-fd199ba56c2c
x-swg-uid: 01-b668e449-76e8-4764-94a6-ef0753998cf8
X-Mailer: Sweego
Message-ID:
 <1793024826.8631fc262581453bbf619ec5b2062170.1a1789b9cee000f79f@vates.tech>
x-swg-bid: 1793024826.8631fc262581453bbf619ec5b2062170.1a1789b9cee000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 26 Oct 2026 14:27:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tools/ocaml: bindings needed to build ARM domains
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
 <9019a85e-c121-4d21-95fb-078765e0c3d8@citrix.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <9019a85e-c121-4d21-95fb-078765e0c3d8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793024825853
X-purgate-ID: tlsNG-d62444/1793024828-1DC79757-02AFC2B0/0/0
X-purgate-type: clean
X-purgate-size: 876
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/26 21:57, Andrew Cooper wrote:

> But, I think now is about the right time to put this in as a real test
> to run in CI.  What I did was a gross hack, but in principle all we need
> to do is install it into $(DESTDIR)$(LIBEXEC)/tests and it should get
> picked up and run automatically in Gitlab CI.
>
> What I can't find is anything which can truly pretty-print an Ocaml
> object without some external structural definition.  To test the
> bindings, we need to reference every part of them in Ocaml code (and
> have it not crash), to confirm that we built the correct structure in C.
There's no nice generic way to do this, I'm afraid. It's a common 
complaint...
It can technically be done with PPX-es
(e.g. https://github.com/ocaml-ppx/ppx_deriving#plugin-show), but it's 
going to
be fairly painful to integrate this into Xen given our reqs.


