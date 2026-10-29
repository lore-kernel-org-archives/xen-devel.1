Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D7606A57A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=J7dGPYk5
Received: from list by lists.xenproject.org with outflank-mailman.1464340.1675040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMMsx-0004bB-Sx; Thu, 29 Oct 2026 09:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464340.1675040; Thu, 29 Oct 2026 09:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMMsx-0004b4-QK; Thu, 29 Oct 2026 09:57:27 +0000
Received: by outflank-mailman (input) for mailman id 1464340;
 Thu, 29 Oct 2026 09:57:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMMsx-0004aw-3P
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 09:57:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMMsw-005rnd-5H
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:57:26 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae31881-2eae-0a2a0a5409dd-0a2a4507d8d4-14
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 10:57:26 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae31885-b4ea-0a2a45070019-d1558035ccc6-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 10:57:25 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so15079235e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 02:57:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7ee575e2sm54854155e9.1.2026.10.29.02.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 02:57:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1793267845; x=1793872645; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XClxOWhUsvUCRR49fE1bGi/6cJOaK8D4/W3rnCLSA7E=;
        b=J7dGPYk50Rk4CpDPtU5y9skIXMD5aewD6G0E9fE0XF5/mGeqEq96BXNGyCL6y7WuM2
         A/qEx4X5im7s+k6DUUt+213lFjPeSANiYY3+nJlidjEds9C3d0oav+wa7wAFyHUCWHdt
         rRr+PSIpXQYjwSQP+i2XvE3psPlU8Ssk4EPSUtliSiNUHPilYHVxmhL0eEEQb5ZNoKsY
         bUtNXNTQFqUuCmdcfOvo08nSqU+egy6HHvvBrOIZRZx8RFIWmfGhrsyS/7MuMTBAiqfD
         BlFkftH0xp64K4gxqSTatRE/KJZfw11lXZ6+GzdgnGzuMuSvT9xNmSMJ9NXSYb8kpaI0
         DCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267845; x=1793872645;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XClxOWhUsvUCRR49fE1bGi/6cJOaK8D4/W3rnCLSA7E=;
        b=R+tqF/YxdUJwjNVZ6/TybWV7e66OWkgUtb7uzKqxKksJKaKGGF3M6mgpHi0JPqx68b
         1h/9TQ5s9DLFamwiI2yTr1e9NoFuBvVqbv1idFMDiwkmAn15F9+lsW82rpF7ttjPJbWW
         uErpWpPRjbLGKsSsQ7ZbH52BqPGokyrAKROSifi6TxSpt4nrv6mzmRu9hB0TRhiAHxM3
         WBAAp2DDcpR1yFqT3K2rowY64/mHs6S1ItxUoSlvV+V7BtaKaf6zobp0bm2aEWcI91IF
         ZFqbfHD8VI9W+cZarmKXVf0GV/9j7Mxx7PNQTmN/2r0D27IkH1gv+cZAFBHgwVb5EA2X
         daqw==
X-Forwarded-Encrypted: i=1; AKwUvBz47J/XGjeVjw8QtnnEUc/St2UdezrdD3w/AtLGYj7lqNHoXD3BWmyVeBW5/p3VBdr2NdS4SvRC4lY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIyDrKmzNaEMUolHqU3amn+QwvsGDSral8L9uObSGaKjU+gvlDG
	GRT4G/X0OWIlRgmNcQAT7d2PeSHQPmpsIuC91Sow8k+ktkRbV4c8FbP4OckEdHKE0g==
X-Gm-Gg: AYBFou1LZwn59kzXTnAAoPVlZRqLy2pdHAEYZJQtbS88U1CX8Q9DTccZmpLtbXuaUpk
	N12+QtKkNVSb/Q3gkhzVGA88EEZA+zYZEZXuCPw9c8H88RL8c04cj86TtaKh4F+7XNMph73oXpz
	pSTJSN1r6y0H7hJKquoniMr7JoqXCxMiaWvbv7hzcadLxcnmBghz99S00JRRm4GYOjM2dQfBSFC
	j5osr5hFnszqpGWLRZZ2ieji+Ry1GLALHGYuZXcbT4s13L7I1v3XfPI9wmqQCpvGGVgpEUKV8Qf
	+B6PcO0k5n22e0ZZ1EefamfdEM0TrENGV1Vp/CGUjzJGnaEQlIgO7YU7ssUI88DtxT8757F4gRe
	ISU3YoevMetJVZf05dDAv8dlaRmvVp01htJz5WHigdJN1VmzLzo7kX72uwTg46urCc5uCGbEyhd
	Q/+iUqketd6cPKxYESdMrHNatFE3RaTUGxWOHPIULngPY77fFnZ5SGSZb2bBfC9wrxD6mjpVwCl
	ASPw1qdxZSHewUAJKzrSXs4GAFLoOE0mWNvuuIXtBvMSaZgZJfHkAsYmHuAzr566aWiu1yFuuog
	sUEM4G5JEtQSdBGR+hpXSj8HQpZVtDWgcLbdbLVcc8yitX1H9Z9OtkBK0Hgzh3/ozXEMpOEOl4G
	QtceGhfxvZf5PdU30
X-Received: by 2002:a05:600c:1143:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4a967ab1949mr76494215e9.31.1793267845313;
        Thu, 29 Oct 2026 02:57:25 -0700 (PDT)
Message-ID: <e802a84b-4528-42ed-9f16-0e503273a5cc@suse.com>
Date: Thu, 29 Oct 2026 10:57:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] x86: invoke xenheap_max_mfn() unconditionally
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
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
In-Reply-To: <ca7cc14c-e860-4626-9d20-820796a91024@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793267845-A7CD7AE4-C020393E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2065
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.10.2026 13:11, Jan Beulich wrote:
> Calling the function only conditionally can, when highmem_start isn't set
> and when hotplugged memory appears above the boundary where the "short"
> directmap ends, result in Xenheap allocations to yield memory which isn't
> accessible through the "short" directmap. Accesses from PV guest context
> would then either fault or access guest controlled memory.
> 
> With this the bifurcation done by 88e3ed61642b ("x86/NUMA: make
> init_node_heap() respect Xen heap limit") can also be undone:
> end_boot_allocator() can be called from a single place, and system_state
> is bumped right afterwards.
> 
> Fixes: adc5afbf1c70 ("x86: support up to 16Tb")
> Assisted-by: Claude Opus 5.5
> Reported-by: George Dunlap <gwd@xenproject.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This being a bugfix, can we please work towards getting it in?

Thanks, Jan

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1908,16 +1908,17 @@ if(j == 1/*bm->kind == BOOTMOD_RAMDISK*/
>  
>      numa_initmem_init(0, raw_max_page);
>  
> +    if ( !highmem_start )
> +        xenheap_max_mfn(virt_to_mfn(HYPERVISOR_VIRT_END - 1));
> +
> +    end_boot_allocator();
> +    system_state = SYS_STATE_boot;
> +
>      if ( max_page - 1 > virt_to_mfn(HYPERVISOR_VIRT_END - 1) )
>      {
>          unsigned long lo = virt_to_mfn(HYPERVISOR_VIRT_END - 1);
>          uint64_t mask = PAGE_SIZE - 1;
>  
> -        if ( !highmem_start )
> -            xenheap_max_mfn(lo);
> -
> -        end_boot_allocator();
> -
>          /* Pass the remaining memory in (lo, max_page) to the allocator. */
>          for ( i = 0; i < boot_e820.nr_map; i++ )
>          {
> @@ -1936,10 +1937,6 @@ if(j == 1/*bm->kind == BOOTMOD_RAMDISK*/
>              init_domheap_pages(s, e);
>          }
>      }
> -    else
> -        end_boot_allocator();
> -
> -    system_state = SYS_STATE_boot;
>  
>      bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
>      if ( !bsp_stack )


