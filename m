Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC019C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:01:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411979.1642445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vRT-0005I5-Ds; Tue, 08 Sep 2026 13:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411979.1642445; Tue, 08 Sep 2026 13:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vRT-0005Hx-BN; Tue, 08 Sep 2026 13:00:51 +0000
Received: by outflank-mailman (input) for mailman id 1411979;
 Tue, 08 Sep 2026 13:00:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vRS-0005Hp-Hs
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:00:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vRR-001i16-4t
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:00:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa006fb-2eae-0a2a0a5409dd-0a2a450cddc8-24
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:00:48 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00700-f479-0a2a450c0019-4a7de18c8e6d-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:00:48 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso3924205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:00:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883953cfsm30106289f8f.13.2026.09.08.06.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:00:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1788872448; x=1789477248; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BEQrCqmECj+iaTpwB31qWz+WGIw5mDkclPlRgVgLLu4=;
        b=GnQW4CzI5CpbVAO2tSXK9v2xhQaq85ThuzDBIsehuatbWHlcond2pbW7UlgYFMVzWU
         hZtVIGkEBxPyxg1mtyRSt7sfe8us+cdC5ksPaLLa6/2eHJ0AwEzOmqD605PQ3iRS30Sg
         J6G294Z0DTAMiZ/Xx5j0nS8rf20vYexfWzIa/OcHWGsl9wFRpSz726zbupuU73uW4tnb
         O+U9h1+jD48G1chceuvt8t2+QaP1KX0Gy6uCi0Xrp6o/PUPt2LDtr/bnD8fUCSK1Czrd
         NnZi6FDtOZuIAm6pLwTq7FnO0lNGkmRjqEBFciQV/DI6Cef+FQz1K6mnxAh4qwU9okZd
         o/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872448; x=1789477248;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEQrCqmECj+iaTpwB31qWz+WGIw5mDkclPlRgVgLLu4=;
        b=RFuVTleRPz88aYzrzveiAnl1E/3cqFFK4sI6OpeKTMkWS3xYhcmB8Q3W0J2Ix90kyM
         EzOVwZ16gq0jViP9DyMpXDcz4sI6c4Z+AvHrTjlytf/yUj6RxbONfN8SHYyIeo0qGmto
         WwFeEDrNp0WwGwDgKAmxDWE2D0F98lZ76UJDPdLGsUEgtfg8QGR2T62wS/NoRtTMmJni
         KpweuP24InE2/GjD5jR8/8klwKD8/YuuBeH9YwGSfECeirMc2cRbxowkIu45JvgpYBXK
         YoiLfxDdghU27I89j/np0cqLNOKusYEzGkKgY5lhoTzO6TZfbGxErlPZ/vXAL+NtoxV8
         +6JA==
X-Gm-Message-State: AFuF++m8XIRPgZ4CtYbmQ621qneTDg4BRu9wWZ9eSAiEFLHuumvVGZx2
	uzymtzHZEij/ei6/E0JpLU4/l3b/F+23Jf9YDzz673lKNsGefHlZBf5ttdqIZywAFWkLo+V/PmI
	SQ4wNEw==
X-Gm-Gg: AYBFou39yeFHeMK8y08u6XJS/VxUEIDQ39ISThtSVJAfAFSlIQ6PJWUXFb2a7RYWYZE
	JAK4+zjZ9BpsHKuEwptfxrgcljwK/VSfYaOb0Ct3ClTAQfduEnPPMDmrPFkEJN9z9Qrgk/KRgOd
	XejA+jT1bmDVfUbNelvFBz3f3cWmsIMfQU0N86AwMggXYOabNQ5P11jJ1LfBENgU0SQ04Whqhvy
	CfJVllQTBNFhQYcTDzzBrFVHcMDtAxyE6/8zzlY8nWe74qe9exYOsyc6pyt6/crBljPYZHSZ499
	aFf+Eal1xcVm1RHWcd5oqaQcsoOtOl6pv8QqeUK3kz8ZduiJmR+5Sr6/U+ZgjnaN5/l/99kwkNy
	wU0LYTLKRcC1reKTUaSGF5oNAb+E5eyfpUqBykp9MHK1v6+V6NdA7YKvnZtja2/3+f4vyqJMsT7
	7df95DFhFBvFwI2Ul0T6yviruLBKll9tVOk+5X6OjBz63b29Zd87l/5sokyNbQe/oVTokKB8XQi
	9E5UXs+SrIWTOEqwVOgYBySRRB2TgFvu04M8NfumzeUetfIzFvyo7AOMovRTsY=
X-Received: by 2002:a05:600c:4752:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49d175439dbmr72508055e9.1.1788872448093;
        Tue, 08 Sep 2026 06:00:48 -0700 (PDT)
Message-ID: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Date: Tue, 8 Sep 2026 15:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] x86: pass-through / {,v}PCI locking
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
X-purgate-ID: tlsNG-d25034/1788872448-50B3DA5B-A88921A0/0/0
X-purgate-type: clean
X-purgate-size: 486

Now that XSA-509 went out, here's what actually caused the issue to be
noticed, plus some follow-on cleanup.

1: x86/pass-through: defer event unlock in pt_irq_create_bind()
2: x86/pass-through: no locking around pt_irq_{create,destroy}_bind()
3: x86/vPCI: tighten locking assertions
4: vPCI: drop bogus locking assertion
5: x86/pass-through: use simpler locking primitives in pt_irq_{create,destroy}_bind()
6: x86/HVM: drop vector parameter from .pi_update_irte() hook

Jan

