Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E4C54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 08:08:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378851.1623884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiHY-0006dN-1Q; Fri, 31 Jul 2026 08:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378851.1623884; Fri, 31 Jul 2026 08:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpiHX-0006dG-UI; Fri, 31 Jul 2026 08:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1378851;
 Fri, 31 Jul 2026 08:07:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpiHV-0006ag-To
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 08:07:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpiHU-00BNYV-RW
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:07:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6c57d4-bab6-0a2a0a5309dd-0a2a450484d2-2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:07:48 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6c57d4-b57f-0a2a45040019-d155dd2da9a0-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:07:48 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4720f3bf164so1066999f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 01:07:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d1956sm2283053f8f.6.2026.07.31.01.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 01:07:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1785485268; x=1786090068; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVPR6IV5y4sZnO82TuJyj2/dSLaf5FSWC3TMCkssEMQ=;
        b=Q5tsnYlhNv/ooc5fiYdjxp0VRdcs7GYv1k2avNR1SrPUZ/VGY5q/HEymoKiNTZe0GN
         taIIRMY5JRtyWzGCWYwrGMAaKJcK2fsq2kTRjia4ndx1Ira7noi9p7WbAL3zYcMXz6GY
         p6Z+FjTQugLRFKwK2wXEmG3/YoeWTaxsmwaaAyCIGf1kelvJYFLHxJu/InGpYH+FB5we
         ikadaArr6YVFvnHGA22v53ak2cUbvCpLQcgHWa4LgYXMRF8rLpHNKAN/AzHuUFu2VVC2
         q+3HtLPA9ul1I+vNhQ6aKeDp5D5IzJB+OiVy0QcMSK5dQpSCx0zUVch7QudSjPQDkiSg
         By9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485268; x=1786090068;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVPR6IV5y4sZnO82TuJyj2/dSLaf5FSWC3TMCkssEMQ=;
        b=EhYecZzPFB8uQNetec+IECaNz8fM1EipHcE9ueB7RuY4LN6QJO4RR9Agdqb/oaBxwb
         E7EsSDfaTp2fC4kuz9zZIolSw9MrQuySllKFC7+eVYkU80L3emtDXSxJALcbVgqGcnY8
         +GVfYFSGUZc8KqaYDs9Nu52ZAFSjc4oPIeVE5GTJJaTqvg4Tl6xWWntq+7LqL27Am9mB
         bEsyi2rywlhVon+aiP09Hlg2eAGfWa8cSHv7u7wyt4+ekGcn2sY+zthrp4K+nIEi+doD
         WVX+3Ct/0M9Xh8jrp2T1Jf6IKUG6I4Mcsfdpx4tSKHaOpKu0dwEtDsvhb8AX92ReWGF/
         9OhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rri0bB24GxaaI0PnPakLhe3reQKlXf0Nvlx0znOlC24LQsT1Ai5AaT4Lo0YyrzKQTeWHlgCpsjSeXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/c5wkk0KKQ+ouIFJz6rGQHmBBd/j9XnjN+/DnjTWz/Lkqqk71
	EI6C748XBAj3/pf2w6OB8KpPkfubcx1+fsYCRh3fNeCC7Ra/hfdCRelhrP3fYTZ+1Q==
X-Gm-Gg: AR+sD115/3P6bN28aDCZQ+vMfvHp3+K2a+1gG6IfigmfoGQYK2J6IEXiAN7553cWnxA
	JVhCtQwvlqWbhmaweFBmVNZwLuPhSoz2dmAlEFC7gh7v0Lw5+T9XIUb06J+c3P8Rh+0XCXOlcY2
	tDzE6Mr0g+GtztDwRzoJ4lyfTBZuWWDXdgXhsWWVoxrNvk7qCxOiQ2kIHKQbHsdxyinIR5SRj3I
	NOyx2A5EilSBBD4jIxaCpxfTI75toeJRJ1wwxKs9+t4anY8mwCIdzoCBsIlQkGWA2M4+Zjx7rEd
	Omk64PRVNnENuLb3Da7So0DDM/dXwb11zV3UIR35CkKGbu/g+VdcQMAquJsGnQO6k43IfMusghF
	nEN8i6ANTqLKqdEhwjsHypyJgxPti7yRSC2yfEKvTfRvJ4dPz4pRBJn6OkvTNozc8LA9/Pxtue1
	wHonXv/9c5cNdPuddBBpM1KVjH/xFcSK0u5Kkn2k6et4WhP+Ank1BRASugv6YOCxcXeoF+Xqj9a
	sCoVAjcCoHE9u4Lze+VaNxpPx/bNh1f47qwVZqlDxXh1K4jBAaU
X-Received: by 2002:a05:6000:250a:b0:47f:9096:3f01 with SMTP id ffacd0b85a97d-47fd33ae7f4mr1763362f8f.22.1785485267919;
        Fri, 31 Jul 2026 01:07:47 -0700 (PDT)
Message-ID: <9aec4b1d-cb47-4229-bc54-3002a311a419@suse.com>
Date: Fri, 31 Jul 2026 10:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] acpi: reboot: log reset parameters
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260730001854.905354-2-dmukhin@ford.com>
 <f71e5d41-329e-4859-9744-c390e26bb5f8@suse.com> <amwnolcHTioaRjpe@kraken>
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
In-Reply-To: <amwnolcHTioaRjpe@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785485268-50AD8B50-1E315D1E/0/0
X-purgate-type: clean
X-purgate-size: 1600

On 31.07.2026 06:42, dmukhin@ford.com wrote:
> On Thu, Jul 30, 2026 at 08:26:38AM +0200, Jan Beulich wrote:
>> On 30.07.2026 02:18, dmukhin@ford.com wrote:
>>> --- a/xen/drivers/acpi/reboot.c
>>> +++ b/xen/drivers/acpi/reboot.c
>>> @@ -6,6 +6,7 @@ void acpi_reboot(void)
>>>  {
>>>  	struct acpi_generic_address *rr;
>>>  	u8 reset_value;
>>> +	pci_sbdf_t sbdf;
>>>  
>>>  	rr = &acpi_gbl_FADT.reset_register;
>>>  
>>> @@ -21,17 +22,24 @@ void acpi_reboot(void)
>>>  	 * on a device on bus 0. */
>>>  	switch (rr->space_id) {
>>>  	case ACPI_ADR_SPACE_PCI_CONFIG:
>>> -		printk("Resetting with ACPI PCI RESET_REG.\n");
>>> +		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
>>> +		printk("Resetting with ACPI PCI %pp RESET_REG at 0x%"PRIx64" (0x%x)\n",
>>> +			&sbdf, rr->address & 0xffu, reset_value);
>>
>> As indicated on other occasions - %#x and alike please in favor of 0x%x.
>>
>> I also see no reason for the 'u' suffix on the literal number. Plus if one
>> was wanted, it would want to be 'U', to match the Misra-demanded 'L'.
>>
>> Also - nit: Indentation.
> 
> Thanks for taking a look!
> 
> This file uses tabs - I can convert to spaces, but in separate patch.

That wasn't the point of my remark though. Merely switching to all-blanks
indentation would be wrong. Converting altogether to Xen style would be
an option. My remark was about you not using the necessary mix of tabs
and blanks when the wrapped part of a statement want to align with the
respective part on the earlier line. I.e. here two tabs followed by 7
blanks.

Jan

