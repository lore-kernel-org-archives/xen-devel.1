Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0293C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 15:35:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427681.1650487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8g2z-0004VW-SN; Mon, 21 Sep 2026 15:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427681.1650487; Mon, 21 Sep 2026 15:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8g2z-0004VP-Pp; Mon, 21 Sep 2026 15:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1427681;
 Mon, 21 Sep 2026 15:35:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8g2y-0004VI-TL
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 15:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8g2x-000524-0C
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:35:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14ea7-e002-0a2a0a5209dd-0a2a4509c27a-12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:35:10 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab14eae-be1a-0a2a45090019-4a7de18cb9ee-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 17:35:10 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd4ba9f68so43717925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 08:35:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd115dcbsm234844005e9.15.2026.09.21.08.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 08:35:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1790004910; x=1790609710; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqH4ELkHW3x44HV78MoN5EZNURTa3QJZ+kK8Ogv0hM4=;
        b=LKHEmCuZTvJKqn/oZ3IcXfMjm7to93+ykZ2g0JfDAMnQ6LSp+x5IZmZfSn6XglXyE4
         /Ifg2Ub00J+ZmysTjB4QKsDbpk/BeBINnSURfX67cTz41SKN7taoaM0vriUMVjGg45NC
         jsnXdzbfLseO7Cw1Eb3fMYIWMADjgnEOwNBJ5qeqdlTBY3RerR5as+9imGYlV+20UHF+
         CZgrFtIbgjIeolEZNjWh8Aq+WCi0nmKYMY4ugL97DCPwglWHSvMGzlqJv3ECjPfGT4pG
         4hI8IbYaG90FSsnQeEGXzg9k38DCRv6piymSjG756vm0Q1ZTxH64c+/d6xcDG92i2PiZ
         /qXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004910; x=1790609710;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqH4ELkHW3x44HV78MoN5EZNURTa3QJZ+kK8Ogv0hM4=;
        b=SRppkVsHHXsk3AAB3utsVwY3zR91u20Hf8HOQBNbkURD/9rVBpXj4E2AwAx7zeBXKC
         9+e2o1zPiJl4kmw1PWr8Up+IdDbcvcmaOwSPHl0AGjYaY/wojsMtntlQrwfmnh7PmsHv
         X21/qBv+iGIqGtCxyXZKmZRPEprxv8jXLuBx0hWtuUwX4JgSIveFcGU1yIEqVb9cBMrp
         /CqXCpv/QCPqfh0wgTXpnt4RnevxnQA3TyBUv8SQj30IRW++GahnDZWNQhsGitEPQI0D
         ITLq3+VEVSpjRCSa8KQHWrXxTMsNEiN93Ge2NPu+QsqOqZ880OJrLZ4om6IXKciHikpH
         UvKQ==
X-Gm-Message-State: AFuF++lt3FOsuWB2M66lsMBaWrEdi+r0XzRGm4Y8UruCCmmiJr5XKP8G
	V0jthYpn9QC+wPh+8wR0rfB20cEM9ri2Jfnk/nVEdzUhyaXTM2UwP6+Per5WO8LNUQ==
X-Gm-Gg: AYBFou04PHpBzMQ7Qfq8CroMa1SpW4y6NJslNUmkikHICqMQqjVubF3uhjThjf2Q4Gd
	8W++8HitZR/+iudQLOVEHPUA0FiOTquTVaE0mJ0rtHVT2aN/vuVdZX3RN2bFlOZm30PLcN3f/9I
	8PeyrDucgIHjcWOcQY1fI1Z3zC9AFJFXCNm+1qq4nlW8Cc4qu4fw1WDpvwHSOMBasjfOtT7eqdU
	FgHUY1tem2JXTzzCumS5rBi4SJgwuU6YARxtsUBVn10SQlez2g2qjWQ8A2SPejrIZXbIETbdFmB
	OCmUqJjAsf0HwoBmeATxUCkZUQevVCDHHwQwVOn2zgtabVzoBaGMarmvngOqMTykXgBrWQ0RvnP
	5G+HbxU8wUNR4vbPElrD/lS+YRXuazlUHhv0P+mCxOfNl3Bc9xOwyODtZEH0HkdDv6u3u/nkN0Y
	icUwnw3cqXk/P4C5RC02pDalcLPzM4Lv+K9RAiXy1Z1uNkuSsnj58pUKHTW52PLgzhAEKbKtBoE
	yaOQjZkz3yM0TN/BxbaKdS92PmrpNcPFPlTqzcTleML+OYeIU6MMpznYMSfh3x0Pql0igSu
X-Received: by 2002:a05:600c:358c:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fc56b4ebemr190181535e9.9.1790004910250;
        Mon, 21 Sep 2026 08:35:10 -0700 (PDT)
Message-ID: <925a17b9-2be0-441a-b49c-8a8bbf51d633@suse.com>
Date: Mon, 21 Sep 2026 17:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen/riscv: set A/D bits in Xen's page-table
 mappings under Svade
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
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
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9ea7000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790004910-3B2DC034-C787A5C4/0/0
X-purgate-type: clean
X-purgate-size: 840

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> The previous patch set A/D bits in case of the Svade extension for G-stage

As I think I have said before - no "the previous patch" or anything alike
please in descriptions.

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -140,7 +140,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>          case 1: /* Level 0 */
>              {
>                  unsigned long paddr = (page_addr - map_start) + pa_start;
> -                unsigned int permissions = PTE_LEAF_DEFAULT;
> +                unsigned int permissions = PAGE_HYPERVISOR_RW;

The variable was already not named entirely adequately, as PTE_VALID is
only somewhat a "permission". Now it clearly holds more than just
permission bits, so want to be given a better name.

Jan

