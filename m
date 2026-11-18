Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B0606A337
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RjyoxdFP
Received: from list by lists.xenproject.org with outflank-mailman.1493858.1693575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaBB-0005ds-Nl; Wed, 18 Nov 2026 07:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493858.1693575; Wed, 18 Nov 2026 07:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaBB-0005dl-JT; Wed, 18 Nov 2026 07:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1493858;
 Wed, 18 Nov 2026 07:34:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaBA-0005de-5b
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:34:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaB9-001EHM-I2
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:34:03 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd54de-e002-0a2a0a5209dd-0a2a4501b040-32
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:34:03 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd54eb-5bcc-0a2a45010019-d1558032a5e3-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:34:03 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so5131185e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:34:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7840b05bsm184807705e9.7.2026.11.17.23.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 23:34:02 -0800 (PST)
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
        d=suse.com; s=google; t=1794987243; x=1795592043; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl8g2iYCMzCTBv5SJdfeRFLd2fRsOTOFBQMSa69jUsY=;
        b=RjyoxdFPtY0/sbtU5/EYPAHnmOlDRTh7m0ny5mPDdHx8mb7tiSBPa3K3oAp8T6xUy4
         2RpWfjJMfGVzPBYI3wmcsykuOK/0NsbY68+EKxbNJCQyvuEwC5W7CaVPAPv8H5jE/H/c
         LHomDU6g3LWnBSxXxr524juNaBeggarDdU4bK8mrWZxm80gJE102oJwt49+IgBs15ILs
         bB28EnDav+JpQVSU2VK7HJYv+bNjE18rZCADjJylL82yQODj+abKlrkoS/KgJBBAhJK3
         pT8hg2tFUtX3xO0wyHJaKjWYGIhX+Rjx6Qj16bZa1cxnTf8tR0nUmv3Wl63iO0lP2Rqu
         FGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987243; x=1795592043;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl8g2iYCMzCTBv5SJdfeRFLd2fRsOTOFBQMSa69jUsY=;
        b=C8++ARUEMzeCvYFw+0LLwk90bz/U75QSyaNh520/YKIoxe4TThXj6LGoir059Ma872
         K8uq3/lce6H5eZvIw42ZsS5Go6b08s0iDHG5X65tFYfOJsEp0uGCPJ1myy0P9nJTyQb4
         vzb+qsdqCUllIZ5DUlZEFmPzJiAzxZhniS0vpLK+ZvfE5ZHAW4SY/+VwkHGA0rs32RaF
         2lJKJt6y5G80/Oz2aDeQVXXsYEfdLSCK6paSnTv7Z3ZECY3mNZFIYkj0JIs9JT+fhkMf
         KY4YhcS7ThTBvx4fK6k3uP4qSga/Dmr5YqcKcsIVe7af5dUUro9ibXLUrJ/5IybJgMgf
         ycQw==
X-Forwarded-Encrypted: i=1; AL+hErFe1TMSM0NJHyM836iYDhXCyowyEzgsSUyCqI0JWw2D+wGlEbjf2kgPrdiA2mnck6urK9DRjp7TTdQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/QygymDsG1v5W+P/7KqPAoiRf0TIW4ZgDzPpgqJSJcrMOw20mN
	ljL0ByeburZAnIMmzUK9CU7lzbfYsfCFCfdFsCgGwC+ttSXkv3jb+W0DqR5B/yQFoA==
X-Gm-Gg: AYBFou0aHDme/QqWwuttAGQ2J1HJl3fRsr3IIM3pHjSU21XYyJ1KXU3CVU/r1NWqVL/
	40sdp1KkmNQtGUnsQnTPrDwjowUmi2oiwhwDPLT7ojIQGABpZx7n4BVFrtXmUuqVk/VJ8ALzPgI
	GMqovq52u/offeQs/kQh1gzhZTyJmeNDk3L4L+tY+l5k194NUKUjdm4FgTiTiX4RPzY2SDO0uLS
	Ay5gyjcnpDa6wIpJNyIdVe6DveMlb8AluU/OPdJhjxBlttcL6Vwl2T8zkI+kDU95IH1MJBKn0sp
	BNYlPlYrIBfi+yoJlddgJ4iTnPZx/23IYtgVXEBM4Dg2102ef0pEYqzenH50kt80GVitAhcFQSR
	QSp/SJJrszdfDjM0Ou6iWTeGSZpERl9zpX1vvCGMUVXNuCnY0vnH+5nqHdKTeNSb9kJLM5PO+NW
	nOGE5KDJvbt1ohsch1mkDsBccdTzSi5iLa9gZ+xHf9UDBrNRrQOF2nBzpEX4NP7+C+IkUsWAH3w
	X5Omw6fsspX/rm4b+cgFGtPLnBJ5hhNk8LUvTA+qYyDJpspH7Ihs2eKgqHaYPQBnKqsCcDZhb0/
	iIXSzU1qtWAnxq7G+1EnYuEMUa18vKI3iRwQS50oZUwT2Cjb2e/L5oXI/ROX4c6YhR78MzohIfY
	nedLBjtgLt1EfEg0Sxcc=
X-Received: by 2002:a05:600c:8717:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb7da17f77mr27667615e9.7.1794987242823;
        Tue, 17 Nov 2026 23:34:02 -0800 (PST)
Message-ID: <9a8903f6-5962-476e-8058-b8501638265f@suse.com>
Date: Wed, 18 Nov 2026 08:34:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] libacpi: Build TPM2 tables for the TIS interface
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231526.482418-1-jason.andryuk@amd.com>
 <20261106231526.482418-2-jason.andryuk@amd.com>
 <6213ab52-73ad-46d8-83eb-0ab7161b2a8f@suse.com>
 <f4fd77a4-bdf2-4d29-bc3b-c8ce314f7385@amd.com>
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
In-Reply-To: <f4fd77a4-bdf2-4d29-bc3b-c8ce314f7385@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1794987243-4FB4E5FD-9F8B7B1E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2541
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 02:15, Jason Andryuk wrote:
> On 2026-11-16 08:30, Jan Beulich wrote:
>> On 07.11.2026 00:15, Jason Andryuk wrote:
> 
>>> @@ -444,17 +445,30 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>>>               break;
>>>   
>>>           case 2:
>>> -            /*
>>> -             * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
>>> -             * identifier register.  See table 16 of TCG PC client platform
>>> -             * TPM profile specification for TPM 2.0.
>>> -             */
>>> -            if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
>>> -                break;
>>> +            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
>>
>> Better use switch() right away?
> 
> Well, I don't expect there to be more than these two on x86.

I see. Something assert()-like on the else path may then be nice, except that
the way libacpi is used (and there being no abstraction of it) this may not be
possible in practice.

>>> --- /dev/null
>>> +++ b/tools/libacpi/ssdt_tpm2_tis.asl
>>> @@ -0,0 +1,25 @@
>>> +/* SPDX-License-Identifier: LGPL-2.1-only */
>>> +/*
>>> + * ssdt_tpm2_tis.asl
>>> + */
>>> +
>>> +/* SSDT for TPM 2.0 TIS Interface for Xen with Qemu device model. */
>>> +
>>> +DefinitionBlock ("SSDT_TPM2_TIS.aml", "SSDT", 2, "Xen", "HVM", 0)
>>> +{
>>> +    Device (TPM)
>>> +    {
>>> +        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
>>> +        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>> +        {
>>> +            Memory32Fixed (ReadWrite,
>>> +                0xFED40000,         // Address Base
>>> +                0x00005000,         // Address Length
>>> +                )
>>
>> I know you're only following what we do elsewhere (i.e. this isn't a
>> request for you to change anything), but I wonder how we could make sure
>> that such seemingly arbitrary address range allocations won't ever
>> conflict. (I assume the base address is dictated by qemu?)
> 
> Yes, it is a hardcoded address in QEMU for TPM-TIS.  More generally, 
> 0xfed4xxxx is standardized by the Trusted Computing Group for TPM TIS on 
> x86.
> 
> ARM defines assorted GUEST_* values for ram and mmio.  Something like 
> that could be done for x86.  Though using them in an .asl file isn't 
> friendly.  TPM_REGISTER_BASE is already a define.  That could be placed 
> in the comment at least?

Yes, this would then also serve as grep fodder.

Jan

