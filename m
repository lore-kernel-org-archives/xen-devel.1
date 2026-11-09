Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13888606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeXwkVxM
Received: from list by lists.xenproject.org with outflank-mailman.1480196.1684160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQXa-0002Ml-Qn; Mon, 09 Nov 2026 14:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480196.1684160; Mon, 09 Nov 2026 14:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQXa-0002Md-Ni; Mon, 09 Nov 2026 14:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1480196;
 Mon, 09 Nov 2026 14:40:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQQXa-0002MS-6P
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:40:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQXZ-009pff-8A
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:40:09 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1db47-8faa-0a2a0a5109dd-0a2a4506b8da-6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:40:09 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1db49-195a-0a2a45060019-d155802fade0-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:40:09 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso9835615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 06:40:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb0d7a7sm231633855e9.9.2026.11.09.06.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 06:40:08 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794235208; x=1794840008; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3ucCX7WTiep3oeA6fzEc1EUZZTClmyuuB1UgYYrLbA=;
        b=QeXwkVxMwyZbH8Dl9gWcuR96ZfQdhztTj39SZGquxKZWJoODpRXu4cvHdAiZBdhPLI
         uTo1pZGdyN4JiKbclGeniR5KP5eRXDq0NWojxhvEeOVVRVhQvWXJDKc3RV5omxkv5j6B
         ePdoGgDHy+13FYHEnV44NtikFU6gd+mZ5oo79Yz9J9RSPDazLqxw5CrfnsyuxlWGlTY/
         6ZuSFzUNGtQwzIovPd0lFHO0lQo1bzXN2lkyH0ByXXAx52UAzk8A9kh9qvW7OOg+CsO3
         UgSku0afmGdwugMK5WLGIychVddSz/Rr7bVF4k43YKbfudRwOgFu3i8gvmxRrpKIqQvl
         c7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235208; x=1794840008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3ucCX7WTiep3oeA6fzEc1EUZZTClmyuuB1UgYYrLbA=;
        b=N1ZuRxuIardu7VeBsDbVct9Ui0BnAFZGDLItP/uldhzoNt0D3+YulvFMO6wF8c0HAI
         9Vl0edSeqP9U1/B/rq3DJNUEVJg/RaGoLbIpiwfJJYY+KoCA1wM9qEvY8ARgYmiRzwir
         dX/qymba1gsJfTn0WWVtG8qFRTwsBLnJeY+GNqQfKVXTFrYLiS57OJDPToRmcCrkpT1U
         1Y+xEh11dQWu86IlVIsxk08rZGKZTrFnfX7H/G/ThkdvTI0+nFo86GUOhkiFbm6Dt03K
         AS4QzypzGEz47Ci48lS94niNr6kMM2SLDNdu0KccYEQJ+UrzPIKJOIpqcSQkUwkkw+xS
         uW+w==
X-Gm-Message-State: APuU4Z9MD5XMfhYd9D+N5rUJzsgyhCP8zsujFomVKfQPfudJLKU85ewj
	enY56pMQtWKWQJHYkWCYXHug93wcXFhRp+fgIcJczedwFGw1h1zn5ef0
X-Gm-Gg: AYBFou3i0FXK74uigfpJjsz1q6AkT+fLFpPt7I1rAU0C3M/JePUg82i8epmZpS14VVO
	VofZdHwqI55ZxgkKW6QHl6I9nJMD0NkS+ctO+nyKH21b+YtE78agU3tz9zqbqwLpPATCZIO6YV/
	VMR8FZOYy8j2NIRDWDc9+TjJA2X7xZKUz2j8VYfba/Mk28X+Pj2Rzqfkzkot4oA49Ye1JMgfuv5
	jdt/afKM7xLYNdqo0p443PqKKEruTeZkVAvzihmXFyMM0FBpKLWn8T8Jh++HseXvjMlzwYkJwQG
	eycwF1k8aQwim2xBcSREtjJPAYr94HycHIaDUZkpTUqcjySXa1nX6KZWfyQVbu1ZQ4ZPKGJe8QN
	RqLlV8dANfUgIlQ7UB+VcLAo8ZEazIaf3ubEbmycbstujiCsa3mVb8nypXl96EdmVHaSIvgoR17
	NKE9EE/jVaTvOge7FwQWVNlcKHQut59WRZILnBWhNZ3WIhNeh/Bp0CaA4BYFuICrLeW32gmeFk+
	GjbQjO/mUgq4U5tCCgJ1DQg2GuxCKOweG4sPyFMva1g7f+NdW3bc8FrNmoSat8Gi18BRoCCRQm9
	WwfcznQ8FvGCURXKvIUgDB6P0mrlkW9KYlEEi7HnbAou4qKS4clCDeegly1Q4agIWeMyLLqrIa7
	JPA==
X-Received: by 2002:a05:600c:3107:b0:4b6:540d:6317 with SMTP id 5b1f17b1804b1-4b960da5deamr80806015e9.12.1794235208469;
        Mon, 09 Nov 2026 06:40:08 -0800 (PST)
Message-ID: <2622fdc9-8242-4088-b0b9-c78d43ee8f1b@gmail.com>
Date: Mon, 9 Nov 2026 15:40:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/riscv: skip disabled CPU nodes when probing
 ISA extensions
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
 <1794230641.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1794230641.8631fc262581453bbf619ec5b2062170.1a1c07ae3e2000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794235209-1FECC77B-1F3D8C39/10/73395122804
X-purgate-type: spam
X-purgate-size: 1734
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 2:23 PM, Baptiste Le Duc wrote:
>> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
>> node under /cpus, including the ones with status = "disabled". Such a
>> hart is never used by Xen, yet it can still remove extensions from the
>> host ISA: e.g. a disabled hart without the H extension makes Xen panic
>> with "Xen requires extension: h", even though every hart Xen runs on
>> implements it.
>>
>> Skip CPU nodes which aren't available.
> 
> has_isa_extensions_property() still walks the disabled nodes, so the two
> loops over /cpus now disagree on which harts count. Rather than adding
> the check loop by loop, can we filter them in one place, e.g. with a
> dt_for_each_available_child_node() iterator, so no /cpus walk sees a disabled
> hart?
> 

I missed updating has_isa_extensions_property() because I had Cristian 
Andrei's patch in mind, which adds support for the riscv,isa-extensions 
property (the patch isn't published to ML). This function will be 
completely dropped as part of that work.

So, until that patch is published, it would probably be better to add an 
additional check to has_isa_extensions_property().

Regarding the question of whether to use 
dt_for_each_available_child_node(), I don't see many use cases for it 
beyond this particular one. There are also plenty of cases where it's 
perfectly fine for a node to be disabled and still parsed, so I'm not 
entirely convinced that we need this change now.

Let's just add an explicit check to has_isa_extensions_property() for 
now. Are you okay with that or still think it'll be better to introduce 
dt_for_each_available_child_node() specifically for this case?

~ Oleksii


