Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71343C88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 13:06:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423127.1648404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pLM-0000MD-Lp; Wed, 16 Sep 2026 13:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423127.1648404; Wed, 16 Sep 2026 13:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6pLM-0000M6-Io; Wed, 16 Sep 2026 13:06:32 +0000
Received: by outflank-mailman (input) for mailman id 1423127;
 Wed, 16 Sep 2026 13:06:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6pLL-0000Kk-Kg
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 13:06:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6pLK-00AQpY-TJ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 15:06:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa9451-2eae-0a2a0a5409dd-0a2a4503b7e4-20
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:06:30 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aaa9456-fae8-0a2a45030019-4a7de18dec56-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 15:06:30 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so4999805e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:06:30 -0700 (PDT)
Received: from [10.72.3.60] ([91.26.93.146]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e847da0cdsm40245e9.2.2026.09.16.06.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2026 06:06:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789563990; x=1790168790; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mun2AV+TlG924D+xyrsyfLJbFNsClESosmH8/Nj3Ijs=;
        b=R9cXsxL+kyLX3SruWooKrgrKo4M/afknKCg7HCYNZhQwv1enPYN8mNJ/KEb9fJGrNy
         i/Lt8scESbkHOciUvGnxfI4ilGbhTd/8v1IbcnmByGV2TU3rt/9irvYkG2LFDf7zIGwE
         8BPMXz/VOKfJsubHMbkN0qsHhSqrzuOOQqT4G9j98GreDBLIN28l+DfbHitv7Nmqwoy0
         Rl3sO6uM8UFY5U/30dXMyBNgzqcoC9fNYRE7w0fhk3VtlipmI+b5mNm2tRh5k350ZyLa
         71CIN3Uc0dK6X3nFf7HvC+0Ic8QJAQpIVRY2kqQ30BEG0stzP8aGYZeelHkLuKkkyryO
         QEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563990; x=1790168790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mun2AV+TlG924D+xyrsyfLJbFNsClESosmH8/Nj3Ijs=;
        b=XxUWI2UngUbYITISf8xvEU1UuuNEHF83+127D3qj8WKtZXPofpWz3icJZKA7dfAmVz
         E/yfgTiB5Lf4vBDkK9h04QqcgUD+9FKNpfjVZP9lvcK+44yU7bDGZl7iQmu1J2wFcvi9
         R2y16QLVpjHsY7kGKDBO1Hzk+tyMJERNiI6zo/CqHfZV1gY+vCHtZy4d2Uw1FubmO13Z
         /g4IoGgp4Duo/FvY+cLXHDvomxRNcFuqOYywdmei8fXcdIXTSbF7FDlanbxqTQdgp5wB
         x24DwuRqa6nHuNF3iFUV8ckUBoVr1eb0/1YZHHlNpa1KTMYG6dfxdRhX+/j95e1xAZgL
         oXGw==
X-Forwarded-Encrypted: i=1; AKwUvBxhamOVQg2NuDeqD39h+Wvctrg1wfXQ5VI4Pge8FNMzwGiSF2rRHlrPc3YZn+7YhJTbj3ToK8PsbFQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nLkfjdbTlovNjtWrgTme/uSOL3DIuUlg4J2A/nn9jGf3XwP0N1
	E7tKGxB0EwmNw+iDc65Ij7vl1femruCT9VnoZ4fFT0WoD3wSQ2zS78rwXg0ZGvsnbQ==
X-Gm-Gg: AYBFou3cXdoAiWj5+gmdAiRw8c5kxPwtgLgPtNF/D6VUsmCbKBL/0Cn1uIw6iSv/+jL
	r7lwPHNzdTg5dDbpSUQKYrEQUz21GpF/U23C+Um7xHnkOCDM/M+Inhk2JedCXQl8z79vbxtYqIu
	wCAGP43SqBq3MB1rhp6QE7FqobWSkC5pzxSJY4/vPYvehIoHmUFnhzLSAYRjnujhGA2jM1fFSUI
	fLU9u/bhHNt9bkdZeM2ob012cTKfCZuQKPVOzim4Dqd2HnI5mU9wZ/8q47e9huynftUneHkqY95
	cSSshjB6y+bl32E5tmwEp9+xAwpvK7NwGCS4RhMdybPveSbhpVURH+Uy8qh8cqaTRJJsoWpKKIJ
	pLl6yLHXptj97+pk/azVKbeTltlvFhXPaoB9hSgsrK/WxoB0Up+7B4eRQ9siBfqGSIiiQskV/zc
	TxTE3BFLkyu7K6GVSoXQjBOl4xZCCjzHAWnn65fjtNSZxE0fRtwwwhS/riEDGBvwpyAd94P4wn1
	Q==
X-Received: by 2002:a05:600c:620d:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49eac46430amr65034215e9.2.1789563990267;
        Wed, 16 Sep 2026 06:06:30 -0700 (PDT)
Message-ID: <839b00ad-038b-41d4-86a8-24f85e01ca74@suse.com>
Date: Wed, 16 Sep 2026 15:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
 <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
 <BY1PR03MB79965A43641C02BC2267E5A8F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
 <2516df18-b239-4bf8-9f89-f1811515e5d8@suse.com>
 <BY1PR03MB7996E6B84145F4A368D611B2F3B92@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BY1PR03MB7996E6B84145F4A368D611B2F3B92@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789563990-6DAD44E9-E58F16F5/0/0
X-purgate-type: clean
X-purgate-size: 1088

On 16.09.2026 10:23, Kevin Lampis wrote:
>> The "flag set, pointer non-NULL" case wouldn't hit the "return 0" path
> 
> Correct.
> 
> But what about the "flag not set" case. When PTE_UPDATE_SWAP is not set then
> UPDATE_ENTRY may return 0.
> 
> If UPDATE_ENTRY() returns 0 then mod_l1_entry() will give
> the wrong ol1e value to put_page_from_l1e().
> 
>     static int mod_l1_entry( ... )
>     {
>         ...
>         ol1e = UPDATE_ENTRY(l1, pl1e, ol1e, ...);
>         ...
>         put_page_from_l1e(ol1e, pt_dom);
>         ...
>     }
> 
> I think mod_l1_entry may need to store a copy of ol1e incase UPDATE_ENTRY()
> returns 0. Or add some extra if/else around every call to UPDATE_ENTRY() to
> only assign ol1e if we know we're on the new PTE_UPDATE_SWAP path.

Possibly, yes. Or even have a separate helper for the SWAP case. What may
be possible with the returning of 0 is

    ol1e = UPDATE_ENTRY(l1, pl1e, ol1e, ...) ?: ol1e;

when the return value is relevant in both cases. Question is: Is it, in the
first place when SWAP isn't set?

Jan

