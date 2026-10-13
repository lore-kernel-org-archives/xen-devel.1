Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7089CC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:12:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446919.1663043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZUc-00086H-2I; Tue, 13 Oct 2026 10:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446919.1663043; Tue, 13 Oct 2026 10:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZUb-00086A-VL; Tue, 13 Oct 2026 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1446919;
 Tue, 13 Oct 2026 10:12:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGZUa-000864-Cn
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZUZ-00HX1u-MR
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:12:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace03f4-bab6-0a2a0a5309dd-0a2a4505d850-38
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:12:19 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace0403-4cb1-0a2a45050019-d155dd2be022-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:12:19 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1588687f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:12:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaa05sm3781551f8f.13.2026.10.13.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 03:12:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1791886339; x=1792491139; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOjpexEo/oEBsbXX+5V+KgbMtvjSKZ+/MBlYvc5Beks=;
        b=eSndy2VtaSNOe11mL5c4uGpIwMscLRpsOl3avjMUZnK38QCBu9w4x23Dvn725tR5Gu
         VswSWgpGGCgEH4QLAPCFeh5wMVGWNoEylxtJ54F/OrNZBY//He+01+BNmH9VoJ8YTXyO
         4JfeA3RzIHkY7tpBEARQeryk9wgT5Mbngu8sqOUaukz5+jX0xhKoMajORU4BSACOXm2g
         SBcqwMTAA6yHA50e53ZVJUgkk2i3e0cA4qh9HJmpLz7chinLrW3J9umDWCUapSJxrdnA
         wxm5csz9+nzCottL70O2TYV53Qrq22f7fj4fow1ofvOXQdq/D+XpRZxgBJLToRW5i8V2
         X2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886339; x=1792491139;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOjpexEo/oEBsbXX+5V+KgbMtvjSKZ+/MBlYvc5Beks=;
        b=eBmrY9A0pInj+ZIZkDYCy6LGaQUNad0dTpTbXxSWdoTTTwnbYmBvKkyuZEvamQHAdN
         ir49aN0K4ktVAMIN+76097aAKWgBiLv12mWheFFbYYTrc42Weh+MQd2ETHsBFm5Yoium
         DZJpdLFAWIU7x1AloRnGq05HsOaDVDGtQGPqlZzJoHWa/JS13AHJMz4xAjUKz0lVQTeG
         BqF+QrikNxz1TRw6RX6l6Icpb468IcEo0a/8rA5XvuWd6YCgjlYGfxCSH5maRZCxHg80
         WLxVm3ze3YtVXgH5EzEObF5C3dMt8Ez6thgRjAzJrX6TgbeW5AO9bRTjTt42Z8Jx0aKB
         9uMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxodUJJAdjCGITgvr8pjkXqk4o2BwdIkxd/bmYLJNnFwwwp8GwmRvu4HAOjXs5XZlxDG7oxLwCnmW0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLJmEb+olUX1TNyaxd4wjSRNoKWZ/kceZY6ySj886R1OoVMxwzH
	3p4npE2hEgh7LiXAc30qQ4Wl33ldEYi2lYUf/MKC5D8BMXCNpKsYbd7iyHQwxxlA+A==
X-Gm-Gg: AYBFou1rQwlcwez9kANe+1eCKMz7MKfGMnrSP6M26oq27BKIC0NZ4K5olaPz/mCcVvS
	bwA9WwECpCtmGcy3x3VWdxh9rwJng/jtzRayS5fWgHK6/qF1UGtxi3BEIOBSecbn4MfXnN9oLt7
	O80CK/NRsSFAwUigVYlptnh4HA3kA1+VZiQKnD57jBe16ZVzngsTiSJyaNoG2Ku5J33fQmzGSa8
	dTglay9dxOMl3c199iTfzGona9+CY9bbk15CnB+YelHDrds/QYfghtNbihFlAsNolMS/GoT0vYQ
	RfOC1oIBXOHkPW6M43oEfnN661LnXdVQb9nyC3WwP58226J7v90KpdCW76Vv6xXYfYqiWTuUI9Z
	Jb+T6eRSUcRns6J779kX19nthFWQxXXjhvj1SoKjhEIIS/ryFtDPDwJ9XY31B0TbZC8CWWDt+zj
	oz12OdzD99lAMjw2TaYU1I+3CX9f3RaHzWOjwYi+cQ6yYXKSdbVEwYO/8u6wbZ79Wf4DLYQudoQ
	DhGOkT/0agv86gUKJINXYGViKSAEt9ej/61mEa++myiVRBRaoRZy1IR16TZ5Q==
X-Received: by 2002:a05:6000:298d:20b0:48a:f404:6960 with SMTP id ffacd0b85a97d-48dbaadbf75mr17234787f8f.9.1791886339001;
        Tue, 13 Oct 2026 03:12:19 -0700 (PDT)
Message-ID: <7fe17e71-24b3-4a9b-bc1d-1ad73bc156df@suse.com>
Date: Tue, 13 Oct 2026 12:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] nestedsvm: Fix CR3 MBZ check
To: chunjie.zhu@citrix.com, ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, stephen.cheng@citrix.com, lin.liu01@citrix.com,
 xen-devel@lists.xenproject.org
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com>
 <cover.1791625578.git.chunjie.zhu@citrix.com>
 <56d1229d7efc8da215272a7f03dade9e293652b7.1791625578.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <56d1229d7efc8da215272a7f03dade9e293652b7.1791625578.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791886339-722AB2A1-CC89B5B1/10/78276251493
X-purgate-type: spam
X-purgate-size: 911

On 10.10.2026 12:13, chunjie.zhu@citrix.com wrote:
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -354,10 +354,8 @@ bool svm_vmcb_isvalid(
>          PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
>  
>      if ( (cr0 & X86_CR0_PG) &&
> -         ((cr3 & 7) ||
> -          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
> -          ((efer & EFER_LMA) &&
> -           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
> +         ((efer & EFER_LMA) &&
> +           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
>          PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
>  
>      valid = hvm_cr4_guest_valid_bits(v->domain);

While Ross replied to Andrew's question [1], imo that should have led to
commentary being added here.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-05/msg01369.html

