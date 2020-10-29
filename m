Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68833C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 07:05:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E720E218AC
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 07:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTVoSTQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E720E218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14003.34897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY1zE-0002Ga-Pa; Thu, 29 Oct 2020 07:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14003.34897; Thu, 29 Oct 2020 07:04:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY1zE-0002GT-Lk; Thu, 29 Oct 2020 07:04:40 +0000
Received: by outflank-mailman (input) for mailman id 14003;
 Thu, 29 Oct 2020 07:04:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HK/=EE=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kY1zC-0002Fx-EC
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 07:04:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 329ecce4-b11d-4bfa-bbc3-1eaa03fa51f2;
 Thu, 29 Oct 2020 07:04:37 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-tTl3mqOmMOuk9PomABB5QQ-1; Thu, 29 Oct 2020 03:04:35 -0400
Received: by mail-wr1-f70.google.com with SMTP id q15so875770wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 00:04:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id 3sm2825527wmd.19.2020.10.29.00.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2HK/=EE=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kY1zC-0002Fx-EC
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 07:04:38 +0000
X-Inumbo-ID: 329ecce4-b11d-4bfa-bbc3-1eaa03fa51f2
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 329ecce4-b11d-4bfa-bbc3-1eaa03fa51f2;
	Thu, 29 Oct 2020 07:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603955077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+MySIa0GO5sAsedbOJklvkP1JxXrpHRlnL4dRpsf/4=;
	b=iTVoSTQ2NbxX4x11OjpDifcwXh3AsZtz6+oh5Ja5vUOoAK68O27u/E5SSxfUK4zFpggGIL
	+PSRLDCC5dYbjYzOqHWaQIQBy2yTFGqs1LhdhV9BWpnfNf7SLyXYIsO+3iadojFlFckni5
	8MluJPFb80lVt+N1OBRVvpGoncLca/k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-tTl3mqOmMOuk9PomABB5QQ-1; Thu, 29 Oct 2020 03:04:35 -0400
X-MC-Unique: tTl3mqOmMOuk9PomABB5QQ-1
Received: by mail-wr1-f70.google.com with SMTP id q15so875770wrw.8
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 00:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+MySIa0GO5sAsedbOJklvkP1JxXrpHRlnL4dRpsf/4=;
        b=qFIwbQBD4STqNt8sJAXeFXfFMgxF3XfJITYtRdIJ6QxUFZmCz3yEj9YxuMKWC0DVNX
         K14cWkysvI37uT+0hICd2QcpL4B75XkWdXovoCCT8++qUtRiDTJn11eaUOAeDyrHUf54
         qbdyt0r6X0Zgz58ghOmND6OBtt+PGMu1WQF0uo+SDVo/DtcOlVSztHY37deEH5zCfkF6
         tobKHZ2Vtfo8ez8CUYhjeGTemjwGGzowdXb52Fe4CT4P7mhFFxVRTk3BwZ8pth0LZO35
         a8NQU0VSzXWx27Prq26Yivt0VzdwJAQqsXSMc1GnL++2w2v9jPTUFkpIfemdX1Sxa/g+
         K8DA==
X-Gm-Message-State: AOAM531xoZu0yIXtacm7F5XEGa7Erft70u4jZCBTX6yolA9cIromCjVS
	y2kzysrCiBjJgpsze3EflRrgbqUA/F+CzAma8y8h8xy5IQQuddAyz1PZ3DiwbMMqOF2fsI5z0VS
	No+WojCdMwyBUVptngxVOPR2Z6V8=
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr3780261wrm.53.1603955073915;
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjtd7rX2GzPMeGPldc12GMpi5saPCqNeQJ2ZCa70evuRQIB96hYYOHQ+JlKqMs5entrVHldQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr3780234wrm.53.1603955073729;
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id 3sm2825527wmd.19.2020.10.29.00.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 00:04:33 -0700 (PDT)
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, "H. Peter Anvin"
 <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
References: <20201028212417.3715575-1-arnd@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
Date: Thu, 29 Oct 2020 08:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028212417.3715575-1-arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/10/20 22:20, Arnd Bergmann wrote:
> Avoid this by renaming the global 'apic' variable to the more descriptive
> 'x86_system_apic'. It was originally called 'genapic', but both that
> and the current 'apic' seem to be a little overly generic for a global
> variable.

The 'apic' affects only the current CPU, so one of 'x86_local_apic',
'x86_lapic' or 'x86_apic' is probably preferrable.

I don't have huge objections to renaming 'apic' variables and arguments
in KVM to 'lapic'.  I do agree with Sean however that it's going to
break again very soon.

Paolo


