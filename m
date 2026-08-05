Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF9BC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:28:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383487.1626760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbfY-00084k-Tl; Wed, 05 Aug 2026 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383487.1626760; Wed, 05 Aug 2026 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbfY-00084d-Qv; Wed, 05 Aug 2026 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1383487;
 Wed, 05 Aug 2026 13:28:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrbfY-00084X-5g
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:28:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbfX-007Hib-Ib
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:28:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733a77-5cb7-0a2a0a5109dd-0a2a450393f0-16
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:28:27 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a733a7b-fae8-0a2a45030019-d155dd30d5b3-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:28:27 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso633357f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:28:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfda58fsm9094648f8f.7.2026.08.05.06.28.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 06:28:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1785936507; x=1786541307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzXqEp59+17Vsqm1XWbN09ezWzAaeB9MVxhuAbnt2YA=;
        b=TEbMIZn6jPAZtas8+xHExBwQ5Z5p3rWzv9giujm9rgGccME/3G3v9dewsBQagGH3dv
         dInesvfjCqfSkPoImsScXKj9coRmgbjFh+wM4LsAQME6yuM6xLM2/P0RPcr1vW7c8nH7
         DYLhr4lytZUyTPIZ1wOTX9G2Qvc0/TnpgKJ8D/V9VWCMm8keydO61cgsk71bgig5Tkv9
         Vt3NP8nUFh82Bq6jtK79YT8YU53zk/w1ZATlnkBjvWThxcFo+zR09WHbDeHoMmH+Txvc
         1FVrkPRovWfqeingZeKG65C+K0FkPxIN7VTwtHNJ5TCu6i4dEJK+b/CKcPQE6rR/EHI+
         T22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785936507; x=1786541307;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzXqEp59+17Vsqm1XWbN09ezWzAaeB9MVxhuAbnt2YA=;
        b=fMmzDs3gy66WPiyOIinFsZqJMybsbs+6YcWv2t+NuWATkZYhePcFl2GxsY9T/901sq
         lCFjoSDKoB50iyz9fbIz/5IrKTIKFQ0nVajyeG0Xs3JUDzLakzOer9j366oipaZfFeso
         5/2kgIGxdn6fwz0LjRupZjdPvfbk50EE1ZvBS4356mP9yM3Lxq85oNvZpf3vPfZjLsSp
         l+o6r9LH04IcLCSf9gs0dTqqwhs/iBc0NTXV27WARlj0XjvpvnbugwK7WWrT0ESFgBzr
         90OfEuSOJzJ0dcK3X772xvb+kGTwXYpZfR4wBagfC0srORDnCi97WtS2NscvVOa4elKE
         RQjA==
X-Gm-Message-State: AOJu0YxTEWZWWd6tCDF9elMc7NgS9++fHleNBQTnpUdRPVAuU1Qlh6jG
	LCR6aEtXEdvAdSWRfqgPgNt0oW09gd1oBmAY+JzmI1aJ3hujxeJ7XHuNGv0d0ZIj/g==
X-Gm-Gg: AR+sD1372Ff9F/5ncpMQflEoB2E145nYQOsRtbkvysbW0A1KycOuFUyTSFefUKHxhOj
	N+QMQ4UpJVtG+HPaEkzCLu0KfBgxE7R+KIMiIzUuflTsZy2fJ0mymqf8ZhmiQQo2mdhhthb4irg
	RfjGzLxerDDZs8qoFI3g5Px1LcBAEt64i00P4DXCkGgy1pgcx8DmnivGxxaDvGLD7vNs4lmYXyI
	fQfmT+lDjl9BsLHmeKpsUtuSHycibzGb2lPyQc3v53/HptX3eaH+IkjMltpaWa98nh+bI/LTBSM
	SiPxS2Gk+BDyJSDwY3bV5m7pT0B2WbFGh2Dyd6FLQmjPw6WmbycHY7fg+PFDLb5dFwGb00JTkK4
	wkKkIX+a1aoA/pQYLrire7TRB6FwzlpgliWoEKTUHbQYl72kZOd94XdAnXIPL1lLz39Z0l+ea6s
	mNlsTKg5VkbmzmaO+6N5Fu54gpdYDvD8PfUzds64obF/y2aw4DFhzIpUCZPv7GQ1075JS8x7OCA
	+Dqfy6686Fnckx1bQf6WZg4cMi6qKt25kq3o1wzTN2ZxF3d4CK7
X-Received: by 2002:a7b:ca4a:0:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-4994e738af2mr70515625e9.8.1785936506898;
        Wed, 05 Aug 2026 06:28:26 -0700 (PDT)
Message-ID: <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
Date: Wed, 5 Aug 2026 15:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
 <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
 <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
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
In-Reply-To: <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785936507-7428D4E9-1174FD0F/0/0
X-purgate-type: clean
X-purgate-size: 1078

On 05.08.2026 14:15, George Dunlap wrote:
> You're asking every person who sends an email to xen-devel to remember to
> take an action before sending the mail

You're by far not the first one to be asked this; you're the first one to
have an issue with being asked, beyond some companies' IT getting in the
way. (As to the latter point, I'm already combining my observations on
xen-devel@ with those elsewhere.)

> (or to send *all* mail as
> text/plain, even if it's not to xen-devel),

By default, that is. MUAs may or may not offer options to control this in
the course of composing a message.

> because your MUA isn't handling
> the standard properly.  Is that really reasonable?  Couldn't you tell
> Thunderbird to ignore html and only render text/plain?

Both questions go together: text/plain as the only content is (not just by
us) being asked for because that's the form known to work virtually
everywhere. Wanting your mails to be properly handled at all receiving
ends is - I think - not only reasonable, but also in your own interest?

Jan

