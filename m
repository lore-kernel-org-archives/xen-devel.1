Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02148606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XYUs1T+c
Received: from list by lists.xenproject.org with outflank-mailman.1502012.1698016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAk3-0000OT-Si; Wed, 25 Nov 2026 11:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502012.1698016; Wed, 25 Nov 2026 11:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAk3-0000OM-Pg; Wed, 25 Nov 2026 11:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1502012;
 Wed, 25 Nov 2026 11:00:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAk2-0000OD-Ve
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:00:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAk2-006egy-2X
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:00:46 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06bfd8-8faa-0a2a0a5109dd-0a2a450adf3c-24
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:00:46 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06bfdd-f2d2-0a2a450a0019-d155da33b85a-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:00:45 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c5133831027so799097366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:00:45 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afe01a0sm626673666b.68.2026.11.25.03.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:00:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604445; x=1796209245; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH6OCX8O2rHrDc+AjcgOmeRyCyW9QUyc1yx5oWf9qtI=;
        b=XYUs1T+c8d7QjEhXWI0E7EqXnmLWjezfDD2vC64d00+eTRpg7HJTYD6qQP7ieCG/LF
         6R4df5tnldNOGD9HyUrFKUUrMnBM9Z2ro6amU3c24R7vHH0hSQglqejsRZBSlUr1YqrH
         KBsP28NliD6swmvKHkC8y4Fs3T9yBMhLeaJvt4KjR2qSDZSlgF8KTvZLKWvENMZMNG2M
         ZqaHrqy1H+mKzur/blkiZ229hnBraIQF+9NQ5Tnlx3N1ELg+vePHTcGJUvRfpYJg8eEC
         EV8ObMrjinIYW5n95ykWPKNnCxxRi0hME9HyXCr5pF+55HO7NDoKq92Hl13274xENSmk
         y0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604445; x=1796209245;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WH6OCX8O2rHrDc+AjcgOmeRyCyW9QUyc1yx5oWf9qtI=;
        b=i+13MFVwpl675T/Ahkyh8fuS73a9vxlkVNukJA/He+X+QnxWjKkueXRU+V5sFk41tp
         +I13qABTwdAYG7JfsZZVYWECVDhHY836VbTnjVu/6LcVqMJzHGST1R907komMfVElOSx
         pqCTqhTNQ5CkS4opWsr8tsWfSu3e9yFZF9HLQ6YZfmNJrB3YufIYecUoK1Vl0Kz7Tm7a
         HMgGPh06EYjjtpA7RIUhds4EknekWG6s2kMjvUi0Q1i4h8wmizMfKuHv5nlb52j3Oicd
         Fsh8G4nxMcMye8kWC67s8Wrfal+FPoOSL12c8rECMPY7jyB/UeNhH3Jl3BFevPoP2dri
         aHjw==
X-Gm-Message-State: APuU4Z+j9SWZjQkYLP9FmFxmW0QNvYn/C3jJzsgeoVcxcc6wq7TXtGlp
	9OBTBc2WFn0ALAFWy4YlNkp2NC0qOAjR4JBBdoCHRsaWa7H8gkXci/BL
X-Gm-Gg: AZFdTZfulyMCIEoNA7VrFD4Y2I+kioxd/oZw3HCLdhYpTjgbfAjbABWMJ10gFppWzeG
	xv0sqzs0116dRnKw5+lctfKKQeHgMZI4B5wHRGkRtcShId5x9IZW/l+QMfgJ2gAC2gyaVQdsl4o
	a3gqCGXZONAsivA5OwmMxa2+6s4pl/RaR99rLM3EtGuOe1Yc/GhTJWgoBTovwo0ZaXAuKcbHcrD
	Dx7RaYRQeXfxId8UUutUisr/6+U/5ELYO1MJg3H+r6CD7dBxalEiduyHJ5uYKlXDd/nHSbCOMnV
	TedCkSAXb1vqRuAPOeaTdzVw+hc/awSJY2RwR5HBGiwEeVynAxEjSGZgftSl9MUn/xCNIe89iwG
	Kz4K4fUP1jYrhZGcifZ9DYDKpqRSwJXLWV8PXsUA0dKbLaFdPfQOi+DF4t8l2qccMIxZSQqSF2K
	vL59rA15jfNtNcRaQeZc1ysSPRcT9ihlbmDf/1eJ1nvpr2t2BM3OAVPjqtpk0vpPLM7FN8Doq7h
	8gCkcRVN8m1QC1x/6vHCgoIQVuFxJPWKrI318XiF4qhhWwSn4OpTWue1uY6H7tnPqza3jl3Dgca
	I61IpYl66mT2hdBdnm7I3Uoto7miiqA1fXFP
X-Received: by 2002:a17:907:6eaa:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c513a4355afmr1482828466b.3.1795604445261;
        Wed, 25 Nov 2026 03:00:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3739cc8a-04a6-4d17-96f0-db70833c700a@xen.org>
Date: Wed, 25 Nov 2026 11:00:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/21] i386/xen: Free Xen vCPU timers when a vCPU is
 destroyed
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Hui Peng <benquike@gmail.com>,
 Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-4-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795604445-504CFCFC-7270FA1B/0/0
X-purgate-type: clean
X-purgate-size: 1659
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> kvm_xen_init_vcpu() allocates the per-vCPU timers with the CPUState as
> callback opaque, and nothing freed them on vCPU destruction. So a guest
> could arm the periodic timer for a vCPU (VCPUOP_set_periodic_timer
> always reaches QEMU; the kernel doesn't handle it) and eject that vCPU
> via ACPI hotplug, leaving the armed timer pointing at a freed X86CPU.
> 
> Free both timers in kvm_xen_destroy_vcpu(), called from
> kvm_arch_destroy_vcpu(). That runs under the BQL, as do the timer
> callbacks, so it cannot race an in-flight callback. It *can* race a
> timer hypercall from another vCPU — hypercalls don't take the BQL,
> which is why xen_timers_lock exists — so clear the pointers under that
> lock and have the periodic timer paths return -ENOENT when the timer is
> gone, as for a nonexistent vCPU. The singleshot ops act only on the
> calling vCPU, so cannot race its destruction.
> 
> Also move the timer_del() in do_set_periodic_timer() inside the lock,
> where it should have been all along.
> 
> Fixes: CVE-2026-123069
> Fixes: b746a779264f ("i386/xen: handle PV timer hypercalls")
> Reported-by: MyeonghunPak <https://gitlab.com/mhun512>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4098
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c     |  6 ++++++
>   target/i386/kvm/xen-emu.c | 36 ++++++++++++++++++++++++++++++++++--
>   target/i386/kvm/xen-emu.h |  1 +
>   3 files changed, 41 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

