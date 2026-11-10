Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F7606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HFiHxCyz
Received: from list by lists.xenproject.org with outflank-mailman.1481567.1685470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk8F-0004O9-9D; Tue, 10 Nov 2026 11:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481567.1685470; Tue, 10 Nov 2026 11:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk8F-0004O1-5A; Tue, 10 Nov 2026 11:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1481567;
 Tue, 10 Nov 2026 11:35:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQk8D-0004Nd-QZ
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:35:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQk8C-00EP3J-SC
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:35:16 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af3016c-8faa-0a2a0a5109dd-0a2a4507afc6-34
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:35:16 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af30174-b4ea-0a2a45070019-d155dd29ac32-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:35:16 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so1011963f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 03:35:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498367ba82csm4814646f8f.50.2026.11.10.03.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 03:35:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794310516; x=1794915316; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V299ZVVfJzahczX2LktlGJD29mGxPHQKJPkPbW309f4=;
        b=HFiHxCyzOoIbHI38iNhOE74EQioQl04MKWSeT4TMi9dvOQJ40nKNpYvUohfigLMqqS
         2aBQ9EjZE29wp5hx9USLK0tU8d0FfoawQ0RjUT4HKNm2ZkY66wbav85U420UCZCldoLA
         KQeebqPxvsUlFwkZmSwFrlpy871HRDGIWN62kiuPc174OoQzhbz7NI0H8OZScCfQb2JZ
         nR0jA3qoZZPrtSEei4vcSgH7R8Y9xlCdLEl8p+avN+LQmWGPUs+6Z7E8B0Ep66IPFfld
         IkZEalZk4oBoOMo/gcNrIu/ZSNvwdAyta3CHkZ46cbHpZypK6qIbfn/YvtkxFsXx7cFq
         rq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310516; x=1794915316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V299ZVVfJzahczX2LktlGJD29mGxPHQKJPkPbW309f4=;
        b=t145xKWe0KskM1bNu+iwc3uVrs4xePgeMJh4ON/Nj8BXpho8UUnO406/HE4pJGy64H
         HtVVWNwztvJLXlPx2cPvrQww8JpUkc2QkwuOO3J1G+Wp6mC8EF0FkAyHmOKn7J5AAI1n
         Aicao89WyvdjrnHIXf0TbLhqEYzpguhdb9N8vncgQ3+qpsBtVosySY8yUxOl2V+xGUw9
         Ngl7vTY61wm34lgZDg08msRfIvnWuBh6CAJF/SSG01ClhcAnz3CZjFjGHs96Ha0l+aTJ
         rXbhfz1NTjFxupDBymFRKXALjOWCU35iFlVuYMluTS9Z1yGXbqZ+uCWA5kTWbUKhKx6f
         TI/w==
X-Forwarded-Encrypted: i=1; AL+hErEL1ETEU1bYCc3/UqmNdsbqPKf8ih/OGu6LqbIKcYCX7f5zeHz0sN595mYwXFyXJRRi4kuEmuFIFKg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8LQB1Zt0jXO4LlhM5EZFpYzkjhSUGpu1WZCIngqKyKVQeV9dwR
	EVytq2E4mdnKh//1NcnZUj/+oo2SjEhJC8xZlbhBWu+4tOnXW+UyhmxXRUpoZ/lPth8fwsuitQG
	fVrZvpw==
X-Gm-Gg: AYBFou1gBW4kCrbsgCXxfpF8SPyR4t/vve2KxfGPjholGnnx+zXbHeif9qehTENa9hN
	+Q2vcnJE4148czAsJUfQdHdtYU86iuXZbUqdNaa9qiOLycruUYPB4yYNeAnI+eqVJN2syfeK/jO
	AKBJFj6cBpnV3InW3pdd0k9yTWtw2WPS30/occ5pyG754OybK+TLbD8/PsEQ93aPAOHsmU7+FNN
	UpTKVbSp0xV42Co718y5aeyA6KaDC1sTShPFdeXNEjGGBY8kCftir823G8AwMxxjO3woMzg/FOE
	39jv6OUCHTpFnl81Hk6aOEEhjR8tzYFsOh2RC5ZtabitgnEYiQvboqhIhmp74AytmsnDt7YhS5y
	PU36rb0SQB7SjHdvL4D0HjOVXCanGhY1c5P3dgOzpK2FADmblpe2DyWScm89MA5QSNfM9bU8mMp
	VEXng2GZZ8IZDReEYwoVY1ZUkALv71U5QJDqguFgXd7F8Zm7My0Ama9h4krxLiHRAmiATDuSm/k
	39OUDwj59FFBUINsQ0E5cDfqEJFPzVjFFgFhCn9TPFaWYEYlfbP6Qrnjw4RQCw3mO4HMreF0uTI
	49MLLtmVM+6hllQpXOb4uZQlTLExJRjC/SxxVmAWB75NPDizyWLfe3fvbV3h/oXHb3vsD9kxYwa
	E+1mDRmpro3ybNV4XvQ==
X-Received: by 2002:a05:6000:1a8d:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-4982d03bd88mr4363142f8f.7.1794310516259;
        Tue, 10 Nov 2026 03:35:16 -0800 (PST)
Message-ID: <80ef2e0a-95c2-4f6b-b956-8478d1450788@suse.com>
Date: Tue, 10 Nov 2026 12:35:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/traps: Make get_stack_{trace,dump}_bottom() static
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261110112827.3063860-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261110112827.3063860-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794310516-A4ECEAE4-DA4B2E02/10/78276251493
X-purgate-type: spam
X-purgate-size: 240
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 12:28, Andrew Cooper wrote:
> They have no external callers.
> 
> Suggested-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


