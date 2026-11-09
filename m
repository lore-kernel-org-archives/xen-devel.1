Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54A606A33E
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Pc6jqZgH
Received: from list by lists.xenproject.org with outflank-mailman.1479667.1683574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQKyf-000678-OE; Mon, 09 Nov 2026 08:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479667.1683574; Mon, 09 Nov 2026 08:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQKyf-000671-KO; Mon, 09 Nov 2026 08:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1479667;
 Mon, 09 Nov 2026 08:43:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@swg.vates.tech>)
 id 1xQKyd-00066v-HD
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 08:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQKyc-006deG-Jc
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:43:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@swg.vates.tech>)
 id 6af187b6-e002-0a2a0a5209dd-0a2a450385e2-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:43:42 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@swg.vates.tech>)
 id 6af187bd-fae8-0a2a45030019-b9ff1c23b549-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 09:43:42 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1bf7a3b52000403d.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 08:43:41 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5825E82095;
 Mon,  9 Nov 2026 09:43:40 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Ds/rFPd3qtyEgz7EvsLJ9nExT1P8Nu1ccmNBmnH/p/g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Pc6jqZgHcWduZRP2V2pmfj0j9u5Tzwh8fvrOJ1+V6TG4AosofhCCkuIqb5QjnF3zPo9RlcDLN
 0RQnZlYVslJkdzUVOsoQJuBK6oXqGQhJPhR8TiAQR6V2qb0u7w1qvDshBefjIWVwXTh8icbVce+
 gLno1oyyDXz1MetokndlH/rr5DJQ5qKNyS1xdbNPbg2hXgfElBWbZXZCswDrb9mmzS0ukFvKHCA
 fEqmvUezal2dkv05B2KsBp9C/AvE69StoX9UXDZlGrmMw0j8NQ2KpcROJIQg6iBThKjrsxV7Xn8
 gtFSF0RLOHpSox+f5DlaXwtej40DthgHMNhbX3JNAz4g==
X-Zone-Loop: 2a6e4d40e2d5a01b8f6b54fc3b0c3abf677aa541643e
x-campaign-type: default
x-transaction-id: 52559c01-cc57-41b1-b80a-a269dc48251a
x-swg-uid: 01-d2de41fa-5bd3-476f-b8d6-85150134b490
X-Mailer: Sweego
Message-ID:
 <1794213821.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@vates.tech>
x-swg-bid: 1794213821.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 9 Nov 2026 08:43:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Fix cleaning bindings test
To: Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20261106231732.482518-1-jason.andryuk@amd.com>
 <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
 <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794213820590
X-purgate-ID: tlsNG-33051d/1794213822-74E874E9-827B25BA/0/0
X-purgate-type: clean
X-purgate-size: 1183
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/7/26 00:11, Jason Andryuk wrote:

> On 2026-11-06 18:19, Andrew Cooper wrote:
>> On 06/11/2026 11:17 pm, Jason Andryuk wrote:
>>> make clean fails in the bindings tests:
>>>
>>> make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
>>> rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs 
>>> *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
>>> rm: invalid option -- 'c'
>>> Try 'rm --help' for more information.
>>>
>>> Split the compiler flags out of the LIBS variable, since LIBS is passed
>>> to rm.  The individual *.cxma files are deleted in their respective
>>> directories.
>>>
>>> Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Lovely...  Sorry for breaking this.
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Thanks.  I just double checked and unix.cmxa isn't in the directory on 
> a successful build.  So the whole thing could be moved to LIBFLAGS or 
> a suitable name.
>
> Regards,
> Jason

Could we follow tools/ocaml/xenstored/Makefile further and
move to BINDINGSLIBS or something like that?


