Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F709C61DD3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 06:58:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404474.1638148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IS6-0005WV-6Z; Tue, 01 Sep 2026 06:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404474.1638148; Tue, 01 Sep 2026 06:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1IS6-0005WO-44; Tue, 01 Sep 2026 06:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1404474;
 Tue, 01 Sep 2026 06:58:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1IS4-0005WI-VM
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 06:58:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IS4-0072a1-88
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:58:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967790-bab6-0a2a0a5309dd-0a2a4504d2b8-20
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:58:36 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a96779c-b57f-0a2a45040019-d155dd2cac5d-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 08:58:36 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48444ec4fe2so116746f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 23:58:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce4a804sm51786135e9.15.2026.08.31.23.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 23:58:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1788245915; x=1788850715; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXH9/Zicwqf/w37oLUncAUAq9SnbWuzie8/5/MKlMYE=;
        b=BMOnHexl5PMpQ5QUWMERFuHJjAvqrLiOymC+xV3zCGYkve5H5eadkAu2LY7LFxW6yI
         9Y3RMrwWJIsN9AYWCInuw120RadN1ZWfBqXPr29lRAbrwZPZpwL7lK94x+dh0gmLCTBO
         H7uvFPmSTF0wq4k7szxDb3SrHmMF6MpU/jT6tJse9YEBSG9oCzkwk9PY3ZPlqtpi5zpi
         aYLvxb8NW2Kvt4JMjvSsztMswPL502qWEeuhG40R5TrJVfXIOUNSpmTU/uPJbLybGhuT
         xjYJpP6MI73LNBfhsniVXtRsZdrKTOgIscMMsCKKJ7+jOIcWsnZYDg4W/eVzj+IhB7DJ
         tz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245915; x=1788850715;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXH9/Zicwqf/w37oLUncAUAq9SnbWuzie8/5/MKlMYE=;
        b=hHRoqMCtETrhNrSRJ4SyNttyxXwV6wUpSiFaOti6EYeG9hrQLkxKFoTGlbF9TU0OH5
         v/eFwtY60Vw9LKp8C0vOCKZ4/nt/QepL+7YIAJarVQo55GkYLKUWoe2wsARFUFWy+ZNu
         3MKyfeMNWWdFzC9lxKTCjRbZyZTVUE2w/D+HsMs+PqVTEdYOXAILctGBnrbrRSX/T58L
         8rIBjIVfYmEHmvgJB+6zL5gXMwRDKCaaW4grV83dFO1fpekSMZht0Ct/pKaYuJYgESwk
         CyaQ14e9qZSsGlDt7xpvy+NFHKrchfqEq6xya/olx7Yh2xzJl0UBnyxjVsQ8m27LZGeM
         NYLA==
X-Gm-Message-State: AFuF++nc+AbxZxNX2HbcLb2GIjdH6dVXyV/1uUQlVhHs75hhfkRnkHrZ
	b6j3USdtbvI6maNylfAYvVX65Gxy/aqPWgYUdbJs/PwOD9GHBaM4N+Bs04b/dHbFOg==
X-Gm-Gg: AR+sD128R4LojJE9G9ElTrmLULTYVzuNDPYaHE97p8nnM2sL4JxDChMYhoiDiZD3Ga2
	gHF0ztIIVUd/UOL0qt/f08xdOBrd4chxr2UxKyLapSAVPOg9zN4K9NlYqX5FeDu65nYcl+3dNGH
	ZJY9jozpWOTOmcOHjn/rza/sBDaM7uweg+hvw3Ok8ChZZJf6F+704epmWMoGxukd7HD3MGfPY6Z
	oOFjjqtvPz/V/pwBmgfjFpGZCd1tI85+RPsKhgcA4xj0aCodi6V+kts0prok+q8JbT3F9zyWXd+
	b49C5vUzo/y+Q0j6B5QtEcYCqC75Mhu9gbEvHwxxDvSPOB5Hs4hY/i7Qsr96qVjgl69pWmJkH0h
	p2N/i9wqPXVlAsJ67oNBK5UifK8YHtpDn38qhKzCwP5ZJRfm5qc858SaN6x8vPrApmEXatt70B6
	m0tql+8qd+9Bg/PpgL3N9HXpeiawhIyqA2uzfYGxOsqd/7olO5Vx+Td4K4vGy6GVQRpyUsNbVmA
	dX/8zY+zFp+zCOdwpuzVkhil3Vrje+BFyrl2ymTD9gDB8ybYVBY7zE1f7/e9hk=
X-Received: by 2002:a05:600c:6215:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49cdc422c50mr117146625e9.1.1788245915682;
        Mon, 31 Aug 2026 23:58:35 -0700 (PDT)
Message-ID: <779caf0f-e6aa-4076-b242-89bbb67a627f@suse.com>
Date: Tue, 1 Sep 2026 08:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/39] xen/riscv: drop pregs from struct cpu_user_regs
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
 <0dc967fc4bba2dfd97a9c9ea6e60e4d5be3538ff.1787838835.git.oleksii.kurochko@gmail.com>
 <1788180503.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3@vates.tech>
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
In-Reply-To: <1788180503.8631fc262581453bbf619ec5b2062170.1a057dd1d04000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788245916-51AD0B50-34544628/10/73395122804
X-purgate-type: spam
X-purgate-size: 411

On 31.08.2026 14:48, Baptiste Le Duc wrote:
> On Thu, 27 Aug 2026 17:20:45 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> As nothing is using pregs in upstream or downstream ports of RISC-V drop
>> it from struct cpu_user_regs. Once it will really be needed re-introduce
>> it.
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Jan Beulich <jbeulich@suse.com>


