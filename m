Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B51606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 09:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CPTK1lNo
Received: from list by lists.xenproject.org with outflank-mailman.1492083.1692755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTFtp-0003tz-ER; Tue, 17 Nov 2026 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492083.1692755; Tue, 17 Nov 2026 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTFtp-0003ts-Ac; Tue, 17 Nov 2026 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1492083;
 Tue, 17 Nov 2026 09:54:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTFto-0003tm-DI
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:54:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTFtn-00032m-KP
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:54:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2464-8faa-0a2a0a5109dd-0a2a4508c34e-16
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 10:54:47 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc2467-f659-0a2a45080019-d1558032c1c6-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 10:54:47 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso16109855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 01:54:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c609c6451sm28753862f8f.45.2026.11.17.01.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:54:46 -0800 (PST)
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
        d=suse.com; s=google; t=1794909287; x=1795514087; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uFs4cwpuUzxcLy7sUDIiw5jGFWKiJCqUn+J5NegRxc=;
        b=CPTK1lNoJdhibgDdvq5IrofomcC0e0C0b53PfH/JMmkXrQ8nURDGKNjDx0JQy4X1IX
         OZ1nXqK6Dof2Nocxwh4IdWwNR7cVTHEfxxFB/7oswIjOFAa3Jax5cWlv/xolLzQA4sKb
         O55iNwvgZajNBB66v51izl/sFB+e1xpwvWPuQlMTUaanSqFxeAePYwRc1ovpdGmTJqDt
         xDtc5/g/d62vI5AsFTmyD58usa7YaZx5CLgexzY3g6ZSnfXzIeso7MrUDRi6XlGHGKwu
         ZznWgAdPMVhzACL5O7AWtTjdMWHPKEM6g21QCvX3kWsgS8jzlHnI4ElkvUKPWU9YHZyt
         8gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794909287; x=1795514087;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uFs4cwpuUzxcLy7sUDIiw5jGFWKiJCqUn+J5NegRxc=;
        b=uE+56EBNamKawY7nGgNXMgiZ7atKy1SeQ/YVROPO5li4w9loZumXLKWln2u8W3hLGU
         vn6c9DABLY3o3SJntluAeTXBGrkOeHx+OlkeVjVuVdaXkYB7Tw+XN+DiliXfMQFu1Iww
         xPIZA6XEuNpzAQJnCbUE/xk1xDnr7zzFr2rdpSeZnDox/xwGbKdxZqhhexnAuxFKH4cV
         3GBduhItuH10VuXFr/+9oJTHwHPbRkqIUqA3d3T1NgTsTxoavlaoakspVHoXdwGNM6h3
         7uD4cuiptFMThHUAd8hkBUYSSJVTYG1wJA44h5GLheAIpuKCqMY5TPeS4Xw7BoHd/obF
         VngQ==
X-Forwarded-Encrypted: i=1; AL+hErEarwvAmXHljSndHq533xiFcVpwUDzSNYJ0iSYZzZCFwWAqAGU0n0y0Ls8fYuYIArkW6+UysFaZvOQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8jrAhF7kiTtXESmpG6AM1SBZxeFCKs7GlgevHF8G/tw6UXQFx7
	CyOIOsXZ0m/6dZIzQmS5tU6MLTicR8a3r+MMsBTEqftvt2yV7jNd6GmURH9hAEpqVw==
X-Gm-Gg: AYBFou14MEWi3cH1skrRTPlQXEfvc1zrqTiGsA7mvHbPSSWNvf0CtzQwRBLeVikIXI+
	G4D8n08L4flp4EBVzMS8u7p48YGl+uZpU54KlblgF5EaANIW2NZ6jjasz1V/3XUho6yLNPqW4JJ
	hzg1FykaSnH0Hwp0+J3wRBQWKvJt9N67La20ZnyjZGQsRyRukn2/g+UWAOrlY6KUrd+3mmDEmGB
	Ezb14q9oNQyhWNyZ1kceafOWU45psKf8uNRRdXG+JysAvaOI06i7+/w4bLLOLXV2BowlJ5C+Fa8
	4S0vQG8C6a0NqVr7NQfVz6ZzhnjROd1eAAoxQyhTOp9vpzz38SzKlKzjRlS39oHtW867up2wqJG
	9oRng9GngWVxkrpi0/UD2cNMBzf5rCMp7GajKjqgKIJtT+GXv60z0IUVE0NKBQo+nmrbPp+zbDu
	NL+jcKhTvU5pDNWRs+xk1AoOJUi318yXiCHt8m8zDxhg2X42kNv9Pn8GPv9rxEm4GDYsnpYd+wv
	5HPMWNeSDnUao4d0iMOmYN8Vy7KmhUwgGzMEXNXh2bUsOEAaBCPuC5IFkEV4dGasXTKFGw1wQOL
	wmTTyYpE8Oa7BTs3Yym973z0T5LUeED+jzf4XF6lg9mtWtD19Xrholr26NS33KgDxmUMjeE6enT
	lnUpNZY0Lnbdv1bDjBXH9lGkeKnIBMNcZ+DBoOek=
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr175190845e9.11.1794909286831;
        Tue, 17 Nov 2026 01:54:46 -0800 (PST)
Message-ID: <8779ceea-3f2b-4a83-8d87-44e4737e8148@suse.com>
Date: Tue, 17 Nov 2026 10:54:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] x86/efi: discard multiboot and PVH support for PE
 binary
To: Frediano Ziglio <freddy77@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
 <20260715062206.328049-3-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260715062206.328049-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794909287-D4D7087B-D7A6B7E1/10/78276251493
X-purgate-type: spam
X-purgate-size: 1741
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.07.2026 08:22, Frediano Ziglio wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -57,6 +57,10 @@ SECTIONS
>    __image_base__ = .;
>  #else
>    . = __image_base__;
> +  /DISCARD/ : {
> +    *(.text.header)
> +    *(.init.*multiboot)
> +  }
>  #endif

This has caused fallout: GNU ld 2.47 now warns (once per .xen.efi.[012])

ld: .xen.efi.<N>: stripping non-representable symbol 'start_pa' (value 0x7d2fc0000000)

This is because "start", from which "start_pa" is derived, has disappeared with
the discarding of .text.header.

Question is why we (still) have "start_pa" in xen.efi: I can't spot any reference.
The sole reference is xen-syms' entry point. The patch below addresses this, but I
wonder whether I overlook anything.

Jan

x86: restrict start_pa to xen.gz

With "start" (living in .text.header) now being discarded, "start_pa"
obtains a bogus value (which also cannot be represented in the COFF
symbol table). As the symbol is solely used for xen.gz's entry point,
limit its definition to the non-EFI linking process.

Fixes: 9f8ebe9f46ce ("x86/efi: Discard multiboot and PVH entrypoints in xen.efi")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -55,6 +55,7 @@ SECTIONS
 #if !defined(EFI)
   . = __XEN_VIRT_START;
   __image_base__ = .;
+  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
 #else
   . = __image_base__;
   /DISCARD/ : {
@@ -74,8 +75,6 @@ SECTIONS
   __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
 #endif
 
-  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
-
   . = __XEN_VIRT_START + XEN_IMG_OFFSET;
   _start = .;
   DECL_SECTION(.text) {


