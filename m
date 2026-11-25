Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5473606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1FJR5cQ
Received: from list by lists.xenproject.org with outflank-mailman.1502037.1698045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAsz-0002GB-2K; Wed, 25 Nov 2026 11:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502037.1698045; Wed, 25 Nov 2026 11:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAsy-0002G4-VK; Wed, 25 Nov 2026 11:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1502037;
 Wed, 25 Nov 2026 11:09:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAsw-0002Fx-W0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAsw-00BGW6-CJ
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:09:58 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c1fc-e002-0a2a0a5209dd-0a2a450acdf0-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:09:58 +0100
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c206-f2d2-0a2a450a0019-d155d032bd14-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:09:58 +0100
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6b167ffd132so8703310a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:09:58 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ba370e8ad0sm8023171a12.18.2026.11.25.03.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:09:56 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795604998; x=1796209798; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfPJCXNF97QeG6OnA8OUfo8WFxokwzAlfPX1tH79C4g=;
        b=X1FJR5cQE6aN7GidbVROpoSeBGfXzoTXWUbPUQFpxjH+8pMUdL7JyZ7LgqsgO/bCyl
         9BRQSVjVHftGaJvPP+O+9gozd1/C+SF08FO3HKg2wSfWxXSh+wRNP/fwDHMxJSBGNLEf
         oJ2u2QdKMuTHO1YUil+iq5hUYYhIhiIkVt4EVL1GbOLXPgfe31Uy1iq4Q4SqIHOdKRWa
         zLs0g6QqyzxARw0f3DzMFx4jIhUCw2TPavGdxgF9NXFaxQBaaA4Rcnh7QXRsxpD6VtQM
         O+mpYO/J/eRlq3IYwPjvCJG4+EaZfikkimn50LW8vhE2AOsb9uPT4UToVCVC+ahiPk4o
         2BlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604998; x=1796209798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kfPJCXNF97QeG6OnA8OUfo8WFxokwzAlfPX1tH79C4g=;
        b=fbMKoOlfLzItConW1RY4Fy0WTOEHQVM4feHRqtUyb+Oxpej9PSmOfyMnyeLGY8SKoA
         oU9hoIiRyXKfPWD5V3RpzO5sseoW+X1vl5kRIW3jBhyNc0Z05+CDYeIH1Z0n13fX241O
         x2iQnPOevdHeyrmo81UxuNLnicon5lIE3W6+4HqcaDHK6n4FIOhJUehozIFKbrfOWRFX
         4c1SIsbHX9tMKEgscz+eafHA3KGxY9v7U5rlyW7zpBsNQf/eharG3cn7Wgt8NiVAW2Fg
         0511JIIBDTea7pZyWTnudw3XLj7/QG9dhIg/h3GG6KdaNQAKIV/badnIxxPMDKFQ0IvA
         2V2g==
X-Gm-Message-State: APuU4Z9ErXcNXcUkL+dRL2wrrKLH6BHOP0WFgfijTYEqry6ilS6AJMwd
	1pAPn4pl2otsoxDpt7vaKO1bhc6BJK9hbEvssklZm1WIWMdbOZef3TZR
X-Gm-Gg: AZFdTZdVlw+jPLLlsuwrxWXTsdT0udKLb4L6M9gdcrI4fKpmm+dCvKoxmQO6xCXzuWk
	iwFTVUe3qU+ucZ+rCSznts2QoG6ehoTt6yhyFJh54yea2UL6UIhYKB/vssiVUGNC9RkcXQpw9Fg
	kz/fe37vqMEWo/VSEYUhxNwhQuPfbo/uamx7i+gJlbU2fAn8xyqg4eFTfLwIt7lWVHl+xQIu++/
	kwSF+JRKOmvw0m8/0QbgqbuVWdTgkeVS67LqEsFqwGq5I3KKKIZd89s4k+VamIuoYcGC3u4N1mz
	KbIR+7bLlgIhFXCH+e4QgWhKdwbOeyoFETDOO0bc+il59u/BgsqgTuJtlRFmiYv65TAkNqeOE01
	pO7Y6RPL6oBwHkVB3cYqV/+lg10kjh/MAagNhP7wM1HXPseARDIL1qW3kcVkfCGCjcBWTCsSDjv
	53yTN+zfA7ouCSxohAt8qzXCcWh/cNBCG7IFsQlWpN0oQ9Fd7DKpGokE2C3AIZTXac9qBiuOZio
	J5VYsi+FxOiH6X4W90nNMilnb/zymKOMks0zj08bQmn5BcuZBSM9zsa6c6URSMD55+e3vuYoDXg
	Koj/zO6ytiElY7s8wxzOIdUepq84PQWI0Y4=
X-Received: by 2002:a05:6402:2743:b0:6b4:be3f:51b3 with SMTP id 4fb4d7f45d1cf-6ba37d17d1dmr13152584a12.12.1795604997575;
        Wed, 25 Nov 2026 03:09:57 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <70dd9b2f-3c91-4363-a61b-2569e60960e9@xen.org>
Date: Wed, 25 Nov 2026 11:09:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/21] hw/xen: Validate grant copy segments against the
 page size
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
 <20261124232247.23169-7-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795604998-51EC2CFC-D6AE7623/0/0
X-purgate-type: clean
X-purgate-size: 927
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Reject a grant copy segment whose offset and length reach beyond the
> granted page, matching Xen's GNTST_bad_copy_arg behaviour, in both the
> emulated gnttab backend and the libxengnttab fallback. The only current
> caller, xen-block, already bounds its segments to a single page.
> 
> Fixes: b08d88e30f06 ("hw/xen: Add emulated implementation of grant table operations")
> Fixes: c412ba47b2ec ("hw/xen: Add gnttab operations to allow redirection to internal emulation")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_gnttab.c | 10 ++++++++++
>   hw/xen/xen-operations.c  | 11 +++++++++++
>   2 files changed, 21 insertions(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

