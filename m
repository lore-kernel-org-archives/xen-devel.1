Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422ADCD6E74
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 06:27:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328978.1593181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVO1v-0005QP-0X; Fri, 05 Jun 2026 06:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328978.1593181; Fri, 05 Jun 2026 06:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVO1u-0005QI-U0; Fri, 05 Jun 2026 06:27:42 +0000
Received: by outflank-mailman (input) for mailman id 1328978;
 Fri, 05 Jun 2026 06:27:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVO1t-0005QC-QE
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 06:27:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVO1t-00HUJk-6w
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:27:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a226c54-bab6-0a2a0a5309dd-0a2a4502e81c-26
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:27:41 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a226c5c-af86-0a2a45020019-d155802ac59c-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:27:41 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso12884415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:27:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc23394asm127474535e9.0.2026.06.04.23.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 23:27:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780640860; x=1781245660; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3rZfdlS7fSzq382SRlUw/Dg6cNT9KtppY8c17+2RtIU=;
        b=EVW1VYJGIyVyMkbSE/YOr4PyfS2X9igC3ysBvK6VFhBXGw0Ko5g4ctnqrqdxrylRvJ
         Jum9fjDeRf99/4MOdowHX26ggxYE8z6hSo8zKlrOsc1UDgwc89lt+C08n+2h49mHihAZ
         XsRYHB7RWUTz9Yvov+4/C2wvHsO+/4BfAG4VwGyuZKJaWWTEgO5pUSvFVcpbtYtMV3+W
         b3cBh48a89cdQeGWXOTqA/2TIj3843E7smGuDCgqLpzdBnUKizOE1dgtqkK7VBndXHxV
         ECH5NaZ/qi7dxE2uUM6woF9eGykopucTt7BfcjVp23v4RcycgeTJRapRijP1wV9yulci
         9wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640860; x=1781245660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rZfdlS7fSzq382SRlUw/Dg6cNT9KtppY8c17+2RtIU=;
        b=bIZEnmjHvAlWFL4UrOzwLZiENbmRnqHT8CayWBfZleY5q/rIfzV8WHKR14F4ebNqse
         c4Rh37GbPLxeU33JMnKr8tRlO3Td9f/xm/3MAz8/NUvTCOudGcuti6mniPX90GtlX/RE
         m3cHWxEhhUi1AoXb+t2byXgsy9DSdz3qK+G8nPU8xtrEgByyfSu+WwY1hSNCCx1npEBV
         xHpnaiEeiE5gSLFhho6EtzJ0wFyIXXFbt1FNywA+NvI4vEKQPQoFcIgTbBhg995aRb7m
         g2AR2ncFS0AgGDqfjvnOySA9WoUoff3foh6AjZpHK40QqJ8QE5zyXhQFBpbt7MEinwcR
         WLEA==
X-Gm-Message-State: AOJu0YwMdZXPE3qzb0Faa+oPYNA8UAX+CxtdwvGcOwDymYIEFbKpKMGB
	OBmPP/eks+w9CZg27HxWmkurmYgK1UKNnNrNa3zv5SZH78mA9/g9NLoQ7beq0P+gQQ==
X-Gm-Gg: Acq92OGym+whIqYWMKVPbk0oImNhV9aDyJk+Rskyav9q2PlCGjhqaHdA+t8hRuxDQuL
	UV1kIqO/u6MuRXv+sEKpe0R2JCY3O9IslAgMveseDpMezlpDewJ1YciGBo/g447PB6asXkCSiSF
	IUP9DZV08yEsZy2P2TrN66DAmOwPzriD9n2yeeXsnetAlcAwK6xzVaL1CZ+MI0dR6UZ+Zgz3qNe
	a4RpBT3/5EQQb+37/i/m3477lryA4kMGqu1aODW6964odvupuariVFVNRbTjmW3odUgZ2zwRJsD
	p2mhNy9o3SfDU1AAhGmuUpzNNvjf3tcQoMbXPAariQIJOv1u/q7D4n3yQbr0P8BBwFxyTe9ZWE4
	qk4yubW2kevjWS/79QZBo1+Ae9nVs60QYbqksCyxHyNIreDKDM6CJkpAjWp39P+sU2hxJKZlJYI
	TeGq8JTC5nkEweOZYhDJvjW4t87+esaS3tb0jauljg7v0bQuCbgi4Rec0IfiWlJsXPaX/OEJmr6
	ajsz9h06UFswkOOMxeBv2bsMQ==
X-Received: by 2002:a05:600c:628c:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-490c25a87f5mr26115385e9.9.1780640860463;
        Thu, 04 Jun 2026 23:27:40 -0700 (PDT)
Message-ID: <586a6225-e68a-4f84-b4c3-0b0a780946ed@suse.com>
Date: Fri, 5 Jun 2026 08:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as an Argo reviewer
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260604184413.788910-1-jason.andryuk@amd.com>
 <CACMJ4Gbi315aQZ0qE8+f3JJXyaRvva2vxmiH5-iXtiPKk+039w@mail.gmail.com>
 <CACMJ4GaZ843wx4J+GL8i=p-thg7jGgR57=JUEUHVuZ_N3Q8zMg@mail.gmail.com>
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
In-Reply-To: <CACMJ4GaZ843wx4J+GL8i=p-thg7jGgR57=JUEUHVuZ_N3Q8zMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780640861-83B60161-BA498A0D/0/0
X-purgate-type: clean
X-purgate-size: 825

On 05.06.2026 00:04, Christopher Clark wrote:
> On Thu, Jun 4, 2026 at 9:27 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> On Thu, Jun 4, 2026 at 7:44 PM Jason Andryuk <jason.andryuk@amd.com> wrote:
>>>
>>> I'd like to help with reviews of Argo.
>>
>> Thanks, Jason, appreciated.
> 
> Sorry to do this - I am grateful for the offer, I just need to consult
> before making a change here.
> 
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I'm asking for my (previous message) R-by tag to be held for just now
> - sorry for the earlier rushed reply.

I'm irritated: Jason adds himself as R:, not M:. I'm having a hard time seeing
what issues could arise from about anybody wanting to be added as R:, let alone
people well known to the project. Please clarify.

Jan

