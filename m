Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5906CEB271F
	for <xen-devel@archiver.kernel.org>; Wed, 11 Feb 2026 15:32:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1227838.1534246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCBr-00050F-LG; Wed, 11 Feb 2026 15:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227838.1534246; Wed, 11 Feb 2026 15:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqCBr-000508-Hg; Wed, 11 Feb 2026 15:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1227838;
 Wed, 11 Feb 2026 15:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqCBq-000502-IR
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 15:31:42 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3390796-075e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 16:31:41 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6594382a264so9872096a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 07:31:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65a3cf38c5dsm847122a12.22.2026.02.11.07.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:31:39 -0800 (PST)
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
X-Inumbo-ID: c3390796-075e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770823900; x=1771428700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioJjHzn+HTwu1HXk51oAA5u0CTuRCJ3J0Rgf3exiUYQ=;
        b=RQCFZUIYiftZNEdgBMrJthiemMOxSmskOgCGh7m2Tl3Bab+vhRZ7FJ02byeKhLDXKE
         Mx/1XAVI3XxJ5CaUzdQd25oXlyMJg8eRH1IJAeWj0koM8l2dqMdSANCnhVCPwpSdpcNk
         avy3tY6UPTr2zPMZj3ezXyRTOLkyVhz3VbUD/jBHlIqivPvJvnSRyhxnMCaT2fh2y8qD
         OCnnJtgo7Ik5orW5qDQURm4DAC3D0rNhXCSDRGDOi71edGkPqlHoLb/uMBwD+oAdepAn
         48EcqLZAf+ihy0cFh7kuZ2FloYfUTHeVaJQIYrDKooX1ouZBvc+TAhQQYzG1Ky4DXKks
         PtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823900; x=1771428700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioJjHzn+HTwu1HXk51oAA5u0CTuRCJ3J0Rgf3exiUYQ=;
        b=qBbmdAVjeqoOEINWxpcF6EIfttwGI655zJDbd7PahMEnt9V8Kli6SP8FQKO1+dh5Rk
         LF0doC85jgKnxE6e02j0qIQFonkMlhtFOgFgjQmYuSv+d7vznCyPxjC4V9rdNEd/4dQD
         yBw3F9aFiQJR9llZweR3PJnou+dgT1EuL9DlCpR5oAMKdPyRi9JqDTGLDmsEMHFLt9k6
         ZgRHknJHNQd/YN6GFpsjwFFPLgRb3w97u8rbukeV0XyNA8zJEcAQsEmH7KtVDcJSab6s
         8RyTQH37JWTvqg+d3OPpczngtl+4ZtH+TSyTlVFXdfhM79uMcnXllIRnLb4q8Jz3oJmK
         pJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCVJB+pfzUN9OiX5chFLW11XA8EbwM5tpNfe8ii/VMHLqsUG6RKdpTFp1vhDo85AYcTUVFugngHaz1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+AqaoXh6szHCabW+w0ECj7EBe+wc/mBKJWPVOo/CXu+zgpAlQ
	ZU4OdO5+ytG1+/J6S8v8JTALCYhfLJ+MXVEHcAVLOlP3bKgfjyVoWWLF
X-Gm-Gg: AZuq6aKoLwZVxctRoCQv32e5rZqMbquF74170i+dA8s3gpw40RZgnwCY+pnwlHyZKcG
	50do2Pl1QWGjnD+l7P4wX9z0OxHfuE/Niv9D7EbVwlctAyIyPhS2M7XTJeeiKQibl4G8lB6BPHu
	TAz/sEH4d4GXQeHxtAFR8UmlYev+Emx+quUlEHkIgGgPim8vPOjuL+HtSBAUXqUR6pPR2Ns7uTL
	rgDGoROuNi6qe3WE0u4/bVaGbHMhY7/vrsV5LDY4gp5KcIHx+cABJfKoeutQuaP6a9WuI12BFvL
	p4jUb/WnazVUh0jQ06tA2Sp8kkzu5XAj0hQ2t4VtGSVxWi5S3ru7yECjtfUxCl8m1f9PklC8Ur4
	BRHUtyHy2ptlxXHj+cZiVeUHD6QSPxkO9cdgqbE9f+wMehWOSJEJU9WD/6DFO5HyNH54hkUdEJk
	U6vh8RPPhtpQc5xMqRP86IT63hgI+GYUeREFyRlwNzfd7UNBNtCcYmlVJZBPVSLL5e3JHXJRTvn
	o8IMU4=
X-Received: by 2002:a05:6402:50d0:b0:640:e75a:f95d with SMTP id 4fb4d7f45d1cf-65a39b0377emr1640044a12.15.1770823900192;
        Wed, 11 Feb 2026 07:31:40 -0800 (PST)
Message-ID: <433e6170-e00e-4a69-9837-7d28f7e8ac44@gmail.com>
Date: Wed, 11 Feb 2026 16:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <792ea928d748e9ff7bd331b8e8b0262695a062e9.1770650552.git.oleksii.kurochko@gmail.com>
 <75d70edc-b0f7-4d61-8da6-e783c57b4490@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <75d70edc-b0f7-4d61-8da6-e783c57b4490@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/26 3:51 PM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> @@ -105,11 +106,14 @@ int arch_vcpu_create(struct vcpu *v)
>>       if ( is_idle_vcpu(v) )
>>           return rc;
>>   
>> +    if ( (rc = vcpu_vtimer_init(v)) )
>> +        goto fail;
>> +
>>       /*
>> -     * As the vtimer and interrupt controller (IC) are not yet implemented,
>> +     * As interrupt controller (IC) is not yet implemented,
>>        * return an error.
>>        *
>> -     * TODO: Drop this once the vtimer and IC are implemented.
>> +     * TODO: Drop this once IC is implemented.
>>        */
>>       rc = -EOPNOTSUPP;
>>       goto fail;
> Shouldn't you then also call vcpu_vtimer_destroy() from arch_vcpu_destroy()?

Yes, it should be.

Thanks.

~ Oleksii


