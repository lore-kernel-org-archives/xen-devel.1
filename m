Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D06DC04A6B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 12:49:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF8D20830
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 12:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0hOvq76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF8D20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd3S-0007n8-CM; Mon, 06 May 2019 12:49:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3Q-0007m5-Iu
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:12 +0000
X-Inumbo-ID: 57cd3211-6ffd-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57cd3211-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:49:11 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h21so10910733ljk.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQoRTxSeXGZjd2bxUllBeDIXLU4nmoROKOj1mtcgJCc=;
 b=W0hOvq76DvkiPjJcuv/1eeIH61h6kr+p8gmiLVsKWUF8v9tIBVVC3kMy7dWNCr2xbf
 y5z6Glj4TnVgwYGsq5Srrzy7x74+ZzEZBpKKPHjR7WXYNEwBfkpFpFSqJQKD31yk4smw
 dGANqHjKDs6Ef47Mi4VZG9vy4YFGd7+5eFlI46LvtN06UAgaDAoyrWX4dEuRw5kTb5Bd
 V0AFyrCrg+9F5eyRJYpvGZBLTn59SHUjZh4dCc/Es/uykFxR6RODiIea10b4A3vcDAUs
 z2sgiEKYEfhaR/tweV7DyLMEtkzH2NZcQYQSS3vARf8Gj1NiWIObVRQJBpZojOOemj6G
 qL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQoRTxSeXGZjd2bxUllBeDIXLU4nmoROKOj1mtcgJCc=;
 b=eo46WNlAJdecmqcICOwurkq344AVcqVAbjtsIWfRplZkEUOReUIVa17BYJrup34A6J
 ViR4E/o3fZFV9PWDwGz2xFra3qgZLDXxUZHXjk41AixWXEhqYAwmCIbTYAb65YskFZAR
 pzXjizq2Ml6p6PXJKqaiWSCLOsBpbNJEPTFL+AjCUzd7h+hUy3EzvcjCP0HVSruh/d8/
 N6tV1828yLP/85BPVxJn3muPsMjB2qZ2VzaOZVT0orkzFLvTUu50l/VZIfaU4dAa2ZwC
 j020UgzS9Ufgfs5Fs9tIYBiO6o2gMWynpRvgAZ1fzh7xyOvjmAVB7wZv48ypofYRAkQd
 5jHQ==
X-Gm-Message-State: APjAAAWwWQtxnn5KZVM/9pUl2k2AGlW3vGk7I6fbr4i5qvTDxK+x8bP/
 4qXe26KUOVhHmOug/E0NFvln0qoHbRc=
X-Google-Smtp-Source: APXvYqzfX2g9AH9VTj8nfgFc24cYsdkW2i/8jRGNufxaG8NhjXtrX9fKf40kmBbmNwNo8iWcZBK5DA==
X-Received: by 2002:a2e:84ca:: with SMTP id q10mr45098ljh.117.1557146949687;
 Mon, 06 May 2019 05:49:09 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 f15sm2393333lfm.43.2019.05.06.05.49.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:49:09 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-12-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <be9f8a35-8747-5934-eb81-63549b2478c1@gmail.com>
Date: Mon, 6 May 2019 15:49:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-12-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/12] xen/arm: mm: Don't open-code Xen PT
 update in {set, clear}_fixmap()
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
Message-ID: <20190506124908.quaJPVANFYW00on40DRXCt_PdusolQF08wPSCaKV4uA@z>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHtzZXQsIGNsZWFyfV9m
aXhtYXAoKSBhcmUgY3VycmVudGx5IG9wZW4tY29kaW5nIHVwZGF0ZSB0byB0aGUgWGVuCj4gcGFn
ZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdlbmVyaWMgaGVscGVy
cwo+IG1hcF9wYWdlc190b194ZW4oKSBhbmQgZGVzdHJveV94ZW5fbWFwcGluZ3MoKS4KPiAKPiBC
b3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5jZSB0aGUg
QlVHX09OKCkKPiBjaGVja2luZyB0aGUgcmV0dXJuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
