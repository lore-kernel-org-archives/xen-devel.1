Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92A606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 06:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AedolnTM
Received: from list by lists.xenproject.org with outflank-mailman.1504569.1699798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWpVO-000111-63; Fri, 27 Nov 2026 06:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504569.1699798; Fri, 27 Nov 2026 06:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWpVO-00010u-25; Fri, 27 Nov 2026 06:32:22 +0000
Received: by outflank-mailman (input) for mailman id 1504569;
 Fri, 27 Nov 2026 06:32:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xWpVM-00010o-PS
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 06:32:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWpVM-008hMJ-5h
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 07:32:20 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0923f4-e002-0a2a0a5209dd-0a2a450bd5d2-0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 07:32:20 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0923f3-b7e8-0a2a450b0019-d155dd2dd5ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 07:32:19 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e47347279so4700418f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:32:19 -0800 (PST)
Received: from ?IPV6:2003:ca:b72b:fe45:e1ac:ac9c:c3da:1a47?
 (p200300cab72bfe45e1acac9cc3da1a47.dip0.t-ipconnect.de.
 [2003:ca:b72b:fe45:e1ac:ac9c:c3da:1a47])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4b8e564e39asm13428164f8f.57.2026.11.26.22.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 22:32:19 -0800 (PST)
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
        d=suse.com; s=google; t=1795761139; x=1796365939; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p01m6pUl8u+AgaDFwowO2IDm/GT9QF3DdlZ9egJ2cjw=;
        b=AedolnTMqTdCAzkzW/HHXa1TXWEMgUed7rLBnqaJe7y09kVvj6XKP/cmoAat5cCYsu
         l/0ZzYn9lwQQByW6njwvdJ64wXCi6JuTfDOSAaJZOzfsk3g+iLOXPesjaLOCstwX6KV3
         iSOttNNL4F3f15bfP+GTS0qQoOKhyypIhTYN2+PvpmI4qJARI7Emzbc/SgWwSyAucxW4
         k7LjlTxVOqkve+hMlriVsEDjLB2lTybudVGznhJux9RlaGcACpvu9TL+xpVe4Pa3NfoK
         JBIn1MroyV9wcebkzfZVe3wSYjjmW0xNcA0sTopQYrvuEeeB/28aiMeCfqqmGdRZD06J
         BEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761139; x=1796365939;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p01m6pUl8u+AgaDFwowO2IDm/GT9QF3DdlZ9egJ2cjw=;
        b=phjdi9G3aKHKnKncYOBd9Gzm+71d0vIl5MXTPvPKAWtSwAJyEZ5mCCxusFjVmTqguY
         C8hywRvk8VXuBxnQ8gEs1jGYPjDwCMY7JAW7Yd5k2wK0eeZtC1JVXWJ8+p89e/60tnCl
         pYI0rknrTh5wcVbp2Gd4H+32vXxfPMNzXMrZGBCyyHQMXMXsVjV+wmmL/uZhdAfpHnon
         Xgj4UqgH73ae3ehprJpTSSQet03/20sX+Oq2xIeNen4DzbJB8r4wRkV1Qykx+c75Cv8K
         nddEVu8WRE1zDCbwIyIW/nE31EEf1gCzfWIk7p3Bwsu286Uipmi6tSCtFpFWHSrGjOOS
         U3pg==
X-Forwarded-Encrypted: i=1; AL+hErE4FQ8T8HGfyVN1cYHqXIY2uAaKyXjshBlUFVVM67A/GJ9tdbb1w8w6ml7pjxzG9bnUew//eawgfc4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8vV5QkplqGp9ILDEhBOI2pfu3OGzC3SiQ/gCVQeR+HeD+qkXSv
	LxFPxQSFuB0shnejv5h7eBcIUQcJRRVZHNzRG+74w6MyUj9cEbeoQX7mIADq7Nd6QQ==
X-Gm-Gg: AZFdTZd4h6WJDfrliGk88WXudUopdlD6EA2MWJCxNMfLw3X9KnwirV7b27kKy550ktP
	+KJiL6I9Gc51MMfFc9eHcKld5JsUrUpu4VgMsDrMvJfo4GoNAxMNf9a8p2IM79fR9lBy2/yBA8O
	X7ghvMwyU7UF+FQfkfihRK8EMJUnsiwkZmo2SnsY1qtKDzrNplPXYrzZ8AYVrFIbsDZLqcDdoxO
	wLGp4yS7o7bze99UpaRM1nRLaIvC7I83joVAnBrTK9QEiw4BBoe2W5H0qRpRZ1KHffm7OOs46e3
	/zi92fUJzt8TRARvQnZZIj1pLChDS0A4/SSdEiJ0I+hmgvSgTzLt7QkL6aHR1MJZdklltfbDvS6
	RT/CPaHS5T3m2bdM9WJgIyxmDn6hPOEkt9kP07SIK5ZwdxLGouC7HMwsEA5rqIkFycFBkqOP/+f
	7UiDYtsyw5c40yKgvBOoqMRGdXQLf5n3Ex8myKJ8CVt3BIJGde8vsZNSREK50gkYY74lTCjQ23T
	tEwAL/xyk/nbcL63VNdyQ5RNFBotu8jcBpq0l8SexfD1Ers+iHt5V/XvdcChfotUQjRTOHxHW4u
	JPfMnE0DgNxTdTbv4hEnOUo9FpEE9IqsT+SnVBWe50lQhZJiKV04Jl6jL8i+FnSJzShJPF08u2b
	AVc/6i+8KjH8znWdVdcytVbOAwXSfx77KI9gDbUXxcuY6Mj2RzGn1/RQWOTU5vQ==
X-Received: by 2002:a05:6000:1865:b0:4b8:75e5:301d with SMTP id ffacd0b85a97d-4b875e5306amr20649951f8f.0.1795761139436;
        Thu, 26 Nov 2026 22:32:19 -0800 (PST)
Message-ID: <36532619-8660-44f6-9abc-0145bb4e87a1@suse.com>
Date: Fri, 27 Nov 2026 07:32:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] x86/hvm: fix EFLAGS.IF handling of pending events
 with nested virt
To: chunjie.zhu@citrix.com
Cc: ross.lagerwall@citrix.com, andrew.cooper3@citrix.com,
 roger@xenproject.org, jason.andryuk@amd.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795761140-A98C19EA-1A22EE06/0/0
X-purgate-type: clean
X-purgate-size: 542
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.11.2026 04:49, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> Patch 3/3 of v3 has been committed, so v4 carries the remaining two.
> 
> Changes in v4:
> - Add Fixes: tags and collect Ross's Reviewed-by on both patches.
> - Drop #MC patch, already committed.
> 
> 
> Chunjie Zhu (2):
>   x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
>   x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
With Ross'es R-b:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

