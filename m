Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011FE606A32F
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 11:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C2Dbt3Nc
Received: from list by lists.xenproject.org with outflank-mailman.1490771.1691728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSv6M-0006xg-1X; Mon, 16 Nov 2026 11:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490771.1691728; Mon, 16 Nov 2026 11:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSv6L-0006xY-TM; Mon, 16 Nov 2026 11:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1490771;
 Mon, 16 Nov 2026 11:42:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSv6L-0006wC-67
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 11:42:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSv6K-000UTX-EA
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:42:20 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaec1b-bab6-0a2a0a5309dd-0a2a450c991c-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:42:20 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afaec1b-f479-0a2a450c0019-d155dd33ada3-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 12:42:20 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1808948f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 03:42:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6d079a2asm19624361f8f.16.2026.11.16.03.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 03:42:19 -0800 (PST)
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
        d=suse.com; s=google; t=1794829339; x=1795434139; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8p5fnBCzrnKjCLJkgJvJBCAGbsWGY3GA/e/fmJQSUo=;
        b=C2Dbt3NcftO5B0QssFapJEDtfApNs6hjjiZDruupsm+sZMO0aMEmXlDoRqKEByiFdA
         sscS88iPi1vc/+m50M1o7CN6DI34bCwMGidtBzAKg7YnarqhHZ6OZhpm/oZR9JWZne8R
         5qzoOX9AGZztcQfYJpu3BVRdCIife7RiQm2ENQBRRTyS5C2tG2GOANnAEplY6LWQMZjy
         v+ongQNLCRYGIvqNqSAWJWcE2QQDwh5MDPUtFmSbXBlLA3RFWaKKlbTlEOHh/cV28UNg
         WBHydfaaWM/noQ7hYbtNOsm2wt86c7VQWaTKHewWgAYUfIwrHz2i09EfBlXVytO6IFay
         3ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829339; x=1795434139;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8p5fnBCzrnKjCLJkgJvJBCAGbsWGY3GA/e/fmJQSUo=;
        b=Rn07Pb8xReyb9fMUHkOtwPfRXU3pvDjuAyfbPdUb3jU1lh+StrtwqOq0e64P5SLHsW
         DwQMlJpnZ8TrgyAjWIISapPGJH9Hetn5vkFzTZGV54fRZkjRqCmHpGa7YzRkJ8eeG8WX
         +2EMTxl95J9po0Cb5gQ5KGCVQPU8IkIrCuWfNEdzZTX0knyAE+lu8Ku3LaxftZhohEL9
         ZuNRzRSIPjznurQiH9bF9OwhH/5/WdAyls1NWlvASBD7jdTjFfl8nHg+RFxuPK09gDxC
         W6g8z8YRnpSlpWL2hzJ4QToKjRsRKNFz0wEyQWjmKjpLuFT+Z1AGdKmD+1mpC3u10TnE
         iARw==
X-Forwarded-Encrypted: i=1; AL+hErEHZeYjGt60CyTRb65P0hBIVBt95RJ9bShG2BM9fwyBCwHMyKQvMNHXpZxY7p4BAzA8g0BCMBV5ZmY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9qInVlJ0uy6Fmys8zD5i3hZmP/Nzrp1Ip9vsETZKDFMSlzNyYp
	tc/Im7X8C5SM3/EAPxHaaEO/YG+oRbwKi/ssstnB7aIjazODrECy59Mui6kjTEbABlNc52WAw66
	7XiQwoQ==
X-Gm-Gg: AZFdTZcBX4cKRK8keLrQyXcXy0s69NckLJZYi5jML0XEYURF2FxfOEC7dFy7KbTtErG
	JWN5845mZFrSrPniCyCyrYirIc6zz/XTLrW2P6a70OQ5Kqmscyjn3c86BcuL7wvIJI+2oC2aQEn
	Dbh9NtvFYiF5Sug+gjJqg+6q5TxIEfDFu8JGmFOyTrVoUnR0iCp1B9g7WciobnpYGwrcuHtLTUi
	jpetBdLxKBH8IsjSA3Ori185M0YHhOJHshcF7dawYfUFkxbq8iWgAtI1KKFse00mwmLwsN8Z/Na
	u9uU6nOTojFPFo1afbLChrHkr471wXrMud/UUqHkoRWyGAGTfYpQJZz3aZlpJuvghs6Fnqtc/G2
	3oj0pLJXA2f1h+Tvcpnpokdr0MWDkG9BqDylSgbZIqrWEaI+m96PJyCJLf9uWcVIv8/0xGiTifp
	U//cCV0r6rQNjnrB/WKeglfiiv4e0dDZICVs2tVTM8EXKk7yJ3aibPYaO0OtUpCmetZtShf5kcI
	cnvUZd8bP33Gk81h3gNqMS8HmSAT1qwVcn/CsS7LIiTS+Zv0Qo4iQa5qAjdIFBRt8r955OO6Z8O
	UzaPJrQJRNoWEiDgcKTdAWyoazLQPVO9F61ZJopzNdxQj4O9qrWLol8/3cL8mW/+WHAGdrApfEs
	9X7peCtMiaCZaKfe//A==
X-Received: by 2002:a5d:64cf:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-49c6fc9e96amr21345035f8f.3.1794829339533;
        Mon, 16 Nov 2026 03:42:19 -0800 (PST)
Message-ID: <4aed0b50-f224-48f2-97c4-d56ae1ac3012@suse.com>
Date: Mon, 16 Nov 2026 12:42:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Don't set CR2 while injecting
 VMEXIT_EXCEPTION_PF
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261113172444.720081-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20261113172444.720081-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794829340-5093EA5B-210D76D6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1203
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13.11.2026 18:24, Ross Lagerwall wrote:
> According to the APM, the #PF intercept is tested before CR2 is written
> so don't write CR2 while injecting VMEXIT_EXCEPTION_PF into L1.
> The faulting address is available to L1 in EXITINFO2.
> 
> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -741,8 +741,6 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
>                  ns_vmcb->exit_int_info = ns_vmcb->event_inj;
>              break;
>          case VMEXIT_EXCEPTION_PF:
> -            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;

Further to what you say in the description, isn't this also a stale value,
as ...

> -            fallthrough;
>          case VMEXIT_NPF:
>              ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;

... the correct one is written only here? If you agree, I'd be inclined to
have the description say "... so don't write CR2 (with a stale value) while
..." (happy to adjust while committing).

Jan

