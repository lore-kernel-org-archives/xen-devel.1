Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796F606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VOWBXE3S
Received: from list by lists.xenproject.org with outflank-mailman.1463028.1674005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0gy-0005d8-0D; Wed, 28 Oct 2026 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463028.1674005; Wed, 28 Oct 2026 10:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0gx-0005d0-Sr; Wed, 28 Oct 2026 10:15:35 +0000
Received: by outflank-mailman (input) for mailman id 1463028;
 Wed, 28 Oct 2026 10:15:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM0gw-0005cu-M3
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:15:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0gw-002UmB-2x
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:15:34 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1cb40-bab6-0a2a0a5309dd-0a2a450691ca-16
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:15:34 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1cb45-195a-0a2a45060019-d155dd29ac37-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:15:33 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e3b22e971so381516f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:15:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8e0sm26833867f8f.29.2026.10.28.03.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 03:15:32 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793182533; x=1793787333; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PARG7RTdpcAvp0WAx9UWs1TwTbbFjToKTRZ6/XeP2w4=;
        b=VOWBXE3S0xbYg5G7AjgbCo0m8+b60K1BmP16Vl9PT+FF1bNfne1iw23w/6uueWmrxU
         F+2G9gN8Pdo1Ak7UXmMSmeEby1uwCo4ngXSto0xF7gKrmp2fFXAmqVJ3LTjE3OQmBumm
         BmGKahQIEyy/ELWio/ToKR1cG/RnffEXzqCVA+I56BGXUMQSONVDeVKuJZFKSwcr8qUc
         j8pia0+oM/rvLun3uqHkwZLDGferLnxV1v42X11fSyQGNqYjNVbivQVTSkFsWSDcZGEK
         3k9WL6bogsBKTNuGaFScAbmtZdGMtcfbFPxGb0OZdewRViB3OvA68/O1Wif/x2bTMVcC
         bJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182533; x=1793787333;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PARG7RTdpcAvp0WAx9UWs1TwTbbFjToKTRZ6/XeP2w4=;
        b=innJN/9FkVlMErAxSusCH/0c56J8/cg/i1j70u150F8e0DXknWypf6m11vaYe11pyd
         yRED/w2zSQYbmNtzCejdvqRigljhwrjPdjWYRKmSnzbZT24MpN+NYVMbofMPTDXUFJ8+
         ci6YHaqnuTu7lyI+P+nI7A6fsVMIugS/bdDSwkSt/bVpSS+pe7RSjykwv6gLiFD8GYh3
         WU13rUcoDmaYnMeEIqyVV3s5SOdpZiM3zWJ86jKc06Mj02INSYExSyNYtywLh2/dZHRv
         69kMeOd7Qo04tuTQIqK379GyZbQbb7DaeUT8EjI8fncUPSJEmMRaxs7FQLSCIs23k5I3
         /XGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjSpgLjN807yYkNd5bpUb4GwpbMQSzRQne/rMBPve5D8SNe39w+HmIUjqH5TS3zoYM8jCIH3D7Jy4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLu4bZLiD7islrkRyjTptHAB7amcqO/CWlmC8mLvrQxgbpaxjUP
	VNnRTSrSKwVav1OBSiLr7TifF38U3FDI5PpR1FggjtVWX+yTqlLrkYcDuO4B5DJOqg==
X-Gm-Gg: AYBFou2mIOjd5XP5QHilkk8P9nMtoQn0I35gWg3zeoHm7MNUHdBxWd21NnGOIC83Oyc
	OCp5es7oNAmnYxPUrlaAw3RnABL9dLzEO2im+phOE7OFf09NFv33fanevcI/QP/C92MY1LFhqso
	gAaP/AgTYOglM1PNSL73tfSBK9n51YTmNphid5jZg4XrKPQ0dsiOafdaGG4LJN6+mQf+kqTiIP0
	84ElYelWBMX5qm00M3S+e2fbtleziibu3JelaAvuefujARJcTTe56DoPcq6BEgIB+rzJf39i6Nz
	bpf+DIm+EH3C64s9sRd/z3saDfVLR3wL9gd0RvkCGLYOVNLG8c6qekONaa67iQArvaOjAvHd7RS
	+Em0R5mVz0lv4QCTqGmaHViwSn0fGkYaljnPmA2COaCNQivkYXRow6vw1QtSgrsaySKUQlcIPo+
	3YkXDIsdaMwzOlBzKCllepJg1s8ZScPaWYmwp4vGZY5Y/M5VqTHZFsPj6NYBoDCcTv2Uj8brJEr
	mPedGKJL53R0MKSJHrJlv2eopAyR/lesMXCQ7HguAnNR81ckckw0lYlNhmzp6XrK+fZxxIbbQFF
	ti0g64g6ETmUJ2pwTyDJAockldEehDxzFKTUiW8580zhMCV4OsYIRNwgIO8F9m4SfhuAJmy6pd9
	VpVhQipcbOiT8Svlj
X-Received: by 2002:a05:6000:240d:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-48e5d5d137cmr4946584f8f.41.1793182533104;
        Wed, 28 Oct 2026 03:15:33 -0700 (PDT)
Message-ID: <f6cd7e8c-c7c1-4f53-9a29-20ef171ac7b5@suse.com>
Date: Wed, 28 Oct 2026 11:15:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/emul: Introduce x86_decode_lite()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
 <20261015210530.786604-2-andrew.cooper3@citrix.com>
 <998b084e-1a3f-4b51-bad3-4b175e6027a0@suse.com>
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
In-Reply-To: <998b084e-1a3f-4b51-bad3-4b175e6027a0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793182533-F7ACA77B-0A80CA61/10/78276251493
X-purgate-type: spam
X-purgate-size: 639
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 10:48, Jan Beulich wrote:
> On 15.10.2026 23:05, Andrew Cooper wrote:
>> +        [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/UD1 */
>> +        [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
>> +        [0xbb ... 0xbf] = (Known|ModRM),       /* BTC/BSF/BSR/MOVSX */
> 
> With it being MOVSX here, perhaps MOVZX above? Or the other way around,
> MOVSxx here?
> 
>> +        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
> 
> Is there a reason to permit XADD but not CMPXCHG?

Oh, I'm sorry - CMPXCHG is there, just that I overlooked it in the longish
comment.

Jan

