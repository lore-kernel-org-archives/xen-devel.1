Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F133CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:15:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446926.1663052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZXT-0000Dc-Gv; Tue, 13 Oct 2026 10:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446926.1663052; Tue, 13 Oct 2026 10:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZXT-0000DV-EL; Tue, 13 Oct 2026 10:15:19 +0000
Received: by outflank-mailman (input) for mailman id 1446926;
 Tue, 13 Oct 2026 10:15:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZXS-0000DP-2k
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:15:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZXQ-007QAL-S2
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:15:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace04ad-bab6-0a2a0a5309dd-0a2a45099286-34
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:15:16 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace04b4-be1a-0a2a45090019-d155dd29d885-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:15:16 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c4649b3aaso1692601f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:15:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bd1843sm4348125f8f.56.2026.10.13.03.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:15:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1791886516; x=1792491316; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFLOUoM6CJfDZd3355UbFK/8c2q4q7/qRFAfODAgJ+I=;
        b=cNQzaXXIFHcVHle+8GXJROBFTEjIbhyw8TFjxJeat7u9xDog2k27jolBdsWsTNFUP2
         6wk9m9oQorFQdSnc9faJFz+IUAoTpPG9JX1m4PkfoP61j+9lhRZAJz9PVxzno2g5fQS7
         Ufb1I0FE2xTonglQp5Xma8OLja5wajLe+UOWvlv5xvRLRQqPpDYR+Aw8peFEi59K2z6W
         SGE6yJTUR/PAwDo4y3RS2PodfNHcYnsJkwTnopAMQTSDPmbIPgLHPmOuNXbYJe50VEAD
         eJkXjospgTxIJ5GvAvPcAb7UHIaSApCLe8MvAMreoQHkK1wrs0cd2EjRYJGecvpPY7V6
         jPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886516; x=1792491316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFLOUoM6CJfDZd3355UbFK/8c2q4q7/qRFAfODAgJ+I=;
        b=fYTga29PtqSvUcrT3a4U7/H3n3epog5qCngplG4/b+yzX5XmMmBS0hfTE/dmu/kpED
         ZJlCwJ5pbDTLYjQTAd+ihZFBM274ydTram1GX2bFaEVzmUPDH0nTQfTtT0cp3bTCCman
         2ScmwQpExCyZjEKhzzlIFPv9nHhKtyjARpO6H/sjyCwJHamXLOFRSQw8kHcFNuiUam5I
         JmquP0LwS80w+hD6rxgFZ1nuKkqOmjaTiEYTJLRzRlN7b2u90Mu7bPwAoYjUeAL+h/Ss
         j0raVDLLaCjDSjoBb5y4d9TXNF092Sl3i8wj3R/zws+SAD8TRiWPjcNuxT2qqkvy6/Ds
         1dHw==
X-Forwarded-Encrypted: i=1; AKwUvBw2LWdKgZ1y+f5XzpdJ5fQjNcR6+8q2JU/DCrxspCy0Up+PIz2z0ELutZ7PzjFQY49qI6rXV2vAtDo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKXf0y5KgktnNp+OMboZ091renDU7ZNc2Ol4jqTHtGV7YhFvPXc
	9hfQgLdEFPHKZF7kGCP5OAw4men5b9spQ7amJvfe6EtW04okpW9VaT3bhiPAQ3L9Fg==
X-Gm-Gg: AYBFou3GFhykXeuV/r056MxaqTlNzlDGr+/SYM2gBKyXy9WD/HjCs/GDK8hkMHuo7o9
	FKyQv/xVVOKqKlYSdIR9HxtXac+tGnep8JZTlNjpIyH1vXUsTNpStKlmV+zv5y0p/q6978PYq0Q
	J/TAuUBqj0xlPIrZHNXfbOV/NMEl4cTKalnvHp3EseFPPGwKreiAPh46+fTsXd7VWddc5LqFHGM
	cU8DdWyqiD9oMIveDZ3680EjMhP1zTtchvWVy8eJROUeU4SpvD2w/F5tcwiZ9MrokyQNsWgpH3q
	maXqV/G7QhVuZQ2eF0Jz3K2EZw1nSP0kzp51Aio3glk9u426599Zn5horW1K/Cp3JIIQQhzwajW
	V1s/A1sUKArp7DyCWgrdJSpMEdDkh6ZfQF1DH5VZ8JEkwmT6JWT5pEJsxTBdafx42JVmGEEF9Ne
	vIZHzywEtegYm/kwG7NuiIhMwUQvq1lbmTyqp3ssi2GU9XjDwqJpmklm9JLXyGJEpAnEzbjQwi7
	eK322o6tDyRtdsrnDORataM0zX+SizV/3qnKvI0Sp8cubfqwMLglUfu8JUrag==
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr22077884f8f.52.1791886516131;
        Tue, 13 Oct 2026 03:15:16 -0700 (PDT)
Message-ID: <d873b3ec-a0fc-4acf-bd25-8cd9dd27dee6@suse.com>
Date: Tue, 13 Oct 2026 12:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] nestedsvm: Adjust L2's DR intercept when
 adjusting L1
To: chunjie.zhu@citrix.com, ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
 <9b6e4ec9a5fd34db2071adcf8e73b0c50a1528aa.1791625578.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <9b6e4ec9a5fd34db2071adcf8e73b0c50a1528aa.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791886516-BC6CA034-40DA2FAD/10/78276251493
X-purgate-type: spam
X-purgate-size: 1257

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> If L2 accesses a debug register (like reading DR7) without L1 intercepting
> it, it locks up the vCPU. L0 intercepts VMEXIT_DR7_READ, which disables
> the intercept for L1 and then restarts L2 which re-executes the
> instruction and then this repeats indefinitely.
> 
> Disable the intercept for the current VMCB if in guest mode to reflect
> what would happen if the VMCB were recreated via
> nsvm_vmcb_prepare4vmrun().
> 
> Fixes: a59a7be91b61 ("nestedsvm: fix DRn handling")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Andrew's comment [1] was left unaddressed. Comments on earlier versions
should be dealt with, one way or another, before re-submitting.

Jan

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1657,6 +1657,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
>  
>      TRACE(TRC_HVM_DR_WRITE);
>      __restore_debug_registers(vmcb, v);
> +    if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
> +        vmcb_set_dr_intercepts(v->arch.hvm.svm.vmcb, 0);
>  }
>  
>  static int cf_check svm_msr_read_intercept(


