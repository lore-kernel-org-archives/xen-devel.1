Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32949606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQ7Klavi
Received: from list by lists.xenproject.org with outflank-mailman.1502254.1698260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQg-0003GA-M2; Wed, 25 Nov 2026 11:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502254.1698260; Wed, 25 Nov 2026 11:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQg-0003G1-IS; Wed, 25 Nov 2026 11:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1502254;
 Wed, 25 Nov 2026 11:44:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBQf-0003Dp-CY
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBQe-00CrYn-Oz
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:44:48 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c9f8-bab6-0a2a0a5309dd-0a2a450c961e-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:44:48 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c6ab-f479-0a2a450c0019-d155dd34d098-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:29:47 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso4969181f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:29:47 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.8]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b110c3csm32638215f8f.36.2026.11.25.03.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:29:46 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795606187; x=1796210987; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PLhpJz27100xJ4lBejKqYddNXOJStc6+fMGHCxhwep8=;
        b=uQ7Klavi2LpFvzOj7BEsZwdgjM3uPygdNGlRwxulb6dXId8/yp8GVXy3p37GEFJiHQ
         QCkAPOuQ9VuGp5OgWLNHMFqMQKGWeHBHAI1Ds6ulz4NxfYxJyxHsol2rFsbpTTAsP7O/
         TFmvOfxspoLuIfIiPfgE2qSZk/BN5WsLtdLwJ+xzOIGLFazIa4GmhDhCVPtPQ8gVmXZc
         eBLi7Ci05cOzsza6qeh5SeGeK4VVLi5UC9j9Q1IThY9r7sWneMHOD1wMwc91k4xxL7w4
         0DWnjzaGugGPX0jVZ3sDXHai31AMWdezesS+qfgaFG5sv72rHguVekrU54qwVBNenBHO
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606187; x=1796210987;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PLhpJz27100xJ4lBejKqYddNXOJStc6+fMGHCxhwep8=;
        b=HtIDijSeq5K/zYyfGraIlXJLmkJVkyErA7WoiHJWX3+5qrsSFe0dbBYeTfO2NLF1ib
         a2ZOFfaL/j8sfL9NkMQv04ZsFSGKIAIwf832m6S1FekGfWkSMJImT9W8X09Z5f4lyFUF
         QkPbFXhTkX5ghcWNICIOQkQdG+BWOj1UlAN9FRtyJpq0+UN5wv+tL/aW2c+3+WfMySov
         XAkRutvoxSJcUFaRWJ6P2FqKO0k0R1LUfNko5V9J4OfrGSy07yhNxVKhuOx/gXaBI3Ud
         a4TL5T4rVSA3sWFly8Nq6kzarpA9QxWn5PpYMoSvdJjIe6EOGVxAcSzni0f9UM1oSfWJ
         Dy5g==
X-Gm-Message-State: APuU4Z+PPcpceUOZQupTzpda1DCiDMcgu/TJjG/Pu1X3hcUoByBJg8F/
	ogIh4K0LOYEB31Z6IagLVb/L7H3BqLQRCgS0bCgFA6IGgy0jpAzkn+uf
X-Gm-Gg: AZFdTZe5zyaDvtb8PmhDrFR9nJwJ8zv5KAcmqeM5tittDcV/dw6KoNWGZzCFigzyH6R
	LYmqXj3JAHln7Rknjuu36s8TxczVceclPFkIJ7T/v15PlGMM1P9Ujoqv8CVpuyNuDQAn+Uu3ans
	JwBr0+a7BQJEjxI/5oAGhapvpzilLWN8lQldGVfkg7b1VXClnUAjtJ6VrBh6K64auwCtSkK1CBK
	pbtRDvbEBk9feYyLfMbXHgmNpemijniWLI1r6o6SupDH2o3S8fAUgkMf+s4St5JKgsIrqMGCj5x
	EDpabZyHyeOd5I2wKjZXBt27SGeZv2VGQsLbJGYwsSEFsHNClUqu2uinUQvF0MNUF1SO+Zpn6jW
	u67QH79bQUtjp0HWuFx+ac48DxepA/1hQdxCifhfVDZgGVg7SOwai8OedWwcIS4B9fc+yo89up4
	XRT0CQQz3Y6mROePXFJ6vtF1rS4VHH9dJ9tqyl3aDCdgaRvKUX/TaDj+F1X+1EizYLOQnziZW80
	+3G4H8B02uSQ0QmU9iyWENYFSd5dgxe5PXFsZfGXBUN7IQVjHz4DpSi9orUgykD1FD26u4YNcIF
	dSbG+PglrDXzLRi2Q+kH7CS26YVTGGSfPIw=
X-Received: by 2002:a5d:5d0e:0:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-4abb7d465a9mr37285629f8f.38.1795606187286;
        Wed, 25 Nov 2026 03:29:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fbc930a2-7f5b-4b28-b678-e10b97fae2cd@xen.org>
Date: Wed, 25 Nov 2026 11:29:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/21] hw/9pfs/xen-9p-backend: Validate
 frontend-supplied connect parameters
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
 <20261124232247.23169-17-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-17-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1795606187-77CD3A5B-40AF3005/0/0
X-purgate-type: clean
X-purgate-size: 881
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The ring order is read from the guest-shared interface page into a
> signed int, so a large value became negative and bypassed the
> MAX_RING_ORDER check, leading to an undefined shift. Keep it unsigned.
> Treat any negative return from the event channel bind as failure, not
> just -1, and fail the connect if the frontend provides no 'tag' key
> rather than passing NULL into the fsdev layer.
> 
> Fixes: b37eeb020123 ("xen/9pfs: introduce Xen 9pfs backend")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

