Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E720606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yr6T2/ZW
Received: from list by lists.xenproject.org with outflank-mailman.1502097.1698089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB1L-0006FO-Nu; Wed, 25 Nov 2026 11:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502097.1698089; Wed, 25 Nov 2026 11:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB1L-0006FH-Ke; Wed, 25 Nov 2026 11:18:39 +0000
Received: by outflank-mailman (input) for mailman id 1502097;
 Wed, 25 Nov 2026 11:18:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWB1K-0006F8-BF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:18:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB1J-004ys4-No
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:18:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c403-bab6-0a2a0a5309dd-0a2a450888dc-12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:18:37 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c40d-f659-0a2a45080019-d155dd2cf1e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:18:37 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4ac08f4a0b2so3973019f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:18:37 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.8]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab65cb4341sm33914818f8f.4.2026.11.25.03.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:18:36 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605517; x=1796210317; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqDRusDdiLvl1Sf7gFE/D5Bw9nPWlQ6rHY0va4kEHso=;
        b=yr6T2/ZWjv4ZMJ7wozB0hXCKxdWtliNmMILJHF5GYvB0AEqNh0+tjbosMqzIauIXfh
         9C9SnefM+5GmF1dsznGYzKzBX2BiIqS3/PxIOgusodh39p/H1kUAJUkUz/ZWYh7d94y1
         HKr/zALJBGTk05PQwz+fehBmJyouKudmUS/erGpurjBLc/OD1AzuOZQlCDeglbjwAzLx
         6J+U49Avy+U6SS/qOJL8M10MJaMc1iJeLHl4QGXMqiITtdgl1peTsQwBhDDvKadM1urI
         VOoPVqc7NAtyOqxn39vqVFsAf4w3VBw/OvqyKIwPmExZnCcnx4fwKXlOBgsah3vR7m0s
         ycJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605517; x=1796210317;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BqDRusDdiLvl1Sf7gFE/D5Bw9nPWlQ6rHY0va4kEHso=;
        b=bTQy5Qw/Ay6SPW64l8zuVb9WDoLDJ2P9ITj5GQXHD8Y4yobsctfrrjqloCIQN8twVV
         xpCxtYawx0pqvEGSBSs67QDjbwD42BfWaHuj6B9GpDu7lzw7lUMcmeC2EsR5ycTkul8z
         lhD5VwkkQYYQ1UisK95x2cW17fuH7xZOGVMAEOpKoSEY9LrbltVZP+CJrrMAXFjn1BPH
         XNEpeByTLEOmYQICukVLcyGGkIxGUfdH5tHLSWDsoMEfJy912GneTgV30QgU5eVHrLmn
         BeVR93EYBaXXIklKeNG++tBhAeaE5tOgCkD4SCvNhmKu4+nV27idLK9X5v9sTntVaBKD
         KmRg==
X-Gm-Message-State: APuU4Z9jYgx4zBQQyaL/gZ3v5yhrKYf5wJ1mXNuBCtL9idDe9R/hNXwA
	usdHvKFTj9pjhrMZ10+fb4qx9RmDtz1vTpDLmk3DkCilk6MkSrzBslzD
X-Gm-Gg: AZFdTZcJFlZVfM7/q9wrnYxyHOCLlQuZuO59q5pCjgE2K1S7nJYKHisPLSbkwUAc5nI
	aZllJ9fMLTa+7cb900gvlbguQvslyaIjX1AFnZQEvwFUYDLQDk/TiE0QZleUlcX680w+HIGt6Xj
	cEIRKe0WiR53XmtFoSDr6FevPQsv/jVso6b8k8dHkfoujFQVoRcnM1mh6sAKdhE6KVD52xyjHHX
	1kiy6UAWhLDc8/ORtvVqeTJ8EbEDzRXaGoFXbyZ7pGeQ93D141ur9l5GOWtBSJOc2fRG+96EqbI
	ioLyUssY5/PgHZcbAysWGLnFFnTYsH/nHtE0IbUh/9/nQtew62bFw3UerWfJLMPp/kdBv+vcg+e
	Sqkk1EYd47fZ4wk89zWvVTvviN0+F6b7yEYCHIE74xjAnasujFSdu0MO+ekjVM1BXuzei+D1l6R
	5fLwYvTifuX2VddBbPA4in9oEn1UZ+lAPydDsRFA4wd2jEUaBGaZm62TPLC/eD5UtQWmj9S1NXl
	8n95CGrWllkGhwwFCxkLrw75IzP4BR6pI4gdcVR+ANFuRKmbm800euOS+lKDMq6AIr0NB13kDaO
	kH7e6AqrgCAiA5mKuHJtegt3VYi6mXfuVw==
X-Received: by 2002:a05:6000:29d6:b0:490:6fbc:9457 with SMTP id ffacd0b85a97d-4abb39566e7mr23143727f8f.41.1795605517091;
        Wed, 25 Nov 2026 03:18:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c4e8c8e0-91a5-4009-b413-de19cf64e661@xen.org>
Date: Wed, 25 Nov 2026 11:18:35 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/21] hw/i386/kvm/xen_evtchn: Reuse existing backend
 port in find_be_port()
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
 <20261124232247.23169-11-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795605517-D735D87B-72BE8454/0/0
X-purgate-type: clean
X-purgate-size: 860
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
> After a guest soft reset, close_port() clears only the guest side of an
> interdomain port; the backend handle still owns its be_handles[] slot.
> Binding again then allocated a fresh slot each time, leaking the old
> one — and leaving a dangling entry if the handle is later closed. Reuse
> the slot the handle already owns.
> 
> Fixes: 794fba23a53a ("hw/xen: Add backend implementation of interdomain event channel support")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
More soft reset joy...

Reviewed-by: Paul Durrant <paul@xen.org>

