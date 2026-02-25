Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BDAFD3776
	for <xen-devel@archiver.kernel.org>; Wed, 25 Feb 2026 16:34:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240917.1542155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHq9-0004wO-WF; Wed, 25 Feb 2026 16:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240917.1542155; Wed, 25 Feb 2026 16:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvHq9-0004wH-SU; Wed, 25 Feb 2026 16:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1240917;
 Wed, 25 Feb 2026 16:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MQeS=A5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vvHq7-0004wB-Rt
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 16:34:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2168c57-1267-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 17:34:14 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43990aa7dbaso703338f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 08:34:14 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398bb96b90sm10671635f8f.9.2026.02.25.08.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 08:34:12 -0800 (PST)
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
X-Inumbo-ID: d2168c57-1267-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772037254; x=1772642054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErNFB4fWo3erpLz6CQwnamsPRtYALrLm1VQrrV4Tt64=;
        b=c2nZuBYUCPLsLIvzTFjuX+e/XVaODcqlxp645MDi5PxOHlRjJhXDfQO6SqdaTvGnaw
         HllnePR2C0vToL1XUO6Vjd5MpKp15moe5QCi/O0i2jEpebM8mk4IzacVBSPTRcn8ySic
         7zGKrUIOPz+Qs13D4JVIxO0BmktqNS9gfQLIMxilUIDlaUFsmtQDFjAo7InjnFaoU0Ky
         C98y+Yd23x76Xs6F+j8boMfCG4Gvocuh49YS0xNu38HyqubbMspQaBt06ugqBOC4yy9r
         nJ0aQI3LW1zEcCWWqRb7vRK63xnkyD2BpiayucsBwZqJNp+RxAv1O7Bo41L7hdnb2SYC
         M0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037254; x=1772642054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErNFB4fWo3erpLz6CQwnamsPRtYALrLm1VQrrV4Tt64=;
        b=cdEqSGG+26C4dNJkZN/3IHz6aFGoE0LQ8VsLnRYqHxIRTo5O6PHUk5H1Wbm8Sr2wsl
         Oa0Arkfaenn/c2CZCxXOvAWNU4196HMl687ASwIoLt7SB0yguMr1du23ppgOxOnI+nNX
         uYmI9RvPYzROsmGrR/HwBgwJOYXEJQrId28ue/6XlvloRa2w7d0hEbwhYx4AnT1zLDJ1
         GW02kQyKd9yyYOIaei4CatqbKhno/Lmzml3q34nT5PkvikdJcrOyYlpR0un/IX/mxvhA
         J2l+uSaFlN6Itz8R4ec1ebrQg6Ab/iXdhE+ojdAf/HBsbTFldQZ2/hr+1+WqlTkdhnyu
         oBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWT/z3OEtKlM+csDJv+SbMIml6N8lr1r1guuwuRWhrdTzXUcqOWum6DlRiwPhnH3568k/x6GD8URMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS38P0K3CjBifAA9qdHx6R1rZXSWXA+ZNw2g5QWYbBmJDYtlv1
	JyhGIKGirnrXgzWn0LnHS4SBYJXlJw04OZTH2+rYCvAoOukUqM4rKo7RaVMaRj9BaEg=
X-Gm-Gg: ATEYQzyNfbFVyYYXsl6rTvnNIQHCdoMnlopvGWZuyt1g3j4FPcyLKcB5I1Rh5N4vnIG
	ddaKj20TE7f5ap40sVxCPaMtRiWqTevF4MszJeZuRD+F7k40NmMKKDwGZgu66fWyqJWWhnSOgfy
	kHsFlCLpWs3+Sh4kZ1bUi3m3+hk7Qfp3JKCM4ZZ8SPdI9T8/V1XN6gIFe+KOcDsi/KWWHQCR4Z1
	69Dq3PYZVOUG4yvM1yUw9z+6d5b+7ZI1RwwW3c55YeUUhoTy1iLGbM2+ySa7H9Y7dI6TnHkVcLW
	+CDn9SCh1+WWDwZXJ9SzVs04bkWWRS/oYlOE8FJx+awzDZv9jAmbHhVysEC9ArmUIZwmSXoaQ0H
	yhelE3Ao9ViOElNkGD+gbA29oUKM24/bzavaoxnKJovWrItZQgKTJbuzRQb0oKljgrp9gziBucl
	tZkp/GWwmfR6KobBqfD3OrCYbEfIlbk/aj3YjQMX/1A/gzYKXL9FzrY1pmxNDK81gCxA==
X-Received: by 2002:a05:6000:2511:b0:435:e440:f518 with SMTP id ffacd0b85a97d-439942fddd2mr2165857f8f.54.1772037253543;
        Wed, 25 Feb 2026 08:34:13 -0800 (PST)
Message-ID: <0cf4a5e6-0e29-48e9-8e99-e86b4de42996@linaro.org>
Date: Wed, 25 Feb 2026 17:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] accel/hvf: Build without target-specific knowledge
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260225051303.91614-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/2/26 06:13, Philippe Mathieu-Daudé wrote:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is

s/MSHV/HVF/

> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/meson.build | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
> index fc52cb78433..6e2dcc4a5f0 100644
> --- a/accel/hvf/meson.build
> +++ b/accel/hvf/meson.build
> @@ -1,7 +1,4 @@
> -hvf_ss = ss.source_set()
> -hvf_ss.add(files(
> +system_ss.add(when: 'CONFIG_HVF', if_true: files(
>     'hvf-all.c',
>     'hvf-accel-ops.c',
>   ))
> -
> -specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)


