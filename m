Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A3ACA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:05:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438158.1657023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEbf-00067K-PH; Thu, 01 Oct 2026 11:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438158.1657023; Thu, 01 Oct 2026 11:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEbf-00067D-M4; Thu, 01 Oct 2026 11:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1438158;
 Thu, 01 Oct 2026 11:05:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEbe-000676-Hj
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:05:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEbd-008KP8-UW
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:05:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3e75-e002-0a2a0a5209dd-0a2a4504d9a8-32
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:05:41 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3e84-b57f-0a2a45040019-4a7de18dd3ec-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:05:40 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so38146395e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:05:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f96d01csm43801495e9.2.2026.10.01.04.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 04:05:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1790852740; x=1791457540; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdY+cB2fNcNO2e6k4oQvAntu10bBGWQCjhFtQXa2zTw=;
        b=ZtHEGURR2gptICOVn/Rga27c5czwFMTjhQh6kczXChqqz9uecY9nxEGRJl9b+gUGBo
         8WVixVUAeRxVCqREHqOd/XKWA3c5xLX2a3LBXkYDOImTnm4d0ecHOYbgI4eo/XUFLLK+
         4nkXOU06LoiW1Gnk9fXUn57/BRWehSj9z78T+wGsZOxC/Y0fxrD3vwwvJoMH72Z0B2wV
         P6NDxRTpR2ge4oE7TiBpnbwUnoNyeemPZafERW7d4S42WmXaBgtnEB+Y2olnEYiupRk3
         eoOtVrwBi1xsb7RnDIvr5Q2D8ZUZkfyoFFCZypfG+RksNxaVrpYoK42y6wTczYylgLaD
         eKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852740; x=1791457540;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdY+cB2fNcNO2e6k4oQvAntu10bBGWQCjhFtQXa2zTw=;
        b=s9J1H8veP0hNc/uCRDCJhpWfSpPOKj4dmf8bZoZJuV+hOLGryoNDSshvpC78GnRIlF
         OzCzkPTB7GRgq39KJgAAqfUyZrK1i0JUlAUPAWCwuDCmAi0KuZRjCP3pNrJ/x98nTeYc
         +QoWkGUFEPSSwUsqlCZuyBpPNzDmdwQTCMIIGeNYr03025zwWKC79CPPyXN1gj5m4kWa
         Dko0bVzf9VVg9jpBq0fBc6SipPatHbVhU1SJvvd9qTfhwvPB34a7hbdLwi28goJFCvGh
         81NOHZDIfZ2OFUL3MpzcAMpr6qMj+fcWvfwgG2ihiGOqgnOhZZdB9RnCVoDoE8iaao5P
         KumA==
X-Forwarded-Encrypted: i=1; AKwUvBxzvVaRcio2NdAljCs0ak5ByNmhUFfkbmWcJX2aYuDGpCDTMDgRzlDYqheIGDeAPfypcYQ4SCX3HMk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kButDAUrJo/M+nhq57W/H72O0glqzh+GnPfke2A9ClCAjhcgkE
	+fB8YqE15tjxGQJeHbjn2sPzk5xtB6TkjACWZo2iQaohCDy4NKRSTUCCS4I6n2KS1g==
X-Gm-Gg: AYBFou21fidoAUuu8sXidGkw0jGtOwIkIYFxAFN+Ny80xptUWPCFg6KD26wPDY/4xQ2
	aohZbd5tZw9zH/8LPcaFWN/fEbqKLih01rA6eMUDrqo6nIMi6Q0370ynIna3tVHlUWlrpCn86s5
	V88Gg0iCI4oI250+80tGJawRtGVpmjkBrPXgRDGLRvV9sPFX8ujlo1hIqtUXWdQCtEY8762NSR6
	sswH4xTz8ZB+NtgIQpxyzM6HaI3aQLWOFgK0XXBgWiEBE4RL7JNgmJxVrPqBmeSOSvEgP96Fo2a
	WnZNDFWaB4eeb8mAw+Yh5ssH7nQ45Gjq2uqSekx8vOWpspZMrw+jZoxavE7Z32U5AE4WC46aEor
	wbXmbashd39+Vm4v+VYXAnwEKRZ3JTqMWw2F/EjvS/W/AqjECWFINTHiIM7Y8hm5AhoElUP8O6J
	mmgnKtWQRfnvRj80kpfysaxblSocqJSjWYGI9fu3AZ/2ZiIxZ4fT/tZPsQmgc69/sk4PDxKDqIO
	JbsoFSKxd4GYY/GzyRGcsx0V5Gfzk7NQQ5J1t8PgmgFLmD59yVK443rrE9p2g==
X-Received: by 2002:a05:600c:474f:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-4a01aff4fa9mr71566825e9.26.1790852740082;
        Thu, 01 Oct 2026 04:05:40 -0700 (PDT)
Message-ID: <5ff32e79-76c4-4f05-8290-14c248a79afb@suse.com>
Date: Thu, 1 Oct 2026 13:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261001091921.94138-1-roger@xenproject.org>
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
In-Reply-To: <20261001091921.94138-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790852740-52ECEB50-336A07F7/10/78276251493
X-purgate-type: spam
X-purgate-size: 471

On 01.10.2026 11:19, Roger Pau Monne wrote:
> XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
> its setting in XENVER_get_features to the is_pv_domain() guarded section,
> with the rest of the PV specific features.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
> Changes since v1:
>  - Just move the conditional but don't merge it.

And still no CONFIG_PV32 dependency?

Jan

