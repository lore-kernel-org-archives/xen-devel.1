Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71700606A322
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dE6Op46a
Received: from list by lists.xenproject.org with outflank-mailman.1461976.1672994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdTP-0002Cl-RR; Tue, 27 Oct 2026 09:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461976.1672994; Tue, 27 Oct 2026 09:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLdTP-0002Ce-Ok; Tue, 27 Oct 2026 09:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1461976;
 Tue, 27 Oct 2026 09:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLdTO-0002CX-DF
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLdTN-008QhG-ED
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 10:28:01 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae06e9c-8faa-0a2a0a5109dd-0a2a450ba98a-24
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:28:01 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae06ea1-b7e8-0a2a450b0019-d155802df139-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:28:01 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso39696955e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 02:28:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a359f3e00asm439533775e9.0.2026.10.27.02.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 02:28:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1793093281; x=1793698081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGF4ZXOcbT75XAXsS7LhoOIPs2suawsrKKPub0ubSNY=;
        b=dE6Op46a30Mt4doHD+6sGHgdnCRipBdGrgS/s/K8ol1xWxV3GfudDwCdfYPY0nFltc
         no/5PO3vprj4ZBl6UQTnUNAj6FLsBTXIvP7+QAU/NVZyQSgs8zZoTCPf77F3vVsodyC2
         o50bFROeF2MMFQ7lvl/+lvL69qpx8AjzVfJOCwEK1ZNbq1qfTR91nZbveCJ+Cx0A8LwQ
         zXLVRrELJwpqIxLsdcxAesSvajvVSg1IlO2iuSW3leHAhwcWrkuix62mwvy5Ow31al1T
         ttLOVNL9NLGlrFU3brZh9ucSZqvWanNclCjVP/L2HyEdYvkWMPRILxB2xsV/c8LQJ/M4
         m32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093281; x=1793698081;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGF4ZXOcbT75XAXsS7LhoOIPs2suawsrKKPub0ubSNY=;
        b=D3MjvxadNxZmyk5a0BbuBdH/7rZMCLC4qASs3aDwp0yBpZid/Ol6ybcZCC4sAgqDtv
         7DDvN5xLC+tF10wS1R6No+qhbqgJQL43NcLJNUheVV8TmGZbfLOXcc15PAcyoKblUNdm
         eh7jgz+alqCgEnxLEI1FEnk/OK5rZ+O0b1vp7uLBcn7KbVSm9sGejGEPgs/gGgYFzMmI
         Myl9q6tb5VM8/WkrFyl7wiO84qSGGJSOKh1BF4IiHsX8Q1wyPu37ERa0K1TGBScuQRRu
         WCD1SivP6Lje2TCDGxJ6PPHj/0/up2PAMr+3Kx2R/I/w7rGrhPIgB1p7mjKODyalPL4L
         6C+w==
X-Forwarded-Encrypted: i=1; AKwUvBwiZHstV8/cd0NT8tA2GKHxvy3tDwSl5Q8bFXnp4N+c10x/c0iLk5a7weYt9ebI4UZClMAzS1DFmgM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIXeaIxgI6mfmLYN8ziNjdvXc2TBrX97no/x/rwYvMV2A6TjV9g
	hc+OcDIBEmUbFEV+mj+BZ4+/oUmWDsFt+YBkmaK+0Y4vIGuWKDTSbjT3MXsSBDutIg==
X-Gm-Gg: AYBFou0fLkxCjefzquKzPOgjsiae3G2+XYbt5zWwWXGRtqWe0pLlMns/mOBU+dEKHNC
	t3C7sfZawTpiOwDoJZPruLPFoB6ayUcJkBtlQlvCjqLTfkOW42eEBrCwtBthLiv18XVCbQ9+Vj4
	8t6H4ryhy92ICTATcJkMUXYnABIxjAMvi4/VuDlnznblhAV7d43yXGJu9Zvnd2ck0jpTaNSsKME
	q96wocWcR+ndjFEu0rrzjPRQDCQSqEbxjwZtFd65fLTaFmou438/F90oUeOx/zqUZ2bf3XmrvDu
	cD2GiFvPvbc2UY8jWSoscewdLWUvNR83epYlMj1O1UUZBaHK/zQBff+rLALltZ+Q8ICj8QC6g9T
	jFqFbI2sx7k3GWOnjAo2V1fL1Ihvd+lzw+lNgfSsYgPIIlyHfeWiTW9zB4Aw/mJC/WBbCqUFWem
	yKPLKmH1CBIvbgAizlkxh1ZS4u/o16JUu18OAGTRIPTGAw/ESBhCcdN0mIXVQJZ6c5WJE4MsmsA
	jQJfoMghlrMLn+nfsMwqND3pQKOcPpgFFQsJsDXjfXLaxpbV9oeN3ivn2iQgOek2bT6LVp3qQkr
	qISYvmlzxWhjpK2Bemk3UOWK2dtLGIT/ODW416pocys=
X-Received: by 2002:a05:600c:4e43:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4a7776698f9mr61479765e9.31.1793093280736;
        Tue, 27 Oct 2026 02:28:00 -0700 (PDT)
Message-ID: <2e3545bc-7ab0-43d7-9a8f-7c8c30180df6@suse.com>
Date: Tue, 27 Oct 2026 10:27:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
To: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
 <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
 <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
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
In-Reply-To: <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793093281-AA0C59EA-D9E6DCA9/10/78276251493
X-purgate-type: spam
X-purgate-size: 4585
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 09:18, Chen, Shuaidong wrote:
> On 10/26/2026 9:14 PM, Jan Beulich wrote:
>> On 26.10.2026 04:03, Shuaidong Chen wrote:
>>> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
>>> deviated by two separate entries.  One covers 'if' statements and
>>> conditional operators and places no restriction on where the invariant
>>> condition comes from.  The other covers 'switch' statements, but only
>>> when the controlling expression is a 'sizeof' operator.
>>>
>>> The rationale recorded for the two is the same: the condition is
>>> deliberate.  Nothing about a 'switch' makes an invariant condition less
>>> deliberate than the same condition in an 'if', so the 'sizeof'
>>> restriction reads as an artefact of that entry having been added for
>>> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
>>> as a considered limit.
>> Well,
>>
>>      if ( 1 )
>>
>> can make sense, especially when 1 is the expansion of e.g. IS_ENABLED().
>> Otoh
>>
>>      switch ( 1 )
>>
>> doesn't make a lot of sense, even when it's as a result of the expanding
>> IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
>> strict; alignof(), for example, should about always be usable where
>> sizeof() is. Yet making if() and switch() equal is imo going too far. I
>> realize though that it may be difficult to find a suitable boundary.
>> Stefano - do you possibly still have notes from the discussions long ago?
>>
>>> Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
>>> one, which the general predicate now subsumes.  Invariant 'switch'
>>> conditions that are not a 'sizeof' become deliberate as a result; that
>>> is the intent.
>>>
>>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>> What you don't say at all: Does this help with any remaining violations?
>>
>> Jan
> Yes, and let me give the full context, since the motivation comes from
> downstream safety work rather than from the upstream analysis.
> 
> On safety branch one of the techniques we rely on there is to pin build-time
> configuration to compile-time constants, so that the code which the
> intended configuration can never reach is removed by the compiler
> rather than merely left untested.  That matters for us in two ways:
> code eliminated at compile time does not enter the coverage
> denominator, and - more importantly - it is not in the binary at all,
> so it does not have to be carried through the whole qualification
> chain.
> 
> Two examples:
> 
> https://gitlab.com/amd-xen-safety/xen/-/commit/160dac43f554733a68d83c38cc1d0e73b3b7bff0
> https://gitlab.com/amd-xen-safety/xen/-/commit/e0eccfa7184b7acee23916cd5cb2a3b5afa101f2

Just to mention - both pages give 404, presumably to anyone outside
of AMD.

> A side effect of this is that some of those constants end up as the
> controlling expression of an switch statement, which then
> trips R14.3.
> 
>  > Otoh switch ( 1 ) doesn't make a lot of sense
> 
> Agreed in the abstract, and I would push back on anyone writing that
> by hand.  But that is not what happens here.  The sources still read
> 
>    switch ( gt->gt_version )
>    switch ( opt_bootscrub )
> 
> exactly as upstream wrote them, against what upstream intends as a
> runtime-variable value.  The constant only appears after a build
> configuration specialises that value.  So the construct is not a
> pointless switch on a literal; it is ordinary upstream code that a
> particular configuration has made invariant - which is precisely the
> situation the existing 'deliberate' deviation for if statements and
> 
> conditional operators already covers.
> 
> Of course the other alternative: rewrite those switches as
> if/else chains, which the existing deviation would already cover it, and 
> the violations gone. Technically that works.
> 
> The reason I would rather not is that it is churn in common code for no 
> functional
> reason, carried indefinitely as a delta against upstream, and it makes
> every subsequent rebase of the safety branch more expensive.

Plus replacing switch() by if/else chains impacts code readability.

> Having seen that a deviation for switch already exists - restricted to
> sizeof - extending it to switch in general seemed the smaller and more
> honest change: it states that an invariant switch condition is
> deliberate, just as the project already states for if and for the
> conditional operators.

We may need to find a middle ground here.

Jan

