Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E6606A320
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RiwGYkbu
Received: from list by lists.xenproject.org with outflank-mailman.1463357.1674246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4c5-0005Ff-2e; Wed, 28 Oct 2026 14:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463357.1674246; Wed, 28 Oct 2026 14:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4c4-0005FW-Vv; Wed, 28 Oct 2026 14:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1463357;
 Wed, 28 Oct 2026 14:26:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM4c3-0005FN-OX
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4c2-007Ion-Pz
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:26:46 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae20614-2eae-0a2a0a5409dd-0a2a4506a74c-30
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:26:46 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae20626-195a-0a2a45060019-d155dd29dd6d-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:26:46 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so808055f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 07:26:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd47basm31456080f8f.32.2026.10.28.07.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 07:26:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1793197606; x=1793802406; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hs+VEOdUNLzlW8kuG1J2791RhboW1NlX6I/i0/VZM8I=;
        b=RiwGYkbulNeSUvRbaOYpYda6KM/XhBMPZOhcnnHGuYNCtUrd5K5R86B4k/u1i3ObeQ
         /C0Glr+xzD5sfB+iunob1RFVw2Xz9UPLDCm9gj3mSrkNH4EZxvN5ZJ842vPE6Sp2RrLI
         ynkMlRZoQROF87kOkGttcda+chSJfRSYPIhV38wO8cd0w2hyAu0AWMSNDDf+XtO5kx/A
         6+ollQ2cEtBY93zlx/RL+TpTQKN+/K8JcbB55tK4R705TsSNw8o+LRjlWYeC1dtH5xAR
         QAv9G/RVLlAAe5bMrphufxR3vi9cznT/aWeAHj1q0Ryew8DfEfK+8iXSbjOG1odJ4rlb
         XUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197606; x=1793802406;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hs+VEOdUNLzlW8kuG1J2791RhboW1NlX6I/i0/VZM8I=;
        b=1qYSpGAJEqjUcaDtzyExqiwG1j1uM1V+Cr32LP14xRGOZ5o7dYCvCEB0fTfoQEYYeJ
         KwhJnafjiTyrNVJpF8WxolJ6qmaCAeHlSCDbQpy2P7nxYSBaYDAtq17Kjm10Oc0q8PqA
         4PieJ3S+Bpu5J0I7I5g/3aaZnpCGNDVstw5ode2/6rD+9eOcQ16wWDdLSD3JVmfJliEe
         vqv+sQLM5sKY4OiXg4EmQ/KPpwwxvQH61jXpULT2Ict/l4TGoo+AFumYXNwLAyOP23jO
         zPU9Ccb1ptv27UPUtakpJdyBbCMQkpf26nnWhkSVWmghhp5/yFAVsBTuTmNM7NVDaK5z
         Orug==
X-Forwarded-Encrypted: i=1; AKwUvBxtpPupAzWeaC3hb0A5NFJ/HBkR3JqN3s1558wfvFgp+dFWNJISl4ZNNk8gN3hS4IYllBgs/m+QH9M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIX3zdG17OP3Tebwf2LuVuOlu5oRxpd91SAbfKfDfOLj8mYD7HK
	4DXhjC+4wrpf49hB8PI3moPkalHMUDZHPnrO0VupVI1G1vRpQUscbFQn9onXUZeiWg==
X-Gm-Gg: AYBFou1tayY5TeZJNHFHhgO4VzdaAebML7ltmPX/WPAOINjtacUlux9/no332KZkjHo
	OIa5o/oqeU9bjsvbV0EpydBre/VEtGvXQK8JrOl69rHCSpbU7Jub+c8rJag2Y66dfvpGohITF9g
	fwHX5+AYwGxusMepE5/uYGHBGIB5DbwhYyzdKSSb/SYmKQfh+G9xsaD0fhoZG0gYSIMwv84HUjw
	fzSaC8+Mumr3EnhwDXEYzSc9AoK1PjQz5b7NKDMT1rxkSpLZFQkRoIYDjSb8jv/mjbdOvid33s5
	7G+EcCoR88PNFk382+PJCS3RJEl+oHolugtt2GSpHwx463KH3lTp5Y+v/QXdotmVuYbI4oFxWW4
	/0qXoircf3jVlyibEf5GHxo+AmA9Avc+itRUq1QunVWihnRWNhwGgNww4U5UKUqgJ3mLP1DDPDK
	HoMXEWHW+JEhAxWmd3CFvFEGsPVp2bllZyUh1cIJ8p0I4lPQjZI5BZAbO09Vgfoq3Dy7yVzDYK/
	ZgwC1sQ8TmJCnLVFYhOxu1SMRyOZtP6X6Qrzv2oozat5nbGG/SyEKXREoWFEIYB3xOB2ozXNqMO
	YW8MsbD2z6hfjvlJQA2qngIf/WxKsp4Mc37xBU3jJLYAZUGrNdnqUM2V/iPkc5Lql2Bz1SDildC
	rWU3rZX9xLtSZ/XdO
X-Received: by 2002:a05:6000:1449:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-48e5d5a4385mr5818050f8f.32.1793197605977;
        Wed, 28 Oct 2026 07:26:45 -0700 (PDT)
Message-ID: <56a5e051-b8f5-440e-bde6-604dbe575991@suse.com>
Date: Wed, 28 Oct 2026 15:26:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
 <19bc2130-aa66-495e-8f43-b1ce263142fe@gmail.com>
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
In-Reply-To: <19bc2130-aa66-495e-8f43-b1ce263142fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793197606-1FACA77B-16278B3F/10/78276251493
X-purgate-type: spam
X-purgate-size: 2256
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 15:21, Oleksii Kurochko wrote:
> 
> 
> On 10/28/26 2:05 PM, Baptiste Le Duc wrote:
>> p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
>> RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.
>>
>> The privileged spec allows exactly two schemes for updating the PTE A and D
>> bits: hardware sets them on access and on write, or accessing a page whose
>> A and/or D bit is clear raises a page fault so that software can set them
>> (ratified as Svade). Every implementation uses one of them, but platforms
>> designed before Svade and Svadu were ratified, such as the HiFive Premier
>> P550, may advertise neither.
>>
>> Trust the device tree when it advertises Svade and/or Svadu, as for any
>> other extension. When it advertises neither, probe the scheme in effect
>> and record the matching extension in riscv_isa, so that such device trees
>> can be used as-is, and warn naming the extension to add to "riscv,isa".
>>
>> Introduce probe_hw_ad_update(): alias the first page of the Xen image
>> read-only through the FIX_MISC fixmap slot with its A and D bits clear,
>> then load from it under an exception table fixup. Hardware updating is in
>> effect if the load completes and the A bit is then set. The probe fails
>> otherwise, whether the load faults or completes leaving the A bit clear.
>> The A bit being set by a speculative access still implies Svadu, as Svade
>> only allows A to be set by software.
>>
>> Add Svadu to the known ISA extensions so it can be told apart from Svade.
>> The comment above the enum asks for new extensions to go at the bottom to
>> avoid shuffling, a leftover from Linux where the IDs were macros with
>> explicit values. Nothing depends on the enum values, so have the comment
>> say that multi-letter extensions follow the order of riscv_isa_ext[].
>>
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes since v9:
> 
> Nit: something wrong with version numbering. (in the case of v11 would 
> be nice to fix).
> 
> Changes itself LGTM:
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


