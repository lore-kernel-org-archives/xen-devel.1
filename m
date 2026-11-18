Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53B606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e+umhRuq
Received: from list by lists.xenproject.org with outflank-mailman.1494236.1693856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTd7O-0000p9-Do; Wed, 18 Nov 2026 10:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494236.1693856; Wed, 18 Nov 2026 10:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTd7O-0000p2-AO; Wed, 18 Nov 2026 10:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1494236;
 Wed, 18 Nov 2026 10:42:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTd7M-0000oq-Mi
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTd7M-000pYr-2G
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:42:20 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd80fa-bab6-0a2a0a5309dd-0a2a45018f90-28
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:42:19 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd810b-5bcc-0a2a45010019-d155dd34addc-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:42:19 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so423262f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:42:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78386902sm148193965e9.1.2026.11.18.02.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:42:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794998539; x=1795603339; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2u749tRlWNG8WFs3FLnm85cRXLv0FJlsCkVNX/QrPI=;
        b=e+umhRuqlxhAlkK/CbXacXBsGt9tgzz+5FFIvy+sz6kQRFlp3pGbBz1VzGgxPk6g6f
         MCFgGDVdtaqNsVMwsWJeKAU6/xsxYHtMd0u70G8VJuqGRSBxp0DtbDmYgpm0nB4OO2No
         n8geHE4qh+ewc3u414Fp/v11jxzQVuSRN91VWAj9KqjHqxK+X8CjXr/ZiHGjqcLR0Fk+
         g7kbs3jCPRTqmjZp/Elp6HhGid4FOvWelJoBaxmfxMNGO2KA2FOP8b+ug9nqqmwPZOg9
         nloMIZPrU63XO9qfyz8tiC97YeR/DiEyauOU21Ysl4Mr+/veq/wAoROQHLChXNHLMHt8
         hjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998539; x=1795603339;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2u749tRlWNG8WFs3FLnm85cRXLv0FJlsCkVNX/QrPI=;
        b=MHeGbEV5aj6DM160FQNeN6QXsWh4ps8l2+vRJ+sCEHBJiOsTkV7blMBWPsd+jEEpGq
         QcXTIgwwCh5j8o+lr7nwcmkxMsheh6EivanKvLuqfh9JLX9uLAIr9YVq/hievuh8de5V
         QjacB6XN9ap3yxjrBotx0Kdz4FN2tqiv4iNv2iC6x4fzo7F92c1HjfGTGz7PIAMPHiI+
         GbykDexCmougOaoUQHBvNcRpE3cu/2uEkL6D7TchAJFejh0oNjUUwRFH67a+O6F7xuZY
         mI0tBEDnpx+WCFXIUHGvk+kiqPuveOeZQiXT10g9XlWpH8wtkB/Y5lyvo5Ji/pgPy0gh
         yIcg==
X-Gm-Message-State: APuU4Z9AI3mEd4Jf9p0ZMhwwbbCA6FsWarQjMqQOcmfqpZA20dwjP00d
	Hhdmo6hKKbr5u9Fmr8H6yFVXTj+JXEU65sYOPrqDOKIQY3E1bTAQS0kQ+C/JnhraBA==
X-Gm-Gg: AYBFou3RYOTu37hBcvxc1jkkzizaGwmO6FF8XO5kR+YUTMq6lBRNYWjEwePE7cgbA5s
	XopHXv+3Cy1UqlyeT4grGg3G748UrZ+rM0EFMfC29m89OhAzP6witL0kKzuLTrFizREs6YTAIDP
	Qwa3mVML9vTBgzCA1MhjSz8Gk1XXRISsm4DFsPqMHG2K/liWNBoPz7EIPa5R29k7/8LJDkF4jLQ
	z0bKC/GKSUUStQXefNs9StsLwP/O8s5xJJdobA6B0QpMItvy/7qMZImsBuQ/VZuCuV/tUAw7Un1
	ZxCWDcK4davJp0rObAOL2+qdau68dRjTYGaZFZ8ZSqkm5iD6mac3zgHg1/6McdatK2ZAayIt1eN
	bS6nKni+iLMMpVIn3hEhSFpkBq3QtGd+alyGbIVIE3ACgk+57/ck4UCpWFSwUe4xO3xh7KZV1tr
	sntuj8LMbI/6Hy8OJ/RdT2BaHdE+YKRY1bQsB3dvuk1wGa3TBJrfTqFeUg1wjzvBs8lnWHIrSoN
	jGzpBYCqFWs09AEckN1b5Kplqd1WAc1ZwrP04X3bRw2pQaPdmcn9BVa+oddeXTNEO4+tGyNkopB
	M4Fd2/FxBqHy73cv5DljKQkaKujnN5wEgjLvYfhgDASW9RrKVjEhRoaDnHlZjQDsy9xmsUDmwdD
	gmxtN2kGRsQWJN02/qw==
X-Received: by 2002:a05:600c:a41:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb7da1c81emr41262745e9.15.1794998539334;
        Wed, 18 Nov 2026 02:42:19 -0800 (PST)
Message-ID: <9090a0e8-86c2-4728-85b5-573c6517c384@suse.com>
Date: Wed, 18 Nov 2026 11:42:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: check incoming GFNs
To: George Dunlap <gwd@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
 <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com>
 <0a15b164-08c4-4275-a765-6b56e8c842fa@suse.com>
 <CAFLBxZZx=ke4DTduVmmWusoCH0AmD5MxWERjWMb8TiLGPBs5zw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAFLBxZZx=ke4DTduVmmWusoCH0AmD5MxWERjWMb8TiLGPBs5zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794998539-4F54D5FD-5EE90460/10/78276251493
X-purgate-type: spam
X-purgate-size: 4125
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 18:31, George Dunlap wrote:
> On Tue, Nov 17, 2026 at 2:06 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> OK, so to begin with, this commit message hardly tells me anything I
>>> need to know.  "At best undefined", ok, but is that a problem?
>>
>> Maybe I've done / looked at too many UB patches over the last so many
>> years: To me it is out of question that UB is bad.
> 
> Our code isn't a hard-to-change standard.  If we want to define what
> something means, we can just do it.  It's only a problem if (as seems
> the case) code is written which assumes it's going to be aligned.
> 
>>>  "For
>>> non-translated domains the same isn't true" -- sorry, does that mean
>>> behavior is worse than "at best undefined", or better?
>>
>> It's different. I'm not sure I'd call it "better" or "worse". Hence the
>> mere fact being stated.
> 
> But you're saying what it isn't, not what it is.  "For non-translated
> domains, it isn't true that unaligned accesses are at best undefined."
>  What does that even mean?  I mean, now I know that you probably mean,
> "For translated domains, unaligned accesses are problematic due to the
> P2M's inherent tree structure.  On non-translated domains, gpfns are
> just a jumble of numbers, so unaligned accesses aren't as
> problematic."  That's not any longer than what you wrote, but it
> actually makes it clear which is a problem and points you in the
> direction of why.

But "aren't as problematic" isn't what I want to express. There really
should never have been a difference between translated and non-
translated. It's just that the bad behavior was leveraged (or, see
below, utilized) by carelessly written code which now we must not break.

And btw, for translated domains the P2M structure also doesn't impose
any constraints. Instead I view it as our desire that we want to
reflect requests optimally in the P2M. Extents could have been
expressed differently in the interface, in particular with size and
alignment not tied together at all. For input extents there could have
been merely a size, leaving it to the caller to specify suitably
aligned start frame numbers. Alignment requirements really are
necessary only for what is to be allocated.

Overall I think my way of putting it still better fits the overall
fuzzy situation.

>>> "...and domains
>>> may possibly be able to leverage present behavior" --   Is this
>>> attackers leveraging the present behavior to do evil, or clever OS
>>> writers leveraging the present behavior for good?
>>
>> Or careless OS writers adjusting their code only until it works, not
>> until it matches the (largely unwritten) spec.
> 
> "Leverage" implies gaining some advantage.  I wouldn't say that people
> who wrote non-spec-compliant code that accidentally works to be
> "leveraging" the behavior.

Is "utilize" any better then?

>> Claude's description, while - as you say - helpful for you, isn't how
>> I'd like to see patch descriptions written. Many of your recent
>> descriptions resemble that style, and I'm only not opposing to that
>> because it's not wrong to do it like this. Still I, as a maintainer,
>> am not happy with such overly verbose descriptions. They remove focus
>> from the actual change / problem.
> 
> Your description made clear neither the change nor the problem.
> 
> The following facts need to be known to evaluate the patch properly:
> 
> - The public headers of XENMEM_{populate,decrease,exchange} say that
> gpfns must be order-aligned, but the code has never enforced it.
> 
> - This is particularly problematic for translated domains [because of
> how the P2M works?].  There's already been an XSA relating to the
> above.
> 
> - Linux, up until 5.15, passed unaligned entries to XENMEM_exchange,
> so we have to accommodate this for backwards compatibility.

Well, okay, I've re-written (extended) those parts. As I'm uncertain
whether Linux'es use of the behavior is fully gone (and hence whether
5.15 is a valid boundary to draw), I'm going to continue to omit that
detail though.

Jan

