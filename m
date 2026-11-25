Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86068606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yN0KWtEt
Received: from list by lists.xenproject.org with outflank-mailman.1502357.1698324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWD5n-0007Lz-E1; Wed, 25 Nov 2026 13:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502357.1698324; Wed, 25 Nov 2026 13:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWD5n-0007Ls-9e; Wed, 25 Nov 2026 13:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1502357;
 Wed, 25 Nov 2026 13:31:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWD5l-0007Lm-Ol
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWD5k-00Bjki-Px
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:31:20 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06e322-bab6-0a2a0a5309dd-0a2a4509a98c-36
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 14:31:20 +0100
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06e328-be1a-0a2a45090019-d155da34e98f-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 14:31:20 +0100
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c4203bbb1e9so957623566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 05:31:20 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae6663esm639987366b.21.2026.11.25.05.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 05:31:19 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795613480; x=1796218280; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1getO31TbpMrHD3IyKxKUohDsUND4FeywjJ/UyT4N5c=;
        b=yN0KWtEtm44bD4GTaBYo401J3BRiuGHN42XIFn8eH581hlg0PprnT1y+OlWlMI2Zev
         eArReqwL7h2C3Y4F36TXot/37XNPtrWOqezFOXy0pcqzDOAuURHaXcPdu7/eGdGiqbmg
         yihTJ3dt05Yir3DUmgFPPcg9hYd2Rh+Dhszl5k2WkP+yCnzcCmDxjFDF9wA1iMkboDeD
         P9zVNii+YmV3twSJFMs2kbIlRTRU5TDIb5rdZk8KZAyETbusmp8kSeDXeCqncW44Jbya
         wPMwCsA248pthnvaP5h4AJ1Rj2vySO05UKdLHpIz8azmUM8wYlbWYatsNJQFbkz9DeAI
         TgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613480; x=1796218280;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1getO31TbpMrHD3IyKxKUohDsUND4FeywjJ/UyT4N5c=;
        b=2FqpAvh1wFzSgPRmSLIyGmkVFVDwhbkcQsXP43qgEtl5XrK9MnD2h8+NUm/t8J9Hp8
         5dmocc862UGhqFTOfuQZTsOL78FTfoLqtR5dT4uW9HT4jIC0GFry+ScuyM3Q+8+Lmdkz
         FQvTxspL7bzhk35EFJxjaob3VhzinER6O7M3Fg1u8XAb3uJGthiKfxbY22FxPLaGzmIv
         L56jglVwKIRYAUFJNewc6ZGZmocdEUKq0PgZ0Zt6xVufMbcPPHrK8Bt8ntfPnbERDYZt
         CHJjYSZc7SRmoP1u3M9+ws0k/GiQ+2s9mYivF4uPKam5tkJ1p6Ej2R2Jk7XdUVeohLAL
         1Bww==
X-Gm-Message-State: APuU4Z+iYqG0PJVA5RjxmBIyhmOTMBXYHaWXEjThZy3YYxZvN1yWedWx
	GKaLzcdL5Oo252yYT4vhtUMVGwIerIJCJ4jhzfttybNciSDbNlhzb95m
X-Gm-Gg: AZFdTZfNYHUIY3/K++5xjo+/Zk9rhOnCnN/bp6CbsiwwYMiymEkRj4RsUWiu0pP912v
	ptKBQ1+9IQoDOOUUKwP7GzKfMWxCUptkZ4Bj2CKrEFVJdOipUKCIqaDotL1+vtZJRwGSWtRI3Ck
	ggQcUy0VmiIAO0AaTI5I3CuAqzRU4/nccmCaDhBA3v7xaELDBlcLChAqhWYlW6M7FkSe+oT4+wZ
	zO4rraPBJ0/N1yS3ABVRFMsLdD25WkrcSSlNWaXqdDvz+YalpRlGp7d1WT5ICjJsHagbd4zu4ea
	752Bk+Ze8VE5tFwYUxrTqcmlnz+CD+uqd8r86cWm9kyxFhu5aou93UquWacr0QfpexUtcelTllf
	uqhG4jZHbIm7TH9h/Xday2/v2sHzYZZSAWJNIUc/QoVSfpUvS9rUwnyjvGHXrd1uRKbGmd7Tbzz
	1jTmE/5pIZL1SPj3HwfItWXTrVSkKpfuApq+gEtCAPARUUkDeMLAirlPuPCbkVEhLgAJH/eCi3B
	gp4xe/3mUsQjJnYFjDVQkcfZFdiwgH/uMm6KzubVTDEUinr05xNp5GvuAuQLswpIzBit2UrvlNV
	E6RZz3mH1Z1AqsTH/YdvIeV04KSYb42WsoQ=
X-Received: by 2002:a17:907:4d0:b0:c51:f6:216a with SMTP id a640c23a62f3a-c513aaa8eebmr1221466566b.37.1795613479877;
        Wed, 25 Nov 2026 05:31:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <7bdf9aad-dea6-4073-97eb-1c5d2535c9ae@xen.org>
Date: Wed, 25 Nov 2026 13:31:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/21] hw/i386/kvm/xen_evtchn: Fix off-by-one in
 do_remove_pci_vector()
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant
 <xadimgnik@gmail.com>, qemu-devel@nongnu.org
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
 Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-9-dwmw2@infradead.org>
 <8e8fa5ae-f30a-4e38-8aa8-cd46e3b4ca31@xen.org>
 <51d6301de00d83468af889fd4eda0e9cadf23ec4.camel@infradead.org>
Content-Language: en-US
In-Reply-To: <51d6301de00d83468af889fd4eda0e9cadf23ec4.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795613480-BF6D2034-3CF94CEC/0/0
X-purgate-type: clean
X-purgate-size: 1068
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 05:03, David Woodhouse wrote:
> On Wed, 2026-11-25 at 11:16 +0000, Paul Durrant wrote:
>>
>> I guess I'm missing a subtlety here, but the test only fires if pirq is
>> a multiple of 64... so why is advancing to the next word by adding 64
>> not correct?
> 
> You're missing the same subtlety that I missed when I wrote it in the
> first place: the loop *itself* does pirq++ every time, so when we do
> 'pirq += 64; continue;' we end up adding *65*.
> 
>      for (pirq = 0; pirq < s->nr_pirqs; pirq++) {
>          /*
>           * We could be cleverer here, but it isn't really a fast path, and
>           * this trivial optimisation is enough to let us skip the big gap
>           * in the middle a bit quicker (in terms of both loop iterations,
>           * and cache lines).
>           */
>          if (!(pirq & 63) && !(pirq_inuse_word(s, pirq))) {
>              pirq += 63;
>              continue;
>          }

Gah! Recoding as a while loop where the increment is either 1 or 64 
would make this much less fragile.

