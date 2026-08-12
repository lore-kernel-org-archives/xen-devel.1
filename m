Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814EC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 10:31:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388972.1629943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu6Ej-00066U-4B; Wed, 12 Aug 2026 10:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388972.1629943; Wed, 12 Aug 2026 10:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu6Ej-00066N-1c; Wed, 12 Aug 2026 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 1388972;
 Wed, 12 Aug 2026 10:31:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu6Eh-00066B-BU
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:31:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu6Eg-006fEA-1P
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 12:31:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c4b59-8faa-0a2a0a5109dd-0a2a45039e5e-30
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 12:31:01 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c4b65-fae8-0a2a45030019-d1558032f1cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 12:31:01 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so7758905e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 03:31:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150bf5f27sm6078649f8f.1.2026.08.12.03.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 03:31:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1786530661; x=1787135461; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaJihWTDEGWNtgMrnyzuOi5l83Je19M2x2j+h7czLhc=;
        b=QaQL6ChCZHGXPYxjDSZCh6KziK+ogF1MO8pVSY9BrhoQWapMhpCQzk3i3pbczxoi7K
         MNQLCWJgIUHsjOTUJ31ZpfV0Jspw6MTtv35qGqtIBsWJTtFAuYvdCO4mmZJfWgm/zcSB
         ev3mwyPjS581LWilM+6cxy1L3AoGtcAzuw855SSSe4OHmqX8ZtkoDwMRimwE1PunsQrM
         8GV4V+2tC9+4lzKpIl+vrPKdr128m1F8c/g2p3DYpwON023sIQ+cojJbapywh1QHEuOA
         KdC6OuchzHZbFUDxgsES6aHK1JHUCF7FYcDczR81+kRlREL1irBg+1eocWl4Aeb5yF+R
         92RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530661; x=1787135461;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaJihWTDEGWNtgMrnyzuOi5l83Je19M2x2j+h7czLhc=;
        b=WYF1cXR511GzHgYQGWgvrThYJ5J1g9SYgOBqSydN6qp8+eIllxrGsixT8lo6x3YOKf
         reCjsw1ofpt4nhMN++zuHMArjbeP2XPbYCacAERubf4EoIK7PhXVdpxYQWlb+u/gmWlU
         5CVETgQB+GxiCcLAm+bi5BTb/mMklxeQYctr0GvZCDmra/DktNMOGnMGcZ3zm01cK9Cq
         0ZFEVw2I5zj5tswxQoDaHIN6c6X56inNaR1bjL9ZlmUbbjbRttvvEYxaTDX2rCA8LLls
         KSlF9rrL8Coxl0Qr03Nl7rqlWfLeyYcqyO9WqhRxcd+OEi/evGdKFGHsLvv5AmdR8Cs3
         /SKw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Fw9NxCfOxikuF8RgHS293w2dkRqiU2yc919HrIvghcJRLFlBTl9supDdNO/r+vuMd65Peo1c9qU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymq4baTF/s0EHauor19xGW8O4/6v3Iwki9osMFe2QCH5Qopy+v
	Cf8eEWlUSkUPl/Xq+HebAbDHe9bwyIoIOaY7rYdrMq/IdGkZvyqkr6i9u1ofHLGLVg==
X-Gm-Gg: AR+sD10Da035m+K/8w5HoB30oKFvSRrTy/3zaMNwzJYhXAUG+UMQkoEbRV+dbUfSaJ2
	JDmDO8X8tWNYGuHxmZMVSlM7qADcawbAjmOcjVq49lNZw0R/JQ2XrPLOFQUsTDmC1E66MaUkRwg
	/t4tiXaJ6BQibK1k9hMnc4v4bNrpAPdVAcuZkBq9xU6Ef0fv99nKfL2O+nqC3DUq6pXp4qBVjGH
	nOA0rh10z+0pBRbq0J2Wrn1xH9LQ4Co7Sj4+xioGxtJPy4mcZDExUdyh5cfLXQi+sywzYNw6BWY
	HrEkcBhKgaU2l++iQuUBe5/qG/nCTzlTMzZdTRthN1zqx8JSLN1l8pQP+CaAefia4zewWmVDC9G
	nuOxGpkc/G28nISUyubEDT8DkIQReR4GL5MbeoSSWMy9elJWnZt0FfRTV29f1HVW26g8459sa82
	KU1K9UXTdbaSHYhk5bvgCr8vKwBXXbx7dT9nYrmJrP9bPD30/BGXlvdabdk7yT1QPQXveL2Zkuk
	w7dT+S3stBS/lkwtZMTwum/ns2slUhgr6twANQ+HuBw39o8vH4f
X-Received: by 2002:a05:600c:1f82:b0:499:5c3c:41a5 with SMTP id 5b1f17b1804b1-4997bf88a5emr48649405e9.0.1786530661421;
        Wed, 12 Aug 2026 03:31:01 -0700 (PDT)
Message-ID: <75ed4871-f9ac-41c5-a631-b9894a84f221@suse.com>
Date: Wed, 12 Aug 2026 12:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] xen/console: use 'unsigned int' in
 contring_{flush,puts}()
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260728065049.1318143-1-dmukhin@ford.com>
 <20260728065049.1318143-3-dmukhin@ford.com>
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
In-Reply-To: <20260728065049.1318143-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786530661-6D8D54E9-DB610A1B/0/0
X-purgate-type: clean
X-purgate-size: 577

On 28.07.2026 08:50, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> contring_puts() and conring_flush() still use 'uint32_t' to access
> indices.

I took the liberty of adjusting title and description, as ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -375,7 +375,7 @@ static void conring_puts(const char *str, size_t len)
>  long read_console_ring(struct xen_sysctl_readconsole *op)

... conring_puts() is referenced only by the hunk header, while it's
read_console_ring() which is being adjusted.

Jan

