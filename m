Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECBBCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 06:10:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441240.1658797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyN1-0003Qm-Or; Tue, 06 Oct 2026 06:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441240.1658797; Tue, 06 Oct 2026 06:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyN1-0003Qf-LG; Tue, 06 Oct 2026 06:09:47 +0000
Received: by outflank-mailman (input) for mailman id 1441240;
 Tue, 06 Oct 2026 06:09:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDyN0-0003QZ-GW
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 06:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDyMz-00ETM8-TZ
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 08:09:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac490a7-2eae-0a2a0a5409dd-0a2a450c83fa-10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:09:45 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac490a9-f479-0a2a450c0019-d155dd36bd42-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:09:45 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-486e8faff03so109086f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 23:09:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62289e77sm8668228f8f.21.2026.10.05.23.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 23:09:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1791266985; x=1791871785; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDZ5krBY/B/gZUZ9vRTcjQsf5Svtc8MM0KNRqjFAAXE=;
        b=MviPh6WazkiBl2hcgZJeFVhqfOvgb46N53KriGAVH2SE9/giQ63pAA2hBL2AedzDt8
         lyWRabj65FMPFIF1D22b9+piMvKgkIQUfhojBgTwGYV+c9IjFek2JZvoCpaJTCglyBBE
         54O6/eN5hEU3TZy3VmOSdejlWr+rTZa/s+iRHuOtP7nPD/mmIpFZATUVGfDVWR1b40J+
         idr1U4BmU/MaJjQn9KkarroRKA+zy4LY+m1x3SJqYW+5ms+u47oZSOdDuHKcZvRvuveY
         a7HM+X89/Z3NQqfRQscz93sk5XlazARLHlC9svd0DgMnUBITkCGrP6pG3DT1bMyJ2Uod
         IOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266985; x=1791871785;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDZ5krBY/B/gZUZ9vRTcjQsf5Svtc8MM0KNRqjFAAXE=;
        b=qpwRdlfcNynaqE/RYHhfT6goXe5VO59/BniaqHbg9l7ySIBQgvlHH/bEKYl9U/botx
         QiqidC118M72e19H4/zaINuXqcs0Xh6PFeaIiIzCLk1Mnh4lzMz59A9XB4NFsFR257xg
         pVSIW6SqXvkLcXHZjrb2BAKgU27h3LhuYk/N0SVMsfXNAtPoLcREBR9JxABv1G0dItVi
         2Y+lfqZDfeKgOS4cf3SyZkvbWvwHBi3ngGF3qcuWy60gJIXypvVwjmKZDsfkwDVJdeV0
         KDprplezkY2BnmM00noIsOaj8tkxuRkunRSUaTQhEuMLV7TRI+gJSPjxaJDSWRrVPOeU
         dizA==
X-Forwarded-Encrypted: i=1; AKwUvBzfrlyufbKp3kAsmW5fPss+1gMgV5Lo1XzzHLNSbI4KSxyNBYW5ARc9Vby2a4QgQxfsyhNtuYb790o=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLMAP8FakVpFp9eI/og/ZR58+jgc/unHuiSHvgDsBcGLKYZJOEw
	FSTkZROhFdhFBpXQMtZXBIDdetFERPzzlzWjiEsuy6ETAwg7haUPCm66RQhLI6W2wA==
X-Gm-Gg: AYBFou2jLgRfrvqSS7PXcxIUXXIQ1xwmubZ1vfYIwv+YUubjnJr5FBFwdZMOgMkHRC8
	K97H0yoKtdy8NmQoFnvbegzkOA/MtQF2i3B0AvuLRtVNgsmSbGgfGYRWL5Exvg5vlLf9TALo+pu
	cspBJwkPz+pGaQHczceius85MmDJ6JCDNOunS2uCQrfx9Yx/HV882OnQXOFwG/KHn1GZe6HY4pG
	PjxKqYB99vKNbJ+IuaUZtpt7wdZLe+FkDXP2F8A3Z1+j0SVlZLuh7apc9k3Jr65Fn8OUZRh64hi
	pD56rz0gkDdFO3QASUI/VLcrzML8stv8y4uyNon+cE4jtQIx/J+n7VfJRGVluccGKr1yx5BlaBL
	gouZntPJEclTEgv2ZLicqN+eMjPoXYxGxUkmuUMfumTFSB9OdjQ6ZQ4Q0tJRFeNRvJ0VihoqFXb
	9sgr2CiODscf/JpKdzvzw9lgakwogoHiOAefpA0xrwyLi/noXa2s4SJG1lt5WWQUU8bgxmSVDFJ
	Td3t6cJvmaqJkl+oZxrV/rtTjFmPt1ufMEEwGZLQybPZ1NpAbvITQrnJLBZImw=
X-Received: by 2002:a05:6000:2209:b0:48a:f929:e140 with SMTP id ffacd0b85a97d-48c6d1588c3mr691194f8f.10.1791266985318;
        Mon, 05 Oct 2026 23:09:45 -0700 (PDT)
Message-ID: <12b19ff7-f471-4286-8d23-672426a39c53@suse.com>
Date: Tue, 6 Oct 2026 08:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation/eclair: generalize the noreturn
 function-pointer deviation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <d68c56607781bfa829766aed36eeb31f06080fbc.1791224638.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791266985-036D6A5B-C3E1AA4D/10/78276251493
X-purgate-type: spam
X-purgate-size: 623

On 05.10.2026 20:56, Dmytro Prokopchuk1 wrote:
> The R11.1 safe cast only matched void noreturn (*)(void *). Accept any
> noreturn function pointer converted to a compatible function pointer.
> canonical() covers typeof destinations, and compatible_deep_unqualified
> keeps the parameter and return types aligned.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # docs
(or perhaps rather Requested-by: or some such)

Nevertheless, this definitely will want Nicola's feedback. It's only then
that I would remove the constraint from the A-b.

Jan

