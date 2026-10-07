Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758C2CA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 08:31:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442037.1659567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN3Q-0001LE-F9; Wed, 07 Oct 2026 08:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442037.1659567; Wed, 07 Oct 2026 08:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEN3Q-0001L7-Ba; Wed, 07 Oct 2026 08:31:12 +0000
Received: by outflank-mailman (input) for mailman id 1442037;
 Wed, 07 Oct 2026 08:31:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEN3P-0001KH-5C
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 08:31:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEN3O-00Gx2g-G8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:31:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6034d-8faa-0a2a0a5109dd-0a2a450aebd2-8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:31:10 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6034e-f2d2-0a2a450a0019-d155802ded58-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 10:31:10 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so36058385e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 01:31:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17a0fc2e4sm130900585e9.3.2026.10.07.01.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 01:31:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1791361870; x=1791966670; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwFdaNiudN2iiylPMoo56VdyeBK0OseTg6BPlmrhMsg=;
        b=Q9PeOPaTZVLR5XJzKhY603vX1DeqPZC0LOlQN1XQCV73PDDZRWinWeSE8Q86UoD0j3
         VRqoV2CHDxWeW23F/6Nr1+mz+bGmUDOAIS4G/FJ+rYOMLopfL7kqu9PzhIp9OMyI1Pnz
         qTSOaYHMsu7/jV6u7E/Ai0CbQvsSq1sZKn6aHjSTlA61fxq32ALpcsWYPYSj8QY6GQSu
         bsfrxC68frJ5mSlTRcm4tyWPyy6QW+DPssTtCdtprm3f8wRxGzXHXUDisSfVuWjOZ3PB
         Nhi8zT2EYQODM04xtV1gcAqFv81huggYyIreEadHFLi9F1smtNTuLORGhpZEUhxnR/wU
         S2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361870; x=1791966670;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwFdaNiudN2iiylPMoo56VdyeBK0OseTg6BPlmrhMsg=;
        b=rhhGv92ZlPZrppQngE5SW4fjU4E38Km4vlUrhc28GdAPCyUusNZUPErhX+l2rAGqNP
         zBGMMg69rf0SvuAgQzLsdjlCTNJCd90fSzFj6nQWioQgTJKf0AnUuaqN9xBtOSc91CSF
         iERzlE6Wn2XweHFcbJmfgMW42oumwmJUBbRupK9SslujT09apDP3dmMkfLUPufk9GNJ/
         RgCClm/WEg21ZnyzynCeeSNsaf44mcddf3LO9TWQN1MoByoOEOTAfoDufjl2Isi8fl/4
         brN5wghKXRNGIS7bWkGAwcwBcbrKi3HHysWu/yObZfi/PU9YWjxXI9L2+x2+wp9F9syS
         znMA==
X-Forwarded-Encrypted: i=1; AKwUvBzdzAOLzG6XFUZKCtMD3ZL8wtaB5iLElU8/N9IUl67gc495cW0dM8bGMSFZfzYIQzEw9XM4yC/nz5A=@lists.xenproject.org
X-Gm-Message-State: AFuF++nZxP9u5Ro+3ehZkvJNLqpdeNrWjOvAHzRB7O0XgjDMcAc02Ww6
	eUF3+oi4gMcaglrWG5jmRd93kRGFLA0Xix1upWEKRHOgfMM89uUgF1BnG9EJn3VWxA==
X-Gm-Gg: AYBFou2f93HWD5Zq+V1k+esvarAsCbFU5cy2Zd/AqYZqhvP5yuOPkQgtGwUnf/wDkH5
	jV9Hh92U+wDSqvAxhscVfbbJtgLpkSakAWhOszO3S5plL5ZvA1G9jQJmiicTAbUH+z6Oaegi9jp
	iigiF+J3kOzRFcn9MeTLNceLl5ooHo2Ld38ue4/QrJPyspthDfpEky3x+JrwdLlQnFWJqqEpaSa
	O3SfPv10QFmRgAuYE9TgqePZoBiabU+XvhMRvazG+lPITo26Jop/0hwLi6qtzDOiRTqK0AYROyI
	QvOdelHQ6vXm8q57qB1MVFHjcGiSzBW8OAVXrVqGIcsh0Umgxdegp/jyqtMa/W5sc+R6XcYzXQE
	ZR6iXpI+v1de5ZyI0dZ87ENzpItnfHIy9VGtVWZhjA4aGqTMQ7K4Zwwkupc1yzcRgI3X8/+9Tey
	GeZ1ZC6neT/EtQaZnlIPlbg3QLraEeJ1Uy4mwsExn17zxp1LatLzKdZmInwZi9rMVaX41QoQd4c
	Ii7NsWNxoRMDzyc4cz4b15M+/1aBgYf1Nd5j5B/D+hP94fMdw/yh+Jvsmfflg==
X-Received: by 2002:a05:600c:46c4:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a180660fc7mr17337865e9.28.1791361869630;
        Wed, 07 Oct 2026 01:31:09 -0700 (PDT)
Message-ID: <8304c0cf-8166-483a-b9cb-534b434a3a3a@suse.com>
Date: Wed, 7 Oct 2026 10:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
 <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
 <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
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
In-Reply-To: <8d3b26df-a42a-4d34-bc6c-81ed26839006@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791361870-4B6D6CFC-1DDF8764/10/78276251493
X-purgate-type: spam
X-purgate-size: 2389

On 06.10.2026 18:09, Dmytro Prokopchuk1 wrote:
> 
> 
> On 10/6/26 18:03, Jan Beulich wrote:
>> On 06.10.2026 16:23, Dmytro Prokopchuk1 wrote:
>>> Hiding .xen-syms.[013] assumed the almost-final image is always pass 2.
>>> On x86 LAST_LINKING_PASS is 2, so .xen-syms.2 stays visible. On Arm
>>> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3, which was
>>> hidden. Pass 2 is usually only a symlink, so Eclair saw no program link
>>> and reported every translation unit as unreachable.
>>
>> When I did that work, rule 2.1 ended up clean for both ARM64-* analysis
>> jobs (iirc). Upon re-checking I now see that ARM64-amd has 177 violations
>> (apparently that's what you talk about above), but ARM64-allcode has none
>> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2916569232).
>>
>>> Stop hiding pass 3. Passes 0 and 1 remain excluded.
>>
>> This will cause scanning of both passes 2 and 3, i.e. consume more time
>> and report duplicate violations when both passes are real linking steps.
>> I think we want to be smarter than that, to really scan exactly once. I
>> don't have a good idea just yet how to achieve that, though (and I was
>> wondering already when putting together the original patch).
> 
> At the moment
> (https://gitlab.com/xen-project/hardware/xen/-/pipelines/2917375773) I
> see ARM64 R2.1 violations:
> - 177 in AMD
> - 249 in allcode

Which demonstrates how variable the situation is.

> Anyway, we can have if-else like this (copied from
> automation/eclair_analysis/ECLAIR/tagging.ecl):
> 
> -setq=target,getenv("XEN_TARGET_ARCH")
> if(string_equal(target,"x86_64"),
>      file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[013]$"}),
>      if(string_equal(target,"arm64"),
>          file_tag+({"xen_syms_tmp", "^xen/\\.xen-syms\\.[012]$"})
>      )
> )

Ah, yes, perhaps. Yet there isn't any if-else needed here, is there?
tagging.ecl also uses two simply if()-s afaics. (Excluding .xen-syms.3
on x86 is pointless. There's no 3rd pass there just yet, and once one
would need adding, we'd want to similarly scan that rather than the
potentially no-op pass 2.)

The thing that continues to worry me with this is: This way we have a
connection between the build machinery under xen/ and the patterns
here, which need keeping in sync manually. That's going to be pretty
easy to miss.

Jan

