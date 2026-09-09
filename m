Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF32C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:07:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412713.1643087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EH4-00058s-QD; Wed, 09 Sep 2026 09:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412713.1643087; Wed, 09 Sep 2026 09:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4EH4-00058l-Mt; Wed, 09 Sep 2026 09:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1412713;
 Wed, 09 Sep 2026 09:07:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4EH3-00058f-CD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:07:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4EH2-001cKP-LB
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:07:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa121c8-e002-0a2a0a5209dd-0a2a450cb05e-0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:07:20 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa121c8-f479-0a2a450c0019-d155802ec4da-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:07:20 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso54963035e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 02:07:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d20fce7a7sm96338115e9.4.2026.09.09.02.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 02:07:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1788944840; x=1789549640; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHE8jaulGAEwrLHrzoGfPszK91vl6DFnbrJHVc6I92I=;
        b=grMmu7lHpcC79K2lQ73N+70kLLE7Vt2EfqpAF9WggKm31ZaW7ilzqlt7ccd2dYRjXC
         7bFAm6y9JVOoGRxPfFjUGpQvsstXIzg/QvZ0tRSaqJdETvc0ybBe+RBxWodFrm2cTLRF
         PzmWWF14ifUWQDA5u+nMoJSBejwd43Fiicv5xXygDDZkeybftatdTjK9Wx1954JJOMWI
         KEopzEXRqe66NyHun3RAFblAXh3M53rv+sOIIRvRiZC4fB/WRzVQPecS5YxHN5U7USsF
         uNWzrpe7AZO5BsrEcK6Ri12VbqQyeRNGv5eYEPEemV3jRg2jCIfw0VC4fLI7yFneokFX
         uUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944840; x=1789549640;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHE8jaulGAEwrLHrzoGfPszK91vl6DFnbrJHVc6I92I=;
        b=ll3MhStdI2Vo5Wi5sAAyHr9uGdhJuvLoetvvP23PlmJEjivoLRiDDvlhtOOAmX58Xu
         HA2e3efsZyl0CaUecVYuGMz4T3lEwR4GtbcC7NMhyaanLqJdZnXcu+4OQaR7Frd1CX79
         QgM0arER7Ta2lhCIIXIIXxvc9PGB5hejgIBN6QBxqbEH2twwlPyJP1oKAF7UsFef+jV2
         IRVIaZLtJb/axdm3Hh+OQnx4JJTDkZXWAa+x9yjjZrst+rmgGXB8tkSRxuiTIRebse36
         s2Tm50yAz1mvhHvWnl283U/qhuKVnaUmhlwFzVqEJIG/zdZbUFdGNtFdTE4iB0NISP0T
         lwFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvua0zZva00IVhg7zOU4rKaHJL/yxNlVJDGk8s2VMx6b0qFn+M07trQcT17usN557Yw3d84v93KT0=@lists.xenproject.org
X-Gm-Message-State: AFuF++moQ3jQ81BeAdI3XLLBID8OL09NQCfvSvTN9GLoKsb2hYd8Woef
	TQd+D+v8GCaJT9/2OcMFPFcvGdB0rAeSJR3Q7PrQ2wxP4dwg2Y19PT6cxg6i7amXRw==
X-Gm-Gg: AYBFou0SQeIebH3c6Z+NgV6Rv+MMKFMNOnLy5xYIAFsq7x4WsXIHc+vRJ+s3n5cY7k8
	nudskF1+05aYXsVVkAdbEYpNoK6JmudbbM3oG4zJiGk/BHcUhI0PvVqrk02Nou6dh8Ta4jz2lyS
	wKAplXuGIHPAr4onFDpQekAEJOqOqRzinxrEy7t/LrOIJCYcUCglcvH8hMWcwCSIuWCpPPQSPou
	0NCfcM2LVDsSOtO5/vZRRp0OlpH2tQJpO85qTc6MGTavwdRl9Kf25u+rdJzzl19qW3uEV2iIMVE
	4ih/jLp+UeEZfq/aGaQWznPATlpwjqnPESKW7zTp5tz6YEGm8B+liTIWNzZQhGs/zPMsxnqnrnW
	9i0fytjE0W1QZaY8+Wk4JHlT9MAD2dXrvpXf259RSUd2kYNfkxHIMGNPb8sXIA0XybMKKKCJBta
	oaRwjGQWxOxo7oY5av9g4PkOkewzDZn5z1ZtnTPz3qqB6SwBef3CGF6lH04B3/AduuwEuSZEdn1
	hgJULj5o6jumEPXJNzWdpnJ833fko504+dg3ZrZ4loMRycq1JJgV2FSQI+P9y8=
X-Received: by 2002:a05:600c:3544:b0:49c:f5c0:aa79 with SMTP id 5b1f17b1804b1-49cf8244bd0mr349787475e9.9.1788944839835;
        Wed, 09 Sep 2026 02:07:19 -0700 (PDT)
Message-ID: <3f2bb6fe-a517-421f-adb9-c33d67ef4591@suse.com>
Date: Wed, 9 Sep 2026 11:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] common: dom0less-bindings: introduce XSM labels
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20260909085707.2359322-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788944840-77AD4A5B-742F1EC6/0/0
X-purgate-type: clean
X-purgate-size: 674

On 09.09.2026 10:57, Sergiy Kibrik wrote:
> @@ -141,5 +144,13 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
>  
> +    if ( IS_ENABLED(CONFIG_XSM_FLASK) &&
> +         !dt_property_read_string(node, "seclabel", &xsm_seclabel) )
> +    {
> +        if ( flask_context_to_sid(xsm_seclabel, strlen(xsm_seclabel),
> +                                     &d_cfg->ssidref) )
> +            panic("Invalid security context for domain: %s\n", xsm_seclabel);
> +    }

Is there a reason this isn't a single if()? Also (nit) the one wrapped line
is mis-indented.

Jan

