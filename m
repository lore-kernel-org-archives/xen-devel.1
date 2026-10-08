Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D71CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:57:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443459.1660775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpYu-0000IJ-QY; Thu, 08 Oct 2026 14:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443459.1660775; Thu, 08 Oct 2026 14:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpYu-0000IA-NS; Thu, 08 Oct 2026 14:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1443459;
 Thu, 08 Oct 2026 14:57:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEpYt-0000Hx-UD
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:57:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpYt-00627l-Au
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:57:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7af5e-e002-0a2a0a5209dd-0a2a45059208-6
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:57:35 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7af5f-4cb1-0a2a45050019-d1558031e0a7-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:57:35 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so55414065e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:57:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f486b6fsm115547715e9.1.2026.10.08.07.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:57:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1791471455; x=1792076255; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oUNES7EamklFcAW7NtMFwCaZ9b536afhhJ2PodqlTs=;
        b=AhCDDxwr5NLOY+LiQO6DeWNy97p9X46UTI8XOczNn5dxjaZG1HezCDMRgbg/m8e9XF
         Y+AsEBbB/HfYyHkhnX/x25wRv+9SS8c1V/24VokLec3tR2il8NCvR15TV8A5SdVgUTQ4
         4nxKgaLgDsG1i/Q1lTgBY7SwOZ/QWkFpdm4JBJ4Wt6u+cXmZDpOTmcZviMRLITZvIzWJ
         d4exCjujArnZEJLpLmO1VcYHJ4qjIAa7sMBaqMdM51AqiHfBUJHyq2L8x9sJW2dGLw7+
         4M46pDhABDRdNdyoW3BZwOVmv4AttAjgJmQWF7TJ4z6JbnO5CQZQ1spkv2rQcOeT9Yhb
         WeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471455; x=1792076255;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oUNES7EamklFcAW7NtMFwCaZ9b536afhhJ2PodqlTs=;
        b=aBF0KPkFIJ7iSB6TNcXa6Ad/qLMy4QOo0S7eMxXfpKBLSfGWqKvocon7b1DHHGGg8p
         aN2FdpwV9LMWStS70eMmggLPtQx+Ys22ZH2c8TA919IE9FnWejFUFp1qCnFrL+lT7Ylx
         IamvQwOeq4CkV8pec7g7ngmovdbdczNZtlLBk0YgodgdfJyt8nyvIOO049PRM1Ti/Taw
         A7W1G9mzCF4jUUqwWnQxeAwgIWn2hbYfRqwy26yhaPSFFMxMPzKnOpRwufls6s2ijNxt
         4Ql26xOEPKtNfI2PMk8EcnMUKrMga5dn+nzkZxMNMJq9kWAKtCxQYIdQazePw2B4p2Yi
         BiAQ==
X-Gm-Message-State: AFuF++nMjphOS0216X18v8TcugPunsoOPC7kYEzDLPwhwAFdDxJQVqkU
	hW9jQoAR5vuD4nIvQD4G8QsiZ+3M9Fj/+Sj2VpdimaKCytyTJDvBGxRb/1X2JQOcaQ==
X-Gm-Gg: AYBFou21aI+Ie+ilDYJKE2iGJaLcdIWw+6Q+gKQwE8qG/J+6/Ohv6C35xtdc7wHbELx
	dKHkigu43J0mVZvpTQjptsZBtYWQJTvANd/a466qoteCnXaoKidIPjTrezHZZjvbMtcEBBBMTmh
	8rvJrGRRYDL+8i19yKGhLL4il5TfNXq4mKYu+9lhHWtuaJCWBdUz6gNNKP79ZzGgB0el51EN2A4
	dobBagg8gExwJvFPpr4YPL8Yhl5dPhl4AvxMVUX57jI+X+Cd9+mX1cOU16Ks9C81HFKInI9NzBx
	lGypfA1LebUHDMqbNe3U6oyz2/p3bjatzrzoAgvk6scTKpfvd+0Zg9ambHdXKb2csEDLldQPsAz
	Y5zdJNwkZj4kH1EQAuVuwKp1MdWorj0gzVfeLM6CkfPl/0Q/xwsZUGN8NyzkiR+8/Ikzpkg/tCy
	io5x4fQo8jqpuYQgPDrXihjMAJqOdLh0QauUVckrjHgm3J9mD1y6feDWNU80gPlOqWvHX6JaLCx
	Jp1oZT1rvEsOhLH7ovSlWwkYPvvEe3nQWuPIrcKskdyoB9piB8fLA3hseYJRAdae/0GqfvndA==
X-Received: by 2002:a05:600c:810a:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a1802eb4b1mr106527225e9.7.1791471454722;
        Thu, 08 Oct 2026 07:57:34 -0700 (PDT)
Message-ID: <8aab6ff3-512e-418a-8170-5182ae7f30dc@suse.com>
Date: Thu, 8 Oct 2026 16:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
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
In-Reply-To: <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791471455-72CB02A1-AE89B359/10/78276251493
X-purgate-type: spam
X-purgate-size: 467

On 05.10.2026 12:01, Baptiste Le Duc wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/mmio.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef RISCV_MMIO_H
> Should be ASM__RISCV_MMIO_H instead to be consistant with other header
> files in riscv/include/asm.

No, please see the bottom of ./CODING_STYLE. It's many of the other headers
which would want updating (eventually; there's no urgency I think).

Jan

