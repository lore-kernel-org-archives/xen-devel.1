Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352EBCA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 14:35:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443423.1660731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpD6-0003Gy-AO; Thu, 08 Oct 2026 14:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443423.1660731; Thu, 08 Oct 2026 14:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpD6-0003Gr-7N; Thu, 08 Oct 2026 14:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1443423;
 Thu, 08 Oct 2026 14:35:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEpD5-0003Gl-Cy
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 14:35:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpD4-00Bos5-BB
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 16:35:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aa0e-e002-0a2a0a5209dd-0a2a4502a57a-20
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:35:02 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7aa16-6ca4-0a2a45020019-d155dd33e53e-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 16:35:02 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso3162628f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 07:35:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c75b4e399sm10814734f8f.56.2026.10.08.07.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 07:35:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1791470102; x=1792074902; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h21BfFZWA4UUJWMfzdIoAAxeKQm/P1kA2SL5dyMpd+A=;
        b=GzzMtLhx+hTkkLLxGW/eGWPYl16BrQ+jGhgtTwsAqWuMpZlNdCLAOBhUwI9KYIt4Z0
         1Kw8QuzZMs0xF0z03Bd57vydC2IZJ7uPt4LzYwEKt3EW2sDaZ4VbX/IHAYCRbRvox9ld
         Ke/8/GxLDCqzcyyuFofTn2Onpu8Nss57uS567ov7KTi3fVbf1lICtofUx0Xyr2XBoQa0
         V5MhVWWKMmdwZWVvh3YNfFmVXyFgD22RohOVZrqfd/KtJ2m/K5iIXTv5hr0sqPJEKH7o
         pWsStU7D3RT1pP1mDLrWQOpkTM31ETcRI6BwtIdtSjd2WizfudaZOv6g/k0b9DnS8Cvh
         1yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470102; x=1792074902;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h21BfFZWA4UUJWMfzdIoAAxeKQm/P1kA2SL5dyMpd+A=;
        b=VwaN/QULv8OOT0y30FjGy9f+A3Sg4rA/LCDSwlD/bVauV5QAKSqQwT8+dh4CpWR5jc
         lqYb1XB5KZCSzU0pNMqfCbJ0iBNPP0oyzkfouhxidVPkEGQOam0tasbb+qk7gsUUyQaU
         Bk4q0vIrYn8GF8iMqn4oX6gT37F82BlI9CtASJDLtkVdZghsr/R9S6IreOMLlaQammBE
         JlV6hiC/gph1SKZt39CuMq0tAEZa9r/U54Z9xmBrRn8z8r/toMTRTnxATkqKPC22wWsZ
         yXEE+x3DlZmdA9pfuphgSKl5xSk7wqt69Ay/tRQNYKnd1PEsr8oV9AYbI0oz78l3XCO0
         fCxw==
X-Gm-Message-State: AFq9FYKfH/qmxca8bhvw3N10Czd+yEhNC8gkfkTBFbe+TOO6Tk+mzgmn
	LLS7Iv0EafH+fa3u6dEPYCpKtKJMYt1SU5yZeG+p6CfxWgeeXkXRmSgLL+5IbLHaMQ==
X-Gm-Gg: AYBFou0IyLleRnXoC4DHNyaHDVOremgCL3Vu+RoK/p9GSvq5Vn6iFdqjWY56ooHfNZS
	JeBp4RwZUo5O+bwEWH4yACID5379TQyEL7d1VNtXYAML+d+y6KDht9dnNiQVKnjhb6SEI66Qv7q
	wqLX1vE89FzmYT3PUZv4OfgzTJAMs06usxFZwshz4OFFQ8YbedD2Oz3e6XmX8vqx0Iwm9eEa/Nl
	0qtsDFPN3u2jf2Y1a8P9v3veQD9I95Xyc+kGVEdvp85IHMdrr9N/FE4mUlLup+84PRVXWQMuCfe
	X2QDIJA3cdplXwkzS0LCI5Q+VUreKZxQLrdjdAH+UmQFUU63gFRn4yEkufdJn5xCkd/gXaerzU6
	wsk3Nfb6OsGFLodcthF+uo3dXN12lRnBIN5gOEPZI+rzP0g/l2TswChunXnPcHSWCk2Tpe3lBY3
	lfHbzVOIXWNDnjwZRdZeLGumebzoPRI+CJr2s9pMZ4XhFWQ5svSZk08ernWERwsOwjUs+nqBfha
	FAMMvaXiA3+nRgoAs2oaFKBGxZ3QNW7NEhr25kb08yPRwCGyz0Jiw6ZSK7PkA==
X-Received: by 2002:a05:6000:4308:b0:488:6561:b324 with SMTP id ffacd0b85a97d-48c727878e3mr11341233f8f.9.1791470101662;
        Thu, 08 Oct 2026 07:35:01 -0700 (PDT)
Message-ID: <86d08b6a-a1ce-4aae-8a4c-6b0bcc0b9696@suse.com>
Date: Thu, 8 Oct 2026 16:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/39] xen/riscv: drop INSN_{16,32}BIT_MASK and report
 unknown instruction lengths
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <f3c8b78cd0bbbebf51892c56967a12cb8ea6c226.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194529.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66@vates.tech>
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
In-Reply-To: <1791194529.8631fc262581453bbf619ec5b2062170.1a10b837ff10003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791470102-F1EAB2AC-DC97AE4A/10/78276251493
X-purgate-type: spam
X-purgate-size: 820

On 05.10.2026 12:01, Baptiste Le Duc wrote:
> On Wed, 30 Sep 2026 18:18:43 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> Both constants were inherited from OpenSBI and their names are misleading.
>> The length of an instruction is encoded in its low bits: bits[1:0] != 11
>> means 16 bits, otherwise bits[4:2] != 111 means 32 bits, and anything else
>> is 48 bits or wider. 0x3 and 0x1c are the patterns compared against in
>> these two tests, not masks selecting a 16-bit or a 32-bit instruction. As
>> each constant is needed in one place only, once INSN_IS_16BIT() and
>> INSN_IS_32BIT() encapsulate the tests, drop them and spell the values out
>> in those two macros instead.
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


