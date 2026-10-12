Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864DECA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 11:17:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446144.1662197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE1O-0007CM-QR; Mon, 12 Oct 2026 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446144.1662197; Mon, 12 Oct 2026 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGE1O-0007CF-N0; Mon, 12 Oct 2026 11:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1446144;
 Mon, 12 Oct 2026 11:16:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGE1N-0007C9-WF
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 11:16:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGE1M-00F9d9-QK
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:16:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc192-bab6-0a2a0a5309dd-0a2a4505b6c6-26
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:16:44 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accc19c-4cb1-0a2a45050019-d155dd34ddc4-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 13:16:44 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so1469057f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 04:16:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm20186562f8f.36.2026.10.12.04.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 04:16:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1791803804; x=1792408604; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GW8RSHZ7q65SmBGCALc7Bnt3JFbRru/E5/UAECuWIk=;
        b=JabTwVRcQSbU096AQmCBdiTYJW9FN+DynXaLHt3Q5lT+GlmYh7XILP7vz3bA6KQQzM
         XShCD8QmFas8XMZIL2MOuv5l/VVifdey/6BivT87RhtLLE5KpbQH9ypnCfhIba+XddRp
         ctLwSMCaMvC53yjMgSi1EwqpiNJtbm97EkgWXb1DrAHqbUOHXmuq+5pOr3yNK68uTo0W
         k/P+WAD8FoU5Xp7IPfVZRHGQNMnSwX0Kp7K4VqhSW29loa2/aPD6B5ejUf9omA4jP+3I
         Ad+Kcd9KjkLR1EwRXWA+94ZG//MUyIdWL/8Pv3bVx89LWOd0SZRThpMpe7zs8KdcrSmj
         65jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803804; x=1792408604;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GW8RSHZ7q65SmBGCALc7Bnt3JFbRru/E5/UAECuWIk=;
        b=yeHMYvej+Nhe0nJ0wug4Ukgd7OWtUHpV9IBONx0OixYzhchToml2kfDs8w8i+UmtYo
         h84K2s2ng4DVZ0byrg4lfcN36Lv+u/DWa0ukG8ubhukE5H09lep9krXk6bB1XXCkqkFN
         zo6+DTLMWO+IG1FXk+h36pMWDOoEEKeBXvbAdhvS6BhkbFGB4BGGTM/wjQMrpaNcjImM
         R8zhpHo7kdDzWaMvyNMSgAqbfISD3wKlQapJ9V+xUSsrdcQkW9qTJup56VlXZW34s4oe
         FVNNmRCaZURwCiFsEacsHpHznaow+M7eEDRBwTdpuZg+Sx1V7tfwcYzZZHI4EfegcRqC
         eLCg==
X-Forwarded-Encrypted: i=1; AKwUvBxk+vFpXOw/k0assw+8gtNmax6W3uO2OAkyYFIcz26BDHq2bG+pDlvsPcIZSVfj62Q9EHU6XxcTdIo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJBXY6kTdvabYB5apJnGDsZycX0aUVncQrQEg8THcFOk/qdre2Z
	+NtoidNgmx9w9Dc3M32F9OnSQ5Huz1FnQDAZNVw8sXGn7TPEYJdaYJOajnUGXeL0Xw==
X-Gm-Gg: AYBFou36LV/SCXgiE2BLrA3dDuXuu4iiZIpSk8cGHWwqXIL0wZzlV+p186DYsrGw/tw
	vlkfJS8Yp1OrVJhJXZtJhGVNJ9GobHwlFgjijrkLklj0ZvvhyGPr09IJqA2KhF43dqNewWngkNk
	ziFA/wI8FXrWC+SOaLyo1qZ/H/nR6xaoZsKFxE0a0dL1wjzjW/ErjIkLKzI86uSG3NtdFkwRo3g
	HFZDIRViyhx2zcdOpg/nGttMifxYHUrhEYOpGrcROhsZTAXEC9UQtNYubh2GPVzw+aRK8GawUH1
	HwcspWpGTqqDgybSGol+Z/4VgUCG4PxG0JjfY7knsiTBGO8hl2wNz7v18JscgKR9ud5u6fNgQBr
	zhZv0ixjasgKebcgkFfmfoq4XvHHWw43ZM4YLJWG/rmynKpnGuice9vQs4ob1r1NpjnUAz6PLzj
	ozjtYsH6tykCRzBuqYGMmMZiV7tLA3FmyuYPtOR6jOjhRT5IM3LyQxHtBNixQizl0uQw0M96HWY
	aHg/r5NBaW0Le5Sb41qK9trfiG2kBwYgM8zPknCYBdVbSqQfm7Foo1DoC4TQq8=
X-Received: by 2002:a05:6000:2913:b0:487:834:9307 with SMTP id ffacd0b85a97d-48dbacf06d8mr18489405f8f.50.1791803803714;
        Mon, 12 Oct 2026 04:16:43 -0700 (PDT)
Message-ID: <ee1fa909-f916-4a97-a3e7-8b9474569288@suse.com>
Date: Mon, 12 Oct 2026 13:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-3-kevin.lampis@citrix.com>
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
In-Reply-To: <20261001174749.2275245-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791803804-F62AB2A1-4186720D/10/78276251493
X-purgate-type: spam
X-purgate-size: 981

On 01.10.2026 19:47, Kevin Lampis wrote:
> @@ -95,17 +102,26 @@ static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
>              old = t;
>          }
>      }
> +    return old;
>  }
>  
>  /*
>   * Macro that wraps the appropriate type-changes around update_intpte().
>   * Arguments are: type, ptr, old, new, mfn, vcpu
>   */
> -#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
> -    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
> -                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
> +#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                 \
> +    update_intpte(&_t ## e_get_intpte(*(_p)),                     \
> +                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n), \
>                    _m, _v, fl)

If I'm not mistaken, nothing changes here except for the placement of the
backslashes. Can such unnecessary churn please be avoided?

Jan

