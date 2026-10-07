Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4698CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:45:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442154.1659710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP8p-0002RA-7F; Wed, 07 Oct 2026 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442154.1659710; Wed, 07 Oct 2026 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP8p-0002R3-4F; Wed, 07 Oct 2026 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1442154;
 Wed, 07 Oct 2026 10:44:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEP8o-0002Qx-82
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:44:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEP8n-00HQBU-L9
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:44:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6229e-2eae-0a2a0a5409dd-0a2a450abbe2-14
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:44:53 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac622a5-f2d2-0a2a450a0019-d155dd2edd77-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:44:53 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so3343259f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 03:44:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71c0b708sm4185375f8f.12.2026.10.07.03.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:44:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1791369893; x=1791974693; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jALpHFmm/OFAU5+//4GxIdjSbZ+7OUdEp+033IIftcs=;
        b=B/McBp0ocT9mYMj5nZ1sIakem8o1jRlc4Ao6bVFVhQAyYZIPq0BUDnE+iALYVx+WFT
         p2hQ6MGnmaNIKViZHwwfwDWX2KN3Y93ARkaitFnLKtxULw6CpfRksKqe4KixNJn5ZJsy
         VG/vQYB3llpA0YKtRnSLo3G3sLTQHWKLVrebVtsNaJf+cSZtfRIQe+SlSRxez1PbvSIJ
         FRmmdPy6ZFSSKxtaxb3x4C+XH1uxyZ47luIJ9gqy5vwvTINazlGi3zOix+GUHh5KNU/I
         6zg2Vrem/gfCXtTKwMZwWexv9VNV0poEFA6UQeNv+ZAcb553yDvraXSoaI9J6Ydz3fvZ
         EnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791369893; x=1791974693;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jALpHFmm/OFAU5+//4GxIdjSbZ+7OUdEp+033IIftcs=;
        b=lUfCSuWymZjyQcKlZdEVkDQ1zmgK2EsjiticG9+hfH9CeOUNphlUE92ArECLdEmz/3
         iis6o4qvnMTIheyQ/VvfzkbWOPQZGh62XiJVrAyDKiftbY8dA1B6X+MxhVdAQ4jIrSgA
         kyGoh5T96/3JYkde/Cnp6S/KuWhNQZiO5nLg2F1uFbZG4XknuolDenVMDtwUzuhX+ATP
         2PeXW6UxCRy/DKOor0ISs2Rv4ac855R6qlMCZMTW9oRmDPaGLEe71dR3V9VTUf+ND5QL
         SOEbcxSzXnOJqprco2NIxgy0nUAcsK9ETE2AQvq7euv1+OYInt40ysifMTlc/sKGChcw
         Nq5w==
X-Forwarded-Encrypted: i=1; AKwUvByD367JTv2leSCL01seyKGYYI1QiCCBnFNMDc45E4PgQ/R8DZmjhT0Ybdfp35TRLO7tQzeVZJTTT6I=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJJnOj0W2oqCXdnxUL7MwcYm9kDFSnvBmEsyXe4I3h2fuiQKoKh
	7CgdfTxk8o0ncQAE7cQH/l8rcqzwNWpQViua3otO57grUiuoE4XSiA8CiE8CI7Wyaw==
X-Gm-Gg: AYBFou133Pt16rET63XmW0WlIyxj1ZQ6Vhw9rybrI13wEvZgqIQZnpxvm815ZyRNVUS
	c3warIsG9Xwu3kPiDd5kqOS9GOqpHzJbSsJ/sL7PZ4iC4711rxTz1iWZy0Aay2T7bc426DjlOBB
	qAN9NOhYkEkg5hLQZGvU3GY4rePKvJ+XbQhfimpcKvlgXLKq7gQVOzto+hjz4oHTQ/L2UYElZFU
	j7A3H/I+mj68pqbD5VV0mo2F06CjSqSkcEejdK28xNUGvrz/Ehq2ZIIwo3dA0T8Gd25RGmWkz+A
	7FGKXg8ZvIBHyYvufI0naqVxNfXZEmCCSuseRPcN6Hbwj4V6o6NjWV9t7vnF5OTtB71NRWk8nnG
	wVSTJ9iCEQQ7kkOfFAj1u8b/THcNW3WwFcF2uEm0nxokVPaKsNhM4ed3p4CA6hPL/DFsQVIyAnS
	LyEuFGRcimukYqnyoITvOxtabnKwrPgNolCXUjNS58F0fCHkaLXSG2aFFofC+Q0JcMjM1V1LEE+
	XOgIB/1Bu1OT5B1VxDHi1fXMrGI6tyFArdjvkbBC63j8M+mdbSXYYMu8JIfLFiqyv1NerN7
X-Received: by 2002:a5d:484f:0:b0:48b:12f:50da with SMTP id ffacd0b85a97d-48c7277c64amr2878088f8f.23.1791369892847;
        Wed, 07 Oct 2026 03:44:52 -0700 (PDT)
Message-ID: <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
Date: Wed, 7 Oct 2026 12:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
 <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
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
In-Reply-To: <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1791369893-593C4CFC-7282BDCE/10/78276251493
X-purgate-type: spam
X-purgate-size: 5429

On 07.10.2026 12:03, Oleksii Kurochko wrote:
> On 10/6/26 5:20 PM, Jan Beulich wrote:
>> On 05.10.2026 18:00, Baptiste Le Duc wrote:
>>> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>>>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>>>      2) Generate a page fault when 'A' and/or 'D' is clear, so that software
>>>         can set them (ratified as Svade).
>>>
>>> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
>>> advertises Svade.
> 
> According to the code it seems like it is setting A/D bits always 
> independently on what is DT file.  Baptiste, am I missing something?
> 
>   Platforms that use scheme (2) without advertising Svade,
>>> such as the HiFive Premier P550, then hit guest-page faults that Xen does
>>> not handle.
>>
>> Is that a quirk then (to avoid the word "bug")? Since it's all DT that
>> conveys available ISA information, why can't the DT for those systems
>> simply be fixed? Depending on the answer here I might question the
>> presence of the Fixes: tag below.
> 
> I think it can at some point. Let me clarify why "at some point"...
> 
> So how the things are working now:
> 
> OpenSBI detects the available ISA extensions in two steps:
> 1. It parses the CPU nodes in the DTB. If a node has the 
> riscv,isa-extensions property, OpenSBI uses it; otherwise it falls back 
> to riscv,isa. riscv,isa-extensions describes the same extensions as 
> riscv,isa, but as a list of strings, which makes it easier to parse. 
>  From this, OpenSBI builds a per-hart bitmap of available extensions 
> (basically what we do in Xen). (Platform-specific code can also add 
> extensions to the bitmap at this step.)
> 2. It then probes a small, fixed set of extensions (Sstc, Smaia, 
> Sscofpmf, Smstateen, Ssstateen, Smcntrpmf, Sdtrig) by reading a CSR that 
> the extension introduces and checking whether the access traps. This is 
> similar to what we do for Sstc in Xen.
> 
> Step 2 only adds extensions to the bitmap. It does not check or clear 
> the extensions that came from the DT; the only exception is Zicntr, 
> which is detected purely by probing. So for extensions such as 
> Svade/Svadu, which have no CSR to probe, the DT is the only source of truth.
> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables 
> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
> 
> Now, what OpenSBI does with Svade/Svadu specifically. First, it disables 
> hardware A/D updating by default, i.e. it clears menvcfg.ADUE:
> 
>    /* Disable HW A/D updating by default */
>    menvcfg_val &= ~ENVCFG_ADUE;
> 
> Then it sets ADUE again, depending on which extensions are listed in the 
> DTB:
> 
>    /*
>     * Assume only Svadu is supported when it is the only extension
>     * present in the ISA string. Svade is assumed when neither are
>     * present. When both are present we must default to Svade (see
>     * the zero reset value of FWFT.PTE_AD_HW_UPDATING).
>     */
>    if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SVADE))
> 	__set_menvcfg_ext(SBI_HART_EXT_SVADU, ENVCFG_ADUE);
> 
> So all OpenSBI does is set or clear menvcfg.ADUE based on what is 
> mentined in DTB.
> 
> So, to answer your original question: yes, this can be fixed just by 
> updating the DTS. OpenSBI will then configure menvcfg.ADUE according to 
> the extensions listed there. Note that the logic above is from OpenSBI 
> v1.9. Versions v1.5–v1.8 behave the same when the DT lists only svadu, 
> only svade, or both. When neither is listed, they leave ADUE unchanged 
> instead of clearing it. Versions before v1.5 don't handle Svade/Svadu at 
> all.
> 
> But IIRC such approach was suggested in one of vX and it was rejected 
> because we can't in Xen be sure that passed DTB is correct and 
> corresponds to how real h/w is configured as specifically with ADUE bit 
> in menvcfg we can't read it in HS-mode as an exception will occur as it 
> is M-mode register. So we have to trust that OpenSBI (or other firmware 
> will configure the A/D update scheme according to what is mentioned in DTS).
> 
> So then basically the question is do we want to rely on that how OpenSBI 
> configures h/w?
> 
> It seems like it could be fine. For example, without support for the 
> FWFT extension, we can't access or change the menvcfg bit anyway. The 
> FWFT extension was ratified in 2025, so we have to trust OpenSBI anyway 
> (or introduce our own extension or port the FWFT extension to an earlier 
> OpenSBI version) before FWFT is started to be available.
> 
> With this explanation would you (Jan) be okay to go with just providing 
> proper DTS?

I can't answer this, as I lack details on where the DTS is coming from.
So far I thought this was a blob handed to Xen (as kind of a module) at
boot. What you say above makes me uncertain about that. If it is a blob
as I thought, how difficult is it for people to edit a broken blob, for
it to correctly reflect their hardware's capabilities?

If that's not "very simple", or if there's concern that people may
object to doing such editing, then I think we could (should) go without
that. All I then would ask is that the description be clarified a
little further (clarifying that absence of both extensions is a valid,
albeit historical situation).

Jan

