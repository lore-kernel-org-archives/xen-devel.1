Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420BC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:46:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406937.1640102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25tI-0003E5-7z; Thu, 03 Sep 2026 11:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406937.1640102; Thu, 03 Sep 2026 11:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25tI-0003Dy-5F; Thu, 03 Sep 2026 11:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1406937;
 Thu, 03 Sep 2026 11:45:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x25tG-0003Dq-U4
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25tG-00EbSO-AR
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:45:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995dd3-bab6-0a2a0a5309dd-0a2a450ba486-40
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:45:58 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995df6-b7e8-0a2a450b0019-d155dd2fc1f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:45:58 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47fe89fb333so1468861f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:45:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5941cb4sm53273345e9.4.2026.09.03.04.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:45:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788435957; x=1789040757; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FTmFJ/wHpKzSqbg/irj1Tfv5FuutXJr2ik6F9XpbNRM=;
        b=IUJxkmray5QWLpjTNntlVbSL0LmEvl4Z3+mDhrovAw26/NHTLt64rOYrYW7Q2eJ33Z
         vAuAjHrZeN5R36hJeH4/Np7Ljzym28OrGxLXCrOjg+cxo9jk9mjwYjaqP6Cf4w2rmxxT
         5YHQf5iG5fwxAwsrzxFZU94pdVNQPDeIML00yOh9RcAVR/dDqcoimY2rz8PD0QZsaAlJ
         yszch/desc3x9K7CtPnYlLEVdFHYJCyRAj7l1dZG+cMUPOx2yJXKPBQrzIh6P0V6nw3+
         LeYRgNxvWVIkHlUNlA6RpiXqsxJ+q82lmKIm9YqLEBfOANjiDsiaF0AGmjPeX/TsfUjD
         WKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435957; x=1789040757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FTmFJ/wHpKzSqbg/irj1Tfv5FuutXJr2ik6F9XpbNRM=;
        b=kDJbZAU1UPmIyCKG3iHSD06or099TmHJH2eabWtLtdB5tZtcN+FQSEw3WBkuev0LXK
         TJbP0LVWdyF6gcYIo9NwEO2XvnWG2RazRXIfd7V90cgV/f7zEe8Za9NBH/0wYEA8G5RB
         2yaGMgAW0jds9uCZ8Sg48NUXkV14TJGtkEpsvWhnIp7ofuoIiyseaFl9+Atrh2E8yME4
         G7qIxW1YqbQHEMf1Ngh+9n5LY/hNHc2vBlo0U7t/FCMce6SY9zyj98WVvsW7oHCejtuD
         V6b0RrdUPPHYGwuQmnAg8llPuym60BXnvfgHvRfr7pvb3zVFnBNac6CTA99YaScjh2o8
         gqMA==
X-Gm-Message-State: AFuF++mFHCANJrBQnjBi9DGA4OKhk5olJUQsluqYIeA6rLBFSnZfhTyC
	PmtbpDqluZQXChYXa22e6jQNzwA9mBuNKbJBTt8vVXzFU0sYzNpkH6vuirXRl/U8cssofRcpbWx
	Ou08lww==
X-Gm-Gg: AYBFou1+SLdA97e2supKKW/vBkIWeCNw1HUacOSWe/8ZIDAsoiQ/9k2oXGqOkXqOdFU
	TiImbYNJXukIc3NC2BfeYH++gOR6oYd0ELFa2GE4NAWV76fLL+t0S2Q3qBYr+1T3PaTexSt8yxn
	IyfsoAIaG3rQ+B+FDIYFNVoZacWpz/7nWgpD9n52oJ+VDEqzVR8OaIe/fW/AYmHDWfUwNvI+JFQ
	eEboCuEV+u5cjDbzVBJK7DuhSNZfvj5lQml6aWhLZ1z24qgeOSQlQ3mDg0s39TD6vk6hR4Kxarq
	XWKWQwUh/4Hxh5tnSxdPf2XiypdLi6FiuHZfjJWammRLqJj1P/VU911JjFTsNSgZQWHGypO7n0B
	ngNM3tLRb4mHDI3+eif+IE5vxqZb6MSDhDZfdR20mgrob+l1MlrMw/Hi1xXPeGtN20lGJEvjU2A
	jlthVwfUuxqs/eHIGKKNhrYso3ILqSte0/aWwI27aflD9XlIiqkEejthgu96e3ydnmEiMdPxxyN
	zywbjR/Gs7oPzmYeXlDkjB/pAcmMEDOl7wGX57JI1+BTs4uM0Xg
X-Received: by 2002:a05:600c:45c4:b0:49c:e1df:79a4 with SMTP id 5b1f17b1804b1-49ce57fdd1emr211511515e9.5.1788435957706;
        Thu, 03 Sep 2026 04:45:57 -0700 (PDT)
Message-ID: <a02fd9af-904a-402b-86f2-576ef7d5b0fd@suse.com>
Date: Thu, 3 Sep 2026 13:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] address most remaining rule 11.1 violations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Content-Language: en-US
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
In-Reply-To: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788435958-A84CB9EA-D825E62A/0/0
X-purgate-type: clean
X-purgate-size: 407

On 03.09.2026 13:42, Jan Beulich wrote:
> "Conversions shall not be performed between a pointer to a function and
> any other type"
> 
> The few ones left (x86_64-allcode:1, x86_64-amd:1, ARM64-allcode:2,
> ARM64-amd:0) likely need dealing with by tweaking patch 3; see remarks
> there.

As per [1], that is.

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2816360844

