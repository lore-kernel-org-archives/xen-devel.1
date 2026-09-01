Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12744C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:03:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404486.1638168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IWi-0007Yc-V1; Tue, 01 Sep 2026 07:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404486.1638168; Tue, 01 Sep 2026 07:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IWi-0007YU-RB; Tue, 01 Sep 2026 07:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1404486;
 Tue, 01 Sep 2026 07:03:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1IWh-0007YM-By
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:03:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IWg-00AeZd-Oj
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:03:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9678b3-e002-0a2a0a5209dd-0a2a4509a240-22
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:03:22 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9678ba-be1a-0a2a45090019-d155dd35d94a-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:03:22 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48444eff835so46217f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:03:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d3d2eesm2952373f8f.15.2026.09.01.00.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:03:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1788246202; x=1788851002; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znwkxCkygaNyenpkhsNOCff62ZKqZHIiX1D6OEktD8k=;
        b=ZbMqbMm619o3FlGXW2FoeXG0stdNroZ0Ki2aAbOGQYa32nHEjvnAnF3PiOZsQvGo7S
         C06iBHVPBQDTCMue/Z1l2syOXZJzYs7ve5aqmbJ2y+peptQvcqL3jJBl/5/CPYlMhMYU
         1bKpqEqikXHWK1eePFm17WfFngcEeqyfJuGKMuBwFYH4IiO2RPzhECDBgN7H4LdYAeMR
         MqGr7POJezx53AO7tq0PSW/U22BAYZrHCckKrWmdBjge/JcBI/c0wMPP53NF7j0lMgkJ
         AIJ0h+VU4Lkvn5+hjotochjr46dkR6FFUqS8lTmEWJMF4mI4SqofaH/wY/MrUjZdh16I
         xgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246202; x=1788851002;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znwkxCkygaNyenpkhsNOCff62ZKqZHIiX1D6OEktD8k=;
        b=ioosSjbM0vlW3q24y2ekspi6A0tQ5Pn/8TQULKDLcFHysJtgI0uhwO/edyx5taL3RK
         KfwM/ZzZBXSVBPXIxihRht7iv1qS9rpsOsnW+ZGtLaPxxIIlIRajNoLWBxYXNOSohJ2E
         HLw74CwrkpmJvoqWFfpUbq2HicgytJkz1/2357BxHvYJE+EV4mt0QQJUzJJSo7TCTCpY
         mXJO4SlDlUEO6AIZvm+jXQLo9lXjn+YjpgKQn2KmeSwQR7wTNbb4shlBiwXWnu3Rwjbv
         m3eT5ntkSG1tqdWdOjWDGa36apdwpXPd2LTrsDBlA8zU4dFajNg2hVFF4a9gKRGeC+Rk
         LByg==
X-Gm-Message-State: AFuF++kSHHEDF+NBbHD0sm58i4Z8CGGOSlhhUiL2Yuw76Ed9EB0QLpcn
	FmmGPrISih25/37PExTaCgLrwmtLBXrQ/waqX8PlhDCfowCHzkEV+39AVEZ0wDTAAw==
X-Gm-Gg: AYBFou0ttiCLvp76i1Du3zlWLdAvVUwBJgOK4tjHItv/YBPUo2CJz1hik4FXqzgfOmM
	qtiYpopzZDel9BidMFoZlP7Z9Rc5SaDNB6oUvTE8j0+m7dikKiZOKuK6IEM4Wdtnybv0uaNjCeL
	HeWaboHzS3EvJ87SJRWVoMFsNs6MDd/oP+JrIFJvrv7z03wbfmNXjK+igjbNXoX1sEYa0ja/WTc
	mKU0UnTVwWj9sApaCwdL7QMDcKETg1Fj8ZtMdEf0nJSJJEvQiEbCZULEWs4lEoZ18g7+BcW7Q0B
	QeooZ8aOIA6ekPLr6TYFLRyNtisQ+LfrZSLHDLPJ3YVnPNaULzFcJ1Q8EvomivFkzJMmOBsXQIV
	pSyWNc0kPKgX7B9M9cEvhjqQ4CEUfx+AGVZaaWCEjWZ4tH2U76lM7iK3WZ4gdPBvSywF6ONUUyR
	WX1iNgOum0YVCDgUnqsAwZ2ogvyqmYnAc55/0WMlJqNSBFVscAdKRnb1isM4tfshLINQzZJe5Vs
	LUV453v7GS1TFhy5T6ys2QrTA5VB4MTV7+UgX/YuNHMFkRAQOjp
X-Received: by 2002:a5d:5e09:0:b0:481:3124:c71f with SMTP id ffacd0b85a97d-4843fcd85admr13917334f8f.17.1788246202117;
        Tue, 01 Sep 2026 00:03:22 -0700 (PDT)
Message-ID: <0bbfe4f1-7cf5-4bc6-9583-367512e30a6a@suse.com>
Date: Tue, 1 Sep 2026 09:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@vates.tech>
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
In-Reply-To: <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788246202-3BED6034-29BD4E4C/0/0
X-purgate-type: clean
X-purgate-size: 1148

On 31.08.2026 14:48, Baptiste Le Duc wrote:
>> hstatus.VSXL is WARL, so its reset value is implementation-defined. Xen
>> supports 64-bit guests only, so program it explicitly instead of relying
>> on whatever the hardware happens to leave there.
>>
>> This matters beyond the guest's own view of itself: decoding a trapped
>> instruction depends on the effective XLEN of the guest, as the encodings
>> which exist for XLEN=64 only must not be recognized for a 32-bit one.
>>
> It's not clear which instruction "decoding a trapped instruction" refers
> to without more context. I assume you mean decode_ldst_insn() in
> emulate.c, but the patch introducing that function comes later in the
> series, so this isn't obvious on a first read.
> 
> Please reorder the series so this patch follows the one introducing
> decode_ldst_insn(), or reference it explicitly in the commit message
> (e.g. "load/store trap emulation, introduced later in this series in
> emulate.c, needs...").

Just to remind you: No "later in this series" or alike in patch descriptions
please. Such wording loses meaning when viewed in git history.

Jan

