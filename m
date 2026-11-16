Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD317606A332
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OVBSo/kk
Received: from list by lists.xenproject.org with outflank-mailman.1490910.1691844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwmb-0005aQ-9w; Mon, 16 Nov 2026 13:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490910.1691844; Mon, 16 Nov 2026 13:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwmb-0005Zm-6k; Mon, 16 Nov 2026 13:30:05 +0000
Received: by outflank-mailman (input) for mailman id 1490910;
 Mon, 16 Nov 2026 13:30:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSwma-0005S4-IB
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:30:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwmZ-00B8iX-Uj
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:30:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb0555-e002-0a2a0a5209dd-0a2a4505bd86-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:30:03 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb055b-4cb1-0a2a45050019-d155802dd18a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:30:03 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so34905115e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 05:30:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb729b2801sm71445905e9.5.2026.11.16.05.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 05:30:02 -0800 (PST)
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
        d=suse.com; s=google; t=1794835803; x=1795440603; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cq/cmM6202bEZFiSO6/sxMllmXT3tXSpJ/XXaMY5Tj4=;
        b=OVBSo/kk9MU4B/LLhMrACsw2wPva2n+kicrB5IkiXkmi8Zo7CWXTmJvIzZIFEeN6XX
         1Ty7Bol2+bAO8ipRye1Gi1/15azqa0srynC8d/7lNLsCsokhsQ7P7V25T1zLTeNOxOQC
         EObNvOfSz3RHvxBRISl4xRFLUWXX3XRS1wuv/g+fQx1s5DWAMWMSUEzPReIGYXzcJPVz
         Vcdcg+euq6e1Kdy97/+SCDM8frNt92Q6fPZXG8VAJ4ONV4X63uO+EgZIT84muZ0MVgnc
         YZ74uOfwm3vOh3OZQ2nXSgg537LuSiEUtVfi8NEeS8EZ5IsWpG2aQOfNPMJiB2tOFlKZ
         aKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835803; x=1795440603;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cq/cmM6202bEZFiSO6/sxMllmXT3tXSpJ/XXaMY5Tj4=;
        b=fKRH9+u1N0Sp6YNL0mjjpUBZTMKnlMF2sdOZk9N7Ntu+TU8opR+OoZlTGjiz/MmTrJ
         M7NjgBG1FPdZN3BudoJfGnlsNi5THzwvz25V9jVtEnvrpo6eNNCTpBBK7Kbg304RnB9O
         RIGSh9ksYu8hHlnQTVRyUttbpu5n5HUIrcWtV+bOYddF8u2psVFW6odLETJRyKDelIX2
         ujNqELwgc2v2Z0VQhn4AKTCttLvmBLI93NfAADQVX9jJa1jWJHRO8oJ37zYT87Lvda0X
         MQqhzFSPhqqXb29HsIa2tAbypyw6IQ8dRe8gLM9TEBN9j+8ksc7eMyhIDpMcywI0aPJz
         B7zQ==
X-Forwarded-Encrypted: i=1; AL+hErHy7pkBCEbfG9YMmVd6f8fuvvkU9Jd1+gi0qJ+69OISlfC0CYqB02Ks7+wQpYX1IqRy2+2oxeLoSWU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9IZIKZ6OPOjcimW2GD4RBiXQaj829Qg9AkyQ+C8iHz3e/4fs71
	CTrv7EdX9q4ohWDLDUN0ryH7uG2zcW5BMFnVpQjXgL+b/q5/ovCufHMvJ7A7+f/ETA==
X-Gm-Gg: AYBFou2u75tFDB6OX+raK51p3b0Kuz1j//txxt3r/UiGn2jI4MYE0b6PYQQB/bmMPQc
	yKKlJuXMoR0aisLz7/tg6x2NdY8o2OigHshy8JnFhel5E8cRZRN9Cfu0oIXvKe91XDGQvw7oYnQ
	mNbSvrOTeczf3qXls62e9aiJvavcox10mfk1jn9NhtgLPn/q2dD3FIrxROUVM/kGJXTWPhc7Mc+
	WN74oqH3ArsfssF15r2nv16IXA1No/ZVikZEIbpW75zRxWATmVP2y4+LUBumCelOJifqSl6N7Kx
	mvU2i0FH8I8scct0tm34WdVJHs4XLAycjpuEUAe1IYB7ivIhOPqSsxhpTgO3ypnEM3JiDMBkdaS
	zm1JJVlvQy5sjOldCk74PPEG5R+uhThcA8cO05XIdZt851jipqyyOWVtNNkK7FZONtf0vM8XJW4
	kTCDerLOTdr8j9GTAii+NfqJ5jdk7K/CjxSENoBiDiz8oHiQ+3suPAQ9X9lhCbU5nyfFHwqGd/g
	IN53xXa/vjF65oZF9xJBP/v67xzrhwyB0dfih181zwXWE/IL1tIqXfK267c9T8w0wBpAWEWNP6U
	BeE5mW1MzW0djp7HZ7yxzNkpp8qAU93QZYNJxAbVZAunWiWZXu0yU1aywUHYYt3lR138tMaNwaq
	o82H1HBTrdfCaamxclw==
X-Received: by 2002:a05:600c:a012:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb55a85101mr210765035e9.27.1794835803006;
        Mon, 16 Nov 2026 05:30:03 -0800 (PST)
Message-ID: <6213ab52-73ad-46d8-83eb-0ab7161b2a8f@suse.com>
Date: Mon, 16 Nov 2026 14:30:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] libacpi: Build TPM2 tables for the TIS interface
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20261106231526.482418-1-jason.andryuk@amd.com>
 <20261106231526.482418-2-jason.andryuk@amd.com>
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
In-Reply-To: <20261106231526.482418-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794835803-2551A2A1-66884748/10/78276251493
X-purgate-type: spam
X-purgate-size: 4678
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07.11.2026 00:15, Jason Andryuk wrote:
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -16,7 +16,7 @@ C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
>  DSDT_FILES ?= $(C_SRC-y)
>  C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
>  H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h)
> -H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
> +H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_tpm2_tis.h ssdt_laptop_slate.h)

I think it's time to wrap this line.

> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -11,6 +11,7 @@
>  #include "ssdt_s4.h"
>  #include "ssdt_tpm.h"
>  #include "ssdt_tpm2.h"
> +#include "ssdt_tpm2_tis.h"
>  #include "ssdt_pm.h"
>  #include "ssdt_laptop_slate.h"
>  #include <xen/hvm/hvm_info_table.h>
> @@ -444,17 +445,30 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>              break;
>  
>          case 2:
> -            /*
> -             * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
> -             * identifier register.  See table 16 of TCG PC client platform
> -             * TPM profile specification for TPM 2.0.
> -             */
> -            if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
> -                break;
> +            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )

Better use switch() right away?

> +            {
> +                if ( config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
> +                     config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff )
> +                    break;
>  
> -            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
> -            if (!ssdt) return -1;
> -            memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
> +                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2_tis), 16);
> +                if (!ssdt) return -1;

Please can we not gain further instances of this style-violating code? It
would be nice if ...

> +                memcpy(ssdt, ssdt_tpm2_tis, sizeof(ssdt_tpm2_tis));
> +            }
> +            else
> +            {
> +                /*
> +                 * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
> +                 * identifier register.  See table 16 of TCG PC client
> +                 * platform TPM profile specification for TPM 2.0.
> +                 */
> +                if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
> +                    break;
> +
> +                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
> +                if (!ssdt) return -1;

... the one you re-indent could be corrected as well. Actually, can't
we consolidate both allocation and ...

> +                memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));

... copying paths by way of having another pair of local variables
(pointer and size)?

> @@ -471,8 +485,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
>              tpm2->header.creator_id   = ACPI_CREATOR_ID;
>              tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
>              tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
> -            tpm2->control_area_address = TPM_CRB_CTRL_REQ;
> -            tpm2->start_method = TPM2_START_METHOD_CRB;
> +            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
> +            {
> +                /* The FIFO interface has no control area. */
> +                tpm2->control_area_address = 0;

There is a memset() earlier on, so only the comment looks to be needed
here.

> --- /dev/null
> +++ b/tools/libacpi/ssdt_tpm2_tis.asl
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only */
> +/*
> + * ssdt_tpm2_tis.asl
> + */
> +
> +/* SSDT for TPM 2.0 TIS Interface for Xen with Qemu device model. */
> +
> +DefinitionBlock ("SSDT_TPM2_TIS.aml", "SSDT", 2, "Xen", "HVM", 0)
> +{
> +    Device (TPM)
> +    {
> +        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> +        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> +        {
> +            Memory32Fixed (ReadWrite,
> +                0xFED40000,         // Address Base
> +                0x00005000,         // Address Length
> +                )

I know you're only following what we do elsewhere (i.e. this isn't a
request for you to change anything), but I wonder how we could make sure
that such seemingly arbitrary address range allocations won't ever
conflict. (I assume the base address is dictated by qemu?)

Jan

