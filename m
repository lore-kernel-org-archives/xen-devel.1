Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94152606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZwzwjZw4
Received: from list by lists.xenproject.org with outflank-mailman.1482091.1685959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp2o-0003NW-NV; Tue, 10 Nov 2026 16:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482091.1685959; Tue, 10 Nov 2026 16:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQp2o-0003N3-Ku; Tue, 10 Nov 2026 16:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1482091;
 Tue, 10 Nov 2026 16:50:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQp2n-000397-E5
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:50:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQp2m-0016zJ-QX
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:50:00 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34b22-8faa-0a2a0a5109dd-0a2a45048ac0-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:50:00 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af34b38-b57f-0a2a45040019-d1558035d97e-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:50:00 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so17828475e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:50:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fe2f09sm85651935e9.4.2026.11.10.08.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 08:49:59 -0800 (PST)
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
        d=suse.com; s=google; t=1794329400; x=1794934200; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qP49oYlAM+KS5FkdE3Sw+8Y+fx81Qv4ZnVSsUpD6ofk=;
        b=ZwzwjZw4Y7YyLmDE8sWbit6J3FgyB/J4dHZC7nGUt0GLXt2HmBi2QtVD7TtKZacSOS
         8+TaYenoj4p1p8ohFeBSc/Tb8INfkG8bNI7LVeBdaLsCGhaFtC8IeGL1fHRFsMat8+lm
         2gNiBw3tabT05ugcgrQ4HhxV0B9ZeyBS08jELWi0I+zbY+kSAxDNlVK88H2+hZ/aTGcV
         UM6rWbbOHwQVsdNeBoGgbBMHuTIUHTRqc0A3ESP/Dw5hxt5f0Tf4lPIEyNIaDQF5HSYv
         y70Wor/GrH2Nm4xMT08ViHuzI5QO3pn0o8IupI5UYXBLdcq/To2t2YVXrZNas0k68kZf
         c//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329400; x=1794934200;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qP49oYlAM+KS5FkdE3Sw+8Y+fx81Qv4ZnVSsUpD6ofk=;
        b=DE2O1jM6OdZMo1Qd8vwjYwTNUfDonoR4KuNAKJOTlSXGp9UntPghu8lJwVL5vSzNH+
         b3KkAQ3qEGeWfZJKUs7GokRKxBfT9Y56/EAqj8R3LBKoi7gVJlrFQ7N4iDlDL7KntMvN
         Lv0wjYVkNeaKmNH8xlk4v7RmwCMz5i2PMTWh/hHxc1PWSYZ7ImfxVAS+edQhpzrzP1B8
         KRzMuj7+4oKU/SOZsbeRTslYyF4YXgvz0bY98pfNH9yzYvaSjpRUkVdTYrwo6SPrTtAq
         MhiJWqUJRj8lZnhNOSShyZdZHJJxw0fixl92ZQUa4WU4OywNHMhg/0ylKQ+05aQp0J8V
         83oQ==
X-Forwarded-Encrypted: i=1; AL+hErF+EPnwc5lBdKDjBu03c3NwJGbZ1PDmtCEJANXlF/OzdmrIXYlhyPVpo9xpMLeNQmU68zoMk1SE7+o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8NTqtDHue8Troq/UV5epk1dnIK65J/7liwdaoqPotPFpvD0Pdt
	1szsGQhsky9+Br/jjdoNYrEYmEtCBwiqvHqx8iw6kuiDz79DkKjq+df144ZieFrbiA==
X-Gm-Gg: AYBFou3xWuQ9ws1Zvw48flZoQPoMHdq1pRAr39sf7x0rSjPsIjtV2VIh8vTj6VT4q3b
	3IdnQTAqYzwZTWGwpZK170ZZnJeN3+LUIfUMcIDtQJuNbqUNh9dI5PWxW/KTrXo70+PfzYV5+Fo
	ozxiPPcbk9W9hdHae/XF4MABeK5eFGm2C5o5Mo6MdFQ4hje1TaQ7DhWh98AMpYKurJ+0W7Z5cTu
	73Zk+4lPRm+K9ZyVYWu7Pev4PQxXL8rZMTzxwq/8Hk3bmIpKrBgK5tqWNc8IG5xazgP4qSxqOUw
	wG3ZNZM9skBYd6rmtfdejlD0abZN5DJvSq/Vaf526U04l/tNRCC9YS3MhxvPfBbKTN7JoZO7Iwd
	BdJIVf5ndMyeDXK9nT9xWNTbAUg0JGXiva/RINuJ03tpRalhDsVs0Z1LiPGjvX8Jo+Ypn9wp2qN
	9rjCTg/+ea4kLMRd/5Q59Gaa2tPuQmVU7mLmE3SEI8teze3c58mj06kbF0phD8HmWHhloNtesTf
	WITpcc+J8u1vgyIuLMQOGF6NtG0De5nH9WMHiBe1NTs46fsA3EOJTeTyadQkrSdgXw3Z5tX/YjS
	etys/Wg8DHpyz9HyplkILv/XmhJeJsxNnfDAVsvt5TahkUr9Oj4YY9Fmm8ETDjL0pWvYWj4n4ZE
	XboOKRH9Iblq3mD1/7slQhlBgwjKMnMYEClB/s7E=
X-Received: by 2002:a05:600d:82c8:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ba0234eae3mr65549885e9.25.1794329399889;
        Tue, 10 Nov 2026 08:49:59 -0800 (PST)
Message-ID: <17da9887-fde0-44d2-803c-60a551ca85d4@suse.com>
Date: Tue, 10 Nov 2026 17:49:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/39] xen/riscv: add IMSIC vCPU context switch
 handlers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794329400-53CC7B50-4B33F7CA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1411
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.09.2026 18:23, Oleksii Kurochko wrote:
> @@ -342,6 +343,28 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +void cf_check imsic_ctxt_switch_from(struct vcpu *p)
> +{
> +    struct vimsic_state *imsic_state = p->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /*
> +     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
> +     * VS-file bound to a physical CPU, so there is no location to record.
> +     */
> +    if ( !vcpu_guest_file_id(p) )
> +        return;
> +
> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    imsic_state->vsfile_cpu = p->processor;
> +    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> +}
> +
> +void cf_check imsic_ctxt_switch_to(struct vcpu *n)
> +{
> +    /* Nothing to do */
> +}

Unlike most other function attributes, cf_check needs to be present not only
on the definitions, but also ...

> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -96,4 +96,7 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
>  
>  int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
>  
> +void imsic_ctxt_switch_from(struct vcpu *p);
> +void imsic_ctxt_switch_to(struct vcpu *n);

... on the declarations. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

