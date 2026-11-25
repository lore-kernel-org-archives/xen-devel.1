Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E60606A330
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4pKEm71
Received: from list by lists.xenproject.org with outflank-mailman.1502197.1698187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBAQ-0004vb-Jz; Wed, 25 Nov 2026 11:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502197.1698187; Wed, 25 Nov 2026 11:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBAQ-0004vU-Gj; Wed, 25 Nov 2026 11:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1502197;
 Wed, 25 Nov 2026 11:28:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBAP-0004vL-FQ
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:28:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBAO-00Bvd0-S3
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:28:00 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c630-e002-0a2a0a5209dd-0a2a4504ed98-42
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:28:00 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c640-b57f-0a2a45040019-d1558033a50c-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:28:00 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so72586235e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:28:00 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.8]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm460692465e9.9.2026.11.25.03.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:27:59 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795606080; x=1796210880; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EN7GUMRzh20SUucnfQTtq8uiWe0qYvrM5Jkr0GomWl0=;
        b=x4pKEm71SQOXq4AwKyRXIr/Zg7nwxw0CL1zk9Yhxxa0QmtpQbsRvY9LIqv/fPT4qKT
         RMpWYkKCD7wz7hHf5/Yj+HRKXJuBA6QqmFkGAeaBsBegmcpcrJQxqkpNboi6W9HhRW9t
         HTPgM4mpCx8ltvnd3Hb/aidwR8T5al/PcKna1Yabtc5uOnbJTNZZPvdA/CM92sdl9ivY
         GFkKXEIzsuswxjIh2qi3blGTDySRaKZC/z7raC7gpcJ58xPMJvwVXvP7+beiNzhNN1xS
         aTN5wNsaRMwtCWORxGQvOLT8RJLWGwRcqatRJHlOJ+R3MT9E/rAlLgxRuFtcqudiX5CZ
         OBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606080; x=1796210880;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EN7GUMRzh20SUucnfQTtq8uiWe0qYvrM5Jkr0GomWl0=;
        b=fdpPCX+Bgaz2AbjcJtG4N5owXVVy4vda0QZMqMxBg8DUL0SSapkt6q2Ekhr2MeNIVz
         r+ybd7Ut2GKSLFviTKNx4DvgW0wPbLkaVaFBuDV0kT2ZY/cVkCBhJ3McYvKnBUk5JNhV
         /rXLePZSYvQxOJr1d0dnpBXroneO1eSBSmWizPDgtvoi/Pd0uqAqb6ziPVk2I4GSlAGk
         Qg9xoCyj/2v1Vbw5ECGvukw/Ys5RkKp9t0FIWCv4iAUB+rznkxYzD9a9Sr53UnbaK4rb
         Yso6gRyjHQdI6uXMPWag0Df/ZXdH1YB46e2TgUJ09gZdWMHcioMli5HNiArTkJ2qRNj0
         OY0A==
X-Gm-Message-State: APuU4Z/GG5JPnb0JF9xa+Cryo/UPKRAiPSNYlzzejITCb9gH462wvj59
	uJ0NW0TofaOblR9UpwMlrYCuQ6Lm2aV8SlWK96o2keD4Mu06md49RlpV
X-Gm-Gg: AZFdTZe9SDXctM4JE7Py2sNKUg2aYJoRDsfnHLlFqYfIyBjNrkN4PKhZLJf00WeZ/A0
	7Lsgo+NZcVXnNpG6S8Kdi4mCYCKHRXs6tEKdulST3MCiZIkMuhpdYF0ZEpmtbqRqaUutuvTexLQ
	opFNqTivH0T0Wl1hdZmmjA6Yp/TumaSV0mVS8D4I7aUaDJZokrrGDc2yRNUej2SvtUDeVGfzDD/
	66NhQR8r+ujdbma33H/ktS5z72Oor8FzZ/a0BiZuzvZWlohopCH47PwrWqmMbB+AOf/qmdBeahO
	dxRe7fPlRuSyy+zxtoJ2IELMNf/BjUXZ/A2HwXNT82WHTa/IPXBQ7FxyWFL6cjl6pOVWZKCqWWQ
	FnovULMGy/wzWUqgyGXvdZXm62UI+N1+S+ItMlphbFZST6dU5ozJLsCQfDiaQ9IaReeVGKncWiV
	n7E9DCLyq6cs6TPkarb7Jmjo1XYxbEv6LLXqOKp2pO6I0MIcOFIF+zHWD3mL3gNSu3nSVyr4rT1
	DwshlPBJ9Mf9dR3/KQBCBeso/zJs7xgH5f7wJKwXW6Sxf0FcH4/+2HGHi3rU1VNbXl8vJPrFvnX
	WK49PgrsXhSxOkUFp/glKJ4t0p46PR9gGQQg3i/dCeBGoupCKzJnmy4=
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr340385915e9.12.1795606080223;
        Wed, 25 Nov 2026 03:28:00 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d0e3be64-58d8-4d4e-b90b-f37ca4dc5e3d@xen.org>
Date: Wed, 25 Nov 2026 11:27:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/21] hw/9pfs/xen-9p-backend: Validate the request
 header size field
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
 <20261124232247.23169-16-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1795606080-585C7B50-E0CBB330/0/0
X-purgate-type: clean
X-purgate-size: 865
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
> A request whose header declares a size smaller than the header itself
> was accepted, submitting a zero-length PDU and advancing nothing, to be
> re-processed on every ring kick. Reject it instead. Set inprogress only
> once a request is accepted, so returning early on a half-arrived or
> malformed request no longer wedges the ring until disconnect.
> 
> Fixes: 40a2389207fb ("xen/9pfs: implement in/out_iov_from_pdu and vmarshal/vunmarshal")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
Reviewed-by: Paul Durrant <paul@xen.org>

