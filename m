Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119AFC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:33:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408010.1640760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PMh-0005W1-Ms; Fri, 04 Sep 2026 08:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408010.1640760; Fri, 04 Sep 2026 08:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PMh-0005Vu-J3; Fri, 04 Sep 2026 08:33:39 +0000
Received: by outflank-mailman (input) for mailman id 1408010;
 Fri, 04 Sep 2026 08:33:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2PMg-0005Vo-KX
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:33:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PMf-006AFq-J3
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:33:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8260-bab6-0a2a0a5309dd-0a2a45018810-4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:33:37 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a8261-5984-0a2a45010019-d155802be5c5-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:33:37 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so5714755e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 01:33:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf771e9absm53885825e9.9.2026.09.04.01.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 01:33:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1788510817; x=1789115617; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL1TvCibeZNO0FvOp0VvoyE7y7mH5z6llQijmjUIlsE=;
        b=B/EZAwJMyKZqea7Omlo+ISyVVGF+f5cgr/qNxk7tljCgIy4PjzEadAXB9lVUyfD7gH
         RdD4YBgbND5KrH56ARkuuUY6NXC3h/lYrcxNOoO5GDty/HR/8bxO0Fi1uuG9bUWakDL4
         q3lsrwFM+mrbGuTPBROKdUTXgdFR0VvNftGYF4L8sRoEO8+1wc4Is2vKqquELVu1KlK/
         I4VYW7Ub0frubV1Gov9Vxfmg/EZf8w/IgkimZ15u4SmutlkN84SEhHAc8fW9I2HKzMmW
         ZHwSPeltOkXUU+sszyh8O/s0a4MPCjBB0vEbMspvdruhEIYTQ/ANtxLn2HeiG/IjBCMC
         N4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510817; x=1789115617;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL1TvCibeZNO0FvOp0VvoyE7y7mH5z6llQijmjUIlsE=;
        b=Dsj/N9bNQeLrRmT8xTs7pizAlhTujw60JHpWyngRhsgh20jC/47n/ILBtNlV1E6huc
         3jr3KzkTlFechOxqVPVphJuGBSMlfjhvoBBazaETcSjpy662d1lNJnScFpTbLw6fCWZz
         cHb4B3qNOWhtBob7PDNPZOFnNYiKYM1SspUqbgKdF37QuZL2LzVwiu8TA2AzlMHUVCpn
         0LKNd1CBuK/h26C6B8slpT21A/gOiw0lvgKjuBXidQZWIOgNBI/kxcVhm0s/fun1JcDi
         2WUusH/DxZpeD4Rl4xR/psQvZ6KB8oVQAE0Tq8UjqotL0rT+ZoxA7Nnho5j622XC46kA
         xpUg==
X-Gm-Message-State: AFuF++lt9V4lA8fPbXtF68+WnnUeKmvpuDlwOHURwkA0tNxk+IAPFgTH
	B6NWV107WschRCVadVADvLegvTanUY1lvz7eLvJl9oGphd+uqPyUPAVP0MAQrzkPOA==
X-Gm-Gg: AYBFou30LdQ8f/3EIrlFtPK4EQ+IsnkKfjxVcXnrn/L04qu/a59ipyxChoT7quH6qXl
	CDw0AQMygIYUhM+8U36CkWGEy4yvDjao4laGMCENkFL3Ys/pzfW6U2POYb51p6xORK1r8q0BaBJ
	34KDkQzorRfrqG/IbBUjkUMlpbQVM8Nx5NXJcsRlwfHO+nxZHsFg0SIEm4ue9cRwpCPvNbD2FHZ
	JNiw45T3t83VgwMlB2WUQ6vIushewkGelqnMDaZwhbWn5HZjO3OvvCQ01YOZh0nl6owUEg/Vr7j
	gLPtdXJQS22LBeJdplcNOlnN6MKKwBQbJhV/vKLe9zuAcWxNrXxe/XEzrdIvJM/sHHNy2ZZwtXB
	UutxlAjVEbVfur4/FmupxeTI9WCKBCLie4PTdDFnY6KYFwqIXdpzyH48a0Ltgu/HZKKKMy6qI/B
	WP+cMiawhjAMvqI4115eTtnIrae7TIJGPgSdQ9PeE37O9e8lSi33zjgNumJlSmIMXj1dhhRGbT2
	S9S01rk70dP5YqKIcjpWs7y/mCy7kXZ1ZZSGSto1fAGV0ZJJyiO
X-Received: by 2002:a05:600c:8b29:b0:49c:ee22:364c with SMTP id 5b1f17b1804b1-49cf824743cmr48972775e9.9.1788510816744;
        Fri, 04 Sep 2026 01:33:36 -0700 (PDT)
Message-ID: <879f5184-351e-4f12-947b-d66eef5fee77@suse.com>
Date: Fri, 4 Sep 2026 10:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
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
In-Reply-To: <1788510380.8631fc262581453bbf619ec5b2062170.1a06b86a349000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788510817-BE07B757-C627DF4F/0/0
X-purgate-type: clean
X-purgate-size: 2872

On 04.09.2026 10:26, Baptiste Le Duc wrote:
>> @@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
>>      return rc;
>>  }
>>  
>> +static void save_csr_regs(struct vcpu *vcpu)
>> +{
>> +    /*
>> +     * There is no need to save these CSRs as only hypervisor writes them in
>> +     * restore_csr_regs() and guest can't access them so they shouldn't be
>> +     * stored here. Keep them commented here just for symmetry with the
>> +     * restore CSRs register part.
>> +     *
>> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
>> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
>> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
>> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
>> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
>> +     *
>> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
>> +     */
>> +
>> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
>> +
>> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
>> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
> 
> 
>> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
>> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
>> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
>> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
>> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
>> +}
>> +
>> +static void restore_csr_regs(struct vcpu *vcpu)
>> +{
>> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
>> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
>> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
>> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
>> +
>> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
>> +    csr_write(CSR_VSIE, vcpu->arch.vsie);
> 
> 
>> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
>> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
>> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
>> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
>> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
>> +}
>> +
>> +static void ctxt_switch_from(struct vcpu *p)
> Is it expected to have diverse names for the vcpu arg? Above it's vcpu,
> here it's p (I assume it's for `previous` but I think the _from alone is
> enough to understand) and below it's n. Shouldn't be better to keep the same name?

Context switch code is special, and using p and n can be warranted there.
Everywhere else it should be v, nothing else (and I said so to Oleksii
more than once before). Unless, of course, multiple vCPU-s come into play
at the same time.

Jan

