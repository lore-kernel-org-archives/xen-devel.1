Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BA4C561E6
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 06:04:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382821.1626099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrUjp-0002WL-M6; Wed, 05 Aug 2026 06:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382821.1626099; Wed, 05 Aug 2026 06:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrUjp-0002WE-JI; Wed, 05 Aug 2026 06:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1382821;
 Wed, 05 Aug 2026 06:04:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrUjo-0002W7-Ji
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:04:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrUjo-00HIcz-0L
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:04:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72d267-5cb7-0a2a0a5109dd-0a2a4502d022-0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:04:23 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72d267-6ca4-0a2a45020019-d155dd2dcd3c-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:04:23 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47c2b362ee2so393889f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:04:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e2e4sm5507675f8f.25.2026.08.04.23.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 23:04:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1785909863; x=1786514663; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XBygFyzYJYS5+ICqbXp5tbWEYq5wUoX0qFqph9ian3g=;
        b=IpoICVJ22gglvXwLNqCWPAj/+Ho8PSRUvhaDk7uSNUytl7gFR+g5p172ZHtfz7msrG
         dokWiU8B5bcCz81lgwQFYn1elKRdQOgXkqu/t+71ebuxLDpCMMJmPcE2y3wj/DfbFI2r
         soh5RtuifBrgD1tQ4aGvQFWNiohaTNPgZe3dXnVsU8wWvJHgSYzIZLM7WphjszcmZXGe
         AxM9enOSLl3SbLkL/wLlcx/4WFFxSTWmbxlt6+qs0lDqmlTAFUrzH6RQh7UX6F+0sb+2
         V43w7dx8Jbqapgi3CYEFndtR2Sb3vKQHypfn6pW41nTK4cl2bKeUasVUQukiE++nzVog
         VMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909863; x=1786514663;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XBygFyzYJYS5+ICqbXp5tbWEYq5wUoX0qFqph9ian3g=;
        b=pV8EyPg7NfA9BIAtiim/uVVqZsx5FpankDChlcDXAO+4JgJ95j8vyvLoXQT0sYGhmn
         oPhu7yADvQx/FBhtws63fGMVk8HhROU86gBPA5nmgQQpLf2FOURF+AhRVRs5qnK7w4V2
         2luaayIbCccsBpEX2ThF1k3mIzpLLhjyiLmZeclNAwzShuKAqo6l9z3h5zkjKQg+aNx/
         hZKHN+vJu6b0Qlqg3gtxNVZiJVfva8jfLgrS8AHSsJ+zEjWs+7rrEV8ytuSX85Xq+kcd
         iDUs7qWLDP7dOL7POTYH7e8pwY3Sd8L9dQXvzJa1jIyLydw7Devu8ThRbXirmoPbhLgd
         bPNw==
X-Forwarded-Encrypted: i=1; AHgh+RpptCaLq9A3p7do19SNzy4yIAqkpT3K24r60km1fXqu6JvH98pbtgbnEoGuMUsIBePFac5nj2MW4Qs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBa49D6V47pAphyVzAAtijEBTfOhOoxVXlW08zNH8o77TGXJG7
	dsRm7gBNjzjSrnjATmc82E9y8Fqmaavv4lNLlbu5g+FEUd4FGxe9r/uqtTLnFujWjoF6pF5bB+G
	ex8vbiQ==
X-Gm-Gg: AR+sD10oIyX+jVK0rdX+5yRZiDN+YpuV0RE/1o8SJVc60V0U60XvqceedyD0ScJbVui
	y5vcwm/eoW7hwdut0HvsWCjfRQbr8TmtjOU2X/HleRgdvQ9MggDxsURdkMXp4lDzLLR7XbFZ3EW
	TylAzDW/aWW6TPiDDQY6lvV01WEstqPsSOjoCkhf/Xb0dIOCVDgNoZbM/9XmYOAEqKqrnxCKtTz
	64Va/M+SA21o0k2vZO6XUlxa56x9Zh8dr8I3o/ffirvph31RDBwCE40rvSJfiTVXbGW9Dp3/dT4
	eaCqSq8M8Ggoq8cVI+lxDaexWPuo3Owll1JgtxADoUeMg30VEXPZqZQeEJ78k6alsIloc0+giNd
	3ciDg65lOEnbHRfQLG0QeFN3enS+NcbmSk7QMfUE8n9c1oJQpKFtvM3CL7q4VcU6gRcLFIGauF9
	HgyT2mfRY6+aB/ilWGtyEUbXRZp1K3ivwd6t/ixuc5YIUl6e7Os9HnN9JOKuAxiIvHd4tiG/HeW
	IXtOZVPGzejNX/zwm+tySdYbhove+U/e0LPEBlJj0yiLUm9paU2
X-Received: by 2002:a05:6000:491d:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-47fec8a2195mr6168363f8f.15.1785909863308;
        Tue, 04 Aug 2026 23:04:23 -0700 (PDT)
Message-ID: <cd877869-3d53-41e4-88b3-df629e4dcbbd@suse.com>
Date: Wed, 5 Aug 2026 08:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-3-andrew.cooper3@citrix.com>
 <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
 <f15222a9-1d61-4d9c-b923-8e6ad4994af3@citrix.com>
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
In-Reply-To: <f15222a9-1d61-4d9c-b923-8e6ad4994af3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785909863-674BE2AC-A40A59FF/0/0
X-purgate-type: clean
X-purgate-size: 1898

On 04.08.2026 19:13, Andrew Cooper wrote:
> On 02/06/2025 10:57 am, Jan Beulich wrote:
>> On 22.05.2025 17:00, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -20,7 +20,7 @@
>>>  #define MAX_PATCH_LEN (255-1)
>>>  
>>>  #ifdef K8_NOP1
>>> -static const unsigned char k8nops[] init_or_livepatch_const = {
>>> +static const unsigned char k8_nops[] init_or_livepatch_const = {
>>>      K8_NOP1,
>>>      K8_NOP2,
>>>      K8_NOP3,
>>> @@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
>>>      K8_NOP8,
>>>      K8_NOP9,
>>>  };
>>> -static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
>> ... the (at least visual) connection to ASM_NOP_MAX. Could I talk you into
>> adding build time array-size checks for both arrays, to restore the
>> connection?
> 
> Sorry, but I have no idea what you're asking for here.

    BUILD_BUG_ON(ARRAY_SIZE(k8_nops) != ASM_NOP_MAX);
    BUILD_BUG_ON(ARRAY_SIZE(p6_nops) != ASM_NOP_MAX);

> The use of ASM_NOP_MAX was latently buggy before; it was easy to create
> a NULL deference if the initialiser wasn't filled in when ASM_NOP_MAX
> changed.

Partly, yes. But why make it worse when it can be made at least somewhat
better? Omitted inner entries are reasonably easy to spot. Omitted trailing
entries aren't, hence why even in the original code omitting the array
dimension in the definitions and instead having such BUILD_BUG_ON()s would
have been more robust.

Also note how I said "(at least visual)" - by adding the BUILD_BUG_ON()s,
grep-ing for ASM_NOP_MAX will hit here, providing links to the controlled
arrays. Personally I consider it entirely plausible to possibly bump
ASM_NOP_MAX, as technically we could go up to 15. (Whether going that far
is efficient is a separate question.)

Jan

