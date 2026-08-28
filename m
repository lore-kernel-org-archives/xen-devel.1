Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B73C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 06:41:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401572.1637106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqGr-0004fT-97; Fri, 28 Aug 2026 06:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401572.1637106; Fri, 28 Aug 2026 06:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqGr-0004fI-4J; Fri, 28 Aug 2026 06:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1401572;
 Fri, 28 Aug 2026 06:41:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqGq-0004fC-K3
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 06:41:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqGp-00DTmp-AU
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:40:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a912d68-e002-0a2a0a5209dd-0a2a4508e600-32
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:40:58 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a912d7a-f659-0a2a45080019-d155dd31bd85-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:40:58 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so402299f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 23:40:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb34ae6sm1840867f8f.37.2026.08.27.23.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 23:40:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1787899258; x=1788504058; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiaibNZfVIdPxinq1hhQJhOEXV92eSht5gWkix02knk=;
        b=LjbHgesBMSNT1jAUfeozUbWifbwgpBisOGOjFAW/4fNfeE3oZ9j0Kd7Tbb1gskIco/
         VpZ/4QyxA2RvRaH1hKemVIrXnpWhmS9/R6iqmG70JOWcYw1QSVNsCxK5w1pqdNinIrQi
         NONSSKUV1JJURbykKY5L9agnfk3Se/l32K9MmhH5qSYtiFMv1bHwLByiMTQqMefoinPL
         JllF713odY2+QekdEkWybCJG62bN0AyOJy/uEtGIfHMwcy6Ru6z78bEU1nayFeeZSZJf
         nQN7hOl4/rKstxNDz9O8Z7Y9HCwAfSIQbJdTJjqWC1ouV3Y2Y2i9l0fiIyWRyAtxTX6y
         JcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787899258; x=1788504058;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiaibNZfVIdPxinq1hhQJhOEXV92eSht5gWkix02knk=;
        b=Tt/DNwXSdiYb0xk/uI/WS4/BXzupHphJMoQD7Mmhdb46t0YZGZ7RUnjp6bVOrnkepc
         hRLyM+jUD7XUOo0d3tN6YEs8S+hxnbFL630A1FdSfKZIV8b3gSCzQWVh07gEFLwNREkv
         oBixr/Hl1+5ACFKe4XMEwsQEFIixT983naBwL65PkXNoJ34kCdqxGdTmGtLsXYFlJ9pW
         vruUn3Bc+SgjBldqCGKEcwidddRvq1SHAeBOoqYC/hAydxW9GcnnuHOCKB49ffT4NKnk
         yv7ysgIB/UqRm0Kd6gtEkVQNQkwas6svQbabavkESbvLsim2MUKrofhnBZ76AJXD0wtf
         WDRQ==
X-Gm-Message-State: AFuF++mhtHqfnxldPsc4H4lmNATEYrTozwKFzB+Q9pLUWSD3qgo7pxEs
	1uRTt690KmAOQPeqgovVrNIzV6xzmt8Is0HuJeyNzj3s/mybR5+0sBumSuwDVSyJ3Q==
X-Gm-Gg: AR+sD11HB+pyprgqB3evv1fhNQalaAb5EgPVVNUcB2QQDo7jzAGhlahXuqnCPDyupQd
	AvYhiXL0kpGbbdAC+b7jl6FDkfTr0C4IHXgU/PhVZBqX7Kvq9erNUXO0WgkfR1IOlUKJgy6Mvx5
	43zGqlxauf7Spq7TbitECV2iU/ZOLLFEd2q0UyGYh/uhiPOD/t4jQPM7A+9FKq0LI9IOfHrVs5d
	nJNau1FAiqySSXuNYaew0sB7LJbHpaqKzoCDfwD6Qa8jYVr4ZFGF26MCJWD0Xnew+dTaMfRbOM3
	0FVKSlawoZwIfhgT6TwmbBP+ewz1uLT3PS6YPl/0PcbT3Fx3nwaquUFYelsqE1NhgE7SQynNYgY
	ZXer1zbbvpW0UaB4/QINprPvVAHUoyTuJV/ha99Ux2L7iPRqdQSw0feENlHoo7TU/ydIuExD9/+
	Va34hURZ1Ad2eA2gMDZRee7TamVfDzVsP7nKJNqVYFAeVaPvRls5KN9ms1HMotXBvc6AQbNZgor
	pWnWk6+rdvZsA12sf8BQRYjUtJTFq+oNOb8zgn+PC1p6d37s5npB2YL/DIhN974
X-Received: by 2002:a05:6000:24c6:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-482f79870bemr5400345f8f.1.1787899258186;
        Thu, 27 Aug 2026 23:40:58 -0700 (PDT)
Message-ID: <1b680cd1-c086-4aa1-9a8c-f89d9743918e@suse.com>
Date: Fri, 28 Aug 2026 08:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] flask: add const qualifier to
 security_context_to_sid()
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <ee0ce49467ac1ee1cdd017323e70c8a865269f39.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787899258-D735D87B-973723B4/0/0
X-purgate-type: clean
X-purgate-size: 829

On 27.08.2026 11:38, Sergiy Kibrik wrote:
> --- a/xen/xsm/flask/include/security.h
> +++ b/xen/xsm/flask/include/security.h
> @@ -76,7 +76,7 @@ int security_change_sid(u32 ssid, u32 tsid, u16 tclass, u32 *out_sid);
>  
>  int security_sid_to_context(u32 sid, char **scontext, u32 *scontext_len);
>  
> -int security_context_to_sid(char *scontext, u32 scontext_len, u32 *out_sid);
> +int security_context_to_sid(const char *scontext, u32 scontext_len, u32 *out_sid);

I see Daniel has ack-ed this, but:
- The line is too long now.
- The last parameter name here doesn't match that of the definition.
- While touching code anyway, it would be nice if u<N> was converted to
  uint<N>_t (or else we'll never complete that conversion).
I think I'll take the liberty of addressing all of these while committing.

Jan

