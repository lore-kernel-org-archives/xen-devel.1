Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FCF606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=LjX7BsU0
Received: from list by lists.xenproject.org with outflank-mailman.1486927.1689363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRnsB-0007yr-7g; Fri, 13 Nov 2026 09:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486927.1689363; Fri, 13 Nov 2026 09:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRnsB-0007yk-2K; Fri, 13 Nov 2026 09:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1486927;
 Fri, 13 Nov 2026 09:47:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xRns9-0007ye-Tj
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:47:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRns9-005sz3-6k
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:47:05 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6dc94-bab6-0a2a0a5309dd-0a2a450a9268-8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:47:05 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6af6dc98-f2d2-0a2a450a0019-d155dd2cb806-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 10:47:05 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48fd2e38825so484212f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 01:47:05 -0800 (PST)
Received: from [192.168.1.51] (host-78-146-248-75.as13285.net. [78.146.248.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60f8e794sm4351519f8f.59.2026.11.13.01.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 01:47:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:Cc:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794563224; x=1795168024; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o0+diP69F7mScLPPkStsVNseVmGdbWIt0dnsj4T8J8=;
        b=LjX7BsU0RZR2w3okiluqXQkDoI8v9Vuub31BGnFmeqYd0WS5+sfuMQTyGgZd4UMz9W
         6cgy01Q/z3ZLDzr+WSI0Wp/1B6eC55RvffHM0rIL6tSu13iX2u3v+3JCwlEkbc5C/MYC
         Q+yezhTx5UnhYD49rv031YbrlsW5pdzpvKflg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563224; x=1795168024;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/o0+diP69F7mScLPPkStsVNseVmGdbWIt0dnsj4T8J8=;
        b=UTWityp+Wv8Z7R0LKrPKiZ708GvOetOCc8wnxpEgT97GGw4XwvkgRgvDQtCJi6AUcO
         XE6UlTkEnph9t2E7byXTiCGAtgTX7hjkyLu8kRPolhWBVHTPAjTTMyCGCTET0YDhmxDT
         8eUO/BaowfxeAUzA/2Lee6i34A/+iPCvh9PHIWPWPy6/VigF1JHGlHFFD2tR6fdmSbYu
         oLe/HT2LLnnL8JzTXaLr5IE2SEcKneyA+l5YIurVXJA489UlsytTobyQyJ/r0l1cYbO3
         GOKeXWulRMe/9dsUu5eEVkrKUhwLWqmK0m2Z4RarduHAq0eq5omazA4FYUFOe0Ux3gCj
         ChOw==
X-Forwarded-Encrypted: i=1; AL+hErFJBQBQShHNuklABQJRSOSb01h56ax30mntJOjakjY7LHgvuv3p7pTl+UMdG20V92Q51kj3+Xw9l1U=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/kxGxTfU7bLBVD783Ex4gKDb2RmG/HVNfGGl6x/SrMcjGnzxnD
	ZsRtfm6OS/4l0HDWZZb3pHMSqgmVne/o+QBO40tqY4DwSo0L1kfp5GjUnC2axVvDRQA=
X-Gm-Gg: AYBFou21IWG9T1HPhtR1krt57wHahRy5Bth1ZpgDUj+Af7CUlFhB5DaP4+WtX5O6oyN
	4zeW85sxpNlnvtQQNApqKmbuzplsMzcrMEsiV/PA0Z762O/NxdpLVxM5yW8c2S8zWL6s+Onka0l
	4QRHPXZSiKL9wXbtkLbp7nQn0IlZsEmErORx9jWx+glGQNTOL8fSRut0f0QjTt+lqM2TJK9nanS
	uf5tyGHwqtYjx0b5d0Rx/DIRrYKRbrNaTNDbG/zndLbbxJnNMCOyupMcZ8kfQCP9pah4VVp6KMx
	VejMrD2e+5xeDaUCjxPRaGJrbybXT17CqINNWDJnCO48RHiGdCTN4myKP4D9mYp0M642OxMlIWf
	rGBtFgvqW61WzQesYuqrvJEPTW4Cq+ngf2Nuyi1WNrB9gFmMfe613GHanLcn9/9CEmuFPKzC8Ie
	dDPiaI6hjnB6n/IN/OBMNUKoSbBmcPlH0pPC1h5wmmKVXAcnqZDnc1ik94rQ9VN/i7oCuWTzlvj
	mVHq7uBmaBSc3oh7/jNLHmUuEQRtV8blllnL6auBCljUy5yszk3Of5R8b1NQRK28FMI31j2W947
	zf5/vdLVIxZaT8+VP6xJv6IgFCgyBz/R6BUX7vcp1Fh2RyBABOM07tsqh/HNss3OfdrhUA==
X-Received: by 2002:a05:6000:186f:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-49c70de3819mr4738258f8f.16.1794563224380;
        Fri, 13 Nov 2026 01:47:04 -0800 (PST)
Message-ID: <c5e2bffd-5576-46dd-a555-ef45066f35f8@citrix.com>
Date: Fri, 13 Nov 2026 09:47:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794563225-52CDBCFC-02745DAE/0/0
X-purgate-type: clean
X-purgate-size: 693
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13/11/2026 7:31 am, Orzel, Michal wrote:
>
> On 12-Nov-26 19:36, Andrew Cooper wrote:
>> This is a list of pointers which is only ever read.
> I think that's not true. See sched_test_func() macro in scheduler_init() that
> assigns NULL in case the scheduler does not implement the required hook.

Lovely, sorry I misread the const on the name there.

sched_test_func() on the other hand can be delete.  We can force those
checks at compiletime.

But, there's the global init case.  None of the current global init
hooks do anything except return 0, but I suppose in principle that may
want to stay.

I suppose I'll keep SCHEDULER_ARRAY in read_mostly for now.

~Andrew

