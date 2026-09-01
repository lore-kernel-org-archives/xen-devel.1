Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B8C624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:54:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404825.1638489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QoD-0003Sv-Jd; Tue, 01 Sep 2026 15:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404825.1638489; Tue, 01 Sep 2026 15:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QoD-0003So-GR; Tue, 01 Sep 2026 15:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1404825;
 Tue, 01 Sep 2026 15:54:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1QoC-0003Si-BL
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:54:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QoB-001Llo-K9
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:53:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96f512-8faa-0a2a0a5109dd-0a2a4509b2c2-4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:53:59 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96f517-be1a-0a2a45090019-d155dd2cc0f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:53:59 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4843efcbdb2so25781f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:53:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d37111sm5535180f8f.5.2026.09.01.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 08:53:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1788278039; x=1788882839; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9j6qS2MxuGUe2+uOaxo/Cd4AZ7Q6lLcAWMKZFmGIag=;
        b=NOdmIXnajMl7eCc4xgPHVH31bYGjr6K3MmjK3ctXz3VlNA35/aVeYGkwn+PDF8cO/O
         GeyY2pJiEpvAUwp8I//pWdQsK/I71EFXFyHw2PsgdmU0JISexEiBTwAut69+O5fBY1k9
         pi0YOi5CnVxLHVqdDDDK/nsDJLv0mist8rSeakjTIXOElmVaaFvXaQDPdZ7X7COuvARn
         k6B5CQveo6E8idrfN1WNXmC/b0SpYRGijFChTMKTyXCgSZLpUKsD8VkeprTClZoTMdqT
         ezIrMR5URdLV6uXt0tT8ztW9eK+EOx5nO5inatZeyrorv+VAGpi7+W2kOGksZGnvpLR+
         cagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278039; x=1788882839;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9j6qS2MxuGUe2+uOaxo/Cd4AZ7Q6lLcAWMKZFmGIag=;
        b=PdMrKeDnizAso7Bho8DOYalSPFN5NBl+kKpliZeTYwQ1ogmbrs0GhATqKvT5lU9Jru
         75D0QPMuHp+7u7XgJecy8FPjZ8iy0ThHP3cmw2w4mTa+xuWm6p7jgkW/mJbTb8G+tXDU
         TbruUwuhZDDTYBr+Ey68+3ezvB6sS5KFG7GBFWU0Fpa7bGtrUCPf2GEnC273xXxFWcyh
         UyqJitNjwaXp5Tn+WZEsKlmbPDiMYSP54hV/mNHFYDiKND2EqDTUiYehr3gM3/5jup1g
         yFtSXOa9dtegXnyoB3UtuNi8snP9/2uEycnAHYpYexuU5Bgcnzmm1gr7LYhotKF/5GD9
         xfzA==
X-Gm-Message-State: AFuF++kEnIP3f5jn6t/eNXSWQ2CuT2ezyYhtbLws2meSfuGGMzJRSaGX
	nLByMZzm4RZ+WtpWyun0treTltJJT1bEtzzSQfdbJcA7KnkLBJ9TDjbhVphl7Ju/bg==
X-Gm-Gg: AYBFou30NUWAc/fa+r5CIk/uK0hLxV0ksjZvdDdgsAJ1LRsIj+jOfxpJ5FyUZdUG5YF
	WB/LCmMEooLnJIn0FJZPpT2DQoPbxvSzuvkNJdGTrHhp1xigEVIqoxtVni3GcSC873r35eSyw0E
	JXVfnX15D+0fd88SsDC4kk8/EFPwjbNF6FVmKSBDc7Tu5MdclJrqGeciQiIbvboTFdSGZTyyNsX
	IMgZkHGYoC3i2TSnb39RrRPcRZufbIQnEPv4dHJPsY/Z8wAIRbtYegmVqfAM5esxRoLV8x3ye12
	wO+NHk2ZNnD/RAh2qFdn0HqSGjBN+chz6EjDI8S22TaRXXnMBKnQEjYvoNfRi+woAiQsVTvSg5f
	Y+WdE7/DKZc/ort5W08AbXTSQkfiNcjd4NrO8zPizRUMYIjX3hq8olxK/707490Tgcm4Oe274er
	4K738okBgW+OMv9UsD/D8zG6GAUH391UKsX3/jNEx7SumwXSEIcC6NI0LwmZEmdh3v5VFlpJzms
	RsVELubl9CRBKAcyHP3MplmUhEL8A2WJni7gICuSgs+HzuBxP1D
X-Received: by 2002:a05:6000:1a54:b0:484:3310:f397 with SMTP id ffacd0b85a97d-4844103d08bmr14824109f8f.24.1788278038729;
        Tue, 01 Sep 2026 08:53:58 -0700 (PDT)
Message-ID: <d68f0e14-6c74-4b3d-9ede-c60364a93c59@suse.com>
Date: Tue, 1 Sep 2026 17:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/39] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b3e0c1a662403ea2aa84a1943223ad0885733d0f.1787838835.git.oleksii.kurochko@gmail.com>
 <1788276968.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@vates.tech>
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
In-Reply-To: <1788276968.8631fc262581453bbf619ec5b2062170.1a05d9d0d1d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788278039-FCC15034-C9830A94/10/73395122804
X-purgate-type: spam
X-purgate-size: 979

On 01.09.2026 17:36, Baptiste Le Duc wrote:
> On Thu, 27 Aug 2026 17:20:51 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> These definitions are required for correct decoding of APLIC MMIO
>> accesses and target configuration, and will be used by both the
>> physical and virtual APLIC implementations.
>>
>> While adding them, rearrange the header in the style of x86's
>> asm/msr-index.h: a register's offset is immediately followed by the
>> definitions of that register's fields, with the blocks sorted by
>> offset.  This makes the relation between a register and its fields
>> obvious from the layout alone, so no comment is needed to express it.
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>

If there's no dependency on earlier patches (nor the prereq series), this
could go in right away. Yet nothing is being said anywhere, unless I
overlooked anything.

Jan

