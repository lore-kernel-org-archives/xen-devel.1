Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DCFC04AAB
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:20:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889062082F
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 08:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU2FKMLg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889062082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYrX-0007oi-VN; Mon, 06 May 2019 08:20:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYrW-0007oa-Uy
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:20:38 +0000
X-Inumbo-ID: d35e2198-6fd7-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d35e2198-6fd7-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:20:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z124so2340060lfd.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DpiVHWdTrvDIZEq8bR5TzrsDDk+kGvbTek5ZrjnP7bQ=;
 b=gU2FKMLgblExT6N2u10PxB30Wj5QVZQfLofHkiexbCJvoQOMYVX7/Lz6NjUoqtOvLU
 ZFn16rsfGl4iPEdX95AhQHNp9duk4UWwxCO9AJTW8nWof7bPkvAtA+Fw0BXfrI2/USPx
 G7/NZT1ucbbzdNkqYvosFx8a0+cg2NLfkICy67FedNMXV2EoRhKx7XJ3RJ+dXppisOlN
 sscwjMgJbu+k3Jh3n9sHFN4bV6aM4eGkN3frccGtiF4olBgJcPoGWk0VSwX6wVciFQXt
 C9cQHJlgcj2AR5EfDZNDXQNGTHQmlGu2lhC06cWrWWx1HPx250UYdAxPVlH96jXldfbl
 IP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DpiVHWdTrvDIZEq8bR5TzrsDDk+kGvbTek5ZrjnP7bQ=;
 b=TKJRryEISX9EY2NuKuzCmNiJk+aysNrrOv0I9j7omaT4+Cl8dFJ/y5JwPH6vg5Jdme
 8VUQXHsIfeV6C1uSBKLus1DwafnvJczTTzvZcSCo4yFhpMf5Bo5+HBNGomayalqzVwh0
 YiosnigdQBVhxLFqn0jDKE6ovi/KYox87JnwMCJS0JV+meAKx6K7dCJR4qJmnQWvDrnK
 Yxggx3heyyOjdHYaufYS/+EBTO9CWbhzlK7vw4p8e8VRRPWfSnm/KxkehLYGYHLyFTmX
 Pn7VGrqLWi6XouswNiLOwfn2Brm4D9ybv6O3QaSwZL3ceU91GLdV7eDwGIKVMohi+xld
 b/JQ==
X-Gm-Message-State: APjAAAXoHMRXFU8vF1a6Mx2IA//h3O0bPiElrgVYxQQ22KTIi4EY+l/4
 Z8bMd63rPpsbbEdduUrpMng=
X-Google-Smtp-Source: APXvYqzthHNOAnmxcIFP8dwBNfWWe1dJgVMpNqoYuR0nJ7gmVCnjEFfVcioh4DuwqklUBc28WJrgxg==
X-Received: by 2002:a19:550d:: with SMTP id n13mr12046583lfe.127.1557130836173; 
 Mon, 06 May 2019 01:20:36 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 j6sm2395276ljc.0.2019.05.06.01.20.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 01:20:35 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <907cbeac-4904-bc28-b09e-3a68ce6c2c37@gmail.com>
Date: Mon, 6 May 2019 11:20:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-17-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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
Message-ID: <20190506082034.qmTJKN6WYduOYJHRv80uaZRB8NCUYzt1QdRfur12VD4@z>

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMgbWF5IGJlIGNvbmN1cnJlbnRseSBjYWxsZWQuIFNvIHdlIG5lZWQK
PiB0byBwcm90ZWN0IHdpdGggYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0aW9uIHRoZSBwYWdl
LXRhYmxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5j
b20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
