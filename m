Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355C606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsoAlLfs
Received: from list by lists.xenproject.org with outflank-mailman.1502004.1698007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAhU-0007Gz-FU; Wed, 25 Nov 2026 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502004.1698007; Wed, 25 Nov 2026 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAhU-0007Gs-Cm; Wed, 25 Nov 2026 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 1502004;
 Wed, 25 Nov 2026 10:58:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAhT-0007Gl-GS
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:58:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAhS-008WOp-EE
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:58:06 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06bf36-8faa-0a2a0a5109dd-0a2a4503de7e-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:58:06 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06bf3e-fae8-0a2a45030019-d1558032a57b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:58:06 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so72153905e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 02:58:06 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906817ccsm285486235e9.5.2026.11.25.02.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 02:58:04 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795604286; x=1796209086; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ojd6QLbo6svWTxF6DUELPeNw20UDvUeJORZrpfd3O4=;
        b=rsoAlLfs4hGrHRI3FFd+zW0OgK22JHundMApSgAgl7rfvZ/Z3PLeJVbPNWVg/gW64M
         /2dzmPlyMp8RLxq4DsuOWkYUblO70m1ZB2GbvZny0asuEK8l5L3JGv/zyBmzgwW4htDu
         qxMO7E4ymVPc5z4FLfSWWcfNIz7b6Ev/fPvc2pXrVkIaIHL7uBoWBe3Z87qIUZUU2Wid
         OtWEwM/Yg99glE2eUvhe8hSWrVJj/Xlp9rcU3r1ZDEhQ2m6ZRY8n8MszKDf4GhWR7Gwu
         tJTTEHKL3Nzov3AJaXcmG/VPWOfIWy9zO0veRGOm/rIncIj61IHbR+s/a2AKYU8Ss0j9
         hznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604286; x=1796209086;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9ojd6QLbo6svWTxF6DUELPeNw20UDvUeJORZrpfd3O4=;
        b=wisrYCK5PajcYhfUyZSjyS9Z4E1EIMWSv0CDKJPKU+9Fwk8PdbJv135VQr5BD/wd9K
         +Y0E+uIC5b223E6pY7DFGCZagPp80/Y0CDUVXzVpcjmtfJ40bByfIBv5nCpgmqeVzU1t
         fxvsPRbjQmg03JkqetZJ2HYcrrIwfx/WR3iaigI/Me7Xu/0TukRRP4lnK24b9xPHEjih
         EBe0k6E7HQq4PNAT3Du8NtSAdpW8ZUCbLQ4oWnmX5Hj/WQ3rkqqGMx8ABDZUjyAH/j4E
         A0N83nfmJ2tHO9CjSwLPNRLLqOWxQyG3ols4YnuqIQvpeWDMPhcFXoWheqVhwTshJUAM
         K1SA==
X-Gm-Message-State: APuU4Z/2iOlBNxQ+2ed8qkR2HNg2UeNvU12W/F+7G9w0Z0KInRGY4jyt
	tuebABsbVarCfCkKTLxSGnyAtUCpu46/Rxltv/ViMEuc3EsqJT23t/Vl
X-Gm-Gg: AZFdTZdhcpVRi4QaNMk3/dwqmZLuFZpgUfMTAenu31ag4aiF8aQBo/h48JiZMqsS+Cw
	Wd6sMUGGRz4/ZVuaPm8nnytJI3mvn40WDbVBIG6Z4A1LGJZwBrtpLAeeT6IuIUz8yxJ7eLSJ1QU
	KiSedBe5WqzEid4cQ4LbX0mWj50bCxXUfGmI/wFmI8juqMsXcDdUxKvcYLuriwnc0yXYZkPlZyi
	8nEAjfbdYPX4uEKTlkwsuUGFs1PoKRaLgTCWsTnmA87wFszIK1dPtyD7n3mPEsSR6Z2COtoRGRN
	6IyGdXhjVlnrYLVN/8UL/Pal23sbMVh7+AhaWCK4ieSIeW4i7SIh8/n42lVXSnPT+z4xXt+Z5Vq
	lto6FbL6SPcdDY/LWGoPi8Fv82XP5C1n1UW0auje6hw11lwhQ7z3Cu0gyi8GAUjkPDSPSoTzu7x
	5sot7drutAhAP/AsTwbtOzxITM7JxTqLvByHtz/nL3uoMEg6kJscmG9fxeyXDrou2SdhYSZG0jh
	khsb0F3FiS62VDCDfEANxNR4vQCXxVbcJwNE+WYGrA1viIi6abj3WlogVMM+gaGEXjbPAutHS4O
	kW+TQkvi+sedIpUQwMh6jDcJKgjxkz5CcnA=
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr337651085e9.7.1795604285398;
        Wed, 25 Nov 2026 02:58:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8888e81f-ec6b-4211-afef-215eba880e01@xen.org>
Date: Wed, 25 Nov 2026 10:58:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/21] i386/xen: Don't resample GSI when per-vCPU
 upcall vector is in use
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
 <20261124232247.23169-3-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1795604286-6C2E04E9-5C603578/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The callback_via GSI (or PCI INTx) and the per-vCPU upcall vector are
> mutually exclusive delivery mechanisms for Xen event channel upcalls.
> Xen itself will never assert the callback GSI for a vCPU which has a
> per-vCPU upcall vector configured.
> 
> When the interrupt is acked, QEMU's resampling logic reasserts the
> GSI if evtchn_upcall_pending is still set. If the guest has configured
> a per-vCPU upcall vector, events are delivered through that vector and
> the GSI is unexpected; a guest which receives both the vector upcall
> and a spurious GSI interrupt for the same event can crash. This was
> observed in production with Windows guests on a different VMM which
> implements the same resampling logic.
> 
> If a per-vCPU upcall vector is configured, don't resample the GSI;
> just deassert it.
> 
> Fixes: ddf0fd9ae1fd ("hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

