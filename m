Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA12606A331
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GRQYEawA
Received: from list by lists.xenproject.org with outflank-mailman.1494336.1693944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeCB-0006s2-0i; Wed, 18 Nov 2026 11:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494336.1693944; Wed, 18 Nov 2026 11:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeCA-0006ru-TR; Wed, 18 Nov 2026 11:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1494336;
 Wed, 18 Nov 2026 11:51:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTeCA-0006qj-2L
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:51:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTeC9-00147X-68
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:51:21 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd9137-bab6-0a2a0a5309dd-0a2a4509dd1a-8
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:51:21 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd9138-be1a-0a2a45090019-d1558034e930-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:51:21 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so9110965e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:51:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a655608733sm4068787f8f.22.2026.11.18.03.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 03:51:20 -0800 (PST)
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
        d=suse.com; s=google; t=1795002680; x=1795607480; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJOqsDwBcagYRRwfQtZjbA+lG8AF0mIKSoLzrs4piyE=;
        b=GRQYEawAiK2pYtp4gfwMOrCWoTRyoycf4AT7R+wNPUnOjhDKKeBtBESj0KFO9DlKGP
         /ty+eBOrjxc30ZXP6wtTtbbCl4hXOfeOtb9UsbUIPO1gU7TWlWN+IiufuDKbtiTNcVvQ
         08fGzSRdN5us7tLD1ragOVAhrYld2WXqPqrqS4SvqKRFiSrg2xoFdKGI5WXQP6eoyYqZ
         1MlXBGN/4fjrDHu1ybmksFnRwK9lf0ceE2GWF56Vhp5M9GnvrsgKh66KuDa/VmOFlqcZ
         bLLPqWspUC0y5t8QbQ/QAm439GJsN2rE08ySwWN1mNWMza6iJHunCi2cI5vEk8VoArOA
         MK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002680; x=1795607480;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJOqsDwBcagYRRwfQtZjbA+lG8AF0mIKSoLzrs4piyE=;
        b=20ba38JCQeVIDjJyN/gBCqp8x1HHNVrc//r2J4rq5FyAPVsvaP1d5fFOdPDLyarA0U
         HtjmcFQL/TnVhe5Da9woG5D7bRZ7RMKgWQvuMg7KSMX3IZNPRAk6AlYcz3YJSBFa1dh0
         HmzDTRJz4sviyub884SXCIc+htsuGlJr7tQcKaOauQcBknALoBY4iyRsl9UWJpdKsa57
         FrES5enyvqiuLfoJzrJvV22BikRS6N3XfR/haWFywqSdCtDptzCq1NV7w6DonEhDKki5
         Yl7M4u3EhVPsJtimdO14lsynTuqFf7eEKMe4JUg0ExPbGE4v5B9UB1nxIeG4qn3O3PDN
         amhg==
X-Forwarded-Encrypted: i=1; AL+hErFYJb7ywfU2YiHQRJfg/NL6aSkONcthEIQPsX0oaoT2Ky0a/bxJv9bsRxztbJo17omuXRc1v6AaRdg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/nhTsQdPrvdwL4wk0kAWnAuw4dvNVLBBtFADS/rnbmRTG93WkV
	b/aAISuRdNLPJfZp7ez6NQY3ZnqEdCIuW9uM2nYVG8oaq+N5hL5l6IXMERp148SOEtEKQRPxL7q
	jnZnJ7A==
X-Gm-Gg: AYBFou0kBkmdvp2b8PX8Su6U6cWzhFiatqpPe3IDcN38qipLYlN4TDfy9DVmPSuDXzg
	Skp+hW7aoEmMgC5fwK483mYBYP/87pT4qFNY9QHVFZmqDGkRt+Xeywj+p1pYyJqlA4NFaopDRCz
	ofOEtyS7QxaX8v/71S7+AxDFYo4XGrbhiQYC/Ua9qbkZRV3dnffiPPhZFOFaYierQHD+MvokYZR
	IErYBVitw0EUXPIR1CANHlddkMlSDJXiJx4RmzA88gYmLJIWv5Gj0cAtAjGk3lKq04oR4QcBryU
	zS22Mmpmxm+b3WCn2t/mKA1AquNsUMAOh2ws4vBf7pCJE0vbK9jatk2TPFDst0LWrCMWnm03U+U
	9DNmwD990ES+Z2sGIFV84StPvbD3Owp6Kg+/JvlhEtBDdK0UuOIg66g0cmTqQucdKD7Wjup1aHC
	yPsNnNls/5d/KrLlvg0IMGYJw4BKzaKdap7aut51BfgTU9medjQJkc4CcV/TlEhXcx/IgB9vd6C
	WIhEvEO8mNYRzo1PV/GZ6BzXOsvyecOWfy2IO59h9uRVcLb5UjsypyncqTUP66X77Vl/cUOpKDn
	moT3vQVgbF65tKkAHYtYFKiFN9CRG/m1vIgepbwLeasfB8KHGofJR8OOHYb0h/nd3gmk6C7h0vP
	V53XVlKC9zk3cXESj
X-Received: by 2002:a05:600c:500c:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb7da25015mr43276295e9.18.1795002680351;
        Wed, 18 Nov 2026 03:51:20 -0800 (PST)
Message-ID: <ff3a75ce-acf1-4fd3-abfe-9835a27d694d@suse.com>
Date: Wed, 18 Nov 2026 12:51:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/44] x86/mm: introduce a per-vCPU state window in the
 perdomain area
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-25-59dbc5ce9615@xenproject.org>
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
In-Reply-To: <20261103-asi-hvm-v6-25-59dbc5ce9615@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795002681-BEAD8034-4CF1A5E9/10/78276251493
X-purgate-type: spam
X-purgate-size: 2050
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 23:13, George Dunlap wrote:
> --- a/xen/arch/x86/include/asm/config.h
> +++ b/xen/arch/x86/include/asm/config.h
> @@ -158,7 +158,7 @@
>  /* Slot 260: per-domain mappings (including map cache). */
>  #define PERDOMAIN_VIRT_START    (PML4_ADDR(260))
>  #define PERDOMAIN_SLOT_MBYTES   (PML4_ENTRY_BYTES >> (20 + PAGETABLE_ORDER))
> -#define PERDOMAIN_SLOTS         3
> +#define PERDOMAIN_SLOTS         4
>  #define PERDOMAIN_VIRT_SLOT(s)  (PERDOMAIN_VIRT_START + (s) * \
>                                   (PERDOMAIN_SLOT_MBYTES << 20))
>  /* Slot 4: mirror of per-domain mappings (for compat xlat area accesses). */
> @@ -293,6 +293,25 @@ extern unsigned long xen_phys_start;
>  #define ARG_XLAT_START(v)        \
>      (ARG_XLAT_VIRT_START + ((v)->vcpu_id << ARG_XLAT_VA_SHIFT))
>  
> +/*
> + * Per-vCPU state window. The fourth per-domain-mapping sub-area: a small
> + * per-vCPU stride of page slots holding long-lived per-vCPU structures kept
> + * out of always-mapped memory, each mapped once for the life of the vCPU at
> + * a fixed index within the stride.
> + */
> +#define VCPU_STATE_SLOT          3
> +#define VCPU_STATE_VIRT_START    PERDOMAIN_VIRT_SLOT(VCPU_STATE_SLOT)
> +#define VCPU_STATE_ORDER         3

As long as this remains <= GDT_LDT_VCPU_SHIFT, it won't further constrain
MAX_VIRT_CPUS (primarily relevant to PV, when right here you cover HVM
stuff only, but anyway). Nevertheless I wonder whether ...

> +#define VCPU_STATE_NR_PAGES      (1U << VCPU_STATE_ORDER)
> +#define VCPU_STATE_VA_SHIFT      (VCPU_STATE_ORDER + PAGE_SHIFT)
> +#define VCPU_STATE_START(v)      \
> +    (VCPU_STATE_VIRT_START + ((v)->vcpu_id << VCPU_STATE_VA_SHIFT))
> +#define VCPU_STATE_ADDR(v, idx)  \
> +    (VCPU_STATE_START(v) + (idx) * PAGE_SIZE)
> +#define VCPU_STATE_IDX_VMCB      0
> +#define VCPU_STATE_IDX_N2VMCB    1
> +#define VCPU_STATE_IDX_VMX_MSR   2

... we wouldn't better conserve on space use from the very start: VMX_MSR
could re-use either of the other two slots.

Jan

