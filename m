Return-Path: <SRS0=BFXa=NH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B102AC41537
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 16:47:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9CD60BD3
	for <xen-devel@archiver.kernel.org>; Mon, 16 Aug 2021 16:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9CD60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.167420.305595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFflp-00044k-6p; Mon, 16 Aug 2021 16:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167420.305595; Mon, 16 Aug 2021 16:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFflp-00044d-3f; Mon, 16 Aug 2021 16:47:29 +0000
Received: by outflank-mailman (input) for mailman id 167420;
 Mon, 16 Aug 2021 16:47:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hvJI=NH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mFfln-00044X-U7
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 16:47:27 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28b1aed9-0a1f-452a-bcb5-fad4d9a16c87;
 Mon, 16 Aug 2021 16:47:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so400112wma.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Aug 2021 09:47:26 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:88bc:11a:65ad:250e?
 ([2a00:23c5:5785:9a01:88bc:11a:65ad:250e])
 by smtp.gmail.com with ESMTPSA id n3sm52403wms.2.2021.08.16.09.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 09:47:25 -0700 (PDT)
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
X-Inumbo-ID: 28b1aed9-0a1f-452a-bcb5-fad4d9a16c87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gMA0HOQ4Jmz58VzAkG1T8ITvAX1Ssdrkkr3LjJu2r5g=;
        b=CivmiZF4ckPtHtVusbkwrnqNQ7K8hittOSO4nvBojW4Z3cPZA6tspdPwnumURNamGb
         kUf+65AdVGx0y0smJR2Irjttg3bYeIFXHswQNOOybfzyNbfimqn8tNcDtAinDE5XoGIY
         DL4S5T2jnJ/yGJ4QzK0WsxHxcjY0QIc8yQvi2XUZs6lfFEyLpJKhxCAWahsc8dPlChmc
         HMCJShObOyhkh9DZf1YqHbNnabV8s6OJpKTpC2LuklLKVQrxsnVbsi6G7Oiv5Hpe+3kO
         /r3MK4Y9lgOOjlxZAMjgGEuKtZtETTYPd49Rt2n+VHh7RhKB8HEOcBfpN9QZilOxA3EI
         tkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gMA0HOQ4Jmz58VzAkG1T8ITvAX1Ssdrkkr3LjJu2r5g=;
        b=Y336fdU2oodWl0ODRrxLr1ZUJoOdm1JkmoJmeonLxc9IEd16PFOxiznIMUzu/MpKtb
         vuelQmoa95kDQuwjFOzTdfhdhQRJni7CC5bDt00cB1urjhTujSbGe8eSQHm8smeSNRlc
         o3bjGYbwcb0zwHMdL5Xei4TyLoPiXxezpkDqRI8iO0wXlbURZ3v9PN8NRI98e3Ef5OQ0
         8vhbOPld2bMRKzMgBf0jQidM0akXeK3pS9wLlkZuRmzjaSXfYbYKebzhvXnqlmJCqlBO
         hUIXdN3P+w2dITk6vpHvbZmWdQW/W54pr7sdIBoF8EJfpgE3tRuktvh4prvCAEglWYqx
         O4KA==
X-Gm-Message-State: AOAM530r7hWLxSEGOtOuF1BE4iGXV6LmPC3x+PYzdhR8MkP9sMXvwlu2
	Z59IBgkK/iejFJ9pbY2MaiubOy+ThO4=
X-Google-Smtp-Source: ABdhPJzJTAeIwDrOHMeDosBKU2+x+VOozDkIB6m/30hWSQFRxvBNeO9TRLx/Z/fTg+liyEphcKZDxw==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr39418wmg.164.1629132446202;
        Mon, 16 Aug 2021 09:47:26 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: IOMMU page table freeing
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d1aa9fe4-870d-8a02-9cef-af1be617252e@suse.com>
Message-ID: <9ba8896e-ba4d-53ae-83b1-10588e13a07b@xen.org>
Date: Mon, 16 Aug 2021 17:47:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d1aa9fe4-870d-8a02-9cef-af1be617252e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/08/2021 14:37, Jan Beulich wrote:
> Hello,
> 
> while I don't expect this case to occur often in practice, for
> superpage support we will need to be able to correctly free a
> page table (hierarchy) after replacing its mapping range by a
> superpage. Following P2M by carrying out an immediate iotlb flush
> prior to synchronously freeing the memory looks, to me at least,
> out of question as an option - the latest when considering ATS
> the flush may simply take too long.
> 
> Making use of RCU doesn't look like a good option either, as
> this would require callers of map/unmap + flush to enclose the
> whole group of operations in an RCU-read-locked region. Yet I
> think we want to avoid to concern callers with details of the
> implementation of the IOMMU operations.
> 
> Which I think leaves deferring the freeing to a softirq or
> tasklet, of which the latter - to me - would seem the better
> (easier) choice. If you have any alternative / better suggestions
> I'd appreciate a reply; ideally you would also reply if you
> simply agree.
> 

I agree, I can't think of a more preferable option.

   Paul

> FAOD I don't think I want to make an attempt just yet to care
> about the case of flushes getting carried out asynchronously:
> That would require a means to signal to the freeing function
> which prior page table pages are ready to be freed. For now I'm
> rather considering to merely accumulate these pages simply on a
> (perhaps per-CPU) list, for the tasklet handler to consume.
> 
> Thanks, Jan
> 


