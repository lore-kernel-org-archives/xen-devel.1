Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71277606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAwoy/ih
Received: from list by lists.xenproject.org with outflank-mailman.1501911.1697913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8jr-00032l-TJ; Wed, 25 Nov 2026 08:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501911.1697913; Wed, 25 Nov 2026 08:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8jr-00032e-Qd; Wed, 25 Nov 2026 08:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1501911;
 Wed, 25 Nov 2026 08:52:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW8jq-00032X-OQ
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:52:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW8jp-00BNAG-TN
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:52:25 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b06a1c7-bab6-0a2a0a5309dd-0a2a4503d4b2-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:52:25 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b06a1c9-fae8-0a2a45030019-d1558033c0f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:52:25 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so46486655e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:52:25 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865a2sm515577705e9.3.2026.11.25.00.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 00:52:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596745; x=1796201545; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDFy1mMH0f3PbMnax2zBqgsOo31cKXdnCiC7xVncj4o=;
        b=EAwoy/ihGslNc1xpRnTKKj4Wx7i9Nd4zTUrB7UZfpB+oPdh4TMOUuxVJ4C+marNWEU
         wHXppphUozcMLnQxWwdBMSfe6erOypSV9JsFeSlf4XvtV4NdRirKnpzUMhUcMOrqbYv0
         HkfCZz28pu0NCFR2Jdqu1V8beOG6vtFOk8Bj6BvmnWUl1vn9A0aGgcL8WHjm7yc5ofuU
         2vTxu9hgYs3nyGd+waPr6eg+ib4brra4MuNSanbsh81fnFUtcfLN2MrvLn2dwqxjm+oL
         /Ms5mrsm8LI9Hr+oAxj/47kLap6nZAa0ro23KN/K40ZnpFliXnwTMO7KTC9EcSKlTg36
         nB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596745; x=1796201545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDFy1mMH0f3PbMnax2zBqgsOo31cKXdnCiC7xVncj4o=;
        b=ZDrToC/DF9cdi5nwZIAQBfESqKJlDH9wM2b+lKMCdkJeZ3E0/boCpKpbGLn5d8FnS5
         vVA0p3pHtNSAz2qarpkMRm1bO4WUWarqJYUNn2ANgPEYuEfijq+BO1FUAt5EI7kVSEGs
         fxJEdHJQGrF/3y7pVzxilCZmefBr4tY9FE4HTBkoP+WNw0s8G3ddyKPYSqfzj+kyOHxw
         JuBet0GFtrl39z64W3/PPhfFNAB5mocr/oJYOyfuXmlFEYc8KkNLtmS/YYFiujjLd8AG
         KGwS4bNvf23M1NSCzD/7+QQCcJ1z2o1i5EXJ8g15ByvW+Vga/V6jfF1iT/xajgghXPju
         wpAw==
X-Forwarded-Encrypted: i=1; AL+hErHZ7V+8Zydl0dMrb1hymDPTPTSDQ0B338aKHxOpOVIoZCtI8jOeCoMT3nzRS3AjvagdRSP5Ys6dwZA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9RBcsYj8Pzv96IneCHZ3y556s4JQn+tS9aa+E4E4RRjoxKzMbm
	/gij5w4hBrybAQA8FFBtV/SE2vGqgd+qrbneltv+DSYyR83fa1FAxAc4
X-Gm-Gg: AZFdTZd5tDb1ppDHfnaxAvIGSJunQJ5zL3UmUwa4QVctrkp4nNBIaOmepyAX5VkhY3P
	a+w9nuAC4VsbXCP2F07djZemYQEosd0fnKJdBoIlFkAaEWYMuCPFehYSiGid6xGTmuoSDPuJ1mj
	q5NxMZpkgydsfMs85VXffSV1putmuUS4nzakdhDIcoVbY34I0AC+gq1or/lJXQopjbTMzxCLLVl
	0goTdm1QF6Kz7i/4b69lAyHbnvyDKyIaPhMtkwcdan9F0gpFUCEkc8qTJ4wgS+YceQOgXONves7
	dbNnCbQf5ES3z3RRFuSnN4TPN5LVX0W9hb2AwSedaqIOcGEBE6ognQJswAl74IlsjHPMFwViuFK
	7yob2N5fmsHWiSo6ntPC/HYHbBTGlOar3Zm+9e6iviuh+3zeNgucMkawVm+yFugQ1MzdI4OG2Pj
	RafdqxrmQCslWwd23d6fufG9JACmcEshOZl8wk1sL6Hjp25fmxVPrKhbwi99WHFjvI0OMxsqqSW
	oyxuEJ53JhJusULvHZKGS2Q3jHzTtPcuAuwx27czlsivJBa33j6T0te5XgjuFkbDvJKepLP3Nds
	dlfE74Ygyvrz6yo1fKZOKQebW1ogDU6P1qzHe0lbsYJFqybvrvS7LGV9kOLX3a9j2WMOuK3g13H
	wMw==
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr372288265e9.0.1795596745323;
        Wed, 25 Nov 2026 00:52:25 -0800 (PST)
Message-ID: <28471210-9af9-4941-b1d0-5a5679e51e1c@gmail.com>
Date: Wed, 25 Nov 2026 09:52:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ChangeLog: extend safe_copy_string_from_guest() related
 note
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "community.manager@xenproject.org" <community.manager@xenproject.org>
References: <5bc54bac-b86c-420c-a5fd-70f761aa5f03@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5bc54bac-b86c-420c-a5fd-70f761aa5f03@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795596745-77AC44E9-CBD2CED8/10/78276251493
X-purgate-type: spam
X-purgate-size: 1078
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/26 6:03 PM, Jan Beulich wrote:
> AI points out that FLASK_CONTEXT_TO_SID was omitted from the note.
> 
> Amends: 508209c47305 ("lib: make safe_copy_string_from_guest() validate input")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,8 +7,9 @@ The format is based on [Keep a Changelog
>   ## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> - - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
> -   string sizes need to include the nul terminator.
> + - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, FLASK_CONTEXT_TO_SID's, and
> +   FLASK_DEVICETREE_LABEL's input string sizes need to include the nul
> +   terminator.
>    - On x86:
>      - XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
>        permissions for the port range in question.

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

