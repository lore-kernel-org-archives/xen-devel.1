Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B57BC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:40:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388780.1629767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3ZQ-0006x0-Dj; Wed, 12 Aug 2026 07:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388780.1629767; Wed, 12 Aug 2026 07:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3ZQ-0006wr-B4; Wed, 12 Aug 2026 07:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1388780;
 Wed, 12 Aug 2026 07:40:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu3ZO-0006vw-AJ
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:40:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3VF-00DIx1-R9
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:35:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c225a-2eae-0a2a0a5409dd-0a2a4504e6fc-14
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:35:57 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c225d-b57f-0a2a45040019-d1558032e07f-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:35:57 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4956242332dso5506435e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:35:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997ad79e5csm27165225e9.3.2026.08.12.00.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:35:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1786520157; x=1787124957; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1bRtFRY89P4xtwcddqUbTl5+L6bmLdItlBwZdRvoBo=;
        b=fSUVisZYPfgYr81QACXvMPuCsiYVPGYPM3MDSpuYSh0BJsLpOAg97X39HdVeLcvCx0
         1ZewzIUV1g92V39ifFY9YujuthYGNQcjLPdHY4coqEblSZ6h2zCS5GCNPbxCilJrP6Rz
         MxmUD2N3/X9+dckB51Z0onQXzzFNmxUsbivAmOp63LWEZxBTyfRd9Rzx6wmjhw/F9OLU
         vAPRjvCQUSizSP5lnUeqKqs5l6j51jSDKBztjPnNCBzGlxOBdZ10DkH0QCLVgg9dggNc
         0ldocKty8QCH8MNRqScCttuxU6/9iUCwvGLueny6sJyf+nOybTBDvBLeD5M0ivJ1iCoL
         RAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520157; x=1787124957;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1bRtFRY89P4xtwcddqUbTl5+L6bmLdItlBwZdRvoBo=;
        b=FgHss2ilVPSV7nHzqUDJ+yUNckyPzA/EqjWwryYNLAMz8OHx/NmG5Fr0MLr6IzUei2
         ylqoRdfdVn9m61oVnXqUWINSTSOXzF24F+4SwLFeqb3XSSzCcbugA7P8xnLDvVR363hf
         uT3tIFcpuG7Fvrx7lrOBAfJaC38OkI+jucFDmoiQ7M5W+GzJsuOtqtUcuvmW4MyXuBrW
         3ak8b9D6z+7i5u1h5AJgJ5dvtdWGI/mBG3/YhHA5bFnDNlWGjN0oSe8iiaPPth9GBWil
         s/pzb2Ek/f4RqHJhzH7E+K4+FwMiSehzYj6mqvixaTNCCbKfOcqNsDkrKnKACdcywKIy
         KoVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqyl5DYl/gZ3hmjvGeE3MmOoQ8YFp7SqBGOjlEyqnnooxFj/4IDtznCxZJ2VF/F/2tAHoCHZvYgmso=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfXg6w1PMykI1vymW6ValDRrRey3CxzJg0HSHBtIv+lupziT5E
	1l9lkon3PWPTFL7diQBWicuLjlLI3cAJkbJPcfEaQLc/xMY7z33+vvE1Q2QnNBDANg==
X-Gm-Gg: AR+sD121NgG7kMs2AGojWQdjDCl7tEogkmnOnVt3p733zCGtAEzNH/6c5XpOhxn1pAq
	FbmghpucD4ZsCTUdwB912A8dQJg/8FFUVK4DqHt8pUn5oAQJ4YFnkST70f76tTJMimxtNcmgIl0
	BFYrRw71g3W4kLQ7d6cxv7nyOdy13sfELB+pNWnv2Qry0d3hoRAZhsbPZ4zaLdmG9ibbDGaA+JO
	jlCjGgCxGnaCrcNUa2GlnOvJZ1khpG4kDwucdC0ZAIG+18h3LVrWI0slPe5nBb2beYbtGOXC4OC
	GUOXHm1VoaRKhAxhtWgXC1QnSBQL8RKGb+JRi6vc4hahfPYSvxjmmh/5lKuR1HDsI7YwGbdKUHD
	Uj1VH3dozM5/u3/OvdjFLM+heKavtHVdZ0LShYvjeP8U4k8XLixCJFzYsMGMzXDdyEMg3KAoEIN
	D8Pe8OX1gBMF+U/U18rZ/Uq+EWXhhbmkD3ez7r56MlLCY8p0qFCwHwFV0o3INJWNaTnqNpGk2hO
	WeS3JkrVZLu//me4dz2Bt4ssqp7ZWmMaLwDP5hB6p2iFgWv+H386A==
X-Received: by 2002:a05:600c:8209:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-4997c12b341mr42019485e9.10.1786520156055;
        Wed, 12 Aug 2026 00:35:56 -0700 (PDT)
Message-ID: <3e4526e9-0ce6-4620-820a-c670a3c01201@suse.com>
Date: Wed, 12 Aug 2026 09:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/common: add keyhandler to show Xen command line
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260811210956.3806559-2-dmukhin@ford.com>
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
In-Reply-To: <20260811210956.3806559-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786520157-508D9B50-01B8C419/0/0
X-purgate-type: clean
X-purgate-size: 1026

On 11.08.2026 23:09, dmukhin@ford.com wrote:
> @@ -505,6 +506,37 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static void cf_check show_cmdline(unsigned char key)
> +{
> +    const char *builtin_cmdline = CONFIG_CMDLINE;

Maybe compilers manage to optimize this to the equivalent of

    static const char builtin_cmdline[] = CONFIG_CMDLINE;

yet even then I see no reason why it wouldn't want spelling that way anyway.

Plus this raises the question: Why would we need two instances of the string
in the Xen image? If you need the literal at runtime, re-use
opt_builtin_cmdline[] by dropping __initconst from it.

> +    const char *cmdline;
> +
> +    printk("'%c' pressed -> showing hypervisor command line\n", key);
> +
> +    if ( builtin_cmdline[0] )
> +        cmdline = builtin_cmdline;
> +    else
> +        cmdline = "<NULL>";
> +
> +    printk("Built-in command line: %s\n", cmdline);

What use is this line when <NULL> is shown?

Jan

