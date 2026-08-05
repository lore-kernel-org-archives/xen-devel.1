Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D5AC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 09:21:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383118.1626368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXon-0004NI-R8; Wed, 05 Aug 2026 09:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383118.1626368; Wed, 05 Aug 2026 09:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXon-0004NB-O2; Wed, 05 Aug 2026 09:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1383118;
 Wed, 05 Aug 2026 09:21:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXom-0004N5-Fz
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 09:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXol-00HW9a-AS
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:21:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7300a4-5cb7-0a2a0a5109dd-0a2a4505af8c-22
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:21:43 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7300a6-4cb1-0a2a45050019-d155802fd509-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 11:21:42 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so6086135e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfdd383sm6701110f8f.8.2026.08.05.02.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 02:21:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785921702; x=1786526502; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TsYpXoA+xmQ+uT37K3y8LI1YqP2UpTicdeqYAxlPxBE=;
        b=QzY8PYXbwweH/TOKGQUbKM4ayT2a/rbGGFyq8YK2srDY3xjnD6v+JLz9QPTN8cu+UD
         KkfUxMlXbRqWBQNuIieim6Wj4Yuf6GIJPDGZWf0I08spJkYQDTYBwA5jR7XVXhbPAJby
         NWySf+mfMYCZuRxETn2KJEJPaXqnbf3kZGaDOH5qbygpClmkOIW9IQ29R5OGUrFXVhQM
         dZusQms1RkCnVOwqbPz8xdF12s628H8gLIPmLbfSjrFwbrHQBUkwmHno0q4Ki9jIMcKR
         aNFvKr87P5cwNhQZQk5HSOS8vjIp7nzDx9RYrcx42TvFFvrPZl7bGVIOyRUACUx2mBKO
         psOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921702; x=1786526502;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsYpXoA+xmQ+uT37K3y8LI1YqP2UpTicdeqYAxlPxBE=;
        b=ZZwnT3wHoFmbF8ZbnWmtFjsEJ5Nx+C8tMrBAg40IC/txcigHSp0IdLQcOyPKDN+blm
         tePzRJrJaVQ6uxHHccZRwnhO7GkgUx07Rgwl/11MUsxvfnTcnDP6m84WCHXxnYswGPgh
         AG5faS+a9No2/R7rapUTGUz38zkkAqYZdhR+/b5rQv+/tfToXXfA+McIQtzCQHpmcJyv
         WoA5j41QfRomRCguxlnwQVC9NuWQEIzAa5g+92yiujwfrxOkKeskZKUsuoO1Z0J0IPGb
         oj2esTS3ZqeV5IOCrJCxb2IKDWpXgw1XeINanY62TPf1xQlBh4VXQgeXclqVEag+RSym
         ALZA==
X-Gm-Message-State: AOJu0YwU5ciRN8uzh/GlySKBILda4LrAoe8aRbHyOjYQxLhPjs0nkTr1
	KnRwM+qDe6rmiNzDTZ5MDfWUpiyL9xwyNAL5LsX+WMDLxLLs7foFxFqYa/gQfLag3MfbG2ax4RI
	T6rT67g==
X-Gm-Gg: AR+sD13iVQwnD4k5Pd3PXhVnORZtSptFZx4Ge8j29E5CCQ7mGFVzG3E7J1lf17Z9ak3
	+WfZWP3HFRxDu37WOObSCfFgYypMyaO4h3H0FlQxCygVJ4osVyDMYuxoBRylcvmPW5NEGUMS3jG
	40BsK4SwGUma/EP+D6kTcKTH/5oaJ23ajGm8Q8rezHBgpIoCoLR6tnOQLPl37QZ/hzfwxTmh8i0
	vWSwlHfxLnZMQuaaZhT5ds6X2UsVegyGRSIQ18l/bwLGLZMuTNL4UoKGwRzUBxHG7+lnSGUOLuU
	mQjGkRiFFuQTQKOmbLiCy1VIAIOFjXjtEHc2jwI3Axqe3yv6CA88sCm9VsEFFTh99CIuoyH7U8N
	GxufVppTPS9nGh9uM41oceUH/vPrJ/8Gm9IZK1riQREo9KveoQVr6d7qe5N5P404SsBGVvb3kan
	FQnNCEAqqRCGNQPWkJJO0y175v5c5hFCysCvKe5rQTxDdaKXt9AEYCMGeCGnEvMUpMEhBAQCodz
	WXq1lDOR1l7LRKCj2F/qhN4TAgfwGt3FaGyqRrdceC47FKeG4aV
X-Received: by 2002:a05:600c:5694:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4994e7bab0emr40018255e9.9.1785921702104;
        Wed, 05 Aug 2026 02:21:42 -0700 (PDT)
Message-ID: <81a2c636-5a74-41c3-81a2-3f49ed717744@suse.com>
Date: Wed, 5 Aug 2026 11:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v10 0/6] x86emul: misc additions (MSR accesses)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785921702-F74BC2A1-2A83EC49/0/0
X-purgate-type: clean
X-purgate-size: 233

01: x86emul+VMX: support {RD,WR}MSRLIST
02: x86emul: support USER-MSR instructions
03: x86/cpu-policy: re-arrange no-VMX logic
04: VMX: support USER-MSR
05: x86emul: support MSR-IMM instructions
06: VMX: support MSR-IMM

Jan

