Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C855C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:12:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404502.1638185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IfB-0001aZ-0a; Tue, 01 Sep 2026 07:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404502.1638185; Tue, 01 Sep 2026 07:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IfA-0001aS-U1; Tue, 01 Sep 2026 07:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1404502;
 Tue, 01 Sep 2026 07:12:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1If9-0001aM-HK
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:12:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1If8-00Fvip-FB
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:12:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967ab0-e002-0a2a0a5209dd-0a2a4506eaa0-46
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:12:06 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967ac5-195a-0a2a45060019-d155dd2bec07-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:12:06 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-484415c8bf2so358172f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:12:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442c42593sm3169210f8f.2.2026.09.01.00.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:12:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1788246725; x=1788851525; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whBHovxWbeQG0SPDHLaG/DLRFp5/TqHTN3XNJr1QyCg=;
        b=bkVGDC4BpW7ZvDgFTcv/ufZp7Rs86yZ5ma7SINXiJzRVHzbtNzYnhA/e4xcDO4+cgE
         QdXNgoIVK6DhJ57MdOp+ZPoZM5QEbMOpUmc/ghFVl3stFPvU/DwaMT1HtVQ1v8R/zQjT
         +n/xCWMboStw2ueOFzfHh+SZM9yrHRVNN5ohYBGpeNXgDkdlXFTZQ2cNERslkNj9Su7w
         EMcDIei1ka4X9TiWyRG2MNaL4f0mcYiDU+aD1qPLDoMWCBG0BNhC4fNa5TB6AM1BcZUF
         aRQ2Feh1XsNmYrZ/LPAUJhHZJ4GL7NV/el7qhpGdzBLcDFJPL5rgCie4jG5hPC72D43S
         CsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246725; x=1788851525;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whBHovxWbeQG0SPDHLaG/DLRFp5/TqHTN3XNJr1QyCg=;
        b=PQtJhVIHUz7gEP9hzNckulLsRyIbYE6s1P9muzVl7AE66j/RwhmM9geo6kb8iQ/e+M
         HyaG/qf2kIhcQsBE4efCimTh9yAsF//C6sHI/IaHtwjc7MGYAiGqGLGzM1O15tboH970
         DJL5EfpJtCBUj/gIDFOqyBvYBjrqHqjdtALT6Axp8dESsOw0lRo4WE+zJn0IoUvzuKT2
         LDGzA3RL+7yBBNGJTsMoPXUiHS0IdISFfhC3Zu8UGnz6wDgJOYFVwZ9+SWxkPZXaq48S
         2qDu9hQzSWm3xIiX4AbTJALct1VjcfcVj1lz8PlCjPPqQN+dX5VjghUjameZOH9pgt7u
         t6zw==
X-Forwarded-Encrypted: i=1; AKwUvBxFnjldCHE+8hBrVbQocjz2z+osf7q1yHsGN3WXlRI1iaSnVOv/iDd9N3mFipADaf91x/rCOsvmQ84=@lists.xenproject.org
X-Gm-Message-State: AFuF++nXFycnVMfM9rAETygELyRSYjKKxrO1JjtX+DES+c6GkvcY1mwR
	5hzHI5yOq0Kmne9luXmOkfTfHgLFEpvIdzT1g/0IWYKPvR7kweQSlEZocRveSV3lIg==
X-Gm-Gg: AYBFou3qfh5kT+rkaVPjvETX+q5ED+CQKPN1l1YUxI9SriH0VoHtuWepaQ2k0dNEXRH
	hL0UJheN1owKdFrgPVdlwDGDHnWTgcvS24a/G+n7SGMLT79uPiJaNn+l7vrdyo3mTki12WsbEIx
	PrXncH0h1bkxaq/484NSaqBw7/XYSiKViziei2z0llDThZXh/iyy/rhYJ2DEPn6MolHHzNDOmLD
	FLOI/lDXp4mQa6XIu28qjv3ylLskK1hTkq6U2h12nuOziEAHzzISvDCLd+5DTDYrG7R3TIlovTn
	hnpaqcOEyoypDG+3JXtZqoq0WF0XoYLlEF/rqWKeO147K07zEnZK9T7wtvJ/53jlb/C1z9mFyN9
	tsGOKjuYcfgH8T5UXLfX5MRz6ZRcpeJboefN8n++DUrf57pUbXdnmPcftj4UyrTN7TIW27gj/r3
	YpT/qaGv24PfPZHkco0EalGN3t3XId6kLyMyNNeFE6FU1mif72KzLe5b8tTAAnN/5W8RFcpyuDs
	UILpWHz0ZNBHpgk5cDOaaJ6tSGl9wqDt0sIUubQ0pnEJDymKO4fQA==
X-Received: by 2002:a05:6000:41dd:b0:484:3311:6f68 with SMTP id ffacd0b85a97d-4843311735emr31989123f8f.25.1788246725107;
        Tue, 01 Sep 2026 00:12:05 -0700 (PDT)
Message-ID: <5ed7172d-24e7-4ace-964e-dad814c2dc6a@suse.com>
Date: Tue, 1 Sep 2026 09:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/39] xen/riscv: use UINT64_MAX to disable the
 VS-timer
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788246726-1F2C677B-4D01AA2D/0/0
X-purgate-type: clean
X-purgate-size: 908

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
> written with csr_write64(). On RV32 that macro splits the value into
> the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
> writes all ones to the low half and zero to the high half, leaving the
> CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
> would then become pending as soon as (time + htimedelta) reaches 2^32,
> which is exactly what the code is trying to avoid.
> 
> Use UINT64_MAX, which matches the width of the CSR. On RV64 it is equal
> to ULONG_MAX, so no functional change there.

Hmm. This again is an example where code (likely) will be silently wrong
for RV128. Presumably the CSR would be XLEN bits wide there as well, and
hence you'd need to write it with 128 bits of ones. Imo ~0 is what wants
using here.

Jan

