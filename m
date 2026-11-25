Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF65606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNmgAtGX
Received: from list by lists.xenproject.org with outflank-mailman.1502020.1698027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAol-0000zn-Db; Wed, 25 Nov 2026 11:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502020.1698027; Wed, 25 Nov 2026 11:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAol-0000zg-A8; Wed, 25 Nov 2026 11:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1502020;
 Wed, 25 Nov 2026 11:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAok-0000zZ-7x
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAoj-002EJH-GO
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:05:37 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c0fd-e002-0a2a0a5209dd-0a2a4506e196-14
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:05:37 +0100
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c101-195a-0a2a45060019-d155da36a839-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:05:37 +0100
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c40e30c26a4so1257710166b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:05:37 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc316bsm614560066b.56.2026.11.25.03.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:05:36 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795604737; x=1796209537; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rj/OmW4asS9jNN/viln1BFpfuwXmJiprMQIHIS8uDWw=;
        b=WNmgAtGXv2Sh91ZoLC3C4q5n57OAmZJGggv6oyIfHthXHT8RjZxGs08U0NeJz1dG4o
         qX/v8ONyGHb/bUKLIpyAq9p6L/fvObmggPnD2ZswKbEf3XOybcbMehmA/lCO23yJ3Fpv
         8zHVBLOvrwxZp1SsmP3oHmnvveJA34BXTBAhXcQOLUJoXXAy4666Qcpny64y0TsgGpfW
         yxbHjZOEEFUUNVOa29zjJvO3mUgmWCw4pRx1EgI7KEZJciw4JuLFabEQklKvbJYqMIYm
         lxLpgxgxnwpWhxxXX/xhIZo1IsRbOtlO/XXXGxf0JYUgINk9mWpZXssE27G9rs5BdvDB
         HPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604737; x=1796209537;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rj/OmW4asS9jNN/viln1BFpfuwXmJiprMQIHIS8uDWw=;
        b=kUClMjERbsJctiuflWaQQFn8lq3joDcD4Mr8snb8EaV3FxFeocS7VrIQdOn0olJcyA
         IR257jhU8OZ5bsWil61qad597mV6mE4Dw6zI86SZxXAyB5TAPlaQlFH3VI6e0Dzc6cI1
         JJNDoVd9OX0WYBT+vTec38KFDKaBvI7L2vj8IMRBwvRb1bfrUtVJKhT4MtBgXG1zFSQX
         d78L+pXcurbU04GYlg89h/HmhSykmopYvqX9XKvonxdN+cQ7x+vrRl7yc720Ou866ToD
         AZxwGPSlAeGWE/0hCIzVNyQjl39wlKdkLpJazVSrx933DsiIeoLFSth14VskzyqL6Wno
         b96A==
X-Gm-Message-State: APuU4Z/6srrwJws0/Z/4XJSzh+VAJg5iYyTYKjtsPxHaZAZZZyX644by
	mg6GG1obHEWhMXYnNhpa2hVfUruXWyWJNy7wHo4/Qg5zFqZVRORx2ASp
X-Gm-Gg: AZFdTZdfP15vwVhfHjBKAYTbPe80ZuDjE4+rN+P4VKoLT9Gx6pVc2SL3ovgKIHeo1VV
	C5dySsJzvGAxMhP+b2w7o4tRRZRW9HHTqFNFysRDQEIUJGzB+iItKgIspaDSDG5rLeWmJIxLL1d
	kLE+gSo/othm1ZRqrko6H/kdnZ3O0kCMuByegiSoldHy5W7/Erdb8hd/G7MTGVVuX5RmBRDCiny
	3T/kHRpa7ysmBEgUT1ER8ZYYkt1XHGynNPa7plBgQWLCnS5XhhwZ6FqVQpu1n1yrRdOV8EvhguI
	MpwVi5lxiDgWcUktamtj3MSG4MOAi8m69CYZ0ph8qeekTPyihI2FBySrOF8VJzPkYNZbqarCkql
	d7cV8KD1Z0W2YEVyEsvT8SlbAkj4712zGy5U5PewOQ/Yd6zjk/z6hzBU/JCTwXSdshyakDeGQxs
	7XrTwSUgPQagtunRCPuEdlm9UGb3qSpJJz+zXj2zgVQ8Hs4R2JGhVAo5s31EOb6UN3NiNphonK9
	O1bZh2pphlXXJ+0mzx9El5f4qjCSY1SnjdGomWF9gvi0m9XV8AmRXds9p1KzRlfKdJJ4uzdA1ET
	hjhDH6Rf+UrvV6Da62u4memj+z2ybnqBKgU=
X-Received: by 2002:a17:906:ad8:b0:c2e:4397:7c82 with SMTP id a640c23a62f3a-c513a5e6a7fmr1084197166b.6.1795604736841;
        Wed, 25 Nov 2026 03:05:36 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e2cdc050-42c0-4565-aec9-2568c391d756@xen.org>
Date: Wed, 25 Nov 2026 11:05:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/21] hw/xen: Publish backend features before setting
 state to InitWait
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
 <20261124232247.23169-5-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1795604737-F580D77B-6B1441EE/0/0
X-purgate-type: clean
X-purgate-size: 2053
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
> The XenbusStateInitWait transition tells the frontend that the
> backend's parameters are readable, but xen_device_realize() set it
> before calling the implementation's realize method — which is what
> writes the feature nodes ('max-ring-page-order' et al. for xen-block,
> 'feature-rx-copy' for xen-net).
> 
> Linux blkfront reads 'max-ring-page-order' with xenbus_read_unsigned():
> no wait, no retry, default 0. Lose the race and it silently negotiates
> a single-page ring — 32 request slots instead of 256. A device
> hot-plugged into a running guest loses essentially every time; at boot
> the frontend doesn't come looking until long after realize finished.
> Netfront reads its feature nodes the same way.
> 
> Commit 240cc11369fc ("hw/xen: Avoid crash when backend watch fires too
> early") introduced this by moving the realize call after the block of
> code which both populates the initial xenstore nodes *and* sets
> InitWait. The crash it fixed was real — xen-block's realize processes
> watch events via blkconf_geometry()'s aio_poll(), and the handlers fell
> over when the nodes didn't yet exist — but only the node population
> needed to come first.
> 
> So keep the node population and the 'online' write before realize, and
> move only the InitWait transition after it. A watch event during
> realize now finds the frontend in Initialising and no backend 'state'
> node, which the handlers tolerate; none of the three realize
> implementations reads the backend state. Verified against the original
> 2023 crash reproducer as well as the ring-order negotiation.
> 
> Fixes: 240cc11369fc ("hw/xen: Avoid crash when backend watch fires too early")
> Reported-by: Mark Syms <mark.syms@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

