Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7759C606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GcMcNNPz
Received: from list by lists.xenproject.org with outflank-mailman.1486767.1689240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlan-0005kq-BM; Fri, 13 Nov 2026 07:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486767.1689240; Fri, 13 Nov 2026 07:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlan-0005ki-5y; Fri, 13 Nov 2026 07:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1486767;
 Fri, 13 Nov 2026 07:21:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRlam-0005ka-1x
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRlal-009AKx-F0
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:20:59 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6ba5a-e002-0a2a0a5209dd-0a2a45088226-2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:20:59 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6ba5b-f659-0a2a45080019-d155dd35c1ec-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:20:59 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so244545f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 23:20:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c8d286480sm5088863f8f.7.2026.11.12.23.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 23:20:58 -0800 (PST)
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
        d=suse.com; s=google; t=1794554459; x=1795159259; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQsuQB+ZainzdvvJr0H+PyKtl15oKED3QkTHTDM1Z5U=;
        b=GcMcNNPzsimHVaiKgOgWQ4EJlm1ha45k0xxBvFp4h4QpuZ5VuiX0YFLvYE2moU4w0v
         kbi6nY7T1jGHylcAGc6FSVVL21anx0CbkN/3x0CiDJvt/9fU2QFBhjx32p83LwDAiEuW
         6DAv4NsJL9uYIRJsvqi51dMaO/Ok89NaARZVkNgQnJ0TZLmQcodlnqmrneberZnLC98m
         yiR3vDptO/SUXEqOiRwDkqv+YjW1pAKTNTJfwBkEklW7lYqB7LD11XgQ2+sI7nKbO5tP
         JalOM5cQEm7Vys21y8TMAlOKY6ERusZ1tGxH3IDS6YgtSb6iZoL58qIQdt4DigS229F2
         0YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554459; x=1795159259;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQsuQB+ZainzdvvJr0H+PyKtl15oKED3QkTHTDM1Z5U=;
        b=QNUSH2BdsVVJdBniiDp7JX2QNhLV2Zs18UXTYufqf13oYuJHCuqFBUcBOLCKnLeDqQ
         9rxn8gWhvWNdO2obEOgpVbjahFU2z8pQigOcn1X/eOoZpPq6z4MARlzJkJbUVqE/HrKq
         A3bn3aKapklxwBOSf+ekxNCCprP5pbgjcADeyxOqetURp3gOAY76AVE8Ciql6qRdyc9F
         ItX3uKt+R5QJVGXimDs2SX9gfyYUfqxcBLZUA4xbh5XfB2+AlDkbvf2SLC3SbpApD0DP
         nDiI4bXm0ySOvRwxp3tcH3sGUWRag9jQSCDOBb2E1ycpjSTqE3UmJIfc6YdfT+PfgSF0
         DvZA==
X-Forwarded-Encrypted: i=1; AL+hErHLZ8di0T0k5on+2/OOM3Lw65UzfLr2clH7I5NDfTg5S1wHCShS8TVteWBFi/U5W+QQr3Nvukks24Q=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/pWh443DNyn2Hiwm+Izcz7JzPXbdvNTesKhOZPOTdtwg+In8nD
	Hh90lO8BFGjlcD+l6nJD7O33AP0fjs9l68zldwR92SY36LfSTb7cLSqgGUZ8jVX1YA==
X-Gm-Gg: AYBFou0BshrAPrS7/O0y/Q5VdMk10hX9oxlfXgCOFew8uu0VWMq3lGxZv3imjvjtHPQ
	+ODR4k/NAQjyNaLihxp5nIKtXvtScSq9rci1IAZM8wO4KaMvRBbaY4NrlU5n4ETPBqpgLTsBhx3
	dJ/r/cAmHUDzhK1e8MsfcsDNtB4XH8FPb/VQIgMTshMM/rofkRVQRCpBoVdz5TQWrHrtDInX5Fc
	Roc4DGRmE0QwRfAa4QpIzNERpuHKVEKxtimxHHJ+Mhx8XfZ+8y34Fe1LmYC1i5gcs/A+5YgUsaM
	wN15ijAZMSFDUGXXgcaKuwc3V2i02ScBOFp694mmogTp2breHFKfoNNmX8N1M9951cJc8nfoPUO
	VxehpU6058xUUDXEolzW0xMQyI7Yq6Z4EvWNWqrA5Lsg9NMbOYAhZM6pLSFHiB/Dvrmsabu7DLQ
	OxUJbd1TSWoCNvbgWPHjWoz2kv7OnpsnN5sHFhqQN/zlXZaaTPMYmZEx/VKnzEoYI29PziXwOXl
	9qK4Dpkc6pG9lq+Ri6i5D5GqlCAl/23PLTBrU5q1Fds5RNmbKFTrTw3zeUeZELh8agrV+vP1nM0
	CVKeSOfZrqYpk+3LIzqZJVg2eBAXWrF1Xj6X/Wk+thzsMnyMb29ASE2f9J77lvceqI41/dJFX2x
	A2Q5WFnC6/SsRNvC3
X-Received: by 2002:a05:6000:2003:b0:490:411a:1eed with SMTP id ffacd0b85a97d-49c72f7a66cmr3648841f8f.39.1794554458828;
        Thu, 12 Nov 2026 23:20:58 -0800 (PST)
Message-ID: <3d62e07d-a5d9-4a10-af82-d0ebedf8a864@suse.com>
Date: Fri, 13 Nov 2026 08:20:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/26] x86: fixup dependencies for asm/x86_emulate.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xakep.amatop@gmail.com, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-4-dmukhin@ford.com>
 <10af125e-21cb-49a7-bc32-304d11b55427@gmail.com>
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
In-Reply-To: <10af125e-21cb-49a7-bc32-304d11b55427@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794554459-CC77387B-9F2268A2/10/78276251493
X-purgate-type: spam
X-purgate-size: 1929
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 21:25, Oleksii Kurochko wrote:
> 
> 
> On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Add xen/bug.h so that asm/x86_emulate.h can be cleanly used if listed as
>> the first include in translation unit.
> 
> It would help to say what is needed from it: x86emul_invpcid_aux() in
> x86_emulate/x86_emulate.h uses ASSERT(), which lives in xen/bug.h, and
> xen/lib.h no longer provides it.
> 
> I haven't checked by do we really need then inclusion of xen/lib.h in 
> x86_emulate.h? Won't it be enough to have only xen/bug.h as my 
> understanding that the only reason for xen/lib.h is (was) ASSERT?
> 
>>
>> Amends: 0a249bcb0279 ("x86: reduce dependencies on x86_emulate/x86_emulate.h")
> 
> I don't think that commit is where this comes from. A translation unit
> containing only #include <asm/x86_emulate.h> fails with "implicit
> declaration of function 'ASSERT'" both at 0a249bcb0279 and at its
> parent. The ASSERT() dependency got lost with 8de3afc0b402 ("xen: move
> BUG_ON(), WARN_ON(), ASSERT(), ASSERT_UNREACHABLE() to xen/bug.h"),
> which dropped xen/bug.h from xen/lib.h. Since the header wasn't
> self-contained before that either, I'd rather drop the tag than point
> it at 0a249bcb0279.

+1

A Fixes: tag would imo be appropriate only if there was active breakage
in the present tree (possibly only in some exotic configuration).

>> --- a/xen/arch/x86/include/asm/x86_emulate.h
>> +++ b/xen/arch/x86/include/asm/x86_emulate.h
>> @@ -13,6 +13,7 @@
>>   #define __ASM_X86_X86_EMULATE_H__
>>   
>>   #include <xen/types.h>
>> +#include <xen/bug.h>
> 
> Nit: alphabetical order (xen/bug.h first).

And then, with xen/lib.h dropped and ...

>>   #include <xen/lib.h>
>>   #include <asm/regs.h>
>>   #include <asm/x86-defns.h>

... a blank line inserted in its place, we'll be fully style-conforming
here.

Jan

