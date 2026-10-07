Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7C2CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 13:34:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442333.1659889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERmn-00022O-RH; Wed, 07 Oct 2026 13:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442333.1659889; Wed, 07 Oct 2026 13:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERmn-00022H-Oc; Wed, 07 Oct 2026 13:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1442333;
 Wed, 07 Oct 2026 13:34:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xERmm-00022B-K1
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xERml-008Ig2-Q6
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:34:19 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac64a4d-8faa-0a2a0a5109dd-0a2a450aaed8-38
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:34:19 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac64a5b-f2d2-0a2a450a0019-d1558030dc52-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:34:19 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so46580575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 06:34:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f493761sm108208455e9.2.2026.10.07.06.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 06:34:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380059; x=1791984859; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69LatKWuTl442WAQ2wOX8LJAx2OtprmYI3vYMK0Ne0k=;
        b=nxEQWW/5aUApIogBcdePfj/7vrpCmU5fA9jFLZcN0ve2TaTudl+5vzOlwB0qpifadh
         HT9SEyCg9qVgWa8IwCG49kigDMWC2BEe3oOAsrtOASsg9DXh9AbrHKWio+Mk7k2UF2D+
         e63oY8AOa0iXkVH3q4R/Ga7iOxBNLiVATmSwUb1Sg7/3XCLLrcIb6VW8C2ILB7Me8tHH
         Dc96fol3tVacmfmIYdD6deB7Fo1GGXFEOzESmcFanCLhP8ZYXIV+fPORfZICSjzbaeWB
         jHo6cg2In3NZ+kcRkoau81vnG7KGbg/FuxtAVk3r5GgE/GelIMd4sZdWWonVyd8CAZhD
         sEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380059; x=1791984859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69LatKWuTl442WAQ2wOX8LJAx2OtprmYI3vYMK0Ne0k=;
        b=G+4MbBMEyaZIyKAm6JmmLO4Te1ZPssGrTFiOwHlFm0hzjcQvZwbtWEiMhtaOHfKJvS
         EPF31KN3ppx8Gm6aXOf0mFZlpkb2F+a9nUeHzIJ1HHMGuRwqRm2DjW/K/55ywrBPNnMx
         m1c0EKX6RmbaG9L0BtY8EaVU9mtvgQw4dQmxl96/eDaHSkg22YZU+YbPDiCh4fZBrI+o
         CpxlUZfVoAduhTHGQq+dAVDQQQC7dg4pPekWon6tfg5gEzFI1E8fQ/uQtZl7TRP2Jo0P
         A0EBXn5bX3GhjsshHZVhd77dO7fRu4yykVaoUsABAmygvS5NxQdhqpHYewaAz9MfuS//
         gLEg==
X-Forwarded-Encrypted: i=1; AKwUvBwxelhen6DgynNWFIFGtj2WBl7llHXW5uo9ddfvAJOiOV12h/niEh1akHDXuNW3wdPU9biUzh0nOZo=@lists.xenproject.org
X-Gm-Message-State: AFuF++kO+J7/+Ym/f6zLSdEX7+YTW/EQp3R9DUNic48OFlD8oEy/I0uw
	Ter0uGoekZcYB5tiHvspTAkJCVhKLb+YFNGc86W4xBsjGdOck7kTvBND
X-Gm-Gg: AYBFou0BUE47/V4EGJhGd4sc8kjtaZpGXnVjzaPDgDufpWadcWvIL/Tbg55ZWe2UD0Y
	9y3sAIjKAH9bVwuTMlOn5DpI36ogXXVEahdWifLXkpN+60YfjKQ8fceE6kFYmUYjHJzxjH2EABQ
	2No9olD7Wx1Xq7DYEIyX6LsZAQOIU5kAFuMvAE5BzDsV7LXzUJpCBAeNS9vSSoscbrsRSbLUafL
	XHri3eYEeehXd7BjXcIa22YtPy9PBZdWAK7wOTC4K327ABqny7ZI1FLZ/IWVptfk4I8gV5Oz1oE
	vIwUllPfxAKW2CNqlQhvxLAqU2oQm3/PGMmBPGxGvzLAi670AemsOqbzvV00u7LLvl08u/8nnFo
	OkemE8s9ei4lO/Svx6nCFLs9W1jcrXy9y5cveSJgEHFMK9sD/yTPXGHIEgXzRFJ23vFVusok7VR
	a9TWxh6BZcDs62+whBVSElDz/fZ2nYI93UDxPm9Wt5Q/7XAvSIFauFC9HE7hepqS46dmfkCRtad
	9uX+2zngkexGJTCmaYJ72c5DTJtSX0LDE5PWtg4eLAw0jtQFA==
X-Received: by 2002:a05:600c:4687:b0:4a1:7811:6cc4 with SMTP id 5b1f17b1804b1-4a180650943mr41275485e9.34.1791380058348;
        Wed, 07 Oct 2026 06:34:18 -0700 (PDT)
Message-ID: <fc937c5f-01e6-4ba2-affd-2e108ab7eb6c@gmail.com>
Date: Wed, 7 Oct 2026 15:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
 <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
 <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
 <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
 <1791374346.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791374346.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1791380059-514C7CFC-2F4BB363/10/73395122804
X-purgate-type: spam
X-purgate-size: 3439



On 10/7/26 1:59 PM, Teddy Astie wrote:
> Le 07/10/2026 à 13:35, Oleksii Kurochko a écrit :
>> Also I am looking at henvcfg register which we could access in HS-mode 
>> and it also has ADUE bit and the description for it is the following:
>> ```
>> If the Svadu extension is implemented, the ADUE bit controls whether 
>> hardware updating of PTE A/D bits is enabled for VS-stage address 
>> translation. When ADUE=1, hardware updating of PTE A/D bits is enabled 
>> during VS-stage address translation, and the implementation behaves as 
>> though the Svade extension were not implemented for VS-mode address 
>> translation. When ADUE=0, the implementation behaves as though Svade 
>> were implemented for VS-stage address translation. If Svadu is not 
>> implemented, ADUE is read-only zero
>> ```
>>
>> So, at some point, we could verify how OpenSBI configured the hardware 
>> and compare it with what is specified in the DTS file.
>>
>> The only problem is how to interpret this part: “If Svadu is not 
>> implemented, ADUE is read-only zero.” The spec does not explicitly 
>> state that Svade will be used in this case, but logically, it seems 
>> that if Svadu is not implemented, the implementation has no other 
>> choice but to provide Svade and so basically we could detect if Svade 
>> is used based only on ADUE bit.
>>
> 
> To my understanding, when !Svade && !Svadu ADUE bit doesn't exist and is 
> MBZ. That doesn't imply Svade semantics must be unconditionally applied, 
> but the contrary (otherwise, it would contradict the main spec).
> 
> AIUI, Svadu && !Svade behaves the same as Svadu && Svade, as in this 
> case, ADUE mandate the PTE A/D scheme that is effective.
> If by default ADUE is 0, then we have Svade semantics by default in 
> practice, but that can (*maybe*) be opted-out.

At least, in my version of RISC-V privilige spec (Version 20240411) ADUE 
bit always exists. It could be read-only zero, yes (in the case when 
Svadu isn't implemented) and in this case according to the spec Svade 
will be default behavior:
```
The Svade extension requires page-fault exceptions be raised when PTE 
A/D bits need be set, hence Svade is implemented when ADUE=0.
```

Hence based on the spec version I mentioned at least something from 
Svade and/or Svadu should be implemented.

> 
> It could be interesting to check if the P550 has Svadu && !Svade, as it 
> may explain why Svade semantics are effective while not having Svade 
> extension.

p550 basically follows Svade behavior. The open question could also be 
if (in that *old non-ratified* H extension which p550 decides to 
implement) it supports henvcfg and hencfg.ADUE bit.

But I am not sure that we should care about it now as it is mentioned 
somewhere in cover letter that p550 support won't be upstreamed at least 
for now because of some other difficulties.

I think we should back to this question when we really will decide to 
return back to full p550 support in upstream. For now, for other boards 
it will be enough what was mentioned above.

~ Oleksii

> 
>> If we accept this assumption, we could fully verify, in HS-mode, both 
>> what is specified in the DTS and how OpenSBI configured the hardware. 
>> This would allow us to require users to provide a proper DTS with the 
>> A/ D bits update scheme correctly specified.
>>
>> ~ Oleksii
> 
> Teddy


