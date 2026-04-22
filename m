Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284E0F9EDC1
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 12:05:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290435.1570029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWKG-00087c-7x; Wed, 22 Apr 2026 12:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290435.1570029; Wed, 22 Apr 2026 12:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFWKG-00087V-3r; Wed, 22 Apr 2026 12:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1290435;
 Wed, 22 Apr 2026 12:05:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFWKF-00087L-33
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 12:05:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFWKE-00Fgde-Fv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 14:05:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b96d-e002-0a2a0a5209dd-0a2a4506a970-8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:05:02 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b96e-7371-0a2a45060019-d1558035a469-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 14:05:02 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4891f625344so36969845e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 05:05:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb755938sm186606195e9.3.2026.04.22.05.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 05:05:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1776859502; x=1777464302; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oymmmdo0Z7+TImqTXYQBEjW81JQ5Cl2/XBeWf5xJv7o=;
        b=N4Ik8l6gP4jtbkr6QVTTsC4Mhdbp/93YzziJYHt/Qk2tR1ws1lC8Bri1xTcFVtzdN8
         MVwOx0hAB9240iObkBGstwV6aGx+RGdXinHVHz1nw8xrBMgNdGOZIXVfOsAdb8V2cwtF
         t99Gf6Fpwa9QG0ws+SVLx9eMlOEh/dsOLxF/dkkjsTVun6+/gNgdPXASZ/RBzsdZ3DyJ
         2m+cZeFjso+Gk7r2uszHVMLvcIIcy23FdPEHtnMO5SwQzGGvFjc9ab+VJkw1kFoxOUxF
         IraBNQMKD1FVN4nr+kbpFFiKXu26E1mXjM3pUF/Ih/KBUPiww3isy1jVdV1hDCTr4wiG
         BRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859502; x=1777464302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oymmmdo0Z7+TImqTXYQBEjW81JQ5Cl2/XBeWf5xJv7o=;
        b=pwkSSwE9Thip7r8cmS8ODal4ypG2/WcDy6yWApCIKOFVc6lxzsB5ZzZDFgxES06/CG
         MPVx7VSGOSn7Zv4qDABY60sW5q7fMFAjH497qrQF1csFvhovJPXNdKY9jj9MYaL/+Jh9
         Dtcvvv1Oe/qdKy88yG8o00M8SntomSBp1hTEW3sKj1XInXLHKTDQb4twHt6Z+jyksNuT
         868YZR3QEitRL90VBYcEn79/5j3gQmmM/pWx+hbe9r2f+oK/pVcMvJlZXNXdNGxpH0MU
         8ib7ur4EMf+nPb2JfhkIAdHWijeIX8LqBBeVdgQsLI9YPVEnh/pLKwBeD2LAiQQl2ZwN
         Yqog==
X-Gm-Message-State: AOJu0YwipWXXZh2qCK6/JOvGyGVE8FGbe+1+rX6wIscfdqZ9TcmqwpqC
	t9jPNehJd/B2Ylm4f+33Mk2U4MzsJQXbpRsOjY3aGX5fHs74GeJH5FHONNNjmiR0gg==
X-Gm-Gg: AeBDiesGypHhgthIA14Bzifip4rqK3MhjOPB6slX9ppcE4Xq5coJVPXPhFemmUpBUnL
	zx8N177uF+DaqYYc65ZDMiEZZ/IrVKO3I5kqxBh8s4TSrESosxF9U2Y7JxpculoSzzOph9SKk+X
	qpoQwq1aYDXRHDne8D31VR2HlxWjJ+TBrDXvKah8ADyYLWhqK2WVCcxJwPP9M+qM2Vbcfz5ocag
	qbd/ZEfGVkk1BZfxwYPAZJk1NBOK9SYKSbf6I/PAXw2rMQcgfHZBbZpESj3TaxU96lNMK0UsjXq
	0s3aoFyAFTFmrfxT1DhOp8l6TuBAxKRatzN0zYDF7Eq6DlQBbx+TwhTBBUdzRcl+1hBRVGSLb0+
	q9XLyIKEa7AEBbNj7/rOtcL9aOmyxnlx2C/RCOev5Jz+zdd5ytDAE6QLKRLY5F5HDsvDqRZvxfz
	Yc1pAc/OK68C6+Ja0f8ulWuky++e1MtoiGwdlNW0sbe7DE/2f+AnoTRFugNUP50xT0h8ApKsniH
	wYrGuPAMDN/eX47/KqdMfPm6Q==
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a534af0ffmr121366385e9.1.1776859501682;
        Wed, 22 Apr 2026 05:05:01 -0700 (PDT)
Message-ID: <5854f2f8-21b6-4462-a9bb-86345a436f6f@suse.com>
Date: Wed, 22 Apr 2026 14:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] vpci: Use pervcpu ranges for BAR mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <51223761a1f2b8f1e901062d1e59dad934300f0e.1775742115.git.mykyta_poturai@epam.com>
 <aeiqayUd4sLNEPGG@macbook.local>
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
In-Reply-To: <aeiqayUd4sLNEPGG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776859502-52777D75-11245440/0/0
X-purgate-type: clean
X-purgate-size: 1021

On 22.04.2026 13:00, Roger Pau Monné wrote:
> On Thu, Apr 09, 2026 at 02:01:33PM +0000, Mykyta Poturai wrote:
>> @@ -412,14 +414,14 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>>                                       vmsix_table_size(pdev->vpci, i) - 1);
>>  
>> -        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>> +        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
> 
> You make a non-trivial use of current in vpci_modify_bars(), maybe you
> should consider introducing a local variable for it:
> 
> struct *vcpu curr = current;

Without any intention to negate this, ...

> current expands to a call to get_cpu_info(9, which is better to avoid
> doing repeatedly, specially in the context above which is used as a
> loop upper bound.

... I'd like to point out that "current" isn't evaluated when used by
ARRAY_SIZE() (resolving to two uses of sizeof()).

Jan

