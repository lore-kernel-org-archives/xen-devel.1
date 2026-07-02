Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71360C43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 14:28:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351974.1608951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIOi-0006Sf-5g; Thu, 02 Jul 2026 14:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351974.1608951; Thu, 02 Jul 2026 14:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfIOi-0006SY-2o; Thu, 02 Jul 2026 14:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1351974;
 Thu, 02 Jul 2026 14:28:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfIOh-0006SS-Ot
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfIOh-00EITS-5g
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 16:28:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a467564-e002-0a2a0a5209dd-0a2a4502b26e-40
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:28:11 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46757a-5a27-0a2a45020019-d155802fc8e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 16:28:10 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so15642205e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 07:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c6354771sm57322205e9.3.2026.07.02.07.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 07:28:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783002490; x=1783607290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GUmoHYSJrMKjXZep5Z7Hi/mcnqXBGMF8TUyKctMSQmA=;
        b=XKMvuQwun3l80g9i9Q26HP8tXTQK6R8CigJF7v3Ps8eAdx2oCy3Xmrm4C1F1Sbc0Se
         mG4m1l2yQK6RwWSAe/LPqkreIxa5i6Q7/38pau7oEJjjKuQyDaSa8rybui9V/wQqyxzB
         FOCYwjUWbyqtvEEizazmLUcFX4PZnbinCqpFnUdnmIREFuRM4IvyokMA+ySw96/zQ/b7
         NQ9ixNzbUFDflAy8Y32wTdvDprpAc6f8jiC7IFWEhTiiwOixwx0n/AYv2KYde0x+gc/z
         GaZIW8tdY4YG4+FrrACzMazzkcfhdfWrlCg+hNwuEmKNEbesnPz5E2kaXrq40R06FEX3
         jGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002490; x=1783607290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUmoHYSJrMKjXZep5Z7Hi/mcnqXBGMF8TUyKctMSQmA=;
        b=FlwjC9sAOtTlCls5vryoM+xz5AIYig+2yX4jZjNNG6YhQtM697Wpc3R6Yeo9GDmiWD
         7i/wLoO/3yjGzYEbW0emIDizzKTV5BQW2guF4t+ssWeWsFwEgE7s8OO32bD76ni6dwDK
         O6ZiJRxPZUwr4wGQC3O+j8hUwfjQUZsfp0bq6szxwEl1dl1Y/ASxX6NVNHvXfG9bwxai
         /PF8h4pLpAeiRekvOAc26t1mbhTI98sd8tLXWKKmDWJoHw1+A6wfrySm6T7F5ZA+vmNw
         VvUT6CO1O94aWZgdX2BTIMSGWB8HMjCOA19cwe3fHjZ7lymkEtJfa3lNHvCsYMly1lGx
         bu8g==
X-Forwarded-Encrypted: i=1; AFNElJ+8GFEeEDKueLZvGeEAre9Qj2BMouKKpnsHUjh4raAVEdI/7tyzGM36egBCinW0ttgwLfTBpGNXaQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO7H1vKsRmdlY9hNFssCaAq4nLNXiXo7JpPN7Zi+4Y2i8ehM7n
	diDnnjmMVOihffDsCDZ2jaWSpditVBNQcYKphak/DHcE0/n7MKvREU5tTuFm1Kb/YQ==
X-Gm-Gg: AfdE7ckRkyhFUVxaVdHHhMu66hOMo82wgm/OCFvqJln0eRXlFnrByj+oUPluhrZjhBQ
	hPmUZlurmM4HQ2F1MTwqOktyIexW8HyMCjO1F+WbhniEi3mZqwhE6pGVg9jCnZL58gBoLBKbSCX
	1cG8AZlGju2qEz8lNHu8hvZssykBvkyW48hizCTpEJvqPe+sEhTedM5xmNBvHv3pfwe+2gnPYFA
	+UsIjQngUBNjhk85LiQd6WpiYCSi0uFu4ZJaPVTALdL8kvByDJfHZ5zv0t2r6/OfR0NDEUihlmh
	YPGSet8wURR7Drs6EuWkZxR2yf6lNJ0CBnKXWc2pgHO6e78/ua5IfXD5lq926+cSR77PCZvb+nY
	fBGDbG1MRujo6aUZYSdtlak3KTQmeZGBKq4iKTo2evcWyPsrsi3zbay92yDxuP27ldLQ2ULI7+X
	PkDv3MVOdZuEJ9Y6k7kSiAP38D00a5Qc+SVJzLFZ+AyKEm5F+j/Sgg9/R9i76sPkApMNdqHdFEd
	Je813idZ8Fj4GA=
X-Received: by 2002:a05:600c:c108:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-493c2ac7384mr75886215e9.0.1783002490425;
        Thu, 02 Jul 2026 07:28:10 -0700 (PDT)
Message-ID: <6f192c41-7b70-401f-93f1-5bf546b858a2@suse.com>
Date: Thu, 2 Jul 2026 16:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/traps: use entry_ssp in
 fixup_exception_return()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ba5ecff-af64-49c0-abf9-23963ca56aa6@suse.com>
 <8af61c08-71f9-4d18-ba9c-952b7894c44d@suse.com>
 <7fb4624a-02dd-472d-b981-cb7e0c1fce54@citrix.com>
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
In-Reply-To: <7fb4624a-02dd-472d-b981-cb7e0c1fce54@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783002491-4F1127C5-33D5779D/0/0
X-purgate-type: clean
X-purgate-size: 1011

On 02.07.2026 16:22, Andrew Cooper wrote:
> On 02/07/2026 11:55 am, Jan Beulich wrote:
>> With the value recorded on entry there's no need anymore to go hunt for
>> the respective exception frame on the shadow stack. By deriving "ptr"
>> from that field (without any offset), it then ends up pointing one slot
>> lower than before. Therefore all array indexes need incrementing, nicely
>> doing away with all the negative ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The diff isn't easy going, but the end result nicer.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Indentation of the prior inner (but not innermost) if()'s body is
>> deliberately left untouched, to aid review. It'll be adjusted in a
>> separate follow-on patch.
> 
> There are two indentations needing removing.  Deferring to another patch
> is fine, but it would be nice to be in this series.

Can do for v4. I just didn't want to do this more than once.

Jan

