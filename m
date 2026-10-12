Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C93DCA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 06:52:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445834.1661678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xG9tE-0006wx-WD; Mon, 12 Oct 2026 06:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445834.1661678; Mon, 12 Oct 2026 06:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xG9tE-0006wp-T7; Mon, 12 Oct 2026 06:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1445834;
 Mon, 12 Oct 2026 06:52:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xG9tD-0006wQ-El
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 06:52:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xG9tC-004PUo-3A
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:52:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc8386-8faa-0a2a0a5109dd-0a2a450c97bc-42
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 08:52:01 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc8391-f479-0a2a450c0019-d155802bacf9-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 08:52:01 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so13076535e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 23:52:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1a1feb78csm46401155e9.0.2026.10.11.23.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 23:52:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1791787921; x=1792392721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2BxOHwtQlUBpqjW1VD0N3o/AdhodhpFyfCbd5R0rMY=;
        b=YWYI6HWGdBhGUZFTrnzPOm1gP81LzvuoVP/vTkngkbAUd73tD4sfZp+5jWrxNXQ8Ut
         O8yxrHJ703mzxEIxRaXhNDTVw3PNogimfgEcIUF+lPAUzC642QwoY7AZ0ukOPOpwoPgt
         ps9X1vgaABDPZgD+oitnQzMta1tkoClzX9dBFPVeV4hEtKdQ9bimI0zWiMgu1CILQiv+
         mmlojorMdJx+4Ar/hgNWlaI9Eqw9RR/ozvTrwwqTVJcItrYFurtOTl8BEKolMTMbnARR
         wNIUwYdLsq4mA7hhpy/EXucWQzR3xlVI44dcGJngCObx2fPh5xTi5t+Iy+qrYw/czyXK
         0O7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787921; x=1792392721;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2BxOHwtQlUBpqjW1VD0N3o/AdhodhpFyfCbd5R0rMY=;
        b=MvtS2xtpcnrMIglha2bSKggjd3G/+cJEzvUrmVp+etw5T6aYWSC42fhJAlkIkC3CJr
         cb9X7+PCviF6I491NORucP+BRuu7cuB8/NqGTecEQKxP+sLzxO/dV/29BVGUFLi1xb7p
         7ySqxevj9z9caFUOwhy0R+wpqJH23StKWIjFZmzSNuVxYrzisJPjDWIrhaJV59LOhCeq
         d4zFFo6JL9IqIC3ycINHdjwDfwnVV3EvOaqEVi01dYfp+8jR2g9zV5wIbvC5fzl14xFD
         HkyYSzNr1Gxy5xTYjMJAeLOG23ImmHrkizcfkh3c34QmdOJcAsmKTzebEHSDnqTN5v8K
         R0OQ==
X-Gm-Message-State: AFq9FYJunOkxo4eYa4cNmiim2hWRxkIh6GbU/q0K7AYfzTURONXWb8KS
	XSl0it07Xei75pPcBTiBWDYcYUP7zCEVuCyPpuejToZ9ls9uo2Ll+/Gf4ty+tk6rMQ==
X-Gm-Gg: AYBFou39rl0qABQXHZUD8XSMqEsrH+vWkrQVjVCbdm8AWeiau64NiQ203kIrZ6qRT1z
	idGNcvKl7rma6yy8eXzSofFceGiRNr8X5FLYMVHRht/4qyWQ/wBuZSFGp1y3rdaFOtnBQIKb/yf
	tHilOrhIym4wXBaGGNPOLb9Tn1KfCZ20pC78NKxA/evNPk25/xasZO9Uy+4zFCpaM226RWmQIkw
	iCk07/NdmhOJMll0gB6m8BMQhvERtNtL/awg6Niw60QZhvzkLUSF1JRh18urCOp/OxuZS3tUlLq
	xLi0XXptyT8CCmf5LRDshemRUNQIZcAG1Qn/N/hs5qT1Tkd7BHKci10TIExM1HQEOErYxJHR/kh
	1r1PV9tSsf3eWHa1CuU7yFFkXrUkBWKSvZ+YCMg0RwlDs2Ce7nDWuqj9/fpZtPybg2XbygRYtoB
	RT07aCpCVKRYOpjSuFNMf229bOK51ZaehrB/tdYbp+kTt5YPzEQ7i9jxzC9QkEygPq0iK7l7grR
	Oc8KYgHCpLdV7jsMCaFU92+TP7msLfZC+S0M7w15bdgKx+SANQxtenx72WXfw==
X-Received: by 2002:a05:600c:3554:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a18e43a1cemr158201245e9.1.1791787921061;
        Sun, 11 Oct 2026 23:52:01 -0700 (PDT)
Message-ID: <96319798-7cf6-4905-9b1b-37bb6a41bdcd@suse.com>
Date: Mon, 12 Oct 2026 08:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
 <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
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
In-Reply-To: <5b5cccc8bbbc4c87fc99427eb4c1c413@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791787921-00ACCA5B-33AA6C74/10/78276251493
X-purgate-type: spam
X-purgate-size: 2552

On 09.10.2026 17:37, Nicola Vetrini wrote:
> On 2026-10-05 20:56, Dmytro Prokopchuk1 wrote:
>> The R11.1 safe cast only matched void noreturn (*)(void *). Accept any
>> noreturn function pointer converted to a compatible function pointer.
>> canonical() covers typeof destinations, and compatible_deep_unqualified
>> keeps the parameter and return types aligned.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>>
>> This patch tries to cover both of these:
>>
>> 1. eclair: widen R11.1 noreturn cast deviation
>> https://patchew.org/Xen/c6632dd805a119aca54b9d1ae2eea68ef9c1334c.1790674358.git.dmytro._5Fprokopchuk1@epam.com/
>>
>> 2. Eclair: relax "noreturn" function-pointer conversion deviation
>> https://patchew.org/Xen/6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com/4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com/
>>
>> Test CI pipeline:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2914802667
>>
>> The only one Rule11.1 violation remains, which is covered by this Jan's 
>> patch:
>> x86/kexec: address Misra rule 11.1 violation in machine_kexec_load()
>>
> 
> The change itself is fine, but the aspect I'm concerned with is the 
> following: if you have a function marked noreturn, the compiler is 
> entitled to
> essentially remove any code following it, so in principle this could be 
> the case also when invoking a function pointer (i.e. the compiler has no 
> obligation to retain code after a call to a function pointer that is 
> actually a noreturn function). While this in practice may not happen 
> often (e.g., the analysis done by a compiler is probably too shallow to 
> actually infer paths where the function pointer is only ever assigned to 
> noreturn functions when it is called), it is still not completely true 
> to say that the behavior is not altered by casting away noreturn.

With "behavior" here you mean that of the compiler? Because Xen's behavior
won't change if the code following such an indirect call isn't eliminated.
It will "just" be unreachable code then.

That said, ...

> I have 
> given in [1] my R-by to the previous form of this deviation, but I 
> realize that this aspect should be mentioned. This is of course 
> supported by testing and code coverage evidence that the behavior is 
> indeed the same, or a suitable guarantee from the compiler vendor that 
> the behavior never diverges.

... making this explicit in the patch and/or deviation description is of
course not going to hurt.

Jan

