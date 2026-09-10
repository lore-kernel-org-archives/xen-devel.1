Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D1C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 14:58:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414845.1644540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gDr-0005da-Pw; Thu, 10 Sep 2026 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414845.1644540; Thu, 10 Sep 2026 14:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gDr-0005dT-Mf; Thu, 10 Sep 2026 14:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1414845;
 Thu, 10 Sep 2026 14:57:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4gDr-0005dN-1R
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:57:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gDq-008mlO-EW
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:57:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c561-e002-0a2a0a5209dd-0a2a4509da2e-26
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:57:54 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c572-be1a-0a2a45090019-d155802fc4e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:57:54 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso68768885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 07:57:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e5765152asm26985315e9.11.2026.09.10.07.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 07:57:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1789052274; x=1789657074; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy8euwVDIN40tmvyLupIbsPGljAsnh78O5Pc9qRoD3E=;
        b=GmU/GFdlJpqVWFGGdiaQvP62u+a+QIozpDSY6TvLBkiuolxBDfZ04lbiMGNa20TTYn
         m9gUNnXNqar+TZAEplW+PMIX84luLz/6RhtPUPTfDe3wkl+JrcuPn4SHnYPYOZNjUsNT
         mWvCvmSon+6BvDrxL758TLyVdiZTm4ThXG8ngox19F4q7d86scRDxksb54GojoR75wC/
         kZoYDglyL2Almnd4llh8HY0inbavJUF6rXtNlNinWLWLEZnqc5Njjy6de3Z9eI8wuPby
         B9Xzf/Wmra3I1peD+V9ggJUMLS9r4aqhdYhCsWFeaMrLlwp9Npr+qgS1q3281Mt4nlKy
         zBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052274; x=1789657074;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vy8euwVDIN40tmvyLupIbsPGljAsnh78O5Pc9qRoD3E=;
        b=MajjtAov7xZEqE4x96ivlKKq2truVPxvY3bVotWIsklRghgrq1fx9b3yznIF/dRqCZ
         oG37LHpC/Mvcon8Y2MleRRs4jvJhB3kc7puqiUImrN9f49tfKeMOXMhpd1xMM8ByKahz
         5r4+ecpulv3fr2NvVjl0VCk5rHVdkP0ngxLw7H05dUNJeR81OGLc/RNJASH/Da39zPmR
         QkXUqcM6oKzf8nzb2TawP9OOkUp2Kpx5k+uq0wDQiaeEszzx+8ILaJKDQV8A1PoBQo4A
         8Jdvz9EUG6WjwjzVAZoJh6YlPGNU5hSc8EIfBGU4+rwmA4+oZg3h2THGTvHINvkwsUqL
         /Wrg==
X-Forwarded-Encrypted: i=1; AKwUvByAX0A0KsmwJ/IpExhlLoO1+ITLB1BPPOf6/OQIp+kVcvBh6+kGhUNuBc53Xlj+t/DRYohGsGLYuPs=@lists.xenproject.org
X-Gm-Message-State: AFuF++lGuGRUcJXT9JG6dzVQSInin0IgNWU/AfXd/2CHGXAHy32dKPf+
	kHfR304L8u3YutMQL0G0EY/96lovB4AWAwrv6NR4RrF0wj7ZxyrDSprQZC/WXMDWVA==
X-Gm-Gg: AYBFou01U5ZzRSKpwWwis3GkZ80mEMmC0U8nAh9dsSV8alduRt3FwolivzXXBNADTqr
	Nh1tJlitBFUCfDPZgqF1/oZTC1/fuE2TGyLDSsOSKdvrql5J4Lpf2gocs048JHjCHboHO6agahp
	e/ak+dEtsVZ12TB0PzxPhqCyNUsFk8PNqB2/nWs8AkPXNMztCTvVtXzIZyvCY00/C8pq/Nx5BOR
	7wk3m1Jv0Qcvek7wJP9KwGeM+u716FNEXkJt//X4ICTcaXbbOLxtMQWcUHi3LSDkm/4Xfp5nSaq
	NHQzodIvYBHqfhBK+n/xa0/U32pDgLWmy3sqgTs1/2AYWnxzN5gM51p5UMYmfg3O1yHRbxB5sMQ
	VNrslXjEFSn08CvaqBHQEK4EtFIQShRjFtuMfDrOcgtZulNE13p1ARPs6HulGto0WbUPnD3TuEv
	A3NOfPKX28Zfaq8g6CYcXnXOltMKtOu2j0KvBUKnEHpbbcAVfiyJy9dMxQY/e40QgDcEOCvjn4V
	qvNFK1IWzS7R4yOIDQKPVjWOj768FNXTxd32fiuPkGbLWAsfYIDb/zAdxB6OK6tvyanguac4w==
X-Received: by 2002:a05:600c:c162:b0:49d:16dc:e721 with SMTP id 5b1f17b1804b1-49d16dce7aamr225951745e9.24.1789052273861;
        Thu, 10 Sep 2026 07:57:53 -0700 (PDT)
Message-ID: <9651f59e-b101-4c70-93ae-07f668e85c38@suse.com>
Date: Thu, 10 Sep 2026 16:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/39] xen/riscv: add IMSIC vCPU context switch
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789052274-3AAD8034-574478BD/0/0
X-purgate-type: clean
X-purgate-size: 973

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -422,6 +422,13 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>  static const struct vintc_ops vintc_ops = {
>      .vcpu_init = vcpu_imsic_init,
>      .vcpu_deinit = vcpu_imsic_deinit,
> +    /*
> +     * MSI delivery is the only supported mode: aplic_init() panics on an
> +     * APLIC without an "msi-parent", so the vAPLIC state to save and restore
> +     * is always the IMSIC one.
> +     */
> +    .ctxt_switch_from = imsic_ctxt_switch_from,
> +    .ctxt_switch_to = imsic_ctxt_switch_to,
>  };

As previously expressed, I'm not happy with comments like this. aplic_init()
isn't related to vAPLIC behavior. We're doing virtualization, so at least
conceptually host and guest behavior want properly separating. Then it may
still be that for the time being only a certain subset of possibilities is
supported.

Jan

