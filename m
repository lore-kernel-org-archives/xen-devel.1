Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0D606A323
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnPvXU8U
Received: from list by lists.xenproject.org with outflank-mailman.1502180.1698171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB79-0003bd-1T; Wed, 25 Nov 2026 11:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502180.1698171; Wed, 25 Nov 2026 11:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB78-0003bW-Ti; Wed, 25 Nov 2026 11:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1502180;
 Wed, 25 Nov 2026 11:24:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWB77-0003ax-Mi
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB77-004zjK-37
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:24:37 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c571-bab6-0a2a0a5309dd-0a2a450aaea2-10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:24:37 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c574-f2d2-0a2a450a0019-d155da33e908-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:24:37 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c4203bbb1e9so934862466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:24:37 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afed51asm608298566b.76.2026.11.25.03.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:24:36 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605876; x=1796210676; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gzc2evg1RQu08SoZpm7hU+pHzGBQ6fSq/GTpySlh5ek=;
        b=GnPvXU8UVJIuwh/upXaeZPQHqAR3l9XQC/heUMcJyQPx9VqSehvXn/hHbi82NQkDkp
         dQymPxCS9F6SoyDwycS6YMxNyWEBSTj5hLhdYx9tNo7uX+uJ+9EdjiWhd2ZDS5Um7Vpc
         cScC8JOE9qG9fNA3iO8+aTtzCeGX2kc91lftwF+3oz8ifnL3XpoCF8Zmn/A8fYUux3+C
         6/lg5hlSyZV9XjEioJj0Nn8ojmoJqm0h4zdGOqIEYn7y2nqpBGppG8Ro0x5Wb8EE35ZZ
         F0hfY+9fPQez7k7KlsEFAfCMsi7szif5jb2gjFUwep9dkC5VNhPeN6d9RRDOZUhouQj+
         WY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605876; x=1796210676;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gzc2evg1RQu08SoZpm7hU+pHzGBQ6fSq/GTpySlh5ek=;
        b=AJQ+DIaA+xrFzwL7rx2KDqlg/OM3irpCc6R0OhDK5lmrAJXlMLybtrDokxOgf5PPzA
         aXU99hDGz/dnzj9lE1lEvOt/wKMWgGbN78+PMoDmVkR2c0dRQEW+Sy2tt/zZ23/SQOLz
         a631RKtS4EGit1+NIeHSKwNBL3d0AQ+oL+bQjrTOb8NjZ6QW0uh4BYC3WegsEFHhKWb2
         sE0fpabTMb8KWIR3nINarnJOBnKKl7pUJDnXIAuIcz6gbg8Fwr5yluCtZgvaVzGCu1Lf
         fJSM5r6GIruEUyKyGWIN9FeirgFl7g2F3n3Hy5ICwp9zIW0GmUNxomYTy1PrhmL1r6u3
         TA7A==
X-Gm-Message-State: APuU4Z+ZHCkal3JTk9RI03HblZi3gTMFEhwAOCrVEO9OnRhJcej9mDqX
	RBIL6oBCF4oBSTmKtCXjZ6ZBKeUPNH3RwB/W21u3+zIuUpsgCpKurgEI
X-Gm-Gg: AZFdTZeoCU1MlSdoiQGAvU2Hh1kS5bj/j+rODVbaM7sEI13SUUnTnoDB4uh0+70EE3n
	y8ZDb0kcWak2xzEhACigFspRh5gtIN/Za2dA50c5Rqhz4Y2RU9Rr3L9W/VIk7TvYBa8bSoRa+9i
	vbYA4s32xzBb0SMv58ZjbJh0LsWhrv3dsjeuMbI5F0QNlintqJK28ei6IZzZCsyuXWdmU8tSn6d
	R2o974VylPKI6VPHyBjLCB4xVczWdpS0xzMF7vSOtxQGTQtuuF/P5m0kJJ6UtJNW5y2UVGGI9YJ
	PSmGKmLSo/0Wwg/2JyUrwKCzJr7fr2aRkAHmQDjwh1WpKyA0ndUEg8q9QQxdNApM8y2eGvPZap6
	f99gkx2p6ps2PyyyBRrPwOTne+8mdZ8OiOyMejzZGH/06/8wADRJmf9dBTGHsHfUwdOtW9pkvyZ
	3llvtwS3M5u0cF6RzeS/ROgFqQttjKjB2Mb04GlPO4YWn9RSQ/JtHGf+AvSJZVCA+5U2YVDvXrE
	u2JaDmL9L02/AWAZktV4t5MDBr9hWkPjekfqC3DixqFKkfvmLaconCPweuCcqie65Sje2rmYTyo
	5zPf8i09L3kxcLqv0fV4XB7uPZKqYH+836U=
X-Received: by 2002:a17:906:115a:b0:c3e:ee86:d2c with SMTP id a640c23a62f3a-c513a866684mr1271536266b.27.1795605876461;
        Wed, 25 Nov 2026 03:24:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <883b59a1-8ec4-4047-a3c7-d7980730f6f1@xen.org>
Date: Wed, 25 Nov 2026 11:24:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/21] hw/char/xen_console: Fix buffer trim when size
 exceeds twice the limit
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
 <20261124232247.23169-14-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795605877-589C9CFC-575EC12D/0/0
X-purgate-type: clean
X-purgate-size: 976
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
> In buffer_append() we handle a full buffer by discarding bytes from the
> *middle*, preserving the oldest and the newest data. When the overflow
> exceeded the max capacity (a limit set by the guest), the memmove()
> destination was miscalculated and ended up before the start of the
> buffer. In that case there is no older data worth preserving anyway;
> just keep the newest max_capacity bytes.
> 
> Fixes: CVE-2026-123071
> Fixes: e57dd20bb706 ("xen: add console backend driver.")
> Reported-by: Giovanni Vignone <https://gitlab.com/gio24>
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4191
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/char/xen_console.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

