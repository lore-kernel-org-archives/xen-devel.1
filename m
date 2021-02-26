Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68DFC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 16:24:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7E264EBA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7E264EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90439.171190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfuS-0007sB-05; Fri, 26 Feb 2021 16:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90439.171190; Fri, 26 Feb 2021 16:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFfuR-0007s4-Qn; Fri, 26 Feb 2021 16:24:07 +0000
Received: by outflank-mailman (input) for mailman id 90439;
 Fri, 26 Feb 2021 16:24:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ro2M=H4=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lFfuR-0007rz-9k
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:24:07 +0000
Received: from mail-pg1-x534.google.com (unknown [2607:f8b0:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8428e2f-41d7-461e-ac0c-03a172d434e0;
 Fri, 26 Feb 2021 16:24:06 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id p21so6481815pgl.12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 08:24:06 -0800 (PST)
Received: from ?IPv6:2601:1c2:4f80:d230::5? ([2601:1c2:4f80:d230::5])
 by smtp.gmail.com with ESMTPSA id k4sm9407710pfg.102.2021.02.26.08.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:24:04 -0800 (PST)
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
X-Inumbo-ID: f8428e2f-41d7-461e-ac0c-03a172d434e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EgPbYrDjeBajl85MDkJIwUvxr9idnrsm7yPEQm+mh6U=;
        b=RY1ZZO3HnGWJQnOWEUQCtlRpZadlFsu12UaQYNLCe8NrUbhtDUogH5h9Q4Iv2mb9IF
         EFVGAH0zx3JG1M0lnsoMfneKYTwfym1jP5Tllp6bFAE391Om5MC4vyUdIqmC6B3U+6Br
         Vm/2VQ55ZtHQg2wmKIxyYPT3S3BohPpvhWoC8+PRDt4qJRub9Sm4R1gKoIeR2SMnxbwY
         +iHBQ+2eYm3my2OLBhL4lpBSFvRSZdE6QSAtXTBO1bZJoLZ6lybWxb8J7aNLk/KbJ7mB
         WY3vmMQhBDbSl7tyPRdfTd2oeYu+wyAiupdGZe3Aolh05hFdWee7caU5SI5mXMnj9ICK
         34Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EgPbYrDjeBajl85MDkJIwUvxr9idnrsm7yPEQm+mh6U=;
        b=XA9lTfdcBmTA7Gb4bBXLfb1uMMri81nf4Sqn0v85hN3wiJzTW9m7ALReC8LgSYSflP
         YOWLpoUUNHxYth688xUWrJXRmqVASniJm6Nx9dAO+vDzHCS4W09FFu3DQPHBoI49RuLy
         yKZGOAHdzDwAAvkyhyIWMjt8/MtfdPoLFh7uhOX5TGyQQw60b2wRolwwdOov7rtO60QX
         wNxGGLXLIBEZKVERqhpG90hgnHDkqzKgbG0/7uj0xUIZKFJnBDfphvvppnp7t2TB2Usi
         sTY3JeWKdXuoQlyhEQvyukA+XjDV4nb5QlrqiJlAUBntKxwNQQFpy/G2tmdn11LfHYoN
         xPFA==
X-Gm-Message-State: AOAM530IAkiXaJ70C2n1JDMqNcS/uOTFFF02uQkPwoDuVzDpdQhf+da6
	meqRbM0Nbki6e7IcRUhH5uM=
X-Google-Smtp-Source: ABdhPJzvnzdyf38O4f9AE1IDFZwo4yi1B5IiUJRzPmMQ2JPn0ItHMCgO6fypX5aRFiDUN4wXwd17SQ==
X-Received: by 2002:aa7:8a11:0:b029:1ee:42d8:a8f5 with SMTP id m17-20020aa78a110000b02901ee42d8a8f5mr2653938pfa.5.1614356645300;
        Fri, 26 Feb 2021 08:24:05 -0800 (PST)
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
 <0d58bca1-0998-1114-d023-0d8a5a193961@gmail.com>
 <c6ed745b-3847-b878-f683-2d1041be22a1@citrix.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <247706ec-c011-5217-7b6e-deedf22cac84@gmail.com>
Date: Fri, 26 Feb 2021 08:21:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <c6ed745b-3847-b878-f683-2d1041be22a1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>> On 2/25/21 3:14 PM, Andrew Cooper wrote:
>>
>> It sounds like you'd prefer no common to start and none of the
>> arch_* calls it relies on?
> 
> We definitely want "stuff compiled under RISC-V" to be caught in CI, but
> that doesn't mean "wedge all of common in with stubs to begin with".
> 
> Honestly - I want to see the build issues/failures in common, to help us
> fix the rough corners on Kconfig system and include hierarchy.
> 
> In light of this patch, there are definitely some things which should be
> fixed as prerequisites, rather than forcing yet-more x86-isms into every
> new arch.
> 
> ~Andrew
> 

Ah I see.  There's more that could be Kconfig'd away and if they can't be
Kconfig'd away, their should be some commits to make it so they can be.

But things like, for example, `arch_domain_create()` would still
be stubbed, because this is and always will be required.

-Bobby

