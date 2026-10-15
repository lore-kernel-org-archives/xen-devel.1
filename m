Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD3CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:42:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450140.1665651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHyG-0002Zp-Bk; Thu, 15 Oct 2026 09:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450140.1665651; Thu, 15 Oct 2026 09:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHyG-0002Zi-8a; Thu, 15 Oct 2026 09:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1450140;
 Thu, 15 Oct 2026 09:41:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHHyE-0002ZM-RO
 for xen-devel@lists.xen.org; Thu, 15 Oct 2026 09:41:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHyE-007OzD-7x
 for xen-devel@lists.xen.org; Thu, 15 Oct 2026 11:41:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09fdf-bab6-0a2a0a5309dd-0a2a4507aee8-38
 for <xen-devel@lists.xen.org>; Thu, 15 Oct 2026 11:41:54 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09fe1-b4ea-0a2a45070019-d155dd29f148-3
 for <xen-devel@lists.xen.org>; Thu, 15 Oct 2026 11:41:53 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso220144f8f.3
 for <xen-devel@lists.xen.org>; Thu, 15 Oct 2026 02:41:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac3ac5sm17573119f8f.38.2026.10.15.02.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:41:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1792057313; x=1792662113; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6cx/+bSRSzNbenAV9qMAYNJ8/wluukBmSju653PTBA=;
        b=eOA7+wns/st/uWIxTAx4DJHogrUu67KbOaQ1+7CNy0PddawSgcDMhGn8D3vjl+rQlM
         EDmhVitNQ56eq/4sPZ19NzGecSBlNW854uXlKlobLrNelXN3Eva+dBmfMQfxOUXBWVCu
         vH3kx/AkntrRfoc11smijAcHGqr8EWAk2z+xKpzpO3rEQcyU0Xh21uk0MEVCGNSbtNeA
         6jPH2bTBsx7VsyL19Vd8aKFoyA6ei1U74EEKTR/Bdk/4zs6jOtxQzYhdQIkd3Qs2mszC
         rxS9Ivb2VvZo1if3TiiIQDijP+kbXntqInIW6kpJ1b5VaR0q7vaPdow6LtdJ+c2Iex/4
         SDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057313; x=1792662113;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6cx/+bSRSzNbenAV9qMAYNJ8/wluukBmSju653PTBA=;
        b=RRfj0iR5IkYp7oW8VeqUYjCsIkYR0O8PLl3QpjNKQ+bDl7K2QwiyDxHsO3VOmnUnQS
         5VnFSwwDpGV79m1vITWxECnvIgo5G6QI/O5ZY820uHDzkjimQrnMNDnsA/fW0JppCEQj
         gFlK/XDl+1ajBqoGbRGT+7wdhNpyOZWlPWgzKyC3eIub0Wew0lZ4nAkgU40fb0yTPl0t
         X4wevK0JlFxHV1mqGXXHVPHEGeL4hrRVeWv2dVGApNzzSTo8+rrH4njbxv4UYX6r3/jr
         PthOiyjl9wLPi68375vIbIkG6pw8VTt6GfyxuAYyMS4onkqZkcoBkaNZaWKxdMimcjTb
         xFpw==
X-Gm-Message-State: AFq9FYJK3RzikHFUc6tzuMOC1e2dP1XoBvjiBcJ+YhkUhk5VWx+0bSMh
	i5wSx5zJgc5AWn3kPjt1yaOvWR/20FtDguzzmgA7Cx18CRbKnXDo5JAtunLcTmvEaA==
X-Gm-Gg: AYBFou0ALjP4ls0EiVTIVVdG7TD2/spEposLCdtoPZZpg9MA3MDZfVdfOoUkZF/bVlB
	ixNkzoaQTcwK3vkuWqQ90bjT1QQecOnTskOvvcARVsWD2lkH0IOsMr/tSAmVM6bXDtdG/u4tUqD
	O5j0iJtkWc/E2sDvo0LVi2ZaTKCd/TU9EErKkwv7l05PqrsgPKAV63BRAsvqqZ9Mshdwl79OgzO
	vFoYOEeN7dgCupCBIgSn7+NzPl4F2S63N87O8alUlf9n9KsEx7xjn80YNaMHgQaI+acEwCaB0TQ
	Uogr7UHJfj0Q9Yhzd3FuGeKmsny2AKzmCGNulH7U+j5ShAeVWrYFYgjzOegg8HYsL3Wg0sTE9cN
	51hvzmA7NH3o4C7mSukEQw5dVunmpeSz+sIY1tyykV47K2o1zPas+UlpB3v6YMOQYH0UZPnWksO
	7spfeyLa2wKjTdIOXHycPcP+8oNLJrqtW4PTgYrdVZzrrEFLAdpIAjpauc2pTIX7Pzh1XwNkJ/r
	x8IdbXB85UKMvdUnq2dpTtnP+Z7SA844Fu8FShflyUJixLf
X-Received: by 2002:a05:6000:29c3:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48dba7892f4mr23316461f8f.4.1792057311456;
        Thu, 15 Oct 2026 02:41:51 -0700 (PDT)
Message-ID: <b7128b3d-015c-4764-b20a-3c9248d8c0eb@suse.com>
Date: Thu, 15 Oct 2026 11:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen Dom0 fails to boot with "nvme.poll_queues=24" and
 "dom0_max_vcpus=6 dom0_vcpus_pin"
To: Egon Ojamaa <egon.ojamaa@protonmail.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <U7HCP3LJd4EyfAH4QnOSFByAb7GtqgCBigeGGjopZ501a2wAYBQ8ySpQ5_tHz9UCQ8Si5_3lEV0trGVLcQO0c2_ZWGnlwK0kF2gRVOHTv5w=@protonmail.com>
 <e3aa9017-1481-417b-8588-6c7af6c4875f@suse.com>
 <ZdqnKSsFVZlobgEnQFmNe3daMG07IiG61QPJ3-wiX2CyHwXUpxeJOZUPM4dC_a29p0uGFn4czWO4TmACvBQisQeHPhPO2Osjwb4G9MiD3Z8=@protonmail.com>
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
In-Reply-To: <ZdqnKSsFVZlobgEnQFmNe3daMG07IiG61QPJ3-wiX2CyHwXUpxeJOZUPM4dC_a29p0uGFn4czWO4TmACvBQisQeHPhPO2Osjwb4G9MiD3Z8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1792057314-A76D2AE4-396A6864/10/78276251493
X-purgate-type: spam
X-purgate-size: 1128

On 12.10.2026 17:51, Egon Ojamaa wrote:
> I cant find anything in logs, so I suspect it does not boot to the point logging can work properly.
> 
> I tried now to get somesort of log, not sure how useful, get IPMIscreencap.7z :
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2170270/+attachment/6008530/+files/IPMIscreencap.7z

Judging from "nvme: `24' invalid for parameter `poll_queues'" there,
"nvme.poll_queues=24" is completely irrelevant here. Following that I
can't spot any other nvme messages, so I have to wonder in how far nvme
matters here at all. (Needless to say that not being able to search the
log, because it's all pictures, doesn't help.)

The log above is, apart from early boot, only covering kernel messages.
To us, the Xen ones may be more important here. I fear that without a
serial console we may not be able to make much progress. If you're
convinced (despite what I said above) that nvme does matter here, you
may want to try getting in touch with the maintainers of the driver.
Their insights or debugging advice may then allow someone here to come
up with an idea.

Jan

