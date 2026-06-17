Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF965CD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:50:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340344.1601391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZomL-0007Ej-Hc; Wed, 17 Jun 2026 11:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340344.1601391; Wed, 17 Jun 2026 11:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZomL-0007Ec-Ef; Wed, 17 Jun 2026 11:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1340344;
 Wed, 17 Jun 2026 11:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZomK-0007ET-Em
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZomJ-008uUz-Rb
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:49:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3289c1-2eae-0a2a0a5409dd-0a2a4505b4f4-42
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:49:55 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3289e3-aaa8-0a2a45050019-d155dd35bdc8-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:49:55 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso3198173f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:49:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26392esm52807421f8f.3.2026.06.17.04.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:49:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781696995; x=1782301795; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+JmMRdiQ2ZDHjhBhjtyk7zXEv8dXcz/l8u/XLNspV8=;
        b=kteTZ6bB8Vnapr3F5O2w7IfZdk2ggS9RETiew5V3lBfF55h9HyHe5Y3J2lSFuthOHt
         TPaoS0/HRmjMdwTahn+oxokvUysO3RinOmfxyslY84uuQSETIYJ4GkVsoyb7ew7iugpM
         ZgNAeBLwcBGGCz/cHM/p0wTWejjHwXONswtt9+0UT3IaYOiAwn55hO96QPCkoT8th7m3
         wtX38ETFxscubyJZxeOj1sV3v3IZeIaYTXfxliO6i322SOw1T1XqOOGIsfwi0YCncTRg
         pPFivuRe8ups3A0hUQ3CPnIblVlGelWKFP6GYeYIFmggt6LxS+hPF64EOIgumR13jIN2
         Jyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696995; x=1782301795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+JmMRdiQ2ZDHjhBhjtyk7zXEv8dXcz/l8u/XLNspV8=;
        b=aU0uWT7Gx1xXCtGkWIBnpENC98JhU2fXqkFS26OarZIO2G2/hdcXW40kVZD6LhBpe+
         V/+lhNo2Er8w5ryZHiFhJOZyaKln9ycWQiwm0DaYEnpCVi8KCr1W2Tf8KRUzqz2CKdJF
         QDCsv9m9c5JOxZNM/8VtclBVt1QtYlwznboxarg6n2YLxweMxsWQSzcPzX7B3NcCQEFi
         Zwn4X9CkKSxqfsgeprhDNu/uB7JhJ8u3413Sj7U7SQ9MbvMy7Psr9yzRrP83NX2V75sV
         wmChNQBRcay/j0i57BbVnKOIL9+GAbjBPCXb/zLF4z76clJSQOIyeY1R8G5sXvL19XgM
         cvqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eBInmnTzjkFheesF+L2Bsp1NxpqwggUft6wlsDkvt4TwfxobJRomb3arAOWVESxZZhOm85A4JPf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUPmOclWkKDnnoJstxcKVOnY1rTUyOfL11hb6lPvZzqrNBVczs
	ftKpwjt1fdH43P4iKn4ryIuhVGBSk0bmalQa6ThGcWDc+2IGyaKoey4c
X-Gm-Gg: AfdE7ckxMPFEcZJ0wVvlOSUU+mx3rjASif52Fweghf0s/zypf2nlcHbbKq+ecOPHEu5
	873MU4eCjSYFjMe0Mi0MN0WtGFGtlZ26xjMFenMLqHG4BzOHQQEHqi/fKc63lJfS1I/+sxefxqM
	hgTN/XzjsBtXKAUSIuweG5BNIXZ+7zOWWHD981tuBYIW90wITPJQI5nWyCh4oZgrTIq3HkHPRHV
	CA8nRNc3Y6SoYvYSveoKyVYytznqo6a6itK+y6LV8uWsi+Oi/Ob0Uv3VA/3WeI5xWv206WRMpnx
	2xfNEw1JmpAktGNEqfBtJgYn4H7n7hw6G1QJx0tCVQS9K3RJWVsk1YaqaiOtIIL87XCRslGOLxv
	rdY2LUQBSc7kgyGJG9VHXhnW4S50zuAWUMltUbdUoESxjJqM/BGaG+f+tVo5fs4xsel2UFQlEPK
	I7q4B+f+l9crrxHCY1zNvgAFe+q8PX22ZBvzLV1Jumx1+z8gASDfGSj2cKAiDvCfflGso=
X-Received: by 2002:a05:6000:2088:b0:463:1885:6b72 with SMTP id ffacd0b85a97d-46318856dfbmr2298480f8f.11.1781696995086;
        Wed, 17 Jun 2026 04:49:55 -0700 (PDT)
Message-ID: <c4538a3b-23e6-4bb5-bc12-1bfd32095d16@gmail.com>
Date: Wed, 17 Jun 2026 13:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] xen/riscv: implement make_arch_nodes()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <738f97f8ea8bb588742c3f03d3cb2d24f399b602.1781693963.git.oleksii.kurochko@gmail.com>
 <d55f0b2b-3352-4d05-85dd-9c89b73bd338@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d55f0b2b-3352-4d05-85dd-9c89b73bd338@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1781696995-E2193443-97D37A76/10/73395122804
X-purgate-type: spam
X-purgate-size: 662



On 6/17/26 1:30 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> No RISC-V-specific nodes need to be created at the moment,
>> so make_arch_nodes() is implemented to simply return 0.
>>
>> It is placed in dom0less-build.c as make_arch_nodes() is
>> only used in the dom0less code path. In the future, it will
>> be extended to create an emulated UART node.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
> 
> ???
> 
You gave your Acked-by in v2 of this patch but I missed to add it.

I am really sorry.

~ Oleksii

