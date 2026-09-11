Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82185C88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 11:20:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416423.1645468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zIV-0005vY-C7; Fri, 11 Sep 2026 11:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416423.1645468; Fri, 11 Sep 2026 11:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4zIV-0005vP-8R; Fri, 11 Sep 2026 11:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1416423;
 Fri, 11 Sep 2026 11:19:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4zIT-0005vJ-GV
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:19:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4zIS-005XFo-Bi
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:19:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3e3d0-8faa-0a2a0a5109dd-0a2a45068594-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:19:56 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa3e3dc-195a-0a2a45060019-d155d033dca1-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:19:56 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6a9bd4db6ccso662629a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 04:19:56 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b5912644sm669176a12.11.2026.09.11.04.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 04:19:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125596; x=1789730396; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR5Jyl9rMPCNYPTyQOMySxE7qlnr2h5LJyFINO8ElQM=;
        b=BfSByFX/1yS4J2ZBWozIXoRgzoti46Y3TXutj10GNsRWJVJVtFMwPl2fG/Ib48iSQB
         iusJHouvWqN96xlPA8hipw5512zyEC/3EIxZhxYKRHHKvT3cypvb5uBwfE8YSO/tTxHP
         yO1Eavp0wsPOC7gCB48ugRr1PRD2VtCaIjaNQLlnL7uaMXJDkNO5zTfSr0wEF+GOy3Bq
         2KkpKJa/YGHV4h7bCb2VfEXMkpCDnU9X6Z/jprHoWJAfXVN8cm2QkI9wdZD6vMrXCynK
         bkZjCanBh4bM+z5s9z83AjZVe+FhBZowYxG4pSVbKmnh9UE3vf3txyTNcEciEZERLViR
         qvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125596; x=1789730396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zR5Jyl9rMPCNYPTyQOMySxE7qlnr2h5LJyFINO8ElQM=;
        b=n2+c3o4OIXommHh9bxltBW5jRLQhmEhekYQL7zXFqXBYQyxWl1MD1N3GX/ybI7KN6J
         mPoUxTdbhj7aLUy7341FBSovHrwUwECTrrNtSH87pHEPWzOaFBn2b5rbWhvTbLqzU9Kk
         PZArAGSGKs/bg14jZSJ1VW4DfKcxQT55KkQp6H08l8vFtNjwJE6IgNRXXF0gp0BlhRup
         dmnfKqVc/95f/tmjofTg5/yRokygr0ORHzrwOhT1JHb5RP6nuqvPLTXmnELkqx9L9/E2
         Sz5OGjlkkWTQy9t5OOejXBT1myunvXqBpWcCZuHaT9ZORQt3eSAABXoRkxtBbDAbrhSM
         Ee3g==
X-Forwarded-Encrypted: i=1; AKwUvBxFR7Wu4ZLwUWqFiIDPfeCcQMQr3k6BrNxtTNed+3CW7cWa7lQ2eHPSEt801QGfc5B2DB1oFaMx2Ug=@lists.xenproject.org
X-Gm-Message-State: AFuF++mMqJVwvKzcqjpIQQBrQB812gsvD+nhvzS6/K1OYA/IRCNF35E0
	mp619XtsrXg4DCyUownhr8J/6l2ZcNE84bc6kx5sp1XlSbxNpwT87S9O
X-Gm-Gg: AYBFou3jucLQIfyFB8NkpH4X8+Sqt6efbkuRXBa/JrTLJdLOF3HUWqRsnLYZdawDHqO
	V6R9Vj68XqA942hG3C/1Uc2Lv8pJ3XEdLWSwZ//vOY7XfocTfVm6qAP/YpilkgikklQT8J7Hc9+
	xirkE39AGKKve6hmoJ5zXdlvCyWTVTB2QU2FwqQoOsvLK5taWwFfMY2zUVewivwPwBgl/vF6q/t
	2PhqXo2AXke0DgAu8kfHAEGhdPlTLWaOSthoi9CLtTiwqXFUK3s7eP/nbB9mtWzdG82OrMg5ZX2
	qZIgtQnAl/ZdTe3XdBqBjJc/w5fxQY+I0rfGuzL2SS5u17D/qw7nBWHWYAn9kPglMFgsuvJE8/Y
	BMlr10RjFbSaF662xL3MzTPtsjQicmIWo4XmV67cpjEzeJQx3bqsaQ3zxpMus1PmW+0t3W61ZlR
	kfwtmaIz6hrqGDghVc6bRTc+391fXOC1u0FnNx2RJiCHIjkbeLNAyXHp6UsGH0CC/ZB1D60Fjeo
	vY3H0+XT7ZxhjqJhD2BrSwtwxZBNYiN
X-Received: by 2002:a05:6402:46d0:b0:6a9:ab6a:640f with SMTP id 4fb4d7f45d1cf-6a9b56b92bbmr1536081a12.37.1789125595578;
        Fri, 11 Sep 2026 04:19:55 -0700 (PDT)
Message-ID: <168bd9cf-b97b-4e3d-83ab-836b25dd361e@gmail.com>
Date: Fri, 11 Sep 2026 13:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/39] xen/riscv: add IMSIC vCPU context switch
 handlers
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
 <9651f59e-b101-4c70-93ae-07f668e85c38@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9651f59e-b101-4c70-93ae-07f668e85c38@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789125596-FCC0777B-E1320251/10/73395122804
X-purgate-type: spam
X-purgate-size: 1187



On 9/10/26 4:57 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -422,6 +422,13 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vcpu_imsic_init,
>>       .vcpu_deinit = vcpu_imsic_deinit,
>> +    /*
>> +     * MSI delivery is the only supported mode: aplic_init() panics on an
>> +     * APLIC without an "msi-parent", so the vAPLIC state to save and restore
>> +     * is always the IMSIC one.
>> +     */
>> +    .ctxt_switch_from = imsic_ctxt_switch_from,
>> +    .ctxt_switch_to = imsic_ctxt_switch_to,
>>   };
> 
> As previously expressed, I'm not happy with comments like this. aplic_init()
> isn't related to vAPLIC behavior. We're doing virtualization, so at least
> conceptually host and guest behavior want properly separating. Then it may
> still be that for the time being only a certain subset of possibilities is
> supported.

I will drop the part "aplic_init() panics on an APLIC without an 
"msi-parent". It is really not very relevant here.

Thanks.

~ Oleksii

