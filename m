Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA9CC88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 06:40:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420484.1646787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60MR-0004iR-FN; Mon, 14 Sep 2026 06:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420484.1646787; Mon, 14 Sep 2026 06:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x60MR-0004iK-Cj; Mon, 14 Sep 2026 06:40:15 +0000
Received: by outflank-mailman (input) for mailman id 1420484;
 Mon, 14 Sep 2026 06:40:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x60MQ-0004iE-Em
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 06:40:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x60MP-002VMJ-Br
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 08:40:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa796c6-8faa-0a2a0a5109dd-0a2a4502b454-28
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:40:13 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa796cd-6ca4-0a2a45020019-4a7de14c9f6f-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:40:13 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350f88so791182f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 23:40:13 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:686c:f5c4:7858:246b:ca62?
 (p200300cab735686cf5c47858246bca62.dip0.t-ipconnect.de.
 [2003:ca:b735:686c:f5c4:7858:246b:ca62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb32d3c7sm22890239f8f.10.2026.09.13.23.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 23:40:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1789368013; x=1789972813; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpdzU9Y4yRt3tzkevqO7DUbsMCpycKpfrbImX2nQAjI=;
        b=LODrf3exWzIRdaSPX6PCsxK7xR1i6lp1FHuSLyEqOha8ILUm9Vgk+9OTeO6BLHmMaX
         EhUvefj0ZBLVzhiSD8iInc5syAIbh9Ozo77cwFPRs7Ss69/mI6OaQ/LjiNW9rIUFU+B7
         sjGqhuMJBqI/uzJYiXY5qq6RLhVfu24GdA3ZHnwepKEOtIDTP+vN8TVfGv9gWmI9XpOy
         NORaDLxXL86kpbqSXmW34LQdhT1T5D1Q2WiVmXug0KskVoNdwUpDHMZgNBaNunrNYAVY
         nhiTAfw3lMjsj6KzW5YkXy87o0Ke6S5eSsVTK7PyhtEmVPhcpVEodBFWtuZIbea0cGXL
         6DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368013; x=1789972813;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpdzU9Y4yRt3tzkevqO7DUbsMCpycKpfrbImX2nQAjI=;
        b=fgjZo4waFjZKk46G5z+ow79X+/j/qKRfwPKsGnz8yN3V5TxPEha7ugcOlKbJZmTG2z
         n6uJ02nga52M/bGldlhsEYYLuDQYEdywq40Dwd/fTI24KhIyoXRa2hV0GHXkPFQ4CMkt
         TCAr165lX8KfDUPRbDQcEq1BdYj6kpt3SklGXPpgbwEW13GUbBOKHDwJ9fH+qyJAuMLL
         raUXVV3ZhnS9egUk8uyuI0lQk8rnswOuYOMCij1wdxA2K+zMK2/8sG/uFEZc7fwfU4s2
         8vcpKP2MSC0LEPXqYbZqnLlYgbxpQg56VU3vGUQZsh4RKVSCn5epVk7Q1kHsJn1mt4en
         j2wA==
X-Forwarded-Encrypted: i=1; AKwUvByMvilXbLz0nQVPMBXEMZtoyH0Ikfrz43UpieZcz/iRSFUMC3TA7WmyAOPdlktFTZ3Yobz/1J2zCy4=@lists.xenproject.org
X-Gm-Message-State: AFuF++mRAzQ6i6f74bCOk+TqvJrc0EMDeDNZpeA45bknBIinPH5cFRcX
	z1Naiex4xlYpV8CBbeRz8MkIhe9/Sgjk2jmWJiktef9ABVQ+mCT+Fj3zaxVOToYVXA==
X-Gm-Gg: AYBFou1i+vJBdsjVxqNHHUBa+3Y2JEXlzk9eBtD2C/vNRKa0P4WWCgeaNKIXY5fu66o
	uyJW5xU2lJCfMbXSv98kMYVtHcmdyLFtCQuhPPwDWtkEI8Ueml7U8DoWeAFi2SNtmibnFciFwCv
	2IrCHiELk3kzZX6LhXAhq0HWjNQSa3oqYPuJnFALU7ZGu5OiD6HCvAJv7r137mJho5YFhFgcUx2
	GSWlZHCTQCVOJD67weD8TQ+zQ+VJGgFuTlYbwolCWF47Zl+pA8wF0lgh34PsDuaAA5+50Q4/+1k
	3o1H0/rIJyFEP2jDGVNlMlf7cKwmdTjSWmRz8/R9o2TRZqzVHwqTas0wte3YeJkddBqWTMvRUvQ
	sT4Ttu547DMaY5S80F+1DAQQ4mUFQo2NAABebjpihFuwS0G4wKPTRsoU0CWXGzAbrNFIQYdvT1s
	Y2fzTdg/f6VbY0CEfkAlW3tdyotW5XSxzI/5vGl2KmhskhXs+Z6V5F3tvKFd3y8lWSykXpp3jxC
	lJ1G8FW0bneVIWIdM8deeXcJbmryyNlD8u9XFraHcH1R+PvFir7U0OhKH7bzlC5UkaAiHW7esBM
	TtmV0JjclED/zyt6l+Hn3R7Vxrflgc8=
X-Received: by 2002:a05:6000:4281:b0:485:8c17:9761 with SMTP id ffacd0b85a97d-48702aff858mr1201254f8f.35.1789368012751;
        Sun, 13 Sep 2026 23:40:12 -0700 (PDT)
Message-ID: <05aebcad-fb84-4f11-ace2-80c0da7f0e9e@suse.com>
Date: Mon, 14 Sep 2026 08:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/build: Remove leading space in xen.efi.S rule
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260911201601.3682596-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260911201601.3682596-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1789368013-F26B72AC-93B5CAAB/0/0
X-purgate-type: clean
X-purgate-size: 405

On 11.09.2026 22:16, Andrew Cooper wrote:
> It happens to be benign, but it causes emacs to ask:
> 
>   Suspicious line 194. Save anyway? (y or n)
> 
> whenever saving the file.
> 
> Fixes: da944a72fdf4 ("x86: split xen-syms/xen.efi linking rules")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

No idea how that had slipped in.

Jan

