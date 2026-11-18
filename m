Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609F606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BUVtufyP
Received: from list by lists.xenproject.org with outflank-mailman.1494353.1693962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeF9-0008GU-K6; Wed, 18 Nov 2026 11:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494353.1693962; Wed, 18 Nov 2026 11:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeF9-0008GN-Gn; Wed, 18 Nov 2026 11:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1494353;
 Wed, 18 Nov 2026 11:54:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTeF7-0008G8-LL
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:54:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTeF7-00FbpX-0o
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:54:25 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd91e3-8faa-0a2a0a5109dd-0a2a4506a96a-38
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:54:24 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd91f0-195a-0a2a45060019-d1558029ddac-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:54:24 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4bb61185057so7294995e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:54:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7ad9430asm132333085e9.15.2026.11.18.03.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 03:54:24 -0800 (PST)
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
        d=suse.com; s=google; t=1795002864; x=1795607664; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F92B7u3P9br3Ntg8oIWNB62/B72puxlX2k34KM7K0wI=;
        b=BUVtufyPepvxzUg+38XLiDKyai5nOsHA7kpvj3Eiu7beC/719lH1AZvdmkuPKMGsut
         M70d7JgW4lPAAp/7h2Es5iKwKJSIe9HlE1mFfuP6igKAdEEITY6xyyYkbOzQMbjBk6mn
         SLzBt50lewn/SrmYpkrL/0NRFoeQEkN04HS9Gv7DVDUL4BTZ3AToqkJcW8ZRrx+FSOMr
         wwvDiV2MINuPYX0T49gL3fdkQPh4oqflHPLf5T5C12X3wq43iAbINjAri/yr0X+2Mu4M
         aCYX464fEaS+rrOTeMqH9QEylvbODj399QtS8u5q7oyKxk7I4DfQwXuiXl+irllyBKyx
         5BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002864; x=1795607664;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F92B7u3P9br3Ntg8oIWNB62/B72puxlX2k34KM7K0wI=;
        b=Je/Qv5pTRG/yU+tBlcmIlvAc/0RhSx6cmNb5L35A29OwjQ2Zpj8geu735bgH31nZp7
         7vINIcrjbJKs7Rv1LN6CV2i8oyAwA/F+lNM8I1wFRHMVrQgtdjiSF2xJxnFQ9HuTqXrK
         EGi0RWPDrD7Q1uB9U0xcjKaKUPB3fmhkoai68jC/euUYDTvzfdf/GPc03v4K1N/nxv/N
         7lg8paCKi55yFVGbto/rZcc191Z3rYBnyza5vrDHQ31mc/90eI4usQ4zkZX7hRp3nZZr
         qtzhx2h0arZCqUP02fsCVqXvze/wCWJgujxFp1qo4EcYe9lE3R5OWnKxRUGK2poKuPu1
         xL1A==
X-Forwarded-Encrypted: i=1; AL+hErE/IdlOX6+13uU18hGCQx6Xwtiv9d1PDvhfrWPL1T9BUSs4XsvzAZzkZ1vGTaiJQ2klX1iVTvgjvgE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9ZpExHiIzCnBoww6Qucb7YRQK//tQ4aA5+AxJb4G0SWMbaeDuv
	wvbFoltqVsbBQM2nbWzH/g3mQhlF3gwrEG2GiAC7AWuN7lBL01tDO3VEZLb1G5vNVw==
X-Gm-Gg: AYBFou0r+B2AiCYxZRCyeg7RPH6xWm1LFg7U713WKh66Eg4IlgX/mCxr8DOvCq5UXuF
	Z/VRLTAk3vwMZoAHoIMwz/JCVAax0HT1i9Typklul8As9Byx3sgRxi3bdaaK1OS5lASMQwpM1AV
	CR6jkbNQ0PnTjwRN7PRCvdgGX75is2R51QLk2mCbfB6LR2GjORO8U4//QnAGPLHJMOhTlXNQln7
	wVpdhoffXyf1ahAHm2N6nsEQLZ0XwOjP2/alIVYKP9HW75IjEHKldUOZMdTk8kMKrksImtascg0
	HTX+sVeRf9q2IUomBp1ospv2nDyJd0O9fVy2fbdieGgDVsB/2fofczyYGviEQIuZHXYkAuuOCEl
	DGlsgWIKiRC+fyUgZjAGr1p7Pj2170P3zp/5Yyjy5Cm4ntqme4GnKlqxVMnAax38icW6C1E9CEv
	CdqdCiV3/xs7P89jLEqSzEfrBAreL144vaCEaOliArMp7voBiE5Bdl5w6GuZikUm4GvwBR1ntNz
	3JWaTiAjLSfFrVQMMduVb8qH5z05l/XxuJjj4+E29H9POPh7OtsSwgX4KXPx39C4jJSK9ma5Q1Q
	VrIi8BMABA0BqA/OHQ83wJd5oo3owDbuFgXFALc/TRFz4rExP6yW5wWDm4Wqn/e2NUAyNYb2bMC
	/krteiRU/u6XJNgjC5YIGly3DbL3Iwxzv1sh2UA==
X-Received: by 2002:a05:600c:4e11:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb7d578be5mr49165555e9.0.1795002864475;
        Wed, 18 Nov 2026 03:54:24 -0800 (PST)
Message-ID: <df545367-5aac-493b-b44b-f7d3331773b7@suse.com>
Date: Wed, 18 Nov 2026 12:54:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/44] x86/svm: drop svm_vmcb_dump()'s paddr
To: George Dunlap <gwd@xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-28-59dbc5ce9615@xenproject.org>
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
In-Reply-To: <20261103-asi-hvm-v6-28-59dbc5ce9615@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795002864-FEC7777B-0F424707/10/78276251493
X-purgate-type: spam
X-purgate-size: 340
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 23:13, George Dunlap wrote:
> svm_vmcb_dump() prints virt_to_maddr() of the VMCB, which is right only
> while VMCBs are reached through the directmap.  Print the virtual
> address alone.

But what use is the virtual address if it's not a permanent one? The PA
is the only thing uniquely identifying a VMCB then.

Jan

