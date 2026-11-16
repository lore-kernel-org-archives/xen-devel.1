Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E4606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gv/rLPHa
Received: from list by lists.xenproject.org with outflank-mailman.1490246.1691178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsAM-0003Zu-81; Mon, 16 Nov 2026 08:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490246.1691178; Mon, 16 Nov 2026 08:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsAM-0003Zn-4n; Mon, 16 Nov 2026 08:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1490246;
 Mon, 16 Nov 2026 08:34:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSsAK-0003Zh-BI
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:34:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsAJ-00CJtv-Cx
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:34:15 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac006-e002-0a2a0a5209dd-0a2a4505bf96-6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:34:15 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac007-4cb1-0a2a45050019-d155dd2eac9a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:34:15 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1497236f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 00:34:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c77393700sm20304204f8f.18.2026.11.16.00.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:34:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794818055; x=1795422855; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjs8UKT4gdct5m9BJerbxuLWe6aFdOe8tA8z3470nYM=;
        b=Gv/rLPHaC1zRjIo1d/4FNYA1GUkEUhJOuz7dOUYzie+l53lzq8fYubmGG0HZ8Rgj5v
         OE01xZbDnbgC8ptpfjGFvOLAHr6+abEMLvLVXGlRkgKHJXdvdzJdqCBE+zeX+Ht58luC
         Nbrb0X+DEgpVxSsAqwy0FV/tvuMPuCY5Ba1OAbFJkUWi48S+SFG0WleJ6xXagQRdQVLi
         PtsvNQRqY6rfThHbZSu1GTW9OrLfGAyF5nuuJTqCGf0WIcp7i6bn7AcX0u9T18/Ftkjg
         b5+YgWGsmx5SsBCDNGvS+Zk+UTdRduoKLG21g8OPjJZgW6ptT5wS0GEJyN2wc/y4rxXV
         FllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818055; x=1795422855;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjs8UKT4gdct5m9BJerbxuLWe6aFdOe8tA8z3470nYM=;
        b=hyPd65qDMlwtfcEmTezZeu+WI8I+ODwQTQziToYjh6SgkyIylh7irDNvl0b7T5TLhP
         L+e1dDj9X7KnBaaRGfodhwKqAVI6PsEUJzcmcC//fdwQiUmpf3rEMWz6W1qv79OejFKd
         wBjmRkK93nj+NJrRlT+2EfBdU427LJ0d8N74Xm3XeziHqCQZejmf8z+nrvn3JVgl8Xu/
         aoqMb2ylt3mGU1dxF9Gmwqi5LqWmslFMB9adaErLW+arLTt6W73DuIwMmrQ7M+OTBD3m
         2g8qclpHVN2BjHnwq0rY5S5UZH7vPGnhJ71oVSHhKV+Prq48BLG38StPCJWPu24eIPTp
         DPSg==
X-Forwarded-Encrypted: i=1; AL+hErEsZjlWAetpJcfdUlJFHT6G9VqtJXmav9SdoqUWxhk6b/r1B+QMlwwOGu8c24BpBxrT4fAX81Icfgo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9fc50rnb0HLC59NF4I4FvL29QaO18MwQ7FyNlNkESBe9gG4hoV
	GrUwA9I7yvdvY0nsNNDYVJQmQY7NRT78Y4Jg/gh613Y5v0PacYjVzZwopOBR0I4h9Qdf/aZMZmU
	7ZkP+nQ==
X-Gm-Gg: AZFdTZfNbRK6qQpnSVTbyzCESQO7kyG27rUHzmAn8AuLz8vDbDWEJz77uFG2mlO/H5s
	DkMXcVN+SsMgFLgWm0CHuFT3jeJC/SCsUgmiWE3cU+2xRTqenM/PILpo2zPQWLo07dWxdNY/uWV
	3XpMd9M6lo6ROLYAbUeshTdI+CPRqV32hwaE4d0dwKLH1a5pLNlS7KfmA2sjWh4zCXbcXd8e3oe
	7NgzC+pwwAhtKB54XcoATeDoEmG0PP5szDWa2Ll9wq9J0smS8kd+nlzbUKq2a2dHrocumw2UFYl
	XQ2zXUYVFC8Jtvgh0PqDUZ+CtKGCvK76GjDawrGpy62jdImd+bfql7qjyGfSzgx6nagPUz3o8E9
	WyjWaZz/b1YkMfKY15hG/+yCq2Ql/OO+cKJIBmi/imY1ZhtdJOiKzRqHw7gfNQkUm3s/PMRviE/
	hbqsyLjvFKka2kxBrEo5paMTCaUv63uw5NriMuGrVEHkG7IuXDpu2Y6XJFi7YHurA/WyEOiEZ0j
	0PWot5gsKZ81ek2Y6UiXI/x8PZUsJEv7kRMrizFj456pccbDQsmgBk3QLet8kDtFHRcFj77jRiF
	e/pbDdDWVRRCQVgNaVU5vh59GQbAhjL5cCO5uMeA/5L7VqbsS0hkUNNGvyu0yJPjw8ZH3+UTkQU
	V6oQewcew7brT27OYjA==
X-Received: by 2002:a05:6000:3c6:b0:48d:b75d:30f6 with SMTP id ffacd0b85a97d-49c73ce4e0amr19191772f8f.35.1794818054742;
        Mon, 16 Nov 2026 00:34:14 -0800 (PST)
Message-ID: <5e3c152e-d483-475b-b04f-87a3314e966e@suse.com>
Date: Mon, 16 Nov 2026 09:34:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/aepi: Fully remove dead code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261113121850.3423155-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261113121850.3423155-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794818055-2551A2A1-132A792B/10/78276251493
X-purgate-type: spam
X-purgate-size: 347
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13.11.2026 13:18, Andrew Cooper wrote:
> These were marked "currently dead" in commit e681c0408564 ("ACPI/ERST: fix
> signed/unsigned type conflicts") in 2014.  They're no-less dead 12 years
> later.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


