Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C3BC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:49:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A1C206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uvgcxIVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A1C206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1EJ-0000y8-33; Fri, 26 Apr 2019 13:49:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1EH-0000xz-Uf
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:49:29 +0000
X-Inumbo-ID: 1bd658ef-682a-11e9-843c-bc764e045a96
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bd658ef-682a-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:49:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h16so2961985ljg.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SKgWOX6+/NWaTgDf16cP9gKxY8+SHCZC+6Eu499u/q0=;
 b=uvgcxIVh5969OQv1oM/xKAsjuDm0/5Iny2NAOMpZuMs55+/fDzpKg+ptIn0y2ZOW88
 vUNbhmCZTxju7YG8M1to+Zddw1V7bJTntFpkHRlv2QI5IM50cUsX6zqUpQoXmosxuXqS
 HQF6E1KKqUFOuhXqiCgJ/iHF+5sWmAu/thFLQ45Kz6LQ3OYePqI46zfdg/Lp5S006sK7
 YP0kGLlcHcM93oyK7XM64oC4BrkNqZLRXt9Zckt5psNGwjYznu23YEsHRbkqdm6LERpJ
 +vuQYh9hMU7Pyt9CDNJGZufZulfWLsi4fy+5ar5Nj1K+jw1jffjWdGFTYX7gMIKjb26o
 sTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SKgWOX6+/NWaTgDf16cP9gKxY8+SHCZC+6Eu499u/q0=;
 b=H92v+dHUH2kHzQVFICY1QGmPhUvubzxEUPrwRZDe51qwmcrf3jBksZQof8SICJ2u+g
 KP04cSKKcnNkDkyvW6nEAwKm46lu8CgYKi4EFg7OmRcglYmhVuQC9uT0oFyTzD9i6APn
 f25w+4wLoAnHPKo6ymoQZORtKRWaNY4EvpEm8XhyeubSZef/E0tjgFWUkln4x9OTCxys
 MTPVU4vQok++JlkSx4aTpiNXGWKrZpSENEvVXJTWWv/TWXLUSAsZIh4JzZzDJu+Ab+yN
 Z0QdwN8/MhS80+8NAEKniFZhlZg7O1gXUM1Nhh9xl9FXe07sG6F02hKiSHgGYdafu2eL
 XXUg==
X-Gm-Message-State: APjAAAXCw3yhK8wSdreRHq4xhxoHyunT0NuO8DwZZtg7MhxImShygRYh
 qoxflYD33IlZPWfDj/0bOeY=
X-Google-Smtp-Source: APXvYqw+SrKONuGUMd8l8uJm3OMY3bvf9tLQHZPXGc6TKC8zciBRtpV1avKmFQw/TcLadqhykgy6Cw==
X-Received: by 2002:a2e:9d12:: with SMTP id t18mr24922253lji.163.1556286567125; 
 Fri, 26 Apr 2019 06:49:27 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u65sm1029491lja.19.2019.04.26.06.49.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 06:49:26 -0700 (PDT)
To: Julien Grall <Julien.Grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
Date: Fri, 26 Apr 2019 16:49:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426134925.OFoiE94gAzYmSXqIfj37viN4qjSFaTIG4sGJmRsw-00@z>

CgpPbiAyNS4wNC4xOSAyMzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgYW0gbm90IHN1cmUg
d2h5IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0dHkgb2xkIHNwZWMuCkkgZGlkIG1l
YW4gdGhhdCBBLmsuIGlzIG5vdCBwdWJsaWNseSBhdmFpbGFibGUsIGV2ZW4gbm93LCBzbyBpdCBp
cyBub3QgcXVpdGUgcmlnaHQgdG8gcmVmZXIgc3VjaCBhIGRvY3VtZW50LCBhdCBsZWFzdCB3aXRo
b3V0IG1lbnRpb25pbmcgaXQgaXMgaW50ZXJuYWwuCgo+IEkgc2hvdWxkCj4gaGF2ZSB1c2VkIHRo
ZSBsYXN0IG9uZSAoaS5lIEQuYSkuCiAgCj4gQW55d2F5LCBJIGFtIGluZGVlZCByZWZlcnJpbmcg
dG8gYEVuc3VyaW5nIHRoZSB2aXNpYmlsaXR5IG9mIHVwZGF0ZXMgdG8KPiB0cmFuc2xhdGlvbiB0
YWJsZXMgZm9yIGEgbXVsdGlwcm9jZXNzb3JgLiBJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZS4KQ29vbC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
