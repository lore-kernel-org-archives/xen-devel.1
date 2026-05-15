Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8ADCD4851
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2026 06:43:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1309611.1580654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmGD-00078v-Os; Fri, 15 May 2026 06:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309611.1580654; Fri, 15 May 2026 06:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNmGD-00078o-Lx; Fri, 15 May 2026 06:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1309611;
 Fri, 15 May 2026 06:43:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNmGC-00078i-Bp
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNmGB-000906-O0
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 08:42:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c06f-2eae-0a2a0a5409dd-0a2a45078400-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:42:59 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06c073-229c-0a2a45070019-d155dd2cbc31-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 08:42:59 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso5184781f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 23:42:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768bcesm13247011f8f.4.2026.05.14.23.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 23:42:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778827379; x=1779432179; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2rMRXRAIcr1OpIrwpXkcNgZTEg93KKCHcGh8lNqHT58=;
        b=Ln4SMdeFC/ZJ0xd0WfK8V/hc1esF505bu5lFP+HVkuE4PvFH6ggSVkGrA1UDLpZvN3
         3Y70hGS4DWb/R/LkD16D0ZTjrDZEqJ/okEmYGspd5mWx3VYcEwhYFW1/yaUg4ydSgAmv
         BKOngXWgd1Vr63Y4+byZeDYSokVPmLcM5tYTux0Hr3GWzaAjaj8bTK86iTzqXmg/2XDS
         NGUU1pPAwH8Z2+snPZd6snNh3TcTSIM1TMJlpZh585jXCfj0Uct5wzGZODKRvbXwEY31
         +kQZ5r61MvqbpFBaEIceItmNU+lPuH8nMigij+9U59LQQplCixX7rKHGFnxrZ9gSD79Z
         PhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827379; x=1779432179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rMRXRAIcr1OpIrwpXkcNgZTEg93KKCHcGh8lNqHT58=;
        b=U1r6xF+XaxuQCgu7Gmw8StoQLeh2oppOUrB8bRS//+c+croXwe5oCkshXDChy7LVyp
         LqM+8X+tYw/bRrsN8y/Kk78Xl0NStpYb5gxg/PJeuXyTKWMhfVUtinLAACEeRWGUxJ7D
         RFx+WJCtVoRVywGay9P/9Ki1/4QMcGGOw4y26bM/xtm03nl3mgSmjx9Tllj1ahkUzzP2
         9e6GqZJ2v6c8JY7eF2LwgjToqR0rvSjoFpLieks8L7/Gyjt9AQJzZYwYTbb6AXj29ri6
         D+4ktp2OcnUzD6brw7Ch/d+0C3d+IbxWp4JplKU/mJCVMIzoD69CepbXSIfobE9vuuWl
         l95A==
X-Forwarded-Encrypted: i=1; AFNElJ/a50khxTwPZ+ax0klnLmG9l5cs7CDuvRdw2vJvRlAdjrCjW36jKxd7F0wKlGWWjy5G9vQPvVNGOnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1r6EQ8uMa9WFOpfdq9JhmYfbhUYRjpMafqh0SeutjSLHBsRnZ
	EtTP9+1lyFAs1+TvhbbnSuC4b0OMbwd/b1es9muClQonZKBXMVoXQO/B45fEImSn/xeP5VJJtES
	e+Jw=
X-Gm-Gg: Acq92OH7Fgf/xukaQb+vDnG2iJ5+PvadNIIsGOhazw/60+la2vwwZ04euBii6Nul1lo
	TK7dAGMY9uzuVKgAXuTeTRiHVPkK1cgMlcCYIjTuk/85kisM3Yk4PPlNmotjgx23INCuAYQtn64
	83ZMeR4tKE+l7dHs0tWKnmH+MIpU25uAJSbFNW7Jvp7sPBjjmy9n9aiWINIm+wSKUNAGHVMWwLH
	PKTFMu2OGrrC17Hs2mYmAn1tEZZV5Rgs65+umpUpTtgb/D5a8WktXOX/J1tWjHCNSwvuMBEUEG0
	osPhigdf18lWirDFe3nXm7wEaq10SJSfug4R8CO4wZZ+7a23qmQz2obx4XsBtmNSIKM2WGPGEeD
	S9zSnlR9DnLQS4fiGbkLEtombXTKzGDAhcGW8iz6+MXCEuh9B0CNk+tsfrG2b9EVZ8EeCMsW8bo
	v9Vntm+jE95qZ3pF8QGf9RihPJXeMe+boAsjXOJ7Cw1uEmmzhqSmVCBUobma95fcGqrJ1VqDCTL
	deIItDN3GIX8HmToDcgxtNIaA==
X-Received: by 2002:a05:6000:2c12:b0:452:87de:d3a6 with SMTP id ffacd0b85a97d-45e5c6048d1mr3002102f8f.33.1778827379222;
        Thu, 14 May 2026 23:42:59 -0700 (PDT)
Message-ID: <f552ecfc-c238-481d-8b23-42af6b311989@suse.com>
Date: Fri, 15 May 2026 08:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
 <e81837f1-8d97-42c6-9bf8-f6829213733b@gmail.com>
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
In-Reply-To: <e81837f1-8d97-42c6-9bf8-f6829213733b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778827379-23175C48-0E074580/10/73395122804
X-purgate-type: spam
X-purgate-size: 665

On 14.05.2026 09:27, Oleksii Kurochko wrote:
> On 5/12/26 4:58 PM, Jan Beulich wrote:
>> Without this the present logic will misbehave from 2070 onwards.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Generally it looks like 4.22 won't be used in 2070 or higher (I am 
> curious do we have similar use cases now that very old Xen version is 
> used nowadays?) but the patch looks pretty straightforward:
>   Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks. The concern towards 4.22 isn't year 2070, but that we're over 25
years late in doing this work (field introduction which was associated
with Y2K iirc).

Jan

