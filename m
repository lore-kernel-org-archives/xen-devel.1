Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7A9CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:03:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437334.1656195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuuL-0004Nk-U6; Wed, 30 Sep 2026 14:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437334.1656195; Wed, 30 Sep 2026 14:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuuL-0004Nd-Q9; Wed, 30 Sep 2026 14:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1437334;
 Wed, 30 Sep 2026 14:03:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBuuK-0004NX-Nz
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBuuK-00BJZh-0d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:03:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd16b2-8faa-0a2a0a5109dd-0a2a4505bdac-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:03:39 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd16bb-4cb1-0a2a45050019-4a7de162bbe8-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:03:39 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48b01c41135so484743f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:03:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b02a0185asm3819480f8f.32.2026.09.30.07.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:03:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790777019; x=1791381819; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d40b8ylKLCGQqIn3kdm+4kWG3FKdVGCOY6++eHynue8=;
        b=USse7ib1lXZq3iaLtgAUJxisnd4Lx5f1SwUcsHLoeghOXLhhe49CIOPDvLOWrQ7/qx
         khZyxX+U+U9oo3b2aBzO8/RRPe0XtFWtYNYVAF0spZI3ksTYL+NOOjAG0L8HgREVvYlN
         GxjGDX3XjwPQ+7ex5ClCduzdUJC0/68QwO7u11szEinMI4nCwSVC7Hvx6ZTeKXH+Qe6I
         ofYOyHuD0N48KMHH4g8O0JM9hX1q/yAoc7en2iiDIegcUQEaQK1Q9kqEpwrBsBLPd8l5
         9NcPE1BgU65q5nGSlekyuamTC/cpSbh84TK+VU8LDuN+lb/spYvdc+FooOvFVERmSxf1
         UHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777019; x=1791381819;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d40b8ylKLCGQqIn3kdm+4kWG3FKdVGCOY6++eHynue8=;
        b=nz38E32f6v1Bkx3Z/L10DajpOjAwUpKBBxMAMlD7Q0DO02KpyoD22ty7OrDCDOmrm0
         Pyw5vqfvJIpG86WRs1S47qajeDFVgQMVEiCDNE2H/3JdSoNIvBaOR3i9MvDeEgvV4GIA
         A7SH5IkaK0izBG+moCO1NSMzHgXjsq+2OoigQs+wBal6pUTSl+fs2W+FR6GO7tDW3M9q
         TtKFmdZlgf5Pi7Gf4cHvFsrwfqV4Sr8scEPM+VYBYSNROQ6cLubeUXZW0oi6FzT+DKr/
         VJh9OobL749h/Lt6zd3OB5Aq54nzqOXrAFGGxwu1qQdvpKbKkzsZN/RB0XOorXAJod7l
         7EPQ==
X-Gm-Message-State: AFq9FYLwo7rsIWvxlyNcK7obmPbcpXN31O+536C03VAHvyOynMFKIRNj
	KWWZwkafIRBIKG7AC2BuC0956yIr9kGkiWFZ7T9XEqpROAdim94g09yNWfKkYk2x5v1X9v2tH2+
	QJGGlpQ==
X-Gm-Gg: AYBFou2dUAJgpKLh1canQtFC3049PKu8M1HiFwUCk8bmNpTmAhvJFFTbjtHksy4iZrj
	oplYhxt1UvtQyqpK8zKYlQDUi4YWozBsxzYjuy9MyZzTJVLNqrm8fn/vrVzjYZ2+G8bwZS1//jL
	CdCWj1vXltIez6Lc4zp/ftKGW/ft96+6uQuER/uGwgBiUrMtx5tencJulFsDVFkDNOW8HU9IR+o
	k78wNJ7GVMkoz25Wo52V60C+twx3Zz/FAIke2JAm/07duEHmuipG/780G1CbM+CbfDJjdHkW3X9
	aFcAqWEbBP72HB1kaZIzWPLyFz7S+8Ju3Q4zrfmPizfa1ue3ysHrI0LYmmPBsCa201yPty3lhEv
	TM3sv5Bi1xVf1sFCPsPtt35K5ZV4TZOMykSao3OxEF4eYY0vGNgVvPe+a/orT5vUtsaV0Y/g01y
	DXthibCZhpGxGun+xCkdCs4GoMvss32DCpFTE9PLg7D3NtxqkHX02LecZD2DoLCty/7m6geq4/B
	xnueb03HLSgSQ52NTg3fFy2MJ1Byxt3/fGxhhW2sSVx3Nvn6MIiUWjXIdiVfik=
X-Received: by 2002:a05:6000:3101:b0:48a:f318:ac03 with SMTP id ffacd0b85a97d-48b02505291mr3031716f8f.25.1790777018657;
        Wed, 30 Sep 2026 07:03:38 -0700 (PDT)
Message-ID: <a8582379-161d-4fcf-9778-c255e655515c@suse.com>
Date: Wed, 30 Sep 2026 16:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 3/4] sched/core: avoid use of "current" in
 initializer lists
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
 <0a3a6648-0d39-4be7-a023-df987349a868@suse.com>
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
In-Reply-To: <0a3a6648-0d39-4be7-a023-df987349a868@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790777019-6BEB92A1-B7594390/10/78276251493
X-purgate-type: spam
X-purgate-size: 988

On 10.09.2026 14:07, Jürgen Groß wrote:
> On 08.09.26 14:21, Jan Beulich wrote:
>> TRACE_TIME() uses an initializer list and hence is covered by Misra C:2012
>> rule 13.1 ("Initializer lists shall not contain persistent side effects").
>> Use intermediate variables to address this.
>>
>> In vcpu_yield() take the opportunity to rename the existing variable which
>> better would have been used already before.
>>
>> In do_sched_op() extend the scope of and rename an existing variable. Use
>> both variables throughout the function. Also drop a pointless (and
>> slightly malformed, style-wise) cast there, and adjust to other one to by
>> style conformant.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Turns out I applied this to a stale v1 I had sitting around, and then
committed that. I've now reverted the bad commit, putting in the intended
one on top.

Jan

