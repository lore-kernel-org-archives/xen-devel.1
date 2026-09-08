Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54BC79FA0
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 08:44:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411185.1641890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rR9-0007dP-8j; Tue, 08 Sep 2026 08:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411185.1641890; Tue, 08 Sep 2026 08:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3rR9-0007dI-4O; Tue, 08 Sep 2026 08:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1411185;
 Tue, 08 Sep 2026 08:44:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3rR8-0007dC-3e
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 08:44:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3rR7-00CTI5-4j
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 10:44:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fcadc-bab6-0a2a0a5309dd-0a2a450aa97a-4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 10:44:12 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9fcadc-f2d2-0a2a450a0019-d155dd31b1dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 10:44:12 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-484374f54d0so2762223f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 01:44:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588392b3esm39542898f8f.12.2026.09.08.01.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 01:44:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1788857052; x=1789461852; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAoilZe4XuyKlFsnA3IuQchtDpRbFQCE7Y4noXN962g=;
        b=OBv1r/Xh2hC1pAEENJI7KadQp3dFSB+AhCiwjIwQUvl4tqiU+xispmQD1Mt5fj4YSP
         OavZDQq3n8WHe1pKmjiKdehiHYw1awxHIQnHWoW5Q0P8WVmh39aIKDn9cYjJ3TR6G6eX
         Ve78l6hVTWzxeG4QMhvfarxox1zMKLEEfsp/qMMtI6up/2DGB0OluZDpPY+yw5WJhaCO
         7MbTURD9j0nMHbQMIU50aFRNztjeaHMR4Xmwl/nLmyz5oGg4QKFig2pTRTXE2HRK5g1J
         9EpVTU9hPTemkXob6URJ78/tUGBkQex0joMoDiHF0O7GXEkni5SH9w8ioUMGi9gYzMVg
         rpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857052; x=1789461852;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAoilZe4XuyKlFsnA3IuQchtDpRbFQCE7Y4noXN962g=;
        b=enLBSrsDox91N9lj4oy1+sKy5zwGmSeWA8V9C6dpDmldGmXdiijllN1gv1LVFUZm+j
         rTsPC+hQop3pBJYKPbU/jdf4cnrD+h5sGWAVyvieVrTylsxYM2G91d6fmNOq7xZ30KDN
         YgYrqnB6zYthC4c2CpavcWSuqjePpEeMRjl0Xf6QvrSYBdwJAbBimYCUHkqSIpT38HAQ
         CKeD694t6RPjOKuKREa9N9QDlcxCzmK3i5GeHRIH0/wwQH9tc4cWef4xLKCU44/JMFcy
         rPqKvOMMVAKzGoMMzrCjEsDG4YQsLcgS0h6iApYG/0lTNEN8UhtUyOiM9N/XcrD2VuN6
         G4yg==
X-Forwarded-Encrypted: i=1; AKwUvBxHoT4OhmyNpHyKUIfjGr7X/87gtiy9kF6oUHB+kQydpop2a+qXnOaiQJH99JLXYxsUZ1nPmtioBkQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nR3YrbIuFkYbHvGb68qwWQgzZVHnx1u2xhTQaTZuQRdjNoJN/t
	B4yveBec2XZE5DRMwPUL6lhmw4G5PIM/6QNqBuQnya1eB5BoV/kTVaA6v+zPKKrYQg==
X-Gm-Gg: AYBFou3wM9y0ophzIWmAzyXCh/5c+SFXTXj45EgcEOf5m4vUvUp9v9og5Xlqb5yDenc
	dSHkBZapTz8SiTW4uhFFKG9PHpaGAUYp/MBlce6wYDAsJcacJxQPyyql1vb8rc5yU3+KP3lK+Y2
	lk+oE9U8Kj13rZBAhl2PxX7dVq8tEpx6c72akhr1Ji3guKfobRCrjV261iuPXw8LbVBWoUGRZ6Y
	rmiP4WNlWyPK69GCJJAVyVWHnp7QVpzNvLy8Ne2L37L12HKDLRshbAlKiRuPWlmbwvpcl/Kqnht
	sThagoY5l1BfP15WQMXsXamLgocJfZ540dfdkHvDN6rE6M76lD7ZBedfGXS8RdCcavADgyyffVv
	vtso8dgGQBrPG8j0Rx/CkJrBF9LJ37Xht08g4RP6bUJoPsvmXnmNVvaky/rWOg0vBsiBql2EKxi
	Oye9EGk9+iMbcIEu2KBHMrWMNwR/MIKcAO1bOCSPNhtKpFTvrP6zJX3mYpQVVoCRoV7t/aFUl/n
	CioRrR3bqmmGEiyDyXnMfgUXDQERhWTVDN5HYAqxQZGI7ofh9xloPSC4hg+Efo=
X-Received: by 2002:a05:6000:420d:b0:485:8ebb:be1a with SMTP id ffacd0b85a97d-4858ebbbee4mr46152477f8f.4.1788857052213;
        Tue, 08 Sep 2026 01:44:12 -0700 (PDT)
Message-ID: <8fbc99b1-d98b-4f52-b9ea-bd84e8bfa2ca@suse.com>
Date: Tue, 8 Sep 2026 10:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Intercept CR0 writes selectively
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260904122330.306936-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260904122330.306936-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788857052-4B8D5CFC-6E57ACC9/0/0
X-purgate-type: clean
X-purgate-size: 1266

On 04.09.2026 14:23, Ross Lagerwall wrote:
> @@ -2517,6 +2518,7 @@ void asmlinkage svm_vmexit_handler(void)
>      hvm_sanitize_regs_fields(
>          regs, !(vmcb_get_efer(vmcb) & EFER_LMA) || !(vmcb->cs.l));
>  
> +    v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
>      v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
>      if ( paging_mode_hap(v->domain) )
>          v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);

gitlab-CI says no to this patch [1], and I think it's the change above which
gets in the way of running guests in shadow mode (as is the case for the two
qemu-smoke-x86_64-*-pvh tests). svm_update_guest_cr() has

        value = v->arch.hvm.guest_cr[0];
        if ( paging_mode_shadow(v->domain) )
            value |= X86_CR0_PG | X86_CR0_WP;
        vmcb_set_cr0(vmcb, value);

i.e. upon reading back the guest's CR0 value we would wrongly record it
having PG (and WP) enabled, at which point shadow code would try to use the
still-zero CR3 as page table base. I think values need merging here, with
only TS and MP taken from what vmcb_get_cr0() returns.

The zen2-* failure in [1] is, I think, unrelated.

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2828369624

