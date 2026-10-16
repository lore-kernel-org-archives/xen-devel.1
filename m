Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0422CCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 12:49:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451798.1666655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhMa-0006hq-7d; Fri, 16 Oct 2026 12:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451798.1666655; Fri, 16 Oct 2026 12:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhMa-0006hi-4w; Fri, 16 Oct 2026 12:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1451798;
 Fri, 16 Oct 2026 12:48:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHhMY-0006hZ-AI
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:48:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHhMX-00CLd9-Hr
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 14:48:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad21d21-bab6-0a2a0a5309dd-0a2a450a92fa-26
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:48:41 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad21d29-f2d2-0a2a450a0019-d155802fb56a-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:48:41 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so58116715e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 05:48:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8de7230sm55726975e9.14.2026.10.16.05.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 05:48:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792154921; x=1792759721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RP2aUyToeA5O/gznKtJvOUMU63RbbldXp/RugayuiYg=;
        b=dd0tHl/zugQam3sA7P2DnAPDLRqBrcPmLw9WevPnsgPZ8mkqYag/GzZA6tDHvOxLNK
         zHaRReLP8VWHBdhBOs30H3E3tCnsAjN+P3EXnK76oxhOULjJPkfb9dGJX53lz0LPhZib
         2IkPXMbir3ujP7luer7O9hT5s8vzKsP8lO1Hdnorp/i2/J27+lqkW/yX53jSNApPU0pM
         YE1PCpKjWSvktHiGWo72b56OJvwR5hrmuvTrokScsz26XlGXoS+6i9d8GalLby8CPrbB
         a6OBznMD5UO0LBqEf97Ff/+YA5a/NKC7l397i7n3aFBSr/pgirtRmxn/V+9uO8698NOE
         Trfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154921; x=1792759721;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RP2aUyToeA5O/gznKtJvOUMU63RbbldXp/RugayuiYg=;
        b=XlrgN27zPiyQozZxqWggnnWfT95XrVOzzte2eatoIVPqoFwlggn/wW95R/x7NftcpO
         Hsro0Wuqc8ar8kF0OOHpWyXbtzA4kQ5Ud7tTkrsBh99pki0ai7nVNF/mMu3gq0TD4vru
         I0an0Cwz+ZVmpY006EJt8PNJBu8apuz9iTZD9TcRYzLwzywkbRClcxG3ngPTJfmICRk5
         N7XvKMBGyJ40dFI6ILAeWsWW05GhnmAkune32iqBdBfeinivNS+lza/TU0eU2/c21yO+
         F64aG79dBtW+aP52/2Tf3dkSdkse8w5pzlUKCq9AZDRuS8U8aqX3YZoMTckGdNbBi5Ck
         mYZQ==
X-Forwarded-Encrypted: i=1; AKwUvByr1SFh3ORXTQCsX9BDI3PB2+HuJhQrZ51XW/y1w+CEyweqMgjO2JvOL6UosEc3gvWX4NJM1KEDNF8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLHgs7OPgEx7nSuj/kspOe1i/Mwb2v389p8gODM4zVMcNw5dMSw
	R1PccHU4hgMH39xnQhwGWREx3t4RRFgPlZrdvA9ghvdNcb1ZUAUrs8NbQYo1Y37qjw==
X-Gm-Gg: AYBFou35kn02EP+yDjNtD2rPw/C7Sk6PtZQ6yI+dzcy5gJAwwFUZVqe+AQCHcWA1nIJ
	mSldjDzcD3BUt29vkanyfNluBj3UH0uAwZbA4EzTrPpbZLcUZgEvP+htBG6fKHFTmxyNPlI5hVX
	mZKrYxpapQCDbvfUlaE/Nacm1PqO4bLqtzr+oeoTUfVeUizgt9/teXB0ahcJUaVTqPWtflEDmJc
	u7shjXKnF2pGAXmY1mXTHbAiF5TS3TXKZ3xU60KNptc28Ke/HtleGEFQCIV4BpWZa0Hf+1wm3/U
	qrnnckZ5Lz5FXZHuZLZROcJUN74zuLXtcvy6lgenTNRQLLtJmn51y0iML3eFgt4mBV543fV8efR
	vIlm/ljwY9t664XJB1zWi4wi0MvctxEinTwI8Mq5geAAMOJqy4B69CVHruVVU8CXiI06zLwc/OO
	kMEEaD7oPU1pRz0/XfX2sQt6Tm0kRaJxORVfsq90wzk8EQdlt/qmDMSIlsHOcpUeMFD4pJ3R+Dg
	pJhPYVwIZp2yFeicnrcBvlzso9TOg/xpUtYqM3H6e3NP485axbcVDD05pZIoRZb5+OsWTDo
X-Received: by 2002:a05:600c:8105:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a18e483818mr495521215e9.12.1792154920822;
        Fri, 16 Oct 2026 05:48:40 -0700 (PDT)
Message-ID: <25337ffe-67fe-4db9-8407-2f227eebaf32@suse.com>
Date: Fri, 16 Oct 2026 14:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
 <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
 <1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@vates.tech>
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
In-Reply-To: <1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1792154921-4B8D5CFC-B0FC25C1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2329

On 16.10.2026 13:35, Baptiste Le Duc wrote:
> On 2026-10-15 18:04 +0200, Jan Beulich wrote:
> Based on Andrew's answer to your question on GitHub [1], I see two options
> for handling a DT that doesn't advertise the scheme in effect. Please
> feel free to choose one.
> 
> 1) Trust the probe and fix up riscv_isa on a mismatch. This avoids having
> people edit their DTs, and is safe as, per Andrew, the spec has only ever
> allowed these two schemes:
> 
> /*
>  * The privileged spec allows exactly two schemes for the PTE A and D bits:
>  *  1) hardware sets them on access and on write.
>  *  2) accessing a page whose A and/or D bit is clear raises a page fault,
>  *     so that software can set them (ratified as Svade).
>  *
>  * Hence an implementation without Svade uses the hardware scheme (1), and one
>  * that faults on clear A/D bits implements Svade, whether or not it says so.
>  *
>  * Rather than trusting the DTS alone, probe the scheme in effect with a write
>  * through a PTE whose A and D bits are clear. If the DTS does not advertise
>  * it, replace it by the probed scheme. As the spec has only ever allowed
>  * these two schemes, this is safe even on implementations that predate Svade
>  * and Svadu.
>  */
> static void __init check_ad_scheme(void)
> {
>     bool has_hw_scheme = probe_hw_ad_update();
>     const char *scheme_name = has_hw_scheme ? "Svadu" : "Svade";
>     enum riscv_isa_ext_id ext = has_hw_scheme ? RISCV_ISA_EXT_svadu
>                                               : RISCV_ISA_EXT_svade;
> 
>     /* Fix DTS in case of mismatch */
>     if ( !riscv_isa_extension_available(NULL, ext) )
>     {
>         printk(XENLOG_WARNING
>                "CPU implements %s but the DTS does not advertise it\n",
>                scheme_name);
>         __clear_bit(RISCV_ISA_EXT_svade, riscv_isa);
>         __clear_bit(RISCV_ISA_EXT_svadu, riscv_isa);
>         __set_bit(ext, riscv_isa);
>     }
> 
>     printk(XENLOG_DEBUG "CPU is using %s A/D bits scheme\n", scheme_name);
> }

Yes, if the assumption is that this would be used only when neither extension
is advertised, then I agree (taking Andrew's response into account). I'm sorry,
this has been quite a bit of back and forth, but hopefully we're now all on the
same page.

Jan

