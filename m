Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B272C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 15:00:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD7E206DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 15:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEyscQMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD7E206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCQK0-0001yE-3h; Fri, 05 Apr 2019 15:00:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=awEa=SH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hCQJy-0001y9-4Q
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:59:58 +0000
X-Inumbo-ID: 7999d195-57b3-11e9-92d7-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7999d195-57b3-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:59:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l7so5541406ljg.6
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2019 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YU1pKR9vZ49GdpDcF6dFayXMoVPWtD7+O/U34MtZF78=;
 b=ZEyscQMYVrEdGjngi3QZoAP53Z2tjAnXoZlnNdbhqHA3krZ8eB/4rE3z6o1t+0K5YY
 N6pfqW3OGIryySSaTxj1R9/nL/JgVgsGZFxsjeeQNKcfAQDMd012hudYjE0G0PMA4TRH
 OTwX98fxezR7FNljD8kLOoP4KkwSLyz5U2ruEATzBMWhiQPOzLl+hDw9QpkX8WHtT8by
 MDhL7BvNpVrFxvoDXG36uyNiOUGYW13Nu5emmbbCuEw25HwX4I2C7fhEAVaWjqS+Ty2t
 VdnZTkcb5s+pMZDSSz3FlHs4sJ4Zt0Ka1KrG+ksE/IGJUwVbwLQDZUOW38D9yHSQyCdX
 sL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YU1pKR9vZ49GdpDcF6dFayXMoVPWtD7+O/U34MtZF78=;
 b=P9Goh5b7zyK596v/DF3GohVZBUEuP7cBI8QHrlev8SxHtsEbhzGX9ylOpTzVm0UxUH
 dWuqGRe6NolIQfIx1ExPolFa1QoQmEAE1zZQnf5CVbcxh+/jZHZ+GW367uZiiXBTI5it
 Tsam1YzbY75jmEjczy0OvmXZOiVpxyyFiS+/u9JphLxgh3Unjdehs1H3bcD+6MyM+P1n
 WhE5Rsk1R9HyVKjvjE51eRTxOOP8Z9mUPQxd6j21EQgwEA3EJgloKcW0bARjJWitOb50
 XEBTb+ByBKJX9+C/rElAICS4E9U925KVaVf783ZEFRF965WIBzScE7+lvNwbnhy2kjkV
 I4Yg==
X-Gm-Message-State: APjAAAWHbsft1jabgWY34LjEvt618OzMUqA/z4ngXKj73IXP3WpmNS5S
 N2A2hdkelurA/v8OpqLicLI=
X-Google-Smtp-Source: APXvYqwdh6ro1fb+WkPp6datceaF2Oz+Q8RxDT2KWwBXyCY6XHwQarh7VF8cwrmv0L9oB35U1Q5Eng==
X-Received: by 2002:a2e:4a09:: with SMTP id x9mr7294354lja.19.1554476395724;
 Fri, 05 Apr 2019 07:59:55 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 13sm4431401lfy.2.2019.04.05.07.59.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2019 07:59:54 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190128155909.14289-1-julien.grall@arm.com>
 <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
 <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <294d08cf-de0b-35cd-42a4-1571f7ae53b4@gmail.com>
Date: Fri, 5 Apr 2019 17:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405145953.16W1w1GZpy1XhAnXJf1pV_BfyvqAzPTpPJ0FLzVig88@z>

SGVsbG8gSnVsaWVuLAoKT24gMDUuMDQuMTkgMTc6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBJ
dCBpcyBpbiBjb21tb24gaGVhZGVyIGFuZCB1c2VkIGJ5IHg4Ni4gSXQgaXMgcHJlZmVyYWJsZSB0
byBrZWVwIGFsbCBJUlEgZmxhZ3MgYXQgdGhlIHNhbWUgcGxhY2UgaGVuY2Ugd2h5IHRoaXMgd2Fz
IG5vdCBtb3ZlZCBpbiBhcmNoLXNwZWNpZmljIGhlYWRlci4KQWgsIHllcywgc3VyZS4KClJldmll
d2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNl
cmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
