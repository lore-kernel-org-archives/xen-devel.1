Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C908EC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:36:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393672.1632485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFIP-0004j3-1H; Tue, 18 Aug 2026 08:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393672.1632485; Tue, 18 Aug 2026 08:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFIO-0004iw-Uh; Tue, 18 Aug 2026 08:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1393672;
 Tue, 18 Aug 2026 08:35:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwFIN-0004iq-0N
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:35:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFIM-008HXl-9A
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:35:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84192f-bab6-0a2a0a5309dd-0a2a4503cdb8-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:35:42 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84195e-fae8-0a2a45030019-d155802ca4a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:35:42 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4994c49f588so8056695e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:35:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777a4bdsm246461745e9.0.2026.08.18.01.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:35:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1787042141; x=1787646941; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5Sd4O06hDffRwPc1COMU+YEsbVDiujwTLscAEleQBE=;
        b=KWPBHij4ugu5oHxzFsj8zuM4b9bwNV19d5MZr3fblLsoLWrZDOvlDzCdnwuWRc7aF+
         FsNMCrNT4mhKPD1vc/23cR8R5TqcfD7EltqpUGGhIaZhOqCp8aNky2UqVVrIP0Pa769T
         uOYnqbuTO6d21H2Unu8YO7coEV7U7UiJemZ3JQcpcm6RKVBIbFfAb/XklM3vYH46X3TP
         HeZd/5TgX4rZsho2dQeMzMGR0lWbSEWr9JjdSJKQjzUSqszJxRj2frZeMPYK3XinBuO1
         7FTRg6kHwcP2IRhNvQntTKNHOLsVL9Nwutwqe6UJtfQN/pOKd5MUx+8xh9D2++QjHZ4v
         12hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042141; x=1787646941;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5Sd4O06hDffRwPc1COMU+YEsbVDiujwTLscAEleQBE=;
        b=OjivArEDiLuZ1PJgn7MJnJ2Cz57+FtkD2NuORWtgskf5yzlcdrF0TWe/tBl1f750K5
         /IFOIGC7veqPVzFlmhhrUjWHNspUquESoXXyFnktSXutzjionGKWQsHx6ooCvwVHins/
         ObVnfi4BdqI9rV8ZY/uleiTwH9wzul+DqTdb4XSzjzSIxSciV9sYlU7TDnkGQZkgq1lH
         ntU1jnc6IUvwmhUuO9S9fw2/E2XdEpcyKvdnPl67jHt64UG4x4LHk83eQ8xgJQjnknYf
         MfwNMmlo9YnUDI4dINnaK18eADbHiA0SKGyFndM18nLigA0lsUBLEzokvsXiErqzytHA
         WXRQ==
X-Forwarded-Encrypted: i=1; AHgh+RreGBD1+XVYXD0KfyKoOk6sgpEN9vW+BGfSgzINgusV8zexKf7BDb7Gv8aKXa9OIXUBRhRWm0DX+vM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpVw4CIY02tv3VGEF+iEZ1fbeGbGRUKQpc7EzR/z0o2c+FyscW
	PPAdLhnTK9wTDFi9XQduLAwhQmQMpSpgOjSQfnowuIMkU97lcqnbiBZmd3nzkncbeg==
X-Gm-Gg: AR+sD11WYod3+hWCZr/ntyUNtYgq+fzxc8VV2DcQsi040oJg1GvOZxDhjZn5TEhJad+
	YX5myKI9kbDc/1V8fGqHttdVTqgpuHCmdBzqjlyEJK37bSkL9DvhSDwxL6R0P8U1V9u/VX/DN+8
	P8jOnJvchCP7+/fcXEacI3eh9ekVtlYdQIWu+I/wnivym5N90eiRNxgpB4xEe7AcjebNl25+CI7
	untNEfNjw3AkJzPYirxzo8b1GgP9BJ05Bz3xWayM8BQvBCoj/j/NXwHW4cq3wna+l1c0wXJpy8m
	8OIcDitVx5r2fGNFJRZnLgupd+qfmr8ZKYdMgHJACs6ItMS2q2zJOfBeBFQWZV2td2LvOKWuEae
	UcxOaBwUCygSberkT3X7A4abzRV2jrUOkglQ3aAgIfqnfB5U6LFzJ6G6vityKdz4lMqHlShcITS
	eWkRe1z2lUm9iyKjYwnr83KV+p803/mBFheZ8Kv9cd3Ks70WJq14P4taTI/pppp4+XbOGPdLqNQ
	KFK5oVq/HR8FFXqqRLTTPowu7fmUbftz91YBfjiBd5lFhvmZ1dz
X-Received: by 2002:a05:600c:34c7:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-499a05ac869mr95670705e9.0.1787042141514;
        Tue, 18 Aug 2026 01:35:41 -0700 (PDT)
Message-ID: <331a3b8e-7846-42c7-b1f4-8e4951b8e84b@suse.com>
Date: Tue, 18 Aug 2026 10:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/17] xen/riscv: implement trap redirection to a guest
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <8b14a7926e42c7e3308dc7f730334fed56210d81.1784560663.git.oleksii.kurochko@gmail.com>
 <f3ca2cf9-49b9-4515-b634-6de4ae9614ce@suse.com>
 <41c9717f-6083-4669-8e60-20a023c3ae8f@gmail.com>
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
In-Reply-To: <41c9717f-6083-4669-8e60-20a023c3ae8f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787042142-6D6D64E9-FB56CC0A/0/0
X-purgate-type: clean
X-purgate-size: 2200

On 18.08.2026 09:47, Oleksii Kurochko wrote:
> On 8/12/26 6:03 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> Some traps taken by Xen on behalf of a guest can't or shouldn't be
>>> handled by the hypervisor and must be forwarded to the guest's own
>>> S-mode exception handler instead: e.g. when riscv_vcpu_unpriv_read()
>>> faults while accessing guest memory, or when emulation hits a condition
>>> only the guest kernel can resolve.
>>
>> Is the plan to use riscv_vcpu_unpriv_read() also for reading hypercall
>> buffers?
> 
> Yes, it could also be used to read hypercall buffers, but I don't think 
> it's the best option, as hypercall buffers could be larger than 8 bytes 
> (which is the size supported by the `hlv` instruction on the RV64 
> platform). For that case, I think it would be better to map the Xen page 
> corresponding to the GVA of the hypercall buffer and then use the usual 
> memcpy(). So, basically, use copy_guest() on RISC-V for that purpose.
> 
> 
>> In that case trap redirection shouldn't come into play.
> 
> It isn't mandatory to perform a redirection in the case of 
> riscv_vcpu_unpriv_read(), so if trap redirection shouldn't happen for 
> hypercall buffers, then the caller of riscv_vcpu_unpriv_read() needs to 
> handle that properly by checking utrap.cause. Something like:
> 
> ```
>      *insn = riscv_vcpu_unpriv_read(true, regs->sepc, &utrap);
>      if ( utrap.scause )
>      {
>          ...
>          utrap.sepc = regs->sepc;
>          utrap.stval = utrap.sepc;
> 
>          riscv_vcpu_trap_redirect(&utrap);
> 
>          return true;
>      }
> ```
> 
> So, if this cannot happen in the case of a hypercall buffer, then we 
> need to return -EFAULT in the if ( utrap.scause ) case.
> 
> I don't think I understand why redirection shouldn't come into play. Do 
> you mean that the hypercall buffer will always be available, and that it 
> is impossible for the hlv instruction to fail, so there is no point in 
> handling redirection at all in this case?

Failure to access a hypercall buffer should result in a -EFAULT return
value, not in any kind of exception.

Jan

