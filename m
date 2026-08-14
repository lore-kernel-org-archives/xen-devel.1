Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA013C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 08:03:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390926.1631031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumsx-00062e-Q3; Fri, 14 Aug 2026 08:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390926.1631031; Fri, 14 Aug 2026 08:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumsx-00062X-MM; Fri, 14 Aug 2026 08:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1390926;
 Fri, 14 Aug 2026 08:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wumsw-00062Q-BP
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 08:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumsv-008dVh-2S
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 10:03:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ecbcc-8faa-0a2a0a5109dd-0a2a4509a368-2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 10:03:24 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ecbcc-be1a-0a2a45090019-d1558031ac91-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 10:03:24 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495590dde14so9594495e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 01:03:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899b5f86sm9615415e9.5.2026.08.14.01.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 01:03:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1786694604; x=1787299404; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjICsrA5cb4iwjJ9PiwOXzn3br1MovIHw+uDab9cNZU=;
        b=WpGzeHzOE1bunT55Pw13bNL/jlzKijwuY58PeKOjx9nd4fflfJy0+wKq9lcrUeM1lE
         w/Al0GoNrzsOwuQNNzk1Eg2hxIHlDlfycODiKIwjEyhqzk1V9UUSc2OhjjttyBZzOA1m
         7U/Pc/+bDI6M4QwKW42z25y8IVlZXHxPB2IGEGU1XcJHcjgFGpRtpIYtUr2+uTBk04cw
         lU7lrUnt3ioXhHgpWJ24PIB0JN8P5YGXQP87pplcb+wm+OvP4hsvgiideRa1p3JSHWPQ
         eMpwSBOZxxLDVaWcOOlOJXZI8RSPIjNJOZ1Qbh+DAFYgHNd0hNOZWuz/7rDUAj9x/m2C
         gWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694604; x=1787299404;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjICsrA5cb4iwjJ9PiwOXzn3br1MovIHw+uDab9cNZU=;
        b=MLAGTQH7/vvwWBQW2htr7SEj1MPVRHkVgoASCq+WTHJU//jadrIn6MthRBsm1gAIXz
         JD58xtInt25yZezoDyIECHmDZKRaUb5wjczzPyfUlzD9fm2oRq0ld9NM7d88bkylQIud
         No4vgD8/UywXquktnl9UUeDz9QWNF7h7mIQvlmt3+xlEVCk5BiDRPDZoGLz7lDLyg0A8
         IlWT+REctHvoPEj620yMkgXgnC9W6/8oOUKYEHDIzTDbdaQYOrnDGCK4GoybEUfO8uAy
         ROrDkLkLql4J40tHQZw8tvNFdDZOcD3L5XEf2dmpZwtjLSsMxvai+YwSwpCM7ZZUS9Lh
         sveg==
X-Forwarded-Encrypted: i=1; AHgh+RrPxwXKVE13b3ZzgBR4n+3P2T383p8FpjxB7PtQeJQ24IGqCmx9wIU9xAqO+rySSsxSmaf1AAyAcCQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB+GuUqMEhdJKnYQPfHQtGYa37+/LV8KAFiAJJRJVZXqxq4GGA
	7xWBULorhHm8JB1Jp13pZ1tzW6tMnTjsuLq4QMD21+cEi0BIZ2A9hlLRmul0NlqntjqJIkhBLmN
	p5HM/Dg==
X-Gm-Gg: AR+sD13iHntDxkhPY8n+4tMhzgVvMz3CZSpp/Uy8F3qoZQqZRrjIbzrRLCyV2GS74jb
	boGtNW4+OWdrmueXKwAvol4rAgWDAuIHLlBUNZecd+Rntup0Z+YRTRNyUU0jlme2ZGt9IWvKx4G
	8vPDQfcb+b17b/Vefb8SK0eO1+5fhBcTm8RrEqArGFE0lKbSdMcgsLifL4MyoGueHMhavcZjN9Y
	kKH7HRHnkO58LhRejzKrDMP0rJEziraSJLQ+fsup1Z1dS0ePFDx5JsTnZWOnqkdB6knI6EU69nt
	goJBIamV6z8HLLHFzzQ4+JChdOk5SPpIis5hgpleTE/NxV7ZKTlUOElBlaJvAHXJ7FSQ3nrwdFP
	e7DvrCvlo4kztcTrf6Cw1I8mi9FuPjkySs0/ArtGyBPmqUjoevjXHyGo+1ZsAmidcpwPExuUUkB
	Opkjk/ihaxxDy4yHAEvlPHfrVAGKYZy0crW0R/5J2tzPX4dnllZQsICEHeKAU7tBW9i3T9u5gDN
	xtisAr41HtLbKaYExJprcVtLnYg7QIPmkGHIYXUwqdFwpN3kRP1
X-Received: by 2002:a05:600c:3e15:b0:495:6b55:f938 with SMTP id 5b1f17b1804b1-4998797328cmr54577055e9.10.1786694604229;
        Fri, 14 Aug 2026 01:03:24 -0700 (PDT)
Message-ID: <2f247bc8-5179-4b56-9585-37be6f5c80c8@suse.com>
Date: Fri, 14 Aug 2026 10:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools/console/daemon: fix log_dir memory leak in
 xenconsoled
To: Andrew Precious <andrewprecious388@gmail.com>
Cc: anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20260813212724.2607832-1-andrewprecious388@gmail.com>
 <a34ad4ec-28dc-4494-8798-f2a6b0fe7bae@suse.com>
 <CAF14T9n3QXEKHse-=7hr_=VzMc9ca7xkoSnVmGE1aZ_vsFNM2Q@mail.gmail.com>
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
In-Reply-To: <CAF14T9n3QXEKHse-=7hr_=VzMc9ca7xkoSnVmGE1aZ_vsFNM2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786694604-BF4D3034-939CED41/0/0
X-purgate-type: clean
X-purgate-size: 276

On 14.08.2026 09:59, Andrew Precious wrote:
> Noted,it's my 1st first time contributing.
> 
> Should I generate a version 2 patch for this?

May not be necessary, the edit may be possible to do by the committer. Best
wait for the maintainer to provide feedback.

Jan

