Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2E9606A815
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VrUPh767
Received: from list by lists.xenproject.org with outflank-mailman.1469547.1678330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCh2-000626-4J; Tue, 03 Nov 2026 11:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469547.1678330; Tue, 03 Nov 2026 11:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCh2-00061z-0y; Tue, 03 Nov 2026 11:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1469547;
 Tue, 03 Nov 2026 11:28:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOCh0-00061p-LC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:28:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOCgz-00ApVY-QT
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:28:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c546-8faa-0a2a0a5109dd-0a2a4508ce52-46
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:28:41 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c569-f659-0a2a45080019-d1558036b4ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:28:41 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a4dc547987so20751645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09bcc967sm248673485e9.3.2026.11.03.03.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:28:40 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793705321; x=1794310121; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mn6z+HgihqULMfuANDhs+7IjO7lNFOKK8mDTg/JBHak=;
        b=VrUPh767zfl8am7glW3Zn8GIES7dpuERabLdb4d34lhpfo2OInMFscPgkSsZ7EO8gu
         ietTJbXs43V58tiVfg/Y9eltqkX3LjXc09jRXc+biZTdt+KOyQ5EBOT3+Zs98wSZEwMV
         IkMs8iOcBr+gZPH2Po9g4VCy0XRCum/AVSOGgrabbGpT8QfxenD9HJV/8gYZI+icFMbs
         wnzcYC13kCZvOorH2JS505wkFDG0zvn9/MjKKar9TL3P25CMmmFZDvActPyh9ZmkFIbP
         c1T8E6KlW55vlbfVYSCmgtCg1eJsH1YU02+AR6yNxr5tOA4q4UOyOu0ri79rKkHPHoKy
         aoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705321; x=1794310121;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mn6z+HgihqULMfuANDhs+7IjO7lNFOKK8mDTg/JBHak=;
        b=AuJzIMKtsXAn48RC/XZS1qKH3OWDjuVTA94kYd1vUs6z8wVYd5y2mUv39qy9UG0bLj
         jZT7yrQX5mbeZmbPwudV4btiKdhDLUSyWH1CVActFEeS3ntttxiJrkNXdK56naWhG7s2
         oyAd7TLBgUuPdrd8zN+xSpICvFqFdlVy5G5bRa3cpgoehjg5v7vL8rIc5DG6V+VWT/X3
         8SmVLOI2nvD79GYdOKnRnqbf7+2GgJpEIZX/NKAGI1Owjh1aF1RIX0dZvel2tqAM4NSX
         2NF/UfIMSP4bjS8XgEK9bN+5WE+N/lvXUpEtfT3lUe4wz4wuvcThCpS5zu7aEJQseGjG
         93IQ==
X-Gm-Message-State: APuU4Z+Mf2PmXFB0P7zcxjzFEi1qX7j8r03QUJaI3mejVOuXO73s5KTG
	nYg/SCTbxyGskKKE8L6sYeBKQ+NnVa1KgPUQkF/OQyNti3PkEqcF8xnbQEmle04z2+SivTLWqCd
	ymUHpOw==
X-Gm-Gg: AYBFou2usCl8nKwLVdM+F9u8BmIbY6WfBQzLnOVe91aJht8zmSaq3PSkYdqOy870i1Z
	ZUi1SBes+DOSzG/zm9PUeTiZaS/t9N7nHvEfhJKgP/fZ5NYOd4zSX3iZZnd4XTYheGr5o8SycsD
	dHgVjh8inqhEsEVMf2GLra1w8LBEwxyYjmsttS0VzJxlaOYDfiHYrcTDSzQ+yyKBiiKBz8QeLEX
	pBG7S0YDiFyj+6LfEh6F3KMGQIyyaY9qj0fqDnw6ZksMah7UGtbZk+jZA99+yk7tmtYuFMUJEgf
	n0E3H7971JD1/o3F8x2dUc8TRJ457ReYCX3s2nmemMrvyf7JQZ8oYjKSrtp0mmQrHRNJFec3rw7
	4exacfwAQ30QHyEbc9IrR1WC2muG9J8Cn7vwfeNIQRMl2xxykg/cFSrAEd9esjrT3cE3wwzdIJ9
	rZaiKIp3J80DJlCeDla9oH6NlSDRLv+RJ83EiwiUkJQATMHAo+sn0zyEIgTGL+qiPbOdamtXyg7
	jsY3CiFPnw+qYbwroh9ukWSG1WZmPLM79Tdqh7gEvtRkBSKXIyGvYuGEPf/1HTyq0y/0LIckMV+
	n7A8NU6TSiI0+yUQSxL9JDXAUZgyik9vhSlBAO0TPIBa6Db50cbwELhcpcv2S4Qo8Vg/l2WcEWu
	hSZaK310b8oYy+9Y=
X-Received: by 2002:a05:600c:a012:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4ac17b2cdffmr284799765e9.8.1793705321106;
        Tue, 03 Nov 2026 03:28:41 -0800 (PST)
Message-ID: <72b9f0c1-94d0-4e87-bcc3-d1c49baead0d@suse.com>
Date: Tue, 3 Nov 2026 12:28:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: compile out __set_fixmap_x() when not needed
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <575ae8b4-4541-4537-90af-b5bfea2ae68b@suse.com>
Content-Language: en-US
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
In-Reply-To: <575ae8b4-4541-4537-90af-b5bfea2ae68b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793705321-CF95A87B-D47EF506/10/78276251493
X-purgate-type: spam
X-purgate-size: 716
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 10:42, Jan Beulich wrote:
> Only HYPERV_GUEST has a need for an executable fixmap, so with that option
> unset __set_fixmap_x() (and l1_fixmap_x[] in turn) is unreachable. Address
> this Misra rule 2.1 violation by introduction ofa new FIXMAP_X Kconfig
> setting.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Why is __set_fixmap_x() not found by Eclair as a rule 2.1 violation in the
> x86_64-amd job?

Same question actually for both functions converted to static by [1]. This
apparently being a wider problem, are we (again / still) having an issue
with the scanning of the linking steps?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg01537.html

