Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60263C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:44:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394043.1632849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIEj-0001wc-Jo; Tue, 18 Aug 2026 11:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394043.1632849; Tue, 18 Aug 2026 11:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIEj-0001wU-GM; Tue, 18 Aug 2026 11:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1394043;
 Tue, 18 Aug 2026 11:44:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwIEi-0001wO-0z
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwIEh-002WhO-AJ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:44:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844585-2eae-0a2a0a5409dd-0a2a450cc15e-6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:44:07 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a844586-f479-0a2a450c0019-d155dd33e148-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:44:07 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so3943001f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:44:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100073sm288638625e9.3.2026.08.18.04.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1787053446; x=1787658246; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7XzeYR+7zhcH+bahORub+d00BZMv3iO0s/OTh8B8NA=;
        b=I88b2ZNAmm19uRrxD1tbLHMYzeyTIvIF2r+vv7E+Ms7BoHzGQVxg6pd74/JOzb32A/
         f2DtOl5bjFjljCqg5lDGkxW5AOYcwX9/n4SSIoQhUAY9FfhFwVC4G1bgFFYriTbAF2p0
         xViljL085cd/CbY83uHehUJJ44R9El9rNB2Ej6cGZ1YfiPxx+szMurAGnSt5iayAaazx
         rXvo0+YFYjUSyI2318skWlS4uB/Bz4I67h3j4WEGNlMoUhiY1bxAOYwrlOub0FTezsdK
         Ggb1Ruk7sc4avxRoMST2n6MxRQ5qsXCi7suWVgngFaLveTjKqUnCL3Et3u6aVCSVQDAh
         57oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053446; x=1787658246;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7XzeYR+7zhcH+bahORub+d00BZMv3iO0s/OTh8B8NA=;
        b=a8IxrOXp0OMzxCYIIkdUMrKh6eYlJJ2usQsXsuMwIoak/KsvFu+OmrrnRlPs63O7aT
         +V43r/Z1knuGabYXzJgiaJf0gYFwfGNS7TJRksbF2f06VuZR4PD3KHQXDlnra3xtSDO6
         YpVz43XGtvvri91ByQ6BUhx7VRrTu0E+ie8s2+dnIdCoZVpWf7tsNwE37nsGQc3ojiSx
         HQ0fl+JhFJYwbEdyerXMxUh7OC+uBzstXVu0vupGEzHn/EOHp9BftKza8ZXfugzwjvn3
         pcHHiw9cT3yQUipuFliS07Bw4tWg3aAWbonJwHaTMJ+Y32HruzLWgWq5BFs9k/Ll6RKt
         Tamg==
X-Forwarded-Encrypted: i=1; AHgh+Rrfvqv0DHgzNv7d/wWQUqtCF93uQKkCuYLz1om64FKTAO8r5IcPrIe0tjRFeVdNphVCfv0Lfb3xjDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkENaqcSNMaNx7QKUxtD59Re/QR5u8pwJqRUVRpryrBI5gx3Vw
	Y96ZB/31zeAdfBS4MOceQvh2yiMMtX05dF4YBxFLc5e0TLfVINNI41/HEpijzZQhJw==
X-Gm-Gg: AR+sD1049zxlmQhl3JWno9MUTHP+6YPB4JdcHtSieaSIOO6CEPqaTKxyU8xqlhsHXPk
	9hw/PYDNN+7Pb3k6zGXk/N4aAHD8jYPG1ftrDME8xWgJDN4wtM4Ty6mPDZyrXiZl+G83YNQskbW
	Iwa1dZ9zvykWJ6bAFJHpSw1drLMj02f7knW8ldf5ukY1RU/T0RipI1lJ4K4woEP3zOvNlJ9+bO5
	Qg3isjvLVOA5xzHxkDJCadlIteqKx1lXh5Jc3mW4oDLFeflfxtwYPzwfLrpXv3SgzvXRCskfr0A
	QLopjUyXZURAYd/yeUiK50eXitdJ7HkHnRXXTAId7AhNchBizyf6fQ2IovRRhyqTueP083YvYCy
	G8yVkag4zSZoCNg1RbzdOh/CwGvZ0iXZRTUrytdh1SxwSBs1h9Hi4n2u+LafL1GuO2AzP2VPqS3
	zUOQV1BOYypKhAifNTOwFNNIxlq3TQwtMvByex1RYdg/qRESVYXdsesLBlDTW1jAAecRtEbnzdy
	SC6pRpaLhS9EjhkWk3UtqLQl/nKxiXPGA6DjNTNOON7IvopPDFy
X-Received: by 2002:a7b:cbd3:0:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4998794c02emr341063815e9.5.1787053446606;
        Tue, 18 Aug 2026 04:44:06 -0700 (PDT)
Message-ID: <403cc4a0-9b26-413d-bab8-03034e349c39@suse.com>
Date: Tue, 18 Aug 2026 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/23] x86/mtrr: get rid of a static variable on
 pause/restore
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <b36573fda71fdceb3d6049493faf3daff9f64de8.1785668458.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <b36573fda71fdceb3d6049493faf3daff9f64de8.1785668458.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1787053447-01EC2A5B-7F994608/0/0
X-purgate-type: clean
X-purgate-size: 1467

On 02.08.2026 15:09, Sergii Dmytruk wrote:
> In addition to keeping the state in one place instead of on stack and in
> a static variable, this enables exposing this functionality to other
> units in the future.
> 
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
> 
> Notes:
>     v4: was called "x86/mtrr: expose functions for pausing caching"
>     v4: no longer makes anything public, just updates implementation
>     v4: the state structure is now an output parameter instead of a return value

I don't mind it to stay as you have it now, but recently we discussed this
aspect in another context, and I've changed my position: When the struct
can be returned in registers, it's okay to return by value.

> @@ -439,7 +440,7 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
>   * has been called.
>   */
>  
> -static bool prepare_set(void)
> +static void mtrr_pause_caching(struct mtrr_pausing_state *state)
>  {
>  	unsigned long cr4;

Considering the conditional ...

> @@ -461,7 +462,9 @@ static bool prepare_set(void)
>  	alternative("wbinvd", "", X86_FEATURE_XEN_SELFSNOOP);

... cache flush that's done (and the comment just out of context also
correctly saying "no-fill cache mode"), we're not really pausing caching
in all cases. I'm therefore worried of the new names of the two involved
functions. Andrew, Roger - thoughts? (My inclination would be to suggest
mtrr_{pause,resume}_cache_fill().)

Jan

