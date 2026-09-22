Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FC9C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 12:28:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428759.1651699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zbI-0002Uu-6p; Tue, 22 Sep 2026 12:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428759.1651699; Tue, 22 Sep 2026 12:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zbI-0002Un-2e; Tue, 22 Sep 2026 12:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1428759;
 Tue, 22 Sep 2026 12:27:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8zbH-0002Ue-3O
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:27:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8zbG-00FrVj-Fl
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:27:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27444-2eae-0a2a0a5409dd-0a2a45028e2e-10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:27:50 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27446-6ca4-0a2a45020019-4a7de14cb0a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:27:50 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4858bc96fabso3285328f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 05:27:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862793792sm5876059f8f.31.2026.09.22.05.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 05:27:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1790080070; x=1790684870; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP/CxubhZJx44DypIsBQgS0gMJTEdf2jQTTrcKjNZ6w=;
        b=P1RzTurb3TFiRd8++fD2G0kBFpi3xRjkoCPP3u9UX/QO1S4N3eq+H7JoSSlsUom455
         k8ImKGCY0RaQdJhOnRStQA4RnqEzXVX3TQ4ViUjHayuUw4p9wX4hDUzE5aBqPLETk8tm
         6sFYsCugp4c71WogAcgD/Sc+vlouusb37HoZRCBMXvwfixWWsOLyzRok/gH5+wrSxrhh
         gCFIFwLFhU+bB7R5fvoxttTjWJvhNNigs/bMhxbDicXjEqeRBzh620b9xYM/3ahhseAi
         zLEXDXXQSeyG40C7Q+kIm6RWoL8pX9hNFPxN9pAOOtPRef1gne5zXHeCMl3aEK5kPWbl
         b8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080070; x=1790684870;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wP/CxubhZJx44DypIsBQgS0gMJTEdf2jQTTrcKjNZ6w=;
        b=0AHQJI6mi4t62VwoQ4kiDBfX0BhOjNk/0PEsSLs6lIeKrBw80PrIKDvGzrSLmNZGuW
         TpFJgsySLZhkN8lPaORSRa9kk6QiSfzwEIbkn8y36YZz1YX+dwBVDk785he7n9GjX+Dj
         enhv3Rg1evRD5NabBal7HQKoqRb0NWbg/mcBIoWT3mdOCmTmPJo+y6fm4HJN7tkwH5LM
         oAs3BGzd+81oodTMotv+kD8A0WwKMptk2DJw4WEKHUHjMhLFjO10DAAA61XkqgR6VgTs
         eX7kEmy4NLqtThMQcKSWzfFOsa3j8SDrcITmXUD5rq6JtJx8kKH8IHcF9c9B6PLMFUM+
         ztrg==
X-Gm-Message-State: AFuF++l3qHZAOz/s7PAkrJgD93/2JTHT9pB2mBVZcIHboh1xpNofJ+LM
	U8TNTF5WLs4d4fp8FmA1k2sDgmQq4FvJB8cBsuRslPMvpXdrBFt3gsE6PQEe6Z7MeA==
X-Gm-Gg: AYBFou2kKhXGUKcdGs28kfnL1mElT7ALmt2zBqM22YvBO52vispMGhPySr5lIzg5NKC
	hkyunYtwiOhsAJjSebk+WPVKOVT6ettgzmL6Hun0SaLQgMTOOUpfyye+K8YFtR/hL/md3pqxge2
	8uACzi7C+bl6i8wXPKCpr0TTLNys5DHwWgQeBmceWvV0Y8YFQomxkJaPKXbqstAMRF6yfFEA++0
	i5VWbySGiP3qRhmYPSGGJw5VD8NZch5+w30k0Awfn8Z2zUT9BKQ6M22QoHb9ToNhKwpTm+C7cVL
	UmZ6pNCWmLrzh55uM6IeBmxYdzsfG0QsWN3kxrffdqGz35DK7WrcVjYAdxIzoHMwOGDMQ75uqEa
	ko8gKl+h8nvwZuYZ1GR2GGYJ2KI/42KlblngoTocjdSHxQIkm+jsUJZswpG4HCPmgcHCb5j/lf8
	oXdYISukwzoXLNSixMfdcDWVn4f9MgPi7DdG3Xc7l47RII2ZXDXnQAP19tnnw0/A1vOdTzwgbrM
	0ztq0cMKPLWao2pEMbwF0nU+IgSEmweUunQGNWkoTJweW8+S2V7PynMg+B2nK2dbizOeDjvdw==
X-Received: by 2002:a05:6000:41f0:b0:487:7fd:730 with SMTP id ffacd0b85a97d-4871e254ef7mr19640865f8f.13.1790080070110;
        Tue, 22 Sep 2026 05:27:50 -0700 (PDT)
Message-ID: <20c2003f-910b-4e9b-92f4-5298f11f58df@suse.com>
Date: Tue, 22 Sep 2026 14:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/riscv: make Zihintpause no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
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
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790080070-F0AA52AC-4313DE70/0/0
X-purgate-type: clean
X-purgate-size: 1334

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> required_extensions[] panics at boot if Zihintpause is missing, but Xen
> never actually depends on it: cpu_relax() only emits the "pause" hint when
> the extension is implemented, otherwise it emits `0x0100000F`, a legally
> valid FENCE instruction (`FENCE W, 0`) rather than a native NOP.

Just that PAUSE's encoding is 0x0100000F. I.e. what is emitted is always
the same, and hence discussing the encoding aspect here doesn't help
justify the change. NOP or not also doesn't really matter here. The
specific hint encoding looks to fall into what prior to Zihintpause would
have been covered by "Designated for future standard use", and hence ...

> FENCE is
> guaranteed by the RISC-V base ISA, so it never raises an illegal
> instruction fault. With an empty successor set, it enforces no
> memory-ordering constraints and thus architecturally behaves as a NOP.

... there indeed should be no concern for any platform playing by the
rules.

> Drop it from required_extensions so hardware without Zihintpause
> still boots.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - rewrite commit message.

I fear another round of re-writing is going to be necessary, sorry.

Jan

