Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E87606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vge9Gm79
Received: from list by lists.xenproject.org with outflank-mailman.1461124.1672084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIaF-0007S4-BA; Mon, 26 Oct 2026 11:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461124.1672084; Mon, 26 Oct 2026 11:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLIaF-0007Rx-8W; Mon, 26 Oct 2026 11:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1461124;
 Mon, 26 Oct 2026 11:09:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLIaE-0007Rr-Rf
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:09:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLIaE-002rn0-1c
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:09:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf34ea-bab6-0a2a0a5309dd-0a2a4502afd0-26
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:09:42 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf34f1-6ca4-0a2a45020019-d155dd2ce4e0-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:09:37 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso1520824f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:09:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb851sm13574772f8f.26.2026.10.26.04.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:09:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1793012977; x=1793617777; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXp73Q06dDpky/Pakzf4g5UPTalodca1jVmDxhyWTr4=;
        b=Vge9Gm79AcMtKS46Pz0GRCql9dDNBQCPIBWTGp/Efd1lksawMVa3wqH2furzfkN02n
         xzXeKX5w8fif4MmYjtVjCJnMBGtYqhWLwel4MbWqR3aZvbUp00JvHAMERM7rRwxbDgVr
         mKUwKdSUK9c/JRUwXTZgd6d2QFJPG90bwSIxbzgic4DwlW8uo4N4UtqmKdHDPwpQ15MW
         E4N3w3POWwCrDWNQ83za7rRoQRFGGHWzD3Na+JpE4YdeQsYsiJgwlNma+5QOWWXYGyAD
         ymBY5o5n+nevwYvkuxvlreSWgR6eNI0SaN4ychd2X9Gi1hXLiaTa90aeWFrRwzecJomR
         kDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012977; x=1793617777;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXp73Q06dDpky/Pakzf4g5UPTalodca1jVmDxhyWTr4=;
        b=wRo/YLbl7IureV3roaDbKwZb2v+wJsvMwVn0c483zLLYqvE/YjxGx/93IhtmdXBMEq
         RL8NPTkIplZ6NcpHKgLzl5jJR1Ak8+FNRCDPj2rejpGIgGe1UJV7+ezZ6P/QwYSw9Qq1
         yL0E1mmsnIFXf3ecoAbPkiSoMEuZN5G/zQMEq/+/bEHL8RiJs/f61dElNAAGhJjtzgZi
         psPZbtu7jaHc4mlTXY9k2+aGFUcnltVgAaeDTJTPvRzBjM0OMAXiEbI6MozR6AaieFYW
         mKfAdT7br3tp3/CVHMklWldazC93ZtXDkIexUtBC9fu3Bw5EYrRLteCpd1RYV+w2NB48
         4XGA==
X-Forwarded-Encrypted: i=1; AKwUvBxobbSyS9EjkfeyhL9MCIf00+K89xdpaDtLa6qKLZ1SILECGTF4u8EZqLLNqE4FSOh23Tz11tgOxRU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL51X0xXD0iRfLbsM0OM2ucy6AIeEjmwpR17NT9BGkik4j/3RXl
	vnUY2tayF0ACXa/Az6BeUm+N0v9jVTpbu6OMFKPyJ8eJSk86UZGh1f9XMAOnh4Mi1A==
X-Gm-Gg: AYBFou2LcTb3RFsJ5nde1tnvhNZlDYeEJ/26JKrJ/jhQwzrPcpTCLGw41vFwNZEER8V
	BuilAK4kzvPSyKIDkRcBiDQ0e00fqRyRg6HGCDXfoMQbjV3nmMuPgAf7RBYbq+8VB351PNIZMfd
	DjfADaOHf21QdjKqxbUY18+lDvZaYO2VRxcKjONAG+Hkk1DlM4ltT4kWEsW+DwDFlqF9xV8UhCg
	nV/1jeAsc3ss+3n00tAUL+ayush9nOJYtTv+Q0aQXFksMUABNkRbOkMUWrt7i1YL48ofcFyfN0e
	ZIUNRMlJnhfOnfqXcK0/217vlmJMTOehh4WBK/f6oqE/nDJoGLsr8EytGGGlR40XnwhlbVa5TYf
	/iLjLafU7M92poPmjiH+YoAAZnbsjtiblWcnA7DtFKcLaI769jXqg2vhBe/OAXoTTK7Tn7OvT+B
	9SKKEXJOdZ4NmVUA7ZDAAE7utzoTVMjU9nLqSr3Blpvc7sYtd7hcPNjnTjehHs9ia8hcCeT/f6Q
	oOx01BKEnmbcxS5Ah6bmC23kZDHcIN2fWiEHOhtFDcBuGfnSO0mcIpQ7PfCO01kKuMfIHEzGPJb
	puYcBdRaoPaozyHFomVT0DRM9te1CJATRoZTl2Zr9+IKzld8fwSaqfd9iTAnA9mmOA==
X-Received: by 2002:a05:6000:27c9:10b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e3eb926cemr8757404f8f.35.1793012976668;
        Mon, 26 Oct 2026 04:09:36 -0700 (PDT)
Message-ID: <f50e40f9-6ce0-46aa-916f-fac7e97b7a0d@suse.com>
Date: Mon, 26 Oct 2026 12:09:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793012977-66CB22AC-559AF4B3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1854
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.10.2026 12:41, Dmytro Prokopchuk1 wrote:
> bsearch(), memchr(), strchr(), strpbrk(), strrchr() and strstr() all
> accept a const pointer/object but return a non-const pointer to the
> matched element or byte, matching their standard C library interfaces.
> The casts in these implementations strip const so that callers searching
> a non-const object get back a mutable pointer. Fixing this would require
> changing the public API, so document these uses as deviations instead.

Imo "public API" is misleading here, as it could mean "public interface",
which isn't affected here at all. Then ...

> Update docs/misra/rules.rst to note that this class of double-use
> library functions is deviated on a per-function basis.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit there another minor remark:

> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -450,6 +450,14 @@ write or not"
>  -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(hvm_guestcopy)&&text(^.*__hvm_copy.*HVMCOPY_to_guest doesn't modify.*$)))"}
>  -doc_end
>  
> +-doc_begin="Functions bsearch(), memchr(), strchr(), strpbrk(), strrchr() and
> +strstr() accept a const pointer/object and return a non-const pointer to the
> +matched element or byte, matching their standard C library interfaces. The
> +casts in these implementations strip const so that a search of a non-const
> +object yields a mutable pointer. This use is deemed safe."
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/include/xen/bsearch\\.h$||^xen/lib/(memchr|strchr|strpbrk|strrchr|strstr)\\.c$)))"}
> +-doc_end

Can't we fold strchr and strrchr here, e.g. as simple as (memchr|str+chr|strpbrk|strstr)?

Jan

