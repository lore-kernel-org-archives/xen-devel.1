Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E4AC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:21:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427340.1650045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8c54-0004Lp-AR; Mon, 21 Sep 2026 11:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427340.1650045; Mon, 21 Sep 2026 11:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8c54-0004Li-7d; Mon, 21 Sep 2026 11:21:06 +0000
Received: by outflank-mailman (input) for mailman id 1427340;
 Mon, 21 Sep 2026 11:21:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8c53-0004Lc-KX
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:21:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8c53-00Cw3G-0v
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:21:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11320-8faa-0a2a0a5109dd-0a2a4505c368-4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:21:04 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab11320-4cb1-0a2a45050019-4a7de14cbb3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:21:04 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dc83so2026113f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 04:21:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460964sm23503451f8f.7.2026.09.21.04.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 04:21:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1789989664; x=1790594464; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVffXoYueTw4wefpnWYLUUvPFBee2WkB5xh1yrvBjrk=;
        b=fF2AENHSYEgeUXM/6Thl2W8F6dYoWUpYOia6Cm6BXE1UmbkpwCglQkbf1nJkrR6LPk
         i2qV38mk79hragJtCevv2y9qfi3fEVl/fv2jKPrr0ngEd10UwjQCkRrDtAUUQALICmji
         mueUT389Tvm4klAg085ZHh9YY+naNHvlQCasT4WDKgOMNmba2DNbseUCsZeP4aHmeku2
         77n+w6CJKDSYH8qMb2jYz2edeiKhf2mXiFOs3AbmE/Wppdtwcd/blnQGBERIC7yJ45tS
         CvSOQ+floU+ZEZVlxFLKLwUKvD7wKC0szdpOtvU0moaq/mDk6oR5vzFFdfLdveoeQz/w
         YP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989664; x=1790594464;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVffXoYueTw4wefpnWYLUUvPFBee2WkB5xh1yrvBjrk=;
        b=vnzZyX0ugwTV/KbhYkg51rdToob/kgkW+U/t+oDzG14jT8S65MHjSEr+DMmUi3ljDq
         ctEjVafsfi72V+Mh2oVjsbA9EVDXObvIqYNy/TnzFLDuxRLfFOz6EA82X9Zsy/aJyLET
         raV86Kqq7TeSVYJzxEBUIyDR6UJUYQ5IzQX75Ae9lhum3Cv9kbSNicEwg+7JfNbY4c8R
         AIlHAnt0uDMjZRT894xAO6TBfKYqakLMFUjIBtrOk5b7SMOxrr4QKb85kBPE04tUEd/l
         zbd690haiR3L6/QHhXyPvs5zmp5mXfgYQMGw/zXVr4q6zfVM1oZ7oYBv9kodjv0Qoz5V
         +iXg==
X-Forwarded-Encrypted: i=1; AKwUvBzqn3rqosEgaiyoL3AaeOJwUd4zsSnrkZoxdZeRsylmb7wy2FeropFsthZo8H0EIFwNB6l+Z7MYwLo=@lists.xenproject.org
X-Gm-Message-State: AFuF++mPKxJYXzuh982k0R3FMTLpRw9VPA+K8Kh9p/XqpnKh4Fhi6CAL
	DrOuf5fAgAnCfiMiCD2AUQX8XwCU/fK+iLohzOyFAMaGXLA5NMcmY7Q1hN53KMSkdA==
X-Gm-Gg: AYBFou0DioGO6xTHIQFP7DyLf3k2Yu5UEdkMU8w5SGi8seUgmmAhHEbEWyoU8lrWpy2
	5U6W4rpQSY1+WMjdoqPkci2NZXX2fZridXj2wyGNJb5U/MMyynHNqZX7v1cRMzD/5Pl2IIumczv
	jWCcGXcINvFMQIUCXz1CGncPZzUeHl25p0ZwAHYektIyof1xwsWvQx5NFjXC1U4fayCyZOYZcSV
	fhGB8UoSDrIKIzlBRjh2rBAV+keOX+qu+MmqAuc12tSkMmrlZxLj2Oujx4ZEndxYDZ7HEcXDaBA
	qBXCKfIx8wMazj3bZxvnHLIdp1k9vdWYThLu4vnVP2AGIk+pkJzUx49F6fTX7CmnBOVU3Pu2IIq
	DvzTCNZeXY2lvE4s2mYAwy16CIfJv8Bt5TVEBChhb5ZjzaXeg50ejtIHIxSynDWlmm6zxhMTyvN
	u1MuEHYV26aaFX0NKMInUhqTSEXe4jK72nkHKQiYf7tLJSxifbbXrguTcNuxOqU6ypVmQvxGTHp
	uEewhxZbtPASqWhR665CjCmQBOI+Yzd6codktHTcr/IqsmoEuONYL58wBqajDg=
X-Received: by 2002:a05:6000:24c3:b0:487:b4d:8810 with SMTP id ffacd0b85a97d-4871e3a9f00mr16352453f8f.39.1789989664220;
        Mon, 21 Sep 2026 04:21:04 -0700 (PDT)
Message-ID: <f7e45d61-1232-413a-806f-5e041d7b67ea@suse.com>
Date: Mon, 21 Sep 2026 13:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Fix VMLOAD/VMSAVE state handling when using
 nested virt
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260911151250.1232332-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260911151250.1232332-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789989664-F70B22A1-04B0D44D/0/0
X-purgate-type: clean
X-purgate-size: 838

On 11.09.2026 17:12, Ross Lagerwall wrote:
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -444,30 +444,30 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>  
>  static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
>  {
> -    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> +    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;

Here and elsewhere you assume that vcpu_nestedhvm() is legitimate to use
even in the non-nested case. I think that's heading in the wrong direction;
I think that a hypothetical mode with CONFIG_NESTED=n and the entire
struct nestedvcpu wrapped in #ifdef CONFIG_NESTED should still be possible
to put in place, without meaningful rearrangements or renaming besides the
adding of the respective #if{,n}def.

Jan

