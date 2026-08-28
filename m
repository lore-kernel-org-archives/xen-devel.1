Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929C1C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 06:59:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401581.1637116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqY6-0007a5-KL; Fri, 28 Aug 2026 06:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401581.1637116; Fri, 28 Aug 2026 06:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqY6-0007Zy-Fa; Fri, 28 Aug 2026 06:58:50 +0000
Received: by outflank-mailman (input) for mailman id 1401581;
 Fri, 28 Aug 2026 06:58:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqY5-0007Yn-9B
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 06:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqY3-00BR6P-TM
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:58:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91319a-e002-0a2a0a5209dd-0a2a450ad35c-28
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:58:47 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9131a7-f2d2-0a2a450a0019-d155802bf1e6-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:58:47 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so6386665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 23:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49c5a8e0657sm2780435e9.13.2026.08.27.23.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 23:58:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787900327; x=1788505127; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rt9tGRQMZU5d8zduV7r8lgiwa0hofvFlHCeU+g0PSdo=;
        b=MxkdW5Oor1AnpNcu2yerWSFYwDG0YazLKuvKt0RGMlnFvWQW5l042XQKTKjcO1R41/
         veUk2/AGw/+BV3pPxeyB3I9OheAjcrjN9hqnyynHQqJNoJ9UN/JpJIcOQsImIUbL+Her
         kGmIrK2t62iTRL/x1LZU09VMXcPBYbvn8Ch2NnNWT7zwlD70CX7xyHycwaue6D8gQ/7i
         FZPAQxfZ2JqWzwRpdgWheiW9VBRgOBkPJl56Zo/3VyGLX3u6uUEQlXABsSxO12FzU5Ob
         ZwvrosQNzL7XeH+fpxSqVU2o/g0qBxnS+3r/fIdQdiHgkRk07uno9TQ94GGnfXccpbb5
         Xqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900327; x=1788505127;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt9tGRQMZU5d8zduV7r8lgiwa0hofvFlHCeU+g0PSdo=;
        b=PjdYFb1+Wvio0wIc5Sxk0+GacvZVU5jUnqonSxsZXMh/AO3vhiNH69qzKh1nObsv4b
         o6Wu+6aCJoV1Fdp1adLEJYn8izlOkDfHoltakLf8HqLSoL4sFj3YIFWyRfz6FYFSXGls
         7QzkQ7KgJw916uLhgIC+uHvmgtWONIpEEFtSsKClmmbQ+H7XTIyCNG+eKDvIUvjrlZ/D
         tfMa1iYVvGjaEeoteiMNcVE1G0oHJJQXOMDGgQ2Gsz+a/cx6AAFjwKX1D8L/wnnmwVI+
         7AvVlSErXcDPF7XqCBDiKhWAlvG6EM0jWt5QbNXWh53m5TCBEWBx2DqVVmYRSQmyoa3R
         G5BQ==
X-Gm-Message-State: AFuF++lf9pn3/TXtDPLx6d+Un8VU4jwifPZIDZH3KFakCyeyBVCFA8It
	E1sTkzGIZ4lMPPnbwIphyEy+UrDb303yREhm0Dd7Iz2IZolVJ27VvUaH7B2aSbFlr6GzdTcq8C3
	cMT/b3g==
X-Gm-Gg: AR+sD11eN8lUe8tez7jGhWDKlx2dzJA5qgbozuhux6bbjlmoINBSJNlUhg+sGxKV+Ax
	DocjZovB7FXA9MjISW5ncZmIf8veIcE8YqsdEx7detLiafLpDVt+XBso7Y3KixN1PTAY6QVJuhh
	tvhXeGYBNC98G2rCRd8VpkPmGzJTObCGGJL9YwIORJEpiQkSCMZO4wP9eoawSyIZTXSVFe3OahT
	REfbQ4zSGFJSi/96HuqJYBb2l5hmiRh9grAFOxu2opHPQsO9wgguSffNtnY1JxCX7WMwouFXVYf
	A2hjdfj0vFmgtlOPmA8R6NKW2tM+KqNYAt1WPEQclYPnntOA0ROs7pkoG8ShkeDIs7i/0e/eQaB
	cNjpqisIKw3FIKnQo1J61+egau0lsiYEZkRY8yMX3teNOn9ZfCdWEhLUBfuq8GTLo2afReyeBb9
	/8Nc0lehLJ2E4nSQD2YO6Q7/NSS5oJTGTQBzSixwOuZo+V073lw4S/v5QVDBsnxzOGxio+Bmzu2
	e/eYxIyYqL4pfZ1LsQnyv2d4oEwM2sjE4HJ9mB7IYC0MX5oC/4W
X-Received: by 2002:a05:600c:4445:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49b91c44fbfmr56794195e9.9.1787900327010;
        Thu, 27 Aug 2026 23:58:47 -0700 (PDT)
Message-ID: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Date: Fri, 28 Aug 2026 08:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/12] address most remaining Misra rule 2.1 violations
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1787900327-587CACFC-D317F703/0/0
X-purgate-type: clean
X-purgate-size: 1160

Let's try to get the unreachable code rule almost clean: With this series
in place, as per [1] x86_64-allcode has one violation left, x86_64-amd has
two; ARM64-* are clean. But see also "gnttab: unreachable code when
GNTTAB_MAX_VERSION < 2" [2].

The first two thirds of this series are hopefully largely uncontroversial,
whereas the last third may be.

01: x86/IO-APIC: address Misra 2.1 rule violations
02: x86/mm: pagetable_dying() is HVM+SHADOW_PAGING only
03: x86/shadow: eliminate unused forms of sh_map_and_validate_gl<N>e()
04: x86: add noreturn in a few more places
05: x86/crash: address Misra 2.1 rule violation
06: kexec: machine_reboot_kexec() doesn't return
07: altp2m: address Misra 2.1 rule violation
08: Arm/GIC: add noreturn in a few more places
09: Eclair: deviate BUILD_ERROR() wrt rule 2.1 and introduce variants
10: PCI/physdev: address Misra 2.1 rule violation
11: x86/HVM: address Misra 2.1 rule violations
12: x86/nSVM: address Misra 2.1 rule violation

Jan

[1] https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2796557177
[2] https://lists.xen.org/archives/html/xen-devel/2026-07/msg01293.html

