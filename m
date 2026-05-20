Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDFCD5BA4
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 11:58:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1313868.1583892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfZB-0005XZ-7T; Wed, 20 May 2026 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313868.1583892; Wed, 20 May 2026 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfZB-0005XR-3y; Wed, 20 May 2026 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1313868;
 Wed, 20 May 2026 11:58:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPfZ9-0005XL-LM
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 11:58:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfZ8-00GxHg-Ti
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:58:22 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da1dc-5cb7-0a2a0a5109dd-0a2a450accb8-22
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:58:22 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da1de-56b3-0a2a450a0019-d1558036c8b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:58:22 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso41358685e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 04:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febf81970sm185677645e9.8.2026.05.20.04.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 04:58:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1779278302; x=1779883102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1DZmJ2eP7fo1cjpTosdZNGxpmiMnS2id7gX5PIEUn80=;
        b=SezYaZXFLAJdcGPRiUCsPLVghgmTya90S17N5z9yI1Xavx2z16xi5ehKiMykZ/zOSI
         vBqb5gncVGg2rDICYD1K8/ZRrNd0CjCeSfJydchwE7kj71UlwxMhviNX37ph1xhCR152
         UDM7F+7cVKTySKHml+Y1w9xaE0deiqw7cKY3l31A0xdRnlcwLiuQVnl3t5oX383E1Z1u
         BJkqRKz7WIWMReb9xNWhZDyY4VK+LtM1jUJ5AUMMFkC/2sxsFw1yHiA0j/c7shWMZTIS
         fwSwOtknpG6DhI7F78JQecrDx0+UwLAzLIR4uFO+ja7zksCXyQuMOjfZKjRQiucRw5pp
         YQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278302; x=1779883102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DZmJ2eP7fo1cjpTosdZNGxpmiMnS2id7gX5PIEUn80=;
        b=qZ40WhZ2s48jClECfA15f+uMy47GnXuI5jl8+12kpZUnlzNh9t+84IJ7TWxxsNE/dP
         QjyLw8b27tfClCLJcPdcaNm9t3XgUEEl6Itb1qaG1I+JG+QcJYgFCqnXwOCAYjbno2v7
         0SkoMNfi8fJLvkFhpNaGUtRmsGNRLy0Z7aq3VByIA7WSFVrI7x2VzVN6Ob0UDWrYFApC
         uNmqRfcgi3YmBdwRQwWalW/bxtASVvndzodJk0i2J0b5ZsyVo4y0xwws3WbWD+59ffmP
         qTHN8jDRGPTGMiY8s5AZu4zMa3wlmXadfLjCvkhaYofk4sFIC1TSpSPMOZuCjOls4qc3
         Oz1Q==
X-Forwarded-Encrypted: i=1; AFNElJ88fXHReiJIaZzLIX9DvKbMzNN7+5fYGQ4l0HV4e9ghoAXcAFiAsYcCGfjxrT9ft1WSsEQNtJfg8Yw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYROjt/vVepoonVqj2dLYbv47JmVoSug+LUSIs2LK95rmLc7sw
	ERfdQZabeW9cMJLLMQPuLNeQgr2Eh2LpEohg4EHKj9MI59lqOKYIPYi7kSqKLjKByg==
X-Gm-Gg: Acq92OGsCbHvXKIKtV/caed9zSra6lILZWKPIiBqF9cV7xpQaHQioGTll6QKAykTVig
	0x2LkLrz1RROLuP8UkgnJGc9dk/F59LqDT3aM1mCFc23YHi/y12vRcscvgbBHE+KK57iouo3khq
	5w/DAWNbq3Hwv+nN4MPFSG2334n9KkGKuMcY06+nTJbBcDC9WuCfRP3HHFYMkfTV6X2j4ErdOOt
	f1Z9nkYNZ9bD3SJv7Vr1Y4HCG/yLQb8VfE6bLGW/d+HB8vtTKs74KEBROPBq5Nzcie7j91/KR3l
	XwagfyUQVI1PM+x1h66awBkrV3pF3c5D1xTgBQeAJvb4Z7iLFwHe2HMjjAbnwX7/f3Na8CuT+iW
	8Y6M0zZj08Wbyuqq0+Zgo92YAAqSRykBZz4isiuVbF9woNe7Bjni9Ia+WQ53H6AiXNzIZMV2l3u
	kJcXncVvKNEtYkyscDgf3p4iRXBrcvCPEpPP1QNid7ismxDvQNze+jEkbA9gY/KW0wTsEgvr8dv
	bMEfRekYykra2oWdNDDHB137g==
X-Received: by 2002:a05:600c:5298:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-48fe60e51d1mr369313745e9.2.1779278302160;
        Wed, 20 May 2026 04:58:22 -0700 (PDT)
Message-ID: <31ee4635-0eaa-41cd-8fad-223fb11cb9bc@suse.com>
Date: Wed, 20 May 2026 13:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
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
In-Reply-To: <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779278302-70F618B7-0FAC5660/0/0
X-purgate-type: clean
X-purgate-size: 2292

On 20.05.2026 12:30, Szymon Acedański wrote:
> @@ -1526,31 +1537,33 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>  
>          gop = efi_get_gop(&gop_handle);
>  
> -        /* Get the file system interface. */
> -        dir_handle = get_parent_handle(loaded_image, &file_name);
> -
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> -        else if ( !cfg_file_name && file_name )
> +        else
>          {
> -            CHAR16 *tail;
> +            ensure_dir_handle(loaded_image, &dir_handle, &file_name);
>  
> -            while ( (tail = point_tail(file_name)) != NULL )
> +            if ( !cfg_file_name )
>              {
> -                wstrcpy(tail, L".cfg");
> -                if ( read_file(dir_handle, file_name, &cfg, NULL) )
> -                    break;
> -                *tail = 0;
> +                CHAR16 *tail;
> +
> +                while ( (tail = point_tail(file_name)) != NULL )
> +                {
> +                    wstrcpy(tail, L".cfg");
> +                    if ( read_file(dir_handle, file_name, &cfg, NULL) )
> +                        break;
> +                    *tail = 0;
> +                }
> +                if ( !tail )
> +                    blexit(L"No configuration file found.");
> +                PrintStr(L"Using configuration file '");
> +                PrintStr(file_name);
> +                PrintStr(L"'\r\n");
>              }
> -            if ( !tail )
> -                blexit(L"No configuration file found.");
> -            PrintStr(L"Using configuration file '");
> -            PrintStr(file_name);
> -            PrintStr(L"'\r\n");
> +            else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
> +                blexit(L"Configuration file not found.");
>          }
> -        else if ( !read_file(dir_handle, cfg_file_name, &cfg, NULL) )
> -            blexit(L"Configuration file not found.");
>          pre_parse(&cfg);
>  
>          if ( section.w )

Seeing in particular this hunk - why not have read_file() call the new function?
Most of the churn here would then go away.

Jan

