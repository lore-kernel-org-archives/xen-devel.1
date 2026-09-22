Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED55C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:34:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428851.1651764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90dZ-0001fd-9e; Tue, 22 Sep 2026 13:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428851.1651764; Tue, 22 Sep 2026 13:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x90dZ-0001fW-6o; Tue, 22 Sep 2026 13:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1428851;
 Tue, 22 Sep 2026 13:34:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x90dX-0001fI-P0
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:34:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x90dW-00G6SM-EI
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:34:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab283d1-8faa-0a2a0a5109dd-0a2a450a86e4-24
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:34:17 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab283d9-f2d2-0a2a450a0019-4a7de18dbe2d-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:34:17 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so21686895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:34:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277e84dsm5608092f8f.20.2026.09.22.06.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:34:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1790084057; x=1790688857; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4Ryrx73BEQdCje8/y/wl1Qw7FCFzVnkirAvpC6A43E=;
        b=CoHYzCvRPYVBfrzzcH/nnl6vN7VpWymYIkAjiQvMvIAI0azqrJsqsc2I+gIfF88p2s
         CH3Lbfay5c7XBOYxOGJ0PZOTM8JD81gO3m+moR2ziWutxLxelSgNnDOaFJgup0ukrOZ3
         kcDBa5e1Et5reNGYpCrLrtfgGchWLi079YmQqlw4IUJGx1pHI/nBjKvVzQ4gU0hTigML
         Ua/mfbXhNVCe8A7B532Utqm+HC0GyBsZaCil35HUbVBHndQ4OKkod+o/7nrc37JTE2F6
         fKrjLeH2Yn+njMITRKX8UqGLmTS7Rraje+t/It4BIPybWqWv7Oed0aFMSQcFxEy9oPpL
         q3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084057; x=1790688857;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4Ryrx73BEQdCje8/y/wl1Qw7FCFzVnkirAvpC6A43E=;
        b=zbXpO7oBUP7N7+fj31nT7JdNqSPFK8aYsT1Vnden8Iw6O9bvYfdYTeTahIyMmD467O
         ElYsJ8wxjjrLbBN4sZqYfOxns4rcOtlcBUqXso+MlVfOloQDq6UBWBzd9uFRzGqFzkd3
         HpEWRSLXRgyKWOjk6FdIEppOrRzUleMCOcVIYkKTYDwUKC2t7DWoxsBTjNP7HuECrO1k
         ukTP1fqz9vphezivFTgBPc8lkDaw/d1IzdlSCDHOtj6ZuIjiu1f5OKi26hyAEgR5Bef1
         xQrhYHZKfot3701ZiF2exunzesPcH7WGzXdDc7+Io2fmgTJ2eLP1Bp+sHa2AUMs3Gbdt
         4k2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcmdSTQjYRhkqH7frrbe+Xs35L3NFcX4K3LmZ29/M5UYVMCHavTEVcmKgKRrrLShCwxfvs2Z+mioE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mryqem4ErMcAthrfsbZorgLd+aB5y7ab4mF1vF0BtS5zofkUln
	DpN3Ht1ZZP1r5FmyLHP444T4TlEZOvHTsHMLYhNRBGS5S71RCAzHNVT1vN00T2OnTA==
X-Gm-Gg: AYBFou0UL/6JMukYtd97izAtTSslOjEqNaRWE2tbvWDD9ZsgOAW6TKiXko7GiMl66/z
	rIs+nZFEScvaVcnjwmiC4pOpXeVudW0s12YjByoO09at7PbmjwqxtixA8+TDB6kLaoOf5k8itZo
	zEQTghKpNL6ZmgJz3Ykqxxqylk2L3sfErFWB3cmTov2xxs6vqQ0Cv2j9FZ4V0nA7sfLE7Y60Fb2
	eaeV88tpuGYV5fxm/B+8vk0qUXqV6vakOw1x1c9H+g6jy34tQOXIHmuynQWmuwzipgorYNIrW/5
	qAKJgK3yPNQ0xox686kC7J8iZDP3NrRCv0uRiYnu2TwxIwQTt0evGlPM5JIZJruxIn+kaBC0hIc
	1HyhaYL2Gp3f84HfMEm6nmIAQ0FvrtTTBezjn95xXqnyi4uyCRKkC9bvE61mYhx0/E21WZ0rtlr
	VrpglBxvYKCn6ymuCPIyFyr7/SklS4dWYmABY2N3opGOqeVAdB0PcVY/vfOitGlfrwIFYcuFk8w
	wyg7f8H09cFE7Z6s67dfASBc60r0b/BDM28xaGNt+PNFRayNg7sRxjt9Pkheg==
X-Received: by 2002:a05:600c:6308:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49fc5728e35mr190371955e9.20.1790084057070;
        Tue, 22 Sep 2026 06:34:17 -0700 (PDT)
Message-ID: <baabb75a-dc95-4fad-a682-e4eb40071a73@suse.com>
Date: Tue, 22 Sep 2026 15:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Cache the amd_like() output on x86_emulate()
 entry
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260921092545.37148-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260921092545.37148-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790084057-508CDCFC-8D6F4817/0/0
X-purgate-type: clean
X-purgate-size: 1950

On 21.09.2026 11:25, Alejandro Vallejo wrote:
> The current code instantiates amd_like() way too many times, leading to
> codegen explosion. Unconditionally call it early on, and use that
> variable everywhere. This shrinks the emulator by ~3KiB.
> 
> No a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2860748404
>           (it's red because of an caching issue and personal branch name
>            conventions it's just arm. x86 passes in full)
> 
> bloat-o-meter before-after patch.
> 
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-3366 (-3366)
> Function                                     old     new   delta
> x86_emulate                               209351  205985   -3366
> Total: Before=3617694, After=3614328, chg -0.09%

That's surprisingly big a difference, considering how simple amd_like() is.
I'm counting 24 instances, so the savings would be well over 100 bytes per
instance.

That said - there are more uses, and I wonder why you ...

> @@ -1310,6 +1310,7 @@ x86_emulate(
>      /* Shadow copy of register state. Committed on successful emulation. */
>      struct cpu_user_regs _regs = *ctxt->regs;
>      const struct cpu_policy *__maybe_unused cp = ctxt->cpu_policy;
> +    bool is_amd_like = amd_like(ctxt);
>      struct x86_emulate_state state;

... make a standalone local variable here when you could introduce a new
field in struct x86_emulate_state, which would then filled early in
x86emul_decode(), and which could then be used elsewhere as well. With
that amd_like() could then likely also move from private.h to decode.c;
better yet - perhaps the function then wouldn't be needed at all anymore.

Another way to reduce the overhead at least some would be to make more use
of _amd_like(), now that x86_emulate() has a "cp" local variable.

Jan

