Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BBBC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D81EF206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhYmEcB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D81EF206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJigC-000688-SI; Thu, 25 Apr 2019 18:01:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJigB-00067T-6X
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:03 +0000
X-Inumbo-ID: 16119673-6784-11e9-843c-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16119673-6784-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:01:02 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q66so454112ljq.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j66pUHPnCOEIY2YH7S9FY82W015PpaAOeFd20r9JvLY=;
 b=YhYmEcB9S6q57muVtMYOb6kC4wufK4KX1TV071qCnnRZgf7jXJpYUS9ojmC1MZp/Yt
 TawWIII6ojSmVntWjcMeSzPCGQN51BQYHTXEQxIxbLhLm0gESR/+MgDnW07Z5uZ4yfYS
 nrQY7FlSGzNjeiDrBZdqH6kSrA+rOuyWWWIZTRxnpWmkRgl/44d2oBx+B9JZdS9mYlh8
 afkEjlx0b8DX1jW+OX7k5KArQHuXISTYoD0k8CTsU7w6k7i9zqR6lZny7Snr45L7NJ1w
 ji3zwayAlF0DUlB56G/mSdJ2LBTOQubrsngWlcudmfYU0lPdgGvh438hnYN+JLchMq2I
 qkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j66pUHPnCOEIY2YH7S9FY82W015PpaAOeFd20r9JvLY=;
 b=ikT88xvBRCwmCId6zAJe5IQhEcJtWUrcrQmpzCrZNWrSzsgDjFiJdf7B42F7iQPB8x
 Pi0kBbMeItZNHT9OllJbdlMvCpBOUFjEYBhGYpSBv7gXR35UOQr0AxjZFu1J2FDoTe7s
 PNzzpcvClF/2Hc0Qn+Fps9MjmE++C73prKyCvUitz2iWLYSCnJQLHI6U7CzvkD0fPMIo
 6JseOP82HxnYd4iOro9WrI9wHu1tc+lmPRUThpj6+CE4R0Rv9XziUgDsAIwgHtnz5DvH
 HCWOTR62MzE988luKcv11rEMTrFqJsD1Evs4EHE/ehm4LraJYJbZD1PpO8bc6oawwFhg
 jBjA==
X-Gm-Message-State: APjAAAUQnQk91dNefsh73DwIx3HSubCWxfc/NDv8gPeWHxge6ZLHFNL/
 1y40oJCUn+MoJ3s+Vnkodfk=
X-Google-Smtp-Source: APXvYqwi5qvHuHeYLpvTVPFVSesEXXjKOE4xHPu4N8iyLAOVve9XOtBmEs/G6f9BEInlu7nL2efINQ==
X-Received: by 2002:a2e:9993:: with SMTP id w19mr1937070lji.111.1556215261050; 
 Thu, 25 Apr 2019 11:01:01 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 i24sm4745923ljb.31.2019.04.25.11.00.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:01:00 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-5-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <9462a961-0ed5-8aa3-46cb-3b2b0c3c6b1d@gmail.com>
Date: Thu, 25 Apr 2019 21:00:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417175815.16905-5-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
Message-ID: <20190425180059.xjxoNkgSJNiIpVEu91iTpG5Fx0b9R8TjJEFhaj_7O2k@z>

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vdyB0aGF0IHdlIGRy
b3BwZWQgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCksIHdlIGhhdmUgb25seSBvbmUgc2V0IG9m
Cj4gaGVscGVycyBhY3Rpbmcgb24gWGVuIFRMQnMuIFRoZXJlIG5hbWluZyBhcmUgcXVpdGUgY29u
ZnVzaW5nIGJlY2F1c2UgdGhlCj4gVExCIGluc3RydWN0aW9ucyB1c2VkIHdpbGwgYWN0IG9uIGJv
dGggRGF0YSBhbmQgSW5zdHJ1Y3Rpb24gVExCcy4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0
byByZXdvcmsgdGhlIGRvY3VtZW50YXRpb24gdGhhdCBjYW4gYmUgY29uZnVzaW5nCj4gdG8gcmVh
ZCBhcyB0aGV5IGRvbid0IG1hdGNoIHRoZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBMYXN0bHksIHN3
aXRjaCBmcm9tIHVuc2lnbmVkIGxvbnQgdG8gdmFkZHJfdCBhcyB0aGUgZnVuY3Rpb24gdGVjaG5p
Y2FsbHkKPiBkZWFsIHdpdGggdmlydHVhbCBhZGRyZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
