Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72BFC10F11
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:12:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B6520833
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxSEXl78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B6520833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFwiZ-0008A3-Hj; Mon, 15 Apr 2019 08:11:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ba4r=SR=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hFwiY-00089s-EI
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:11:54 +0000
X-Inumbo-ID: 20a54e90-5f56-11e9-92d7-bc764e045a96
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20a54e90-5f56-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 08:11:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id v7so12984878oie.8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ssl4jhvi9lPYhQbn21DdtgJl6sZm+1lZXCuA5CdYzFY=;
 b=sxSEXl78jmH8c9jmmF4/2uJQc+MQK4Kxe9fkMg3Cw/6pb4E3G1c8bIUhAPHq6j5/EN
 zzfuzjmqlksA9Je0wnaOQJmBkqiq698AjaGfbwkmYwPTP+Kl46roNvKxUPXTo9Gp6HA7
 5lu3s7Q5ulO5i9SAms4kMZCa6tx1D6AQQN81BOQwsDHJDZ9xZ0zT/5TP72voraFy+DMn
 agNNoMHrgV0KhFwr3l4qzI72zuVN9J3Ed5ZWyR04+xxJjPB5gFSMD4TuRc8AG5PwwtD2
 P58InFPPXOhU8NL4DwLZBUzIV2NMn47TBNA5iWGcwdIdEl3pi3kKTK1Ec+8rlKr0Zpdo
 MZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ssl4jhvi9lPYhQbn21DdtgJl6sZm+1lZXCuA5CdYzFY=;
 b=DdQaVEoRR5BGklxkG6XRLhaTteihyYKfcj0rAzph/ITZ5hViDOw8oQJ2UgjEK1i83y
 mDA9Sof9y+8o9sIY92bnlKd0S89h3/680GSlKZMDVY80ystZg9AICM7qY8HrPWvxniNW
 D5w4BXx7A8KZ9rTGVUP1cab7TyYd+KLrdAsOHwz3IJzIBA6hbHHrRaG5Qo1TU9o1u3vq
 AV6Tdl9YrJDvISo+x+gJNUy1Im0XjwgB/kN1+kXXcjxW+9a8OxgBdtPQJN3RtuMkXZ6F
 RTMQIIBVLxRED37luSJng6fyHAsB4dvVguw7+XNwY+V1XQibQS3xrpG9fACCb6Dmq5ml
 nhaQ==
X-Gm-Message-State: APjAAAUku+qomtq3k3v//EAm7RKV8+aoo5XJ/8dwwkp7alNM6MLNrPG1
 S1txEkPVFjem2e+EBjV8UclZ+LRsoQbcxaxy3ec=
X-Google-Smtp-Source: APXvYqyY+OwEZc0zCWJtvTmcyLxVSYo2YhAfxog9wU69Jtn0sDi3XWMljaAQ34bjW7YwmhIAExLUW8n5SPwJpzR+e6s=
X-Received: by 2002:aca:f2c2:: with SMTP id
 q185mr19064963oih.147.1555315912768; 
 Mon, 15 Apr 2019 01:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
In-Reply-To: <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Mon, 15 Apr 2019 13:41:41 +0530
Message-ID:
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415081141.xZ8QwN5N-GT31UXvYIRwLUh8fO3I1Yiph09ikjuINKI@z>

SGVsbG8sCgo+IEFmdGVyIHRhbGtpbmcgdmlhIElSQywgdGhlIHByb2JsZW0gaXMgUFBJcywgdGhh
dCB0aGlzIHBsYXRmb3JtIHVzZXMgZm9yCj4gUE1VIGludGVycnVwdHMuIFdoZW4gWGVuIHRyaWVz
IHRvIHNldHVwIHRoZSBJUlEgZm9yd2FyZGluZyBmb3IgRG9tMCBmb3IKPiB0aGlzIGRldmljZSwg
aXQgZmFpbHMgYmVjYXVzZSBpdCBvbmx5IHN1cHBvcnRzIGZvcndhcmRpbmcgU1BJcy4KPiBTbyBp
bnRlcmVzdGluZ2x5IHdlIGVycm9uZW91c2x5IGZvcndhcmRlZCBBNTMgUE1VcyAodGhvc2UgdGhh
dCBhcmUKPiBkZXNjcmliZWQgYnkgdGhhdCBwYXJ0aWN1bGFyIGNvbXBhdGlibGUgc3RyaW5nIG9u
bHkpIHRvIERvbTAgZm9yIHF1aXRlIGEKPiB3aGlsZSwgYnV0IG5vYm9keSBub3RpY2VkIChvciBj
YXJlZCkuCj4KPiBBbWl0LCBwbGVhc2UgYWRqdXN0IHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRp
bmdseS4KPgpPayBidXQgb3JpZ2luYWwgY29tbWl0ICJkNDVlOWI3YzUzNDI4YTJhYTRkMDY3OTI3
ZTdlZjVlMzA3ODNmYjhiIiB0aGF0IGJsYWNrbGlzdApQTVUncyBjbGVhcmx5IHN0YXRlcyB0aGF0
IGlzc3VlIGlzIGR1ZSB0byBQUEkgYW5kIHRoYXQgY2FuIG5vdCBiZQpyb3V0ZWQgdG8gZ3Vlc3Qu
CgpJIHRob3VnaHQsIFRoaXMgcGF0Y2ggaXMganVzdCBjb250aW51YXRpb24gb2Ygc2FtZS4KClRo
YW5rcwotQW1pdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
