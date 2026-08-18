Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7992C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:49:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393746.1632576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFVq-0002ca-Fd; Tue, 18 Aug 2026 08:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393746.1632576; Tue, 18 Aug 2026 08:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFVq-0002cR-Ch; Tue, 18 Aug 2026 08:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1393746;
 Tue, 18 Aug 2026 08:49:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwFVo-0002bn-LT
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:49:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFVo-005Wni-23
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:49:36 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841c98-2eae-0a2a0a5409dd-0a2a450799f8-24
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:49:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a841c9f-b4ea-0a2a45070019-d155802cccc0-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:49:35 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4955aa106b1so39203125e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:49:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b51asm10324466f8f.11.2026.08.18.01.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:49:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1787042975; x=1787647775; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OX8HwlWMKmzVF2iaRGwJTTGCJjMKbDAbMdfQl49dMqw=;
        b=L/p9gfWBPb9DLL1fDCT+Rfl6/GN1sUSEEfGWupiCeiIFbn68dtMxTpHX11c0+rv/iZ
         nJnmWJOCl8q630dQc4ex4beQWyVAgjQSOmIat3MCZUb4q/XIfJf/T+8PkiSFInCkOwgN
         3ZJQZXVvJVG86h7KY8ue3z1xCdszcTqGgn4cej5MjYYWPWjNi1exroCXzdXamWqUFR7T
         cC5T5SZbeTtdwxOp8hSesGeBnG+vGVRC7eTChPIMaTn91p763BozmPSB2oq5cwgIuN55
         VE1lFqYhdfAcww8JOEpk/+Oniax+W8/TNDqxxwirvgcvbJ/ATElZPieNxVXnNKZZZaSt
         yURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042975; x=1787647775;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OX8HwlWMKmzVF2iaRGwJTTGCJjMKbDAbMdfQl49dMqw=;
        b=AIlT6BkOqiH++Zsu9VL4YPc2mddAtxoMk2/+Sz6EOu9QwmZezasJMXeXU0zd7e18bV
         QVyWvGodjnJKyIuHgwxAPEaQXyxx/eUd2MWZ9TkrOj9ea6A+0lXQ7IyHBn2TTBOkcqUW
         uBa2NUY3tvDKWYLB08pyGmczpMwF6tEvexMIAcxxOxuUpI5a+IejCkTErT3W5yikft+9
         E/HAElRwK9Hk+WXr6BKoG5XF6VWmWAEJLxunmNNKv1agMy6qw6HKYli1boxbhydHC6IB
         Si9uS1Qy5da7tWydvtVnC2FRGuL9HcdprHyOiICZW+6w35uGuZG6PLq5C2itTa8+vEXQ
         pZwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAkUagtwZYrumoN1at5PJ60kTtTsHqdvJDLbGk6SQnht+YZ/aHF7QNdXF0gUv51H10DbKhbpZ6Yzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHAgQr53mR0Kh+HSP0oTsoi2rbHRhNF75Xl7yaLwhzHDJBuzXf
	oAQoZwxmN7XxNGcoki/1seA0AvS5zN+Os9KeearRdYnph98b9kgOiddHr5/ZwUB/kQ==
X-Gm-Gg: AR+sD12QQSgtVXgMijK0pem+auiSbQpWK9myT6tz3Lk2vN1fRcNatrpsOCTwpXmmO4U
	Qj/VQW3llc1zaw6KRr/3nbQyZAQdCGQwggall0t+sa5r9YrUdq9zV9DJNF/2wdhJM8KdDOBZhkX
	BR91nKVdRXUcOLdlNeQoLi55YEt2loKwXvubpULsgOBSzXdov5yoLwP+nTW0oo4Zgz98ttH1X9b
	dqC6ZHjHoqk9l9IbnXZN/kI2EB6yAWyf7ElK6D2YgvJlYFteRxh7oPmIDeYktXyKIl5IjdH2NGh
	8hgwaiF3i12plXElgQNrTQQYY4onJlOygW8rWK9oiMJfnKZqHBfy3tekbInYEXFVhqyW5nRZ01V
	p4Kf/h3A9M4Y55bYdPuZnN4A2n/zyR6bOXD2LgQYeUGS2jXk5UJwCrz7WKWeuPev2r5PDtlBCNU
	TjIZ12DeZCvFAicIf8CNmpNRcYXu5KSJ+2NXoFGgGI+ZB3G/4Xt17F8MNZlrmzH48vg63qCcX/k
	olkTzfFgEzmZ6F3BPoiRCwDrl9fj91RK3DBMyYQDT9itUeRSE30RD2y+EppAlM=
X-Received: by 2002:a05:600c:638e:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-49994db0768mr320849595e9.6.1787042975447;
        Tue, 18 Aug 2026 01:49:35 -0700 (PDT)
Message-ID: <c2cc1049-3b92-4a72-bbf9-c49b2c6ff280@suse.com>
Date: Tue, 18 Aug 2026 10:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] add keyhandler to show Xen command line
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260814010206.1321724-1-dmukhin@ford.com>
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
In-Reply-To: <20260814010206.1321724-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787042975-A5EC6AE4-318628B0/0/0
X-purgate-type: clean
X-purgate-size: 609

On 14.08.2026 03:02, dmukhin@ford.com wrote:
> Mini-series to add new keyhander '?' for showing system information,
> including command line and version info.
> 
> v5: https://lore.kernel.org/xen-devel/20260813035139.915536-2-dmukhin@ford.com/
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2758940285
> 
> Denis Mukhin (2):
>   xen/common: add keyhandler to show Xen command line
>   xen/common: move version printout under '?' keyhandler

I would have wished them to be the other way around (as was requested), but well:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

