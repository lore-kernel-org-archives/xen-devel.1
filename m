Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD563606BF95
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QQH6n38P
Received: from list by lists.xenproject.org with outflank-mailman.1469526.1678311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCV4-00033o-PH; Tue, 03 Nov 2026 11:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469526.1678311; Tue, 03 Nov 2026 11:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOCV4-00033h-MY; Tue, 03 Nov 2026 11:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1469526;
 Tue, 03 Nov 2026 11:16:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOCV2-00033b-TH
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:16:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOCV2-002S9f-A6
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:16:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c280-bab6-0a2a0a5309dd-0a2a4505a608-22
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:16:20 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9c283-4cb1-0a2a45050019-d155802fe1cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 12:16:20 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so24018775e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:16:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b8bd8esm24629532f8f.42.2026.11.03.03.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 03:16:19 -0800 (PST)
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
        d=suse.com; s=google; t=1793704579; x=1794309379; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVEMKtNYvRSjGBOpm5zs4wHJtOTfpmZQ9Ifyj9cC1VA=;
        b=QQH6n38PwVpwQOJaTOuDCRmK2zzmHXz684seHa+CzkYtd4a9TOWgJnNIViufR3kj4O
         KyeF/QMi8DryZ7tf3AL/7li/AakDZSlNjJOrRXOZ0ypI+Tk1+6zaigWKCkslVVI170cl
         WoHXGrN7qun3JhpVXUjkghvD4XSjXRZiQs/73pOkSnzOBXHtMcCTBmXjpFxNI9YTnSEX
         qkLvr9BdltHV6/tzpQT21tzOAxRzpiZqL8CNPMvIf0wxn9PxdDoM4F9Wjj6uhJzttVw1
         wiKZA9Z0zRRcTCMechSyikTpEAvxksTFEKG3R65MRLrd6FN1PPehNj6xPs3HoSP8MXtx
         HYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704579; x=1794309379;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVEMKtNYvRSjGBOpm5zs4wHJtOTfpmZQ9Ifyj9cC1VA=;
        b=u22/i8EtzTn7YduRdrUPy4pRdMa7pB7+iGJNBdawLiJGCuhlhj75ZoPJ7cDeIyMGXq
         vTM5EZ8sqB5OGpWPgHxFfZA2p4H63BdAkSjw6by155FnEJ0HSSDx0UmvDjyHtVAEkMCC
         je1ETHw33zi2oBDUaAqOJlVHy8315LvLT2C+DiwpVbcKeOt62a5bJMqG+vK3bGJY+Chz
         d2ydCtFEGqZE8a4vyOHEpkS33D7Zgq/ps2w/1Z+eQb0Ms6GYmWPHr6lOSdQX8ESV5Xx4
         zSO9dMMo+pDlBRbJMVrcG4ogX/cY+PyuQRyQFylSX4C+YRAbXaXhn96qBOlhvcRHro4c
         kkqQ==
X-Forwarded-Encrypted: i=1; AKwUvBymnFn1GAmjyqn2Am1qS6aNeLZZEaK9rBNfutHjpCrre1+3tBNhV8eDo5WsvvxYUEtQlp5MKrW4CSw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+VSeV1o7MXiBSJBm4ReCvwZugRAFR3R40XqNrG8BJ5/5HNdq1M
	WBEs4zY9hd6zRjbHPS+dief2T5XFxvLjGhcNRSZGq0FTkRrUOQHnoICMYuUBQZpWRA==
X-Gm-Gg: AYBFou3U5Pha5W2//ki+o7FD1bie6vka0vxWiSs6BXhrEvxJRdZ4UtVD8C3jnqMefeG
	aqk66PY71I2QERHBp/drNECPqhvD+VIRGhudCpSzFEVqGi6tCUkCfWtYU1Sgpj257qMID6SVzUb
	53IMTS42z9+sztHPnn1DmEYa3H36nq3gfWmaaCLjj+1vzu9fgx196mZuhikQWRvgtFRT6BhGkt6
	VMDrXSbuGxCdnHPs23KKPlQeiEfTFL2cmZxa29W8aP5+1jh6ptt8C//6XJ4j7Sh5BRe0S3CYi2Z
	oJX1UMllZOCV6pUea2wxYfNZo0+SsOhlzs4tuUeyhPT5RScj8phePW1FgVFylK97TLWZNdvyzqM
	5vCJWzsAWB7d2Px/y4P8CDMF5rmgzvvE6GZyJGW22UrUzOv7utnbmTfftCyxOiblwLtbx5MCcVi
	ej7uhEW/wWIFrU+zY8hK0p/kHtp7O9pgyjvj3ije3QQ8fNz7MOwO/4QSAOCSHQvxenovUfXu7L0
	luyPgviuRQhxollekQN4buVAFI7w/pUVrL2pMT5m9ql5nDaS90n/3TdPfSeIm6+jQw9UEGYores
	+YJ9Jx8QT9zAgQHA91oY8nz06WNde41yH3LV9hoZCeE/qdXI76nLmV11nV4sau8jWJuhpBrxnQO
	v7K99jZxoIz6LNn2D
X-Received: by 2002:a05:600c:34d1:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4ac12475a61mr295148055e9.0.1793704579605;
        Tue, 03 Nov 2026 03:16:19 -0800 (PST)
Message-ID: <fdf5d898-0210-4f18-b538-7a05604844ab@suse.com>
Date: Tue, 3 Nov 2026 12:16:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: resolve MISRA C Rule 11.8 in
 xen_build_id_check()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <bd4ca85c30c0a9551171506d81301cd616d4a23c.1793699713.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <bd4ca85c30c0a9551171506d81301cd616d4a23c.1793699713.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793704580-245122A1-7CD3372C/10/78276251493
X-purgate-type: spam
X-purgate-size: 2036
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 11:29, Dmytro Prokopchuk1 wrote:
> ELFNOTE_NAME() unconditionally casts its argument to 'char *', and
> ELFNOTE_DESC() is built on top of it. xen_build_id_check() passes a
> 'const Elf_Note *' to both of them, so the const qualifier is cast away,
> which is a violation of MISRA C Rule 11.8.
> 
> Introduce ELFNOTE_NAME_CONST() and ELFNOTE_DESC_CONST() for read-only
> access to the note, and use them in xen_build_id_check().
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

It again would have been nice if it was mentioned that this is an alternative
proposal to an earlier posted patch, [1]. Personally here I prefer my variant
(with the adjustment as per review feedback, pending a v2 submission).

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg00045.html

> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -133,13 +133,13 @@ int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
>          return -EINVAL;
>  
>      /* Sanity check, name should be "GNU" for ld-generated build-id. */
> -    if ( strncmp(ELFNOTE_NAME(n), "GNU", n->namesz) != 0 )
> +    if ( strncmp(ELFNOTE_NAME_CONST(n), "GNU", n->namesz) != 0 )
>          return -ENODATA;
>  
>      if ( len )
>          *len = n->descsz;
>      if ( p )
> -        *p = ELFNOTE_DESC(n);
> +        *p = ELFNOTE_DESC_CONST(n);
>  
>      return 0;
>  }
> diff --git a/xen/include/xen/elf.h b/xen/include/xen/elf.h
> index 4199b4d6e6..3337b8cabe 100644
> --- a/xen/include/xen/elf.h
> +++ b/xen/include/xen/elf.h
> @@ -34,4 +34,8 @@
>  #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
>  #define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
>  
> +#define ELFNOTE_NAME_CONST(_n_) ((const char *)(_n_) + sizeof(*(_n_)))
> +#define ELFNOTE_DESC_CONST(_n_) \
> +    (ELFNOTE_NAME_CONST(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
> +
>  #endif /* __XEN_ELF_H__ */


