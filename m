Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCA5CC6B24
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 07:15:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448486.1664522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGtCb-00052t-Mw; Wed, 14 Oct 2026 07:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448486.1664522; Wed, 14 Oct 2026 07:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGtCb-00052l-Jo; Wed, 14 Oct 2026 07:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1448486;
 Wed, 14 Oct 2026 07:15:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGtCa-00052f-Gh
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 07:15:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGtCZ-00C7Sb-Ha
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:15:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf2be4-2eae-0a2a0a5409dd-0a2a4501e748-48
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:15:03 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf2bf7-5984-0a2a45010019-d155dd31d452-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:15:03 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48c02782159so2252464f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:15:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de72c7e36sm4538867f8f.37.2026.10.14.00.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 00:15:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1791962103; x=1792566903; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxNzIOA0qyzKYDaLspqJVplnLUKtqE5X6BfHkmcsHtQ=;
        b=OgZLMl1jMn2bM7RVnwdzsQ9jaH0XvSA+V3M5Hjdy0yTNkD7u05DgF/1+aG9jg78m7v
         sU8CdPA8IUue18wPtbL1BBESM8tHMDMNLOhh6+Ps2YsuAwBFyssVR3BXxfHWTnt4YeiQ
         gz5Df5KikZ316PFLshKNMPkgMRMqg3v4L6VJqTUd7f1qectTMNHR2h8EAJPFXVkzYidi
         eDt25JmZMpSZsS/r12SW3bNELX2syLFUjMmVGF28bHGM++YpUIy1S2BWRsvoWC93+47c
         vPBDwYXeAppW9dWXGuYeiH4VpH1APKO4cijkIPl+/QJN+FgEkTO6UH9xAV+p7VYKMeiV
         7RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962103; x=1792566903;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxNzIOA0qyzKYDaLspqJVplnLUKtqE5X6BfHkmcsHtQ=;
        b=2AiVzAw8GYRN2wNTqBQZdmXkdp5HKxBWmNXngXShXaZdNF5/+bG+NsmDQiJ0mj6f4b
         4k6o4qxzzMsD9+gzjJZSA91w/hGvs4xEHBsgtXONs1ukBKmbPH7TFD5SsLGkiTUWfubH
         8ks97lq8FO90dsVXdXbyI+IcsfW2hbgPNNiIqk4lkV/NkiCgoF8zhKE9FzyD3xnhu6IP
         pZFH32YnVDlrlDF8TSy1loOhj0klelGLMPZaGPH+atKq0p1cgMQ1lq00xzcYhhsxErPM
         CHDDKIAoHEBowtvt400ZxhAGYKvj5YiTxdBcyTAfI8Sdb4yGb4HwHSkXUOj/DzBCnDhY
         hGTA==
X-Forwarded-Encrypted: i=1; AKwUvBxucwYu9Qa1msiZqphRmIeW/EtJPgRRN/qbXyBtp/sB9RuxVjxb1isdIWIb2kcFs56vUmn3Lj6BotI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJJXp18WZaHy8cSnxNxLZTeQAn7SXoqU7UwHuWgDnygWbV4J0fT
	m9OBTo5EF5Y/Q9+ptywCQuGLJl0GJg5KUXK+nsUKAaKuHQxXHriKp02LPuyjeAlbwQ==
X-Gm-Gg: AYBFou3PySMUKTlY02ceprH3BO6OPS90L1IhRL+sH5ejeJYxudIWgmB7wDE7mlFH7Sv
	/VTkNACDluIQa+MbZphNFNREVK8gRGYnOgqNodA6eOa4+jpSEqapzGUvoE2mtBXLaK1uJFGOlQb
	ZTt+m+kpj7Zq41X2g5fFCwlFgrA0p0F0oJC/URiN0HRNSpC+lFmlXSxkevwnB0Mej8HFJKmD26U
	QgcrSjmUQPHjN8X05Uh9PM6n7LhmDOBrIKD44nEjSbFzCoLGiqpgHjLAuyIL8u2EF9+HbrzdzpT
	2S/03ZhmYw8qWUGSvj9VkIymmETOvIfHuU2g18/S9sQViX0uj37WH9D5UMBI5LT+6kr1fl9id71
	bRzLMxyHOTalXWf1awlH+KR6s8c9BNIhZEg55vMfQ5vitXtEHJ7rCENonzo6yslxJocTfFfLzzI
	tTWmwWQz1z9ICb7vq4URPzIp0sh2OpXNlYEYch6mEs7qWMH3hI5VgRtRlYv1zOuTchyJ3SMJGNS
	pBfvTHBe2v/fxUZS/ARw0zmTcI/1d8GKBgCFm+3h140dyahMX3mkkFjY2qxQQ==
X-Received: by 2002:a5d:5f50:0:b0:48b:50e:5dc6 with SMTP id ffacd0b85a97d-48dbacda8edmr31931882f8f.34.1791962102667;
        Wed, 14 Oct 2026 00:15:02 -0700 (PDT)
Message-ID: <2117afc1-dd75-42e2-80d6-f87b06902554@suse.com>
Date: Wed, 14 Oct 2026 09:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Fix UB on defensive default case in handle_pio()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261013164404.361893-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20261013164404.361893-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1791962103-BC95A757-CAFD034D/10/78276251493
X-purgate-type: spam
X-purgate-size: 434

On 13.10.2026 18:43, Alejandro Vallejo wrote:
> There's a potential 32bit left-shift (when size is 4) to a 32bit value,
> which would trigger UB and tickle UBSAN the wrong way. Shifting right an
> all-ones mask fixes the issue.
> 
> Fixes: 4609fc8eb04e ("x86/hvm: Improve error information in handle_pio()")
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


