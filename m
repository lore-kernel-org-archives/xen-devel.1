Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A2BC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:30:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412953.1643230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HRZ-0000Kg-8E; Wed, 09 Sep 2026 12:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412953.1643230; Wed, 09 Sep 2026 12:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HRZ-0000KZ-5e; Wed, 09 Sep 2026 12:30:25 +0000
Received: by outflank-mailman (input) for mailman id 1412953;
 Wed, 09 Sep 2026 12:30:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HRY-0000KT-Qv
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:30:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HRY-002kqj-3k
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:30:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1515d-8faa-0a2a0a5109dd-0a2a45059d4e-14
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:30:24 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa1515f-4cb1-0a2a45050019-d155dd2cf101-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:30:23 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-482dd6ee390so6444715f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:30:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bf3f0sm48209345f8f.33.2026.09.09.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:30:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1788957022; x=1789561822; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vfWcV+Rr/yaJNNidS4GBbHBi7UAgQvsCOyZHLutSvQ=;
        b=VmsgqP8n8fxNmWETNVu6/wxm6Lwy0tynQ37JUol9UXnmAfCKiE1APR1UcCpMnbCrx9
         B918DwOi1arZjXRp7aYbF416X8U1FgPDnI9i65xzwBKZaUcd0Gqfx4YYbAj6gO/V5/Vb
         6/s6ZCIj+ydhH1zy17UNM1czqYj0JTI+J8zR1kKMaXi4/6CQIf1Ma58rmd9MM45094Jk
         aFEi4D19PqUGDxxcsZoSBr97sTCui2HpdYvV7wHsLr3XFnUKZ7p3HPpwzJWTQ8XGNiOf
         tq9jqTbN8CXRZ9UCySKD0KhWXKhV6SLTc8TeIFLf121zUY5PUh7iJTCcbgKhngvqob+2
         0qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957022; x=1789561822;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vfWcV+Rr/yaJNNidS4GBbHBi7UAgQvsCOyZHLutSvQ=;
        b=KRUQ7xGHxI70denBwHratHDbHGEUAuwaAeyiIq1191Br0gc8u7OqOJUZw41mHFU1x7
         8AaTqFYOHmiAyFWf9s8KJEdLKY29MlN5OzT4xJxzM0QATQT76zruMyCmLy7OtuIz5OHG
         n7TS3NZQ4jfcR7xRnFyKujbpDx4MiabmcSo83YMTo7jnzTQJzttIf9ba9XHZTWGU+8g8
         YkNg72/jvc6GrpkP84lrrKQMAzVucgX6fNLNoZwTod1Tfg+4tZ5an8L/WYF3QdakMWSq
         rq6lWu0y+4qbAkOjZQ/F17UZcFQGqL4mlWNTfNRr/N64ngt6RqAzd0Jyy3b4glvNSbFh
         RpBQ==
X-Forwarded-Encrypted: i=1; AKwUvByPjTYBw5Qp1+RONiqgcICdmoeG6XTIjnX8pFjYeQjA4/n9KszNqQvUxCTipn/7KJDC62zB4sbTpME=@lists.xenproject.org
X-Gm-Message-State: AFuF++k8LpHdXW/Ll5tYCkJtOoCuTo7/SIz8WwyNacOqLgSCy2P6Z+dr
	lo3rMzp6606FwFu+qP3avDtk6DQ65dusJLZ6PH5uIcXtkL+z+EEcXTQvaiyGSCGJGg==
X-Gm-Gg: AYBFou2K6u7nE8xqdc5RlqJd2CNBlFpnkOwSTngdLnzGIJACBErdoi2P0LIwr6tveiM
	aCsaO1gtP8A3fgkRMvKETlQesxqG5Z3vEmHdeQe83OQoJLFhVrPP6VVTwaGTKdoZeYW6CLkFab4
	/N4S4CBatlWbcEfseaf0oawNntjmvjrwDCsuzFECpa4y9PK2jaZhqBClOdtuL/E+PmefGZsFKdz
	TqUJlc+CgB1v/I632IDVdj0FdRF4ZYNMJ+r2oYlg8y2zZG0VHGzCSERAFG9jFvjEg7cuac5ejQJ
	7qMKRlJ4NyeECWY5eviLdcs2eMLmjWlv0rSFAOMg1n1AcUAWpCOczsynzZJ/hdBHm3iI3UxTSTk
	FZU8xq9om5kl554T0HAVKB1BeDYvr7XFAwBwI7YH/w++cqGxCH7bbaKoUwn0hIN+tZfwqpdw9Bg
	wagl7dnleptd6QeEKXrWJGO/a/Dt9S602UuEAyJiU+sSRCS13aDe7rPUMrYR/bKmIvj6xZjHt9w
	u92yDHXsKgOZbifEtZxUuVvY6Zj0bq30EGDfZsk5X58e4+gMTYpxAMkj2Bc
X-Received: by 2002:a05:6000:718:b0:485:8c16:a341 with SMTP id ffacd0b85a97d-4858e703eabmr30026683f8f.54.1788957022389;
        Wed, 09 Sep 2026 05:30:22 -0700 (PDT)
Message-ID: <1f371e61-8418-48d8-9382-ae8827e6b714@suse.com>
Date: Wed, 9 Sep 2026 14:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
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
In-Reply-To: <1788956067.8631fc262581453bbf619ec5b2062170.1a086174641000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788957023-F68B62A1-6ADAA26D/0/0
X-purgate-type: clean
X-purgate-size: 500

On 09.09.2026 14:12, Teddy Astie wrote:
> When settings HVM_PARAM_IDENT_PT, skip domain pausing when :
> - there is no vcpu
> - unrestricted guest capability is used
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Regarding checking for hvm_paging_enabled(v) (proposed in v2 review), we can't
> as hvm_paging_enabled() is vCPU specific, and vCPU 0 may have a different value
> to another one.

Ah, yes, of course.

Jan

