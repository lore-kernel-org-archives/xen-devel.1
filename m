Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6580AC43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:19:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DF320651
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+cYLmC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33DF320651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMauO-00034c-EY; Fri, 03 May 2019 16:19:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMauN-00034V-86
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:19:35 +0000
X-Inumbo-ID: 3c5e8923-6dbf-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c5e8923-6dbf-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:19:33 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f23so5733780ljc.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aoXsJ7LuYheNKf0FXsDxDrM+VpQr2uA+roob/3nFOT8=;
 b=a+cYLmC/lMYomYKXhXMJFnj40mxKZn3Xp074yHyIJ9QCt0Et7sc9Yab9etQZROZuW3
 1+vHwK5KM88LyRGBQ/sjZDV3BkUzOXc3xADUd9QfX7L+qP3OkUwEjVw1DJhzO9kKtQKW
 Dz+xGJXN2Ij1okExmVh9BjB9r2u9QiMavh55eHZz3hsFaiA3PWjrOiNRo2EzPEUBhv6E
 DTdfPB4nuc9mRFkeFbGECpuAVVCx/b012r5OKv22L34gFm4v3jeIABmFbNaU2bo7inP7
 BbYJ5lHN+4DjYo+EF6yqipEzxrlPiRmwnhxCoDF38Dq1+QI0MzNRBROYItBflvtfJzqR
 uTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aoXsJ7LuYheNKf0FXsDxDrM+VpQr2uA+roob/3nFOT8=;
 b=L9hjIWyiEc9WBW+2N1VzBxIkICZh1fxKVyqbgA1ETFoInzS0q0Cq4261yaa3WFQWNs
 wYII0QqwWujBTDGo+djdTtW3wdDuBAt7tc8wjhA7XFdNPVRc2/bnBt2GGCQW6QukEOUT
 bAWEzWN/T4MpobtkEsyVYhWeY0ustFG9UkQYg4QAfHTh0kfkHIuTiRPkFYll8ciie2YO
 qRr57MHylmF9XEH3aJNmOw4+RTQmdXHbb3RnCmKmqLYW32WXRgvpIVI7DC0tT4KWuWmq
 6iguo0Jd2+tcdon7hsohUsZjwte/IIaPfo+uhaAjoqYqO3AGJVjZWvzrhBPOeYkGBVt5
 DOqg==
X-Gm-Message-State: APjAAAUE3tjnAHSnDmAT2JzDieEZpS/DHpCZb5HFPnTfJXfTO+IL/8oj
 IFgNiWdATOTM4I6WSU6x9iQ=
X-Google-Smtp-Source: APXvYqxD/e1U0y0mV2+ojQek78wYAMvtWk0xylzrF1dtTt+/E8pvDi5MOCuoD54nAAQ3k6X2aT1T7g==
X-Received: by 2002:a2e:b1ce:: with SMTP id e14mr2221240lja.143.1556900372552; 
 Fri, 03 May 2019 09:19:32 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 n4sm506885lfe.15.2019.05.03.09.19.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 09:19:31 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-7-julien.grall@arm.com>
 <da08e713-f660-3207-ec2b-381dfec5631a@gmail.com>
 <5c638139-c643-ce9f-f33c-a72d3c327ed4@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <5d91e08a-d089-379d-ef12-e4a700b220a9@gmail.com>
Date: Fri, 3 May 2019 19:19:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5c638139-c643-ce9f-f33c-a72d3c327ed4@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/20] xen/arm: Remove parameter cpuid from
 start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503161930.d80-Wyp1SjnZhupjE_xTWhmXKOoZ-TH4X0zc796Vb7Y@z>

CgpPbiAwMy4wNS4xOSAxOToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgY2FuIG9mZmVyIHRv
IHJlc2h1ZmZsZSB0aGUgcGF0Y2hlcyBzbyB0aGlzIG9uZSBpcyBiZWZvcmUgIzUsIGJ1dCBub3Qg
bWVyZ2UgdGhlbS4KCkdvb2Qgb3B0aW9uLiBJIGxpa2UgaXQuCgotLSAKU2luY2VyZWx5LApBbmRy
aWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
