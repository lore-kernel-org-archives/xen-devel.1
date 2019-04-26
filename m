Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EA0C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:19:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1209C2077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 13:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1209C2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK0lK-0006ya-2C; Fri, 26 Apr 2019 13:19:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK0lI-0006yM-JM
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:19:32 +0000
X-Inumbo-ID: ecf64e66-6825-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ecf64e66-6825-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 13:19:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5B8A78;
 Fri, 26 Apr 2019 06:19:30 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9F383F246;
 Fri, 26 Apr 2019 06:19:29 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
Date: Fri, 26 Apr 2019 14:19:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
Content-Language: en-US
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426131928.EGe3zreH799eQuMPcyVfHT8XLvgIzIsvYQCQN5-V_zE@z>

CgpPbiAyNi8wNC8yMDE5IDEyOjU4LCBBbWl0IFRvbWVyIHdyb3RlOgo+IEhlbGxvLAoKSGksCgo+
IAo+PiBDb3VsZCB3ZSBpbnN0ZWFkIHRyeSB0byBhdXRvbWF0aWNhbGx5IGJsYWNrbGlzdCBhbnkg
ZGV2aWNlIHVzaW5nIFBQST8KPiAKPiBKdXN0IHRlc3RlZCBmb2xsb3dpbmcgY2hhbmdlOgo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKPiBpbmRleCBkOTgzNjc3Li4wYzgyOTc2IDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwo+IEBAIC0xMjg5LDYgKzEyODksMTAgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX2Rl
dmljZShzdHJ1Y3QgZG9tYWluCj4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+ICAg
ICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAgICAgICAgICAgfQo+IAo+ICsgICAgICAgIC8qIERv
bid0IHByb2Nlc3MgZGV2aWNlIHVzaW5nIFBQSSBzb3VyY2UgKi8KPiArICAgICAgICBpZiAoIHJl
cyA+IDE2ICYmIHJlcyA8IDMyKQo+ICsgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gICAgICAg
ICAgIHJlcyA9IG1hcF9pcnFfdG9fZG9tYWluKGQsIHJlcywgbmVlZF9tYXBwaW5nLCBkdF9ub2Rl
X25hbWUoZGV2KSk7Cj4gICAgICAgICAgIGlmICggcmVzICkKPiAgICAgICAgICAgICAgIHJldHVy
biByZXM7Cj4gCj4gV291bGQgaXQgYmUgT2sgPwoKV2VsbCwgdGhpcyBkb2VzIG5vdCB3b3JrIHBy
b3Blcmx5LiBUaGUgRFQgbm9kZSB3aWxsIHN0aWxsIGJlIHdyaXR0ZW4gaW4gdGhlIApkb21haW4g
YmVjYXVzZSBoYW5kbGVfZGV2aWNlKCkgcmV0dXJuIDAuIEhvd2V2ZXIsIHRoZSBkZXZpY2Ugd2ls
bCBiZSBoYWxmIG1hcHBlZCAKcmVzdWx0aW5nIHRvIGNyYXNoIGxhdGVyIG9uLgoKVGhlIHByb3Bl
ciB3YXkgaXMgdG8gZGV0ZWN0IFBQSSBiZWZvcmUgaGFuZCBhbmQgY29tcGxldGVseSBza2lwIHRo
ZSBub2RlIGlmIGFueS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
