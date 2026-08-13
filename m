Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC39C5CFEB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 07:29:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389489.1630194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPrx-00004x-LT; Thu, 13 Aug 2026 07:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389489.1630194; Thu, 13 Aug 2026 07:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuPrx-00004q-GW; Thu, 13 Aug 2026 07:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1389489;
 Thu, 13 Aug 2026 07:28:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuPrv-0008WQ-N9
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 07:28:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuPru-00CAmA-Hd
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:28:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d7227-8faa-0a2a0a5109dd-0a2a4506e366-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:28:50 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d7232-195a-0a2a45060019-d1558030c9dc-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 09:28:50 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so2472815e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:28:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5af45fsm4173392f8f.18.2026.08.13.00.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 00:28:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786606130; x=1787210930; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WnKfuhOpN9cEpBpCnJX7qk1wPx4868zb1MjUnE+BZe8=;
        b=CIGqrYt+p6L5/ZyHbekR9B9B7klv2r2Fqp45fMrrofpM4v9ZoH19qDgikekwl/Glm3
         guDnvWxc1VUDNYjXoqge7ebqCBZaIcvV0fkxORR/f9LAJFVmhtfNN1dmUEWYKlVbD8M5
         p6KjP0tTdEFGFN9u6OGb3Le3LYpq5EPYmbLURl7i/4ZdqC0cK2Y3lWa7r7vc38m14t1h
         9ULUOG50q+0+1wuUMhyFeU9BlJOxu+dgpux0VOKhng6/J0/r8x7FehQxcrw097GTQcMC
         Q/STE7e1TuSTmsIK/u4VrkXGjLrF/sMAksF870oPG7l99ZJ7u5X59wdJ//zyN+DlEbW8
         jNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786606130; x=1787210930;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnKfuhOpN9cEpBpCnJX7qk1wPx4868zb1MjUnE+BZe8=;
        b=tJMvpSm2pVAKUIHZ/4SPNzgOLx3IiXDgFE1n3QYqdF5xokrvNsj88fpMPK/PB2c2tT
         QuzELt7lC3QwXab3cmGBRqfqidemq5rZMmb39q4hmQ43ZGsUz2LhpzpSrenzZbanVCyj
         jk12/YGWYlMu462Y+/FphdrF5vxgA/YrbPq3PPit/VkFt2YRrfAs31/Ob1ir+bZ5OnBx
         ktc8OO0Cl0EawaVJQoYQih62D21H3yla1eIuViM0vq2rONIYkKfeyPgleRXbXZAutOQR
         gGZaVCHevLXAqMqWXseR83CF9i1GNRNEcFB3n7LHa61Ntkg/2IGm8bUkiY9hltOubMfe
         B/3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpziUi2b07/KxePtr9lg+qRpHdgI1KBG9hbJyHgQbNZJcAw8sdS2igJE+dwUqYi6pXNjQg/0wMKvpY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLE8uvB5jaUzLdrEqzfHjFoRCsbnBqodCd5vkk7yUwVATaRFWL
	lVz2wml6O8eslGvrf0xMUEPNA7x2MqcITwI1h7XaZOI9I3xRCY2OKiRNJ8QS7Y1zdw==
X-Gm-Gg: AR+sD112IKdW2oBSp8VO97I3I9W4mG9cnx376irgbZyzfNQEZ6KPN3xHNUeNPRHcAvE
	GvtEfd5jUGe/lBulkCMrmFkuyctlwaPudvH0OfDuAAYRWsLViwues/ihDB2c+jI6I9v000Iz9BP
	nrntRzjZqjROe48eHFgmLyyPEKdduiYYLBU49o9p3tvVXexDDSa5iEaU0PxWeQmWzhsWKx/97FF
	wLGHI5EFbciMuPRS3/YARfe6JcvlawDDhCvx6rmX9ZLfbTCq3rzh0TgQ6GGzZD+ft+Kjrc+7SCN
	jzUNyH5I7PS4j928mPY8Wi7WlIdzxl6bAx3d7d/UuBawSoBPMkOhIAOp7dc1If+hnX+7iXvtsf4
	2MppzKWgdAF9dcHBuqfXywet2ShsMBcKJPb+8YBo00l7gSMMBNBnWxTqsC5V6JXTb8+0wo3QpBw
	0XwbeFItPXcyr6DHEi2iJHOe3QkPyPone+Vlle0uLAEXwHaJztqIL2QgPrS8ZSgLGT2s0ud3nwM
	IEdeRE+loRBSMM+omWHXH1brB6uGmsoOajuVsy8eNDHO/XZIIZD
X-Received: by 2002:a05:600c:1c24:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-49982206f28mr44422525e9.18.1786606129910;
        Thu, 13 Aug 2026 00:28:49 -0700 (PDT)
Message-ID: <20a4599a-f14e-4c7f-a765-52c1ab667516@suse.com>
Date: Thu, 13 Aug 2026 09:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/17] xen/riscv: add guest load emulation for trapped
 MMIO accesses
From: Jan Beulich <jbeulich@suse.com>
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
 <9b18a20367754605efd6a6b5bf09d4483d9c3ab2.1784560663.git.oleksii.kurochko@gmail.com>
 <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
Content-Language: en-US
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
In-Reply-To: <7a2e46da-5b1f-448e-aba3-7eefe0a61950@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786606130-F460277B-6FD9AA58/0/0
X-purgate-type: clean
X-purgate-size: 2032

On 13.08.2026 09:15, Jan Beulich wrote:
> On 29.07.2026 15:40, Oleksii Kurochko wrote:
>>  static int emulate_load(unsigned long fault_addr, unsigned long htinst)
>>  {
>> -    return -EOPNOTSUPP;
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
>> +    mmio_info_t info = { .is_write = false };
>> +    unsigned long insn;
>> +    unsigned int shift = 0, len, insn_len;
>> +    bool is_unsigned = false;
>> +    int rc;
>> +
>> +    if ( decode_trapped_insn(htinst, &insn, &insn_len) )
>> +        return 0;
>> +
>> +    /* Decode length of MMIO and whether it is a sign- or zero-extending load */
>> +    if ( (insn & INSN_MASK_LB) == INSN_MATCH_LB )
>> +        len = 1;
>> +    else if ( (insn & INSN_MASK_LBU) == INSN_MATCH_LBU )
>> +    {
>> +        len = 1;
>> +        is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LH) == INSN_MATCH_LH )
>> +        len = 2;
>> +    else if ( (insn & INSN_MASK_LHU) == INSN_MATCH_LHU )
>> +    {
>> +        len = 2;
>> +        is_unsigned = true;
>> +    }
>> +    else if ( (insn & INSN_MASK_LW) == INSN_MATCH_LW )
>> +        len = 4;
> 
> Already up to here this demonstrates a weakness of the INSN_MASK_*
> set of #define-s (which I similarly observe in binutils, and I expect it
> all has the same questionable origin). All INSN_MASK_L* and INSN_MASK_FL*
> (also INSN_MASK_S* and INSN_MASK_FS*) are identical, allowing for a nice
> switch() to be used here in principle. That said, with access width
> nicely encoded in FUNCT3, it's not even clear whether a switch() would
> end up being needed / efficient.
> 
> Otoh none of these masks cover the pseudoinsns that htinst may supply.
> 
> Further, what about A-extension insns? Some (if not all) of them can
> plausibly be used on MMIO, I think.

Because of the further additions that are going to be needed, may I also
suggest to consider putting emulation code in its own file (emulate.c
perhaps), rather than directly in traps.c?

Jan

