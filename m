Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B5606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VakVK9rG
Received: from list by lists.xenproject.org with outflank-mailman.1464724.1675594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQpQ-00040H-CA; Thu, 29 Oct 2026 14:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464724.1675594; Thu, 29 Oct 2026 14:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQpQ-000402-9B; Thu, 29 Oct 2026 14:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1464724;
 Thu, 29 Oct 2026 14:10:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMQpP-0003nS-99
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMQpO-00EcHm-LN
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:10:02 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae353b5-8faa-0a2a0a5109dd-0a2a4502a0cc-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:10:02 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae353ba-6ca4-0a2a45020019-d155dd36dc5d-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:10:02 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so1786410f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:10:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecde7easm34896289f8f.52.2026.10.29.07.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:10:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1793283002; x=1793887802; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73SYlDAtiP8uRUIaM56Lx7B0+YvsukeKtcFXE61sCsg=;
        b=VakVK9rGO1t5iXb7OioofJZq09Q0ftZrWHY41DcJvGx9lyOoQOAnGx6TQ7bRgPlb3k
         gbQwSTVUOvnLr+KAEHybmXLzHq+CYHlNM7hBtjgRiwhFayEYpyalY6lrURyJsU88k1NL
         h/KciUbYN14LKjriRmLEzzxuBzB8Nh43liDERf94qJzeZpfPygL77syCpbJQUWJCnTPC
         kUrsMWMbXrSvrk5wOAZs3KuWXGenPHpI5jKmMkDyhOjSVuDrYlYgRL16S9HGbJTogK/0
         NYvDVMAP6OG992velSYZC3srvp9yxCvCdGyZWk2xDnpyOwRJbdCRGDLmnmpJhvH6DC14
         +T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283002; x=1793887802;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73SYlDAtiP8uRUIaM56Lx7B0+YvsukeKtcFXE61sCsg=;
        b=Qo6QoHlHW2IdWF8bT7iVPiCwlurTmk8O+n/fQpXHgMXhZ1QmgTxa9rpDUnt6bcQhev
         oYk9M+zjUJWJtSTRHogfYKxKP09RKpZF6D1jPdiCPr/BdOHxKfsFlZUU9oWt9zHkToBA
         JF00JZpWmuyHtgEOthVIktozw3XJFUgfChj+A8dEVQKH39bzwUUm2MpmSOsdvTX8RndK
         uLDkGXN9VUr6e97ccU/j1czE9mgJ3nL87mkOC3kryQymONY2zQMPRE7esVbEcanFotjy
         iRjEm5g+Q9DDgeXeF9BKSdebu3udKLcx/VQCkbRDu/FT75K7Cr9/6sCplr+xaArAd1SS
         rl7g==
X-Forwarded-Encrypted: i=1; AKwUvBy7u4uPNZ8PdERDmPTaViAVkS9yWWbpzSyToDNGAYqk4p03RlTwCTKjwSCnyxfiMKoswRw7DeOr2Jw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLsi4msaSvozIanBLwYZmr8K/QMv6bks2p2htbWirXRscJzK1/u
	ZHEkTgJU4MubbgdfWVk7MtcfKGUI0hUyznENrcnmoYfAzfqBV7LqOsu54osemNI23w==
X-Gm-Gg: AYBFou1nORKuVJX0p07PBPT/KsEPWzSS0d6MikREsEwiebWgBPdu7NXRpotAMQuDKFk
	8r+a9MUoZE0obwKVajONe5qMpSnjV4N/tJt4GoMn16W9ZDo2x8eWDjI5YL614vCAwhCLWM+3/Ij
	56Ko9nqq8hUCSlUWHxj9qbyfKecUy01AUwz6btPUX/9815BuHVO4gl3pgPkIBL1G1hNuBTj70Nl
	g8OUsnnkDXrNZLEIDMM1CE8ow59kQn57hvAPkf2RRct4kXWWePcJ6rOxDbikyPiksyBKtZQu+4w
	RV55CeNrxqBrFLfd5vVRCHIMUZY80wTmA7CnXTb6VXNalwZkoLYI+Q0VwyfpNk1VXeWXfm31Id2
	9TCArSSRkTSrw9zL0IgAQX8GMrh2qdze7xi250rFsT0B9wpUGuxD66h3QqPMj2rIkRpfCcKBj1c
	rLcUYaNi06KWtRcuXYKY4Dlypt084S5pu5IptiTdF1wGCjEAJMLXwg/UCJE1EntoBPYF2HksPk8
	x9TGL5ZyNYkQ6s5CSqbvr4QW4Wz9PVgD/ACYevozVeUjympgNs7BtJcFxUIQnbYDVEs+b+0ETvP
	bAedF8DpqlD9loFrmckWVP1Kn+BnSQRa8ZbJhZf4weKojWEa7WrJ76951Kq4d2Z2CQbICfdYgen
	yD7I1qvq01xS7ewYrtCQ=
X-Received: by 2002:a5d:5f07:0:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48e5d45a3c2mr12403084f8f.1.1793283001749;
        Thu, 29 Oct 2026 07:10:01 -0700 (PDT)
Message-ID: <482334fd-1b21-4541-a903-a9e7434daffe@suse.com>
Date: Thu, 29 Oct 2026 15:10:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: Convert !test_bit(_VPF_down) into
 is_vcpu_online()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
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
In-Reply-To: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793283002-F0CA22AC-94E2C773/10/78276251493
X-purgate-type: spam
X-purgate-size: 773
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 14:58, Teddy Astie wrote:
> Do the same for test_bit(_VPF_down) into !is_vcpu_online().
> 
> No functional change.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit addressed (can likely be done while committing):

> @@ -195,7 +195,7 @@ static int32_t do_psci_0_2_affinity_info(register_t target_affinity,
>          v = d->vcpu[vcpuid];
>  
>          if ( ( ( v->arch.vmpidr & tmask ) == target_affinity )
> -                && ( !test_bit(_VPF_down, &v->pause_flags) ) )
> +                && ( is_vcpu_online(v) ) )

With this the parentheses also want to go away. With them the stray extra
blanks then will also disappear (at least from the line being touched).

Jan

