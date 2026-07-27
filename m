Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9954BC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 12:13:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371645.1619127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKCn-0003f3-7O; Mon, 27 Jul 2026 12:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371645.1619127; Mon, 27 Jul 2026 12:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woKCn-0003ew-3j; Mon, 27 Jul 2026 12:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1371645;
 Mon, 27 Jul 2026 12:13:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woKCl-0003eq-Fn
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:13:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woKCk-003gUR-Dy
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 14:13:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674b48-2eae-0a2a0a5409dd-0a2a450b8154-38
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:13:10 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a674b56-b7e8-0a2a450b0019-d1558035d17c-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 14:13:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4955158f26aso16969275e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 05:13:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bfd1a60sm232393315e9.2.2026.07.27.05.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 05:13:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1785154390; x=1785759190; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvbafVmBAOD4G/3HqlBa2OMetCsCIoid95w/exmuzDo=;
        b=IW79x4QqVedygHBFDbeD4XcvtL9ndWjA/c4Z5NIsrl8yFULujNB7myeFEEtytbnigx
         RcyGt0FIMxgtbYKjL3gDVfHNL1s5LL3EukH25V2lTQPOlVRQUhfCf3Cvk/8O0Cs1ZpVv
         ZBTVWHE1E9ULtfyDB7eVAE6+1734J4I5ac2OxEnqI8GonHD9srGXtUqENgTgPKQJHA+2
         QDPWsp4KwvvFgsaVUeFAQ+YtvtFSGC6R1VWIPKIeR1/w85Rq4PlkmIrQ7PPIWxAvb261
         4gefvkyOaELUgcP7QP7lJJdJxMeZ/+hXhB1SxykH1G4AUpdgt76HciaYBaTlCU5vhErN
         knUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154390; x=1785759190;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvbafVmBAOD4G/3HqlBa2OMetCsCIoid95w/exmuzDo=;
        b=BHZHhQkc1NXy5fx0ZlGAGaNKRmMqu8LVzEExo7KM+FArDuAIGzO0W8eXUIwtC4QDnK
         WezicaSa6APDPgYhCa5aLIJO1shUbVmD8B/0Z7L4WYaCGBp8x/JZmfGH6N2V8jkaC4U9
         Erf5IQa296kzMQZHNo3QNnDS0VIgrZasieFV27nB4XgNLW5qm5nBc8uk0oE7Bqw/IGes
         tzzmhcBFlV70HCWKw9sT7kTbNruCJ8AxCGeUudLGa5OH/kN7rIUAjBkkHEYVEREuFt5i
         QGWMKX5OPnuVamBmwy/lvDUZAU3o/Vx1th5cMKAsXfTXdD0S7dEIWUSUUda+IkbI56Dj
         NeYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4i7MFH5pC4o8rM4XXNmERUQWM39NxKDPas2sEe/AStHyPqxEvtsECcJsW05ayPkzW7Ycntv8IxLc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4+LQ3DBzxJOtmv1dJj8+D0SeMDBxc7cM6ilzm8Ba8dgzRAENw
	p/glBS/1Ikx6dOip0zp2KFr8rbfm8HxcKmuKDezJ6D/FY6/2jtxJeZPguhXemDk5ZQ==
X-Gm-Gg: AR+sD12vSUd+0Q3+uLm3WmGK7wd/3uG/JFpq5K0tnL9ApLOcYGribsf9eBR1/QZhurh
	eQfLyOoMTDTkL2zNqwAF9Zdc5wNGAYpT4VNViTE1spxkz9nKKtjAnnhHem0Pq05x88J1KRk80fb
	76NLJ8abRjOPnYykMS3Yx60hxhVIgpogi0nneoV6c3Nn5oiyQCm34rRyW7WfRd1a/OGJV9aRFNa
	n+jscSVdN6IvKPa1rNfavZrb41yIgqT1cOeG2QJWfB8+s43nUJXV/mIUbS+NcaEa7l2MXoFPyVA
	gL18GUCDOc7lntnfnxsl+qtNZWJ6aEXh/TV8xuc0hBwZyL87OM7kLhxTjGLPiJ1lBXFcjo7Xn55
	EWzbjsJlW1E+uRi3KvgLqJ/50m0XxeXY7z3L92SrOF8GKcEGTYgmC2vZg7AnzOhiRaaS2QuO9rZ
	nYMuFYKc6loUUKpQKk6zauJng9BtuEUwl66D2yhlEDhzEN5egZYOkSCqCuQeHSThMq3kHsIHX42
	9iU
X-Received: by 2002:a05:600c:210c:b0:495:4a27:483f with SMTP id 5b1f17b1804b1-496b5700419mr67328755e9.29.1785154389652;
        Mon, 27 Jul 2026 05:13:09 -0700 (PDT)
Message-ID: <06a539f0-a15d-44da-8b3b-f49720669adb@suse.com>
Date: Mon, 27 Jul 2026 14:13:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] vpci: create mem local variables
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>, xen-devel@lists.xenproject.org
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
 <20260708210233.922275-7-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260708210233.922275-7-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785154390-AA0C59EA-204FC795/0/0
X-purgate-type: clean
X-purgate-size: 885

On 08.07.2026 23:02, Stewart Hildebrand wrote:
> Use local variables to reference struct rangeset *mem in preparation of
> moving it out of struct vpci. No functional change.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v4->v5:
> * Patch adapted from [1] ("vpci: Use pervcpu ranges for BAR mapping").
>   I kept Mykyta's S-o-b tag since many of the changes are similar.

I think can see your intention, but I think there's a formal issue with
this: The original author's S-o-b wants to be first. That may plausibly
be you here. The submitter's S-o-b wants to be last, though, as the
change last went through their hands. In the case here this may mean
two S-o-b of yours, or yet some different arrangement - all depending on
what changes were done by whom in which order.

Jan

