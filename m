Return-Path: <SRS0=dDkt=OL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37FCC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 21 Sep 2021 16:45:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AAE60E52
	for <xen-devel@archiver.kernel.org>; Tue, 21 Sep 2021 16:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74AAE60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.191824.341935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSisu-0004eI-2g; Tue, 21 Sep 2021 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191824.341935; Tue, 21 Sep 2021 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSist-0004eB-VJ; Tue, 21 Sep 2021 16:44:43 +0000
Received: by outflank-mailman (input) for mailman id 191824;
 Tue, 21 Sep 2021 16:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yhcq=OL=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1mSiss-0004e5-4b
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 16:44:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 25484dc9-5de4-48d6-b73c-778bbd53b5f4;
 Tue, 21 Sep 2021 16:44:41 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-gQyyLU3GPISV1xCadnJOow-1; Tue, 21 Sep 2021 12:44:37 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5065866wrh.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 09:44:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k1sm20272243wrz.61.2021.09.21.09.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 09:44:35 -0700 (PDT)
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
X-Inumbo-ID: 25484dc9-5de4-48d6-b73c-778bbd53b5f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632242680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MOh25Z0CXinUksqYDluCoredOuFNiGvVHCwdZh/BTA=;
	b=Y6nVQSqbJ8FqJsl2l8xxkw+qDNSMwjwmdDd6SOH70Tkxo9KP5Zk1VyKbigmYlx8egEAxmE
	WXRbu1DBL/WgrhuqV7ixXsRu6Szi4Xs6vdIIoGzO5cGDvV5uyvX4DLZwiLKwhFlVZlhhfY
	DXxDNx3C6abSViWjF0ZUUcVKgqCfYdU=
X-MC-Unique: gQyyLU3GPISV1xCadnJOow-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2MOh25Z0CXinUksqYDluCoredOuFNiGvVHCwdZh/BTA=;
        b=zuoRkDyWLbrEGOimO3CYcW9ku8ftUet2vquBPjoN/CW2Of2YPfyKG5Yp+J02QmHPy7
         CEgyijzPqTxwFI2e0kvaEgDnXfU8kKISbvBicjasWUQalzzQvXVpkP9sQqfnIXK1r180
         x0OJzWPiOk7dyHbEyvpFSr36RX1NofaKhYF6KQX0Gx+Zwgzd7lUKZb0xCtpON+wQhfGX
         sMOtoHTuxMMlre+JQRQy4e7bAJxsmWDUGSGUdjRPRASlwXzNsiP8M4AD5rmGgJP6aVW0
         3hT8vMGMRs05W4uYehE2BHOKOBEhtjawDeyaq9uNhzn8rXiv8SkLXWAftCqnlqbPjsCA
         z+TA==
X-Gm-Message-State: AOAM532PAsVx0fzT4y4DQex4oVhlTwHmkYklbxtSJnhMAcacwHPEjnYv
	mpVMfMO7J6Ur8JgG9RPZSkR9ZouytMsVx5wT9FzMIEwOLNpGkRc28i4j/i/dxJtV6n4Wcws+mte
	u2z1qvfW+qq01eTGubKwBr+waExA=
X-Received: by 2002:adf:ef02:: with SMTP id e2mr35671914wro.401.1632242676307;
        Tue, 21 Sep 2021 09:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsCp5ZrdIqXk735XH8pFAzorkNCbfLAUPGTe1MtIGjUyvp4uSPpnZgIUWeU9z8tn602zxqYg==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr35671861wro.401.1632242676096;
        Tue, 21 Sep 2021 09:44:36 -0700 (PDT)
Subject: Re: [PATCH v2 05/13] perf: Force architectures to opt-in to guest
 callbacks
To: Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-6-seanjc@google.com>
 <20210828194752.GC4353@worktop.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8ee13a69-f2c4-2413-2d6c-b6c0a559286e@redhat.com>
Date: Tue, 21 Sep 2021 18:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210828194752.GC4353@worktop.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/08/21 21:47, Peter Zijlstra wrote:
>> +config HAVE_GUEST_PERF_EVENTS
>> +	bool
> 	depends on HAVE_KVM

It won't really do anything, since Kconfig does not detects conflicts 
between select' and 'depends on' clauses.

Rather, should the symbol be selected by KVM, instead of ARM64 and X86?

Paolo


