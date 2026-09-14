Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D0C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 06:22:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420441.1646751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x604j-00004t-AZ; Mon, 14 Sep 2026 06:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420441.1646751; Mon, 14 Sep 2026 06:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x604j-0008WS-7w; Mon, 14 Sep 2026 06:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1420441;
 Mon, 14 Sep 2026 06:21:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x604i-0008WK-A1
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 06:21:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x604h-002axN-GV
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 08:21:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa79274-8faa-0a2a0a5109dd-0a2a4504ea7e-22
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:21:55 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa79282-b57f-0a2a45040019-d155802fede9-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:21:55 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so31588035e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:21:54 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c1bfb5sm400672555e9.5.2026.09.13.23.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 23:21:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1789366914; x=1789971714; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaTnWN4YUI+J/59owkxYy/hOMub/sgSXwVppVvNcXGw=;
        b=TtpvdLfchZmvL/F4b5/xZu/wIQUOI/bneer/hgBxZAk2VYDpM/fArbivBuiR2T8bek
         FrA1V8i+alj4H+sGo0OqG7fz9bjgDHUtp7OIJ+TrMWM8QHoZNMni3OEuCFEBSV7o+aMI
         cprJcGSubr+bCFSgbLtdlAstH1YKpP9keUKY49tb5lKprguEHZceNajZHkDvkjIl4Cts
         5Z1229d/LsB3r1VwV1oL/R4tfK3w1/Aok0wsmCjKjJe06LYG9MymMwr18b70GXkS40YK
         yBgfB4tgXRilyRk9CHPoznEnjYi1vTHsHs67/ERZ0p+aonedCsspBOzDggG44sIUqGpp
         DI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366914; x=1789971714;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaTnWN4YUI+J/59owkxYy/hOMub/sgSXwVppVvNcXGw=;
        b=B/sw8c7keAVlcjCDlUXfZSHlYcI9aUkBrfGU59Lv61p/WMHPTJchvWxkxakahJ9cmX
         U3MLHTB/U8lbEXLKGEv6SujMmD902sjJewbKFDBhrc2hTtEqogrpq+NTX4g7/VyxvTlK
         IbGqkLuhBdLFjcgJjhO5AiAnmGaCTqknKsACz70a6lxbIv8ss7VaHlTe1A7RUE0wivRt
         Z0yachpQzlGxXqTiNI2zmuUO93CbS8uhLEqfZerpc/EuGMUBuOh98XoBLpAD/pzJWxck
         u2WNGcLI41Z0b0qrSJTdMps0FtFMDlYJzuHTwG3LcEUrgr2v+iXmpCLBy7sXuFibgw5f
         kIgQ==
X-Gm-Message-State: AFuF++mnqyrZsutano69P2+ExSCTA6CIuyzUoVzB+UIVSKoZQyDjBBSU
	WdLAA9UGzQmQEtSwGuCdGvRoiniG77hUWvKSYEqBg29Kt39fM2DWAncj4J6Jzr7rYA==
X-Gm-Gg: AYBFou0WsAnzHIMw/hiR34JqallUdcQIEUebyoPmucNblKn+FLAzLH2peE/YJx01WbT
	E+H5x+QuNSzw6NoRmtPVq3714R/GP/CnUWjEn8YOcqgtTdRluM/glrAFa5cvwqOUpIxtKVKdqtv
	QZaNhWLi3fpLE6BZQeRqk//yVl9Kl50Vj2INC1JnprJTthr4cizn1PgfyY3vlEa4i54m71NgSWp
	2m+NmXNG7Mkpf3bmms1cbBSTNzKtUtlrN9L/q7OWoOo/FANTyT8oWq158SdMzMmF0nqbZzUE04M
	WHKzeJ8jyCvaV6EnpTyHhINnYyxxU3fg1XMNQf3sX2fB07gX/gY07Hu/0AJkRwWaM1pp8sBoQ3Z
	+8NzuYj9VfSy+ObpuJoI3AOXT+szNtdMEsl5/X4SrWAeX8XO4QUqgBSm5e624DvjWBbMia5bXjy
	ehYyTq/Y48vquc1niQ5lN7gy2gaTyyOWlwCACkSwwrZPBh2qhYUgXYL4I9H9A6OE1vRCXJafIiG
	gr9ERh1PHe6l4oj3FstEJSg8MMdz+HN7tVYlIuHLPfWZxgMbzFo43+bK8l6A0jTpi3bRhelvPCW
	aDgDsmFdaTp8hVWiEd4hIbXNs12LC4c=
X-Received: by 2002:a05:600c:3b9f:b0:49c:fc6c:be1b with SMTP id 5b1f17b1804b1-49e7a691b0cmr14279005e9.33.1789366914515;
        Sun, 13 Sep 2026 23:21:54 -0700 (PDT)
Message-ID: <b4780b5b-f826-440f-9c06-045590e3869f@suse.com>
Date: Mon, 14 Sep 2026 08:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/domain: address Misra rule 11.1 violation in
 reset_stack_and_call_ind()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <be5f65cc-332e-4292-9b63-33196cc8ce81@suse.com>
 <bddc66b1fc0936a9a85365969f17254c@bugseng.com>
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
In-Reply-To: <bddc66b1fc0936a9a85365969f17254c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789366915-C2AC8B50-65F0AB83/0/0
X-purgate-type: clean
X-purgate-size: 1589

On 12.09.2026 17:09, Nicola Vetrini wrote:
> On 2026-09-03 13:43, Jan Beulich wrote:
>> Eclair dislikes both sides of the comparison to differ in noreturn
>> attributes, thus deeming this a violation of "Conversions shall not be
>> performed between a pointer to a function and any other type". Since gcc
>> doesn't permit use of "noreturn" types used in a typecast, resort to
>> typeof().
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

>> ---
>> Really Eclair's diagnosis is misleading here, and not only because of the
>> missing "noreturn" there, making both sides be identical: There are no
>> implicit conversions performed on this kind of pointer operands of an
>> equality expression. A diagnosis of "comparison of pointers to different
>> types", along the lines of what compilers use, would be more to the point.
> 
> The point here is that the types are not identical, if you consider noreturn as part of the function type (as clang does) or not (as GCC does). This is the reason why we err on the side of caution and diagnose this, and it's not likely to change in the near future. Perhaps we could make the violation message more explicit about the motivation of the mismatch.

Yes, they are different by "noreturn", but that's completely invisible from
the report. That's the whole point of the remark: By its wording, the report
at the same time says there is a violation just to use what's quoted to
indicate there's none.

Jan

