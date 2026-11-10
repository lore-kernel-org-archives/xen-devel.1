Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C6606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e4nhkg7r
Received: from list by lists.xenproject.org with outflank-mailman.1480946.1684721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhRN-0000if-SL; Tue, 10 Nov 2026 08:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480946.1684721; Tue, 10 Nov 2026 08:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhRN-0000iY-Ov; Tue, 10 Nov 2026 08:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1480946;
 Tue, 10 Nov 2026 08:42:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQhRM-0000iR-HF
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:42:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhRL-006Tz0-MJ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:42:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2d8fe-8faa-0a2a0a5109dd-0a2a4503919c-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:42:47 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2d907-fae8-0a2a45030019-d155dd2ecc5b-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:42:47 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso1365262f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 00:42:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0204784esm65158535e9.10.2026.11.10.00.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 00:42:47 -0800 (PST)
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
        d=suse.com; s=google; t=1794300167; x=1794904967; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOlOTG8qGLesIvfuoo5ZdmHfm3Rd1vSrp8XBmxIUuQU=;
        b=e4nhkg7rK7aJaZM2Aq9RB43PtH4zmvW9gGO9/refqRf/M4OjRc9YRZjNLmTslSYgKR
         nswDI99Nq9in8MFdiYfWq0tqsjIjzSNFBOfeRWGPNYygx6JbAwH4UWuKWyaPuBwYowAy
         Mw+umiKnCSu6Nmsi36m7894Uv1aXLsdGhLX2eE/LPvXLJd/5I12VHAf7p2BLmV74FYxv
         nDOOng30ZjERf4RXSn1NFt2fPKR1RzWrJgYDEFzC4RaWOL65Bv63QIXyrN/144Sf+nl7
         b5+gcnCkiePXihBM/8B5cRJSxgjq4uIUSuRrJ8C/rZAqvRYTrbEIMk4O3dDV1kHzsscB
         UdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300167; x=1794904967;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uOlOTG8qGLesIvfuoo5ZdmHfm3Rd1vSrp8XBmxIUuQU=;
        b=BXDRPTe3rPY/qDAckJ3wYtpMJmDmsq2UdcSHm3/tx/Q2vVkqySmoVSfQaFUfc5c6Ow
         4//lV8j1Z3aQP557nEXDmrOe8B3UgsPTC/Hk6WLE2klwECpsQ9giTKqf6hKM5dwjMm95
         vrmZ2MfVx8vEmSvttAxtwrF/p/Gb+yNWHIE5niggI9X7Y7kGAL+8hM66sD+hMewBEnQO
         Hr8PKOD+KZHhSUhYMwn+Li1oPoOuTFZdDL10xRyGWAGM+DXjWRJ7QB4tIh/quOwr9W6D
         oTBYtQE9eGvH5WTPOI3F3m6FdP9Bv1fEyfmnIO1YN5tPMpZ4Eu+XJjb/a6gzF8rWWTQV
         OhcQ==
X-Forwarded-Encrypted: i=1; AL+hErFQ3MpbAVizIcyCdGQ2BvuTnJVlWVfZWf+2HPQ3YAxUom7PYEtb4dE9QtCu/zrV3tpcoewZOSrBREE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+BmeYYGIapEi7p8/Sj7HjhNPSAPP8euM3iSUHXGL7uTtkCF9QY
	CEqSLY7emdypmItOBUD5DTdygQFiagHAzMg9G/nHuIrAU8GXTDk4YMaCDTNfl5b46Q==
X-Gm-Gg: AYBFou0r2RYoA7U/t2Q5MlvDS6Vm76wJYosLaJSwmo9s5IjLAMzZ1p0fFznb46I+DPm
	/kv6JtNssH6Lg5HRIL+PpishmGZwIAaLEQWvU/ctZMk4OFw8wczyBtDX0qA/7j9mU3kdSqfLBOi
	dbKCPzlk4j5xQDixgFEPer1mJ36rp4lbGdsOM64+8atuXeKxb29qEvC/bO/sDl7libdNc8MpTXd
	UsVbnCWwMeaCpwxN2E+sWxKUGe3MYNsUXEX9owvcstfNhI28/O1T14gmvQ7tMhHqYb9PRqDMHuU
	9N7D5Asq/M9nV6LA31/BckX3EhFMsj+h99NpZr+Yvl8r6LeCilo+u9Rp2b0C8fBSF8kNNu1De3B
	RGb1zDUgC3IUB7cOE/fpbFNmhTz/D+cRpJtL3ZSyQGCMzsLaAajnEHkN4ZUlOC21ul3FSrosII+
	u3iA8ZFzupVvAJfnfrQMSIvX3tcY+IqNsuBQC+z0qmu0dtxeJVLuRyM9AUlNrH/09kG4ve9Su+8
	aqaqTrQHm4t+llZfXPqSpvx/qibMiAZV02MRo6uLdPGN2wP685K819Zf7TeMIWjnMo+MMVlPVVs
	sGQZFVeImR9G5clhr09OtdJVmOXkXmgF1nI6998rOsgoogas8chmp5I5UZGRabrOqi+FrPc4biB
	1/OjSVNENrjKny394Ow==
X-Received: by 2002:a05:600c:4709:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4ba02346e8fmr27549435e9.12.1794300167301;
        Tue, 10 Nov 2026 00:42:47 -0800 (PST)
Message-ID: <d15b8c70-840c-4de7-a047-823a31952567@suse.com>
Date: Tue, 10 Nov 2026 09:42:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231818.482564-1-jason.andryuk@amd.com>
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
In-Reply-To: <20261106231818.482564-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794300167-7488A4E9-60DEE68E/10/78276251493
X-purgate-type: spam
X-purgate-size: 805
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:18, Jason Andryuk wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
>      return ebmalloc(map_size);
>  }
>  
> +static void *__init efi_arch_mmap_buffer_virt(void *ptr)
> +{
> +    unsigned long load_base;
> +
> +    /* RIP-relative address is the current Xen load address. */
> +    asm("lea __image_base__(%%rip), %0" : "=r" (load_base));
> +
> +    return ptr - load_base + XEN_VIRT_START;
> +}

There's nothing specific to the mmap in this function, hence it's name is
a little odd.

Also the asm() is lacking a number of blanks. (This aspect could be dealt
with while committing, but a possible rename I'd prefer to be done in a v2.)

Jan

