Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0611DC54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 06:27:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377143.1623357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKEC-0005pM-3z; Thu, 30 Jul 2026 06:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377143.1623357; Thu, 30 Jul 2026 06:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpKEC-0005pF-1O; Thu, 30 Jul 2026 06:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1377143;
 Thu, 30 Jul 2026 06:26:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpKEA-0005p9-FD
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 06:26:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpKE9-007oYh-Ov
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:26:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6aee87-2eae-0a2a0a5409dd-0a2a450bcc74-48
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:26:45 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6aeea0-b7e8-0a2a450b0019-d155dd2fb194-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:26:40 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso1574784f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 23:26:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fc892cc3asm3396098f8f.23.2026.07.29.23.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 23:26:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1785392800; x=1785997600; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrkZcRl1wFMUDdyXVg8t0zdbOjNCjIUHfknFDNOwTrw=;
        b=XwCPY/omxYzz/Acc/vjHAlDpNjfC7eWCABQ0T13832eV4SF8atk9PWMKNSvkydXc9G
         /kwINKfsoR28+X5dW469SQ1VluU3b/skLW1LINFOFEJlef8QVekql2CH1ojMdj/NFJ9j
         iHDkYNs/N7O386a044NdrtK3OpIAwliFVkuP+FZcpX3vnHRZaZYsUeRHCtvYTpbHOWFg
         PC9/PUNgBRWrNOYsQw9V1YseqHERO1G5Ov1wkm8SJCyE79/peU/u1KZ0aXY/b4wKQsLF
         WSDzHaKlec2vsEwSShNHdrZdhs+cRe96m3QuPIgY1zD5pZDFZ7C4trbCmc91snQIlCya
         +jGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392800; x=1785997600;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrkZcRl1wFMUDdyXVg8t0zdbOjNCjIUHfknFDNOwTrw=;
        b=jIBIjJi4+OMyJrLgyv1unm+FGCQIT3XvNq07saK00QL15LwzlG+c2iC36C9Cv21ddt
         VbfzMlTpKC4E7b/pUYG9dfMX0uOuBdCj1MpXGRDwu1Mve5YH3vNz2x9DigZgGtWidzHH
         YE7VH9PXuTcmh3QjaYC1vxifmRdZumSKUxb6QvrNT+/bQ04lw/miOPj0YKRBJ6d7g98K
         tWCLGcToIwbi1tvxkQPt4s3iFp+6GGTneLqBREUDlnjCkbzP2lJQ/TiUiTdJChNbJggt
         TEZfhzC/9WDs7JdRtc8Va6euzUSFvhJYJCpixJpksSTZB9HHTn3C0WcfORtj8zbVD4ff
         MLxw==
X-Forwarded-Encrypted: i=1; AHgh+RpQstxtAOzGJp7X9eAmMhqtdIumLCSfMKDRAANdmuBMaes0+GOZp4RNYKkh+krEM80AQTuZKhMK1eM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxp3o2pHegPBCEfk43GTeyNddOKjm0XstlTQo4Lu9w0AhHZhDx/
	gScdSIAS9ojeiQ2zlejFUzSrtK0QlilMsOY7IRi2b6vRarGCBcnxIu88bCQLT2dACw==
X-Gm-Gg: AR+sD13Blf7aeCZ3rQxWuqM3BSHSI41oj75zhbUC++zHzIf41dTbGsWxDhcfVK5M8Fi
	j0TTXEBreYi2CWtPtBj71E0z23L6h0uDL48MSPpVBjN+OypVr0MiolNqndbi6GFlaimEHNfHTK5
	S+YjYyHy63U2mcy0/P5qwiSoePr8VTb85eKMeuIN9YS+Ky8VNDJXsjiLc43/jUQEmG+VCB5wDVT
	7le08u2OdkXQVnUvu+885Wbj8CYKbV6zRSoE35UVEK2YK6XAZ6zzgeelq3/iMZc6CbBm6Ay5GCM
	bxrYlt9NYTU5FiMG0SF2Gbm4JPBtitYEFZzJbROI0t1c2RJXI2aRct02iJv7U79tpFx4StuyQfw
	ZB3VqQFrPcXS5wO6nTbN8dXURBBbWA1ax6F61XXk1xjT7lr6M7NKYPJQXTej3lQMZjHJX3aLw4E
	4QrAey4MpJJE960eQe33moOdsDXx2WnLzg+wyQpoMdNA912RQ4vS3hkTi7lq4x4hbSpORRv1ADu
	1m2GrLxZ2OETsdhRM8EfPS+2Z4GRT2INP0YMEptF4e9evTybxXX
X-Received: by 2002:a05:600c:1f85:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49800e7028fmr14398205e9.7.1785392800128;
        Wed, 29 Jul 2026 23:26:40 -0700 (PDT)
Message-ID: <f71e5d41-329e-4859-9744-c390e26bb5f8@suse.com>
Date: Thu, 30 Jul 2026 08:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] acpi: reboot: log reset parameters
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260730001854.905354-2-dmukhin@ford.com>
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
In-Reply-To: <20260730001854.905354-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785392805-A96C29EA-67002FC0/0/0
X-purgate-type: clean
X-purgate-size: 2468

On 30.07.2026 02:18, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Xen does not provide much details for system reset debugging in case
> system reset happens via ACPI subsystem.
> 
> Log reset I/O address and reset value.
> 
> While here, fix the missing default case, guard it with
> ASSERT_UNREACHABLE() and drop full stops in the loglines.

On what basis (i.e. thanks to which earlier checks) would this assertion be
legitimate to add? Besides being a wrong use of an assertion, it also breaks
fallback to alternative reboot methods in case one doesn't work.

> --- a/xen/drivers/acpi/reboot.c
> +++ b/xen/drivers/acpi/reboot.c
> @@ -6,6 +6,7 @@ void acpi_reboot(void)
>  {
>  	struct acpi_generic_address *rr;
>  	u8 reset_value;
> +	pci_sbdf_t sbdf;
>  
>  	rr = &acpi_gbl_FADT.reset_register;
>  
> @@ -21,17 +22,24 @@ void acpi_reboot(void)
>  	 * on a device on bus 0. */
>  	switch (rr->space_id) {
>  	case ACPI_ADR_SPACE_PCI_CONFIG:
> -		printk("Resetting with ACPI PCI RESET_REG.\n");
> +		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
> +		printk("Resetting with ACPI PCI %pp RESET_REG at 0x%"PRIx64" (0x%x)\n",
> +			&sbdf, rr->address & 0xffu, reset_value);

As indicated on other occasions - %#x and alike please in favor of 0x%x.

I also see no reason for the 'u' suffix on the literal number. Plus if one
was wanted, it would want to be 'U', to match the Misra-demanded 'L'.

Also - nit: Indentation.

>  		/* Write the value that resets us. */
> -		pci_conf_write8(PCI_SBDF(0, 0, rr->address >> 32,
> -					 rr->address >> 16),
> -				(rr->address & 255),
> -				reset_value);
> +		pci_conf_write8(sbdf, rr->address & 0xffu, reset_value);
>  		break;
>  	case ACPI_ADR_SPACE_SYSTEM_MEMORY:
> -	case ACPI_ADR_SPACE_SYSTEM_IO:
> -		printk("Resetting with ACPI MEMORY or I/O RESET_REG.\n");
> +		printk("Resetting with ACPI MEMORY at 0x%"PRIx64" (0x%x)\n",
> +			rr->address, reset_value);
>  		acpi_hw_low_level_write(8, reset_value, rr);
>  		break;
> +	case ACPI_ADR_SPACE_SYSTEM_IO:
> +		printk("Resetting with I/O RESET_REG at 0x%"PRIx64" (0x%x)\n",
> +			rr->address, reset_value);
> +		acpi_hw_low_level_write(8, reset_value, rr);
> +		break;
> +	default:
> +		ASSERT_UNREACHABLE();
> +		break;
>  	}
>  }

As you're already touching the entire switch(), would you mind also inserting
the missing blank lines between case blocks?

Jan

