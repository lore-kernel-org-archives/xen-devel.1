Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004DC04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:34:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C56208C3
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 14:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9FWeOfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C56208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC2B-00024b-9L; Mon, 13 May 2019 14:34:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQC29-00024W-U9
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:34:29 +0000
X-Inumbo-ID: 361b895b-758c-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 361b895b-758c-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:34:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x132so9270009lfd.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2019 07:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SGViaq4y+YggYlaHyGlL+jh2q++5I3xRjj4VF3T1eI4=;
 b=j9FWeOfgdweKXe3DVTpouzg5mD9rtXGEHq7b4iBNguhuOgLG9jLDd1AvL3ghJK86zC
 YjeCn+qDzhPsKwY/jtP2gTqYJETUdvaQNXOOki57olxRmh+6ZcLtNh0tIqDYbkwEdEZp
 nIgPy4tE4wSNlgK6wSHZpm49G94ewp4jDFCj2myyj47Mbtp8WuC3Oi4tYF41qafNSouY
 s7qDphbETUBpM0EjzmBUOpBGOU7ogOdRSc6DvHgsjNzx5x1tPiPIt9jHpMYnwWoNLSaK
 JpSTF4EIDKyty6DLQI22pf78SxgLb5ZwQXwAX9v08PHkKnETOclTwL5i+2zEUZ8U2Vdr
 VJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SGViaq4y+YggYlaHyGlL+jh2q++5I3xRjj4VF3T1eI4=;
 b=uQTezTMc6SxutlcMG1p/FnKvsELs3x8Bh18rMakNq6Zwln5USsl8KWK99gNUZSRYAG
 RY0L7pHh+g6kpbEfvM9eTmRyVhHmXVEZP3wjLvDQvJ6LtWALvdgvLlpjAN1h+T2Gj/u2
 7THAbOiMUYEnQlWJJ8EfZTsE7OjZH1VbgrOzvBChOMkMjJrQVUgAhkhRCe1rv9UxESCZ
 NlflzjbvHHi0XDkI0g8StjFwfxta7m1QPkbjuaED0eiEJ5gGUGKwLn7GtjV7XYd9zKZh
 J1pCXfIwn/rQlV3ZrA5CKsLjQ/VH1qRqFyzvKW9VTUVFczTfHpLXs62MBgx7jjrZYTyv
 6WYA==
X-Gm-Message-State: APjAAAV1nOhir/Kr3KsPCNYQGsUr+pjXvSAnqSMgV1zJD3Nqx0m4VY/B
 Is0tfiDaxDylh5uqDvO98Iw=
X-Google-Smtp-Source: APXvYqzbmDWpfFfeLuUzCj9UEgDUT/0AgPDUP3MarMVfVny8Vgroa7wkbCl6zBwMIMQv3cSwqhahlA==
X-Received: by 2002:a19:d612:: with SMTP id n18mr1952649lfg.162.1557758066975; 
 Mon, 13 May 2019 07:34:26 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 l15sm3154085ljh.62.2019.05.13.07.34.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 07:34:26 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
 <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
 <98200ea9-c21e-9d58-498d-468764209972@arm.com>
 <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
 <e10c8cb6-da7f-1ce3-f5b6-4c68a2d85a95@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <ee01efbe-d13c-a112-6748-936754765959@gmail.com>
Date: Mon, 13 May 2019 17:34:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e10c8cb6-da7f-1ce3-f5b6-4c68a2d85a95@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513143425.EXJISop89_Byf76MvF8mLA80Dfnv0afOhGP7tVs2YIE@z>

SGVsbG8gSnVsaWVuLAoKT24gMTMuMDUuMTkgMTM6NTAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBB
bHNvLCB5b3VyIERvbUQgLmNvbmZpZyBoYXMgQ09ORklHX1VOTUFQX0tFUk5FTF9BVF9FTDAuIFNv
IGhvdyBkbyB5b3UgZGlzYWJsZSBrcHRpPwoKU29ycnkgZm9yIHRoZSBtZXNzLCBJIHdhcyBsb29r
aW5nIGZvciBhbmQgZGlkIG5vdCBmaW5kICJDT05GSUdfUEFHRV9UQUJMRV9JU09MQVRJT04iLiBX
aGF0IHdhcyBnb29nbGVkIGJ5IG1lIGFzIGEgS1BUSSBlbmFibGUgY29uZmlnLiBCdXQgaXQgaXMg
Zm9yIHg4Niwgd2hhdCBJJ3ZlIG92ZXJsb29rZWQuCgpTbyBJIGhhdmUgS1BUSSBlbmFibGVkIGhl
cmUuIFRoYW5rIHlvdS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
