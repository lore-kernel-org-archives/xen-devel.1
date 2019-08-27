Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7729EC3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 09:07:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37B32206BF
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 09:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37B32206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2XRm-0006il-4c; Tue, 27 Aug 2019 09:07:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2XRk-0006ig-Ni
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:07:24 +0000
X-Inumbo-ID: 15168280-c8aa-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15168280-c8aa-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 09:07:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0401AAD82;
 Tue, 27 Aug 2019 09:07:23 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <c0e531fc665c9ad7595d853e2ce631a13974c022.camel@infradead.org>
 <5f867a0d-036f-9800-5347-7c4d109cce47@suse.com>
 <a2143ee639599afb848e168d0f741c5130f7a241.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c139b11c-a10a-3e13-ac0a-0ce28f31eef5@suse.com>
Date: Tue, 27 Aug 2019 11:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2143ee639599afb848e168d0f741c5130f7a241.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86/boot: Do not use trampoline for
 no-real-mode boot paths
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNzoyNSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OS0wOC0xMiBhdCAxMjo1NSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIw
MTkgMTc6MDIsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEBAIC05Nyw3ICsxMDAsNyBAQCBH
TE9CQUwodHJhbXBvbGluZV9yZWFsbW9kZV9lbnRyeSkKPj4+ICAgICAgICAgICBjbGQKPj4+ICAg
ICAgICAgICBjbGkKPj4+ICAgICAgICAgICBsaWR0ICAgIHRyYW1wc3ltKGlkdF80OCkKPj4+IC0g
ICAgICAgIGxnZHQgICAgdHJhbXBzeW0oZ2R0XzQ4KQo+Pj4gKyAgICAgICAgbGdkdGwgICB0cmFt
cHN5bShnZHRfNDgpCj4+Cj4+IFN0cmF5IC8gdW5yZWxhdGVkIGNoYW5nZSAoYW5kIGlmIG5lZWRl
ZCwgdGhlbiBhbHNvIGZvciBsaWR0KT8KPiAKPiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIDE2Yml0
IGwuZHQgYW5kIDMyLWJpdCBsLmR0bCBpcyB0aGF0IHRoZSBmb3JtZXIKPiBvbmx5IGxvYWRzIDI0
IGJpdHMgb2YgdGhlIGFjdHVhbCB0YWJsZSBhZGRyZXNzICh0cmFtcG9saW5lX2dkdCBpbiB0aGlz
Cj4gY2FzZSkuCj4gCj4gVGh1cywgd2hlbiB0cmFtcG9saW5lX2dkdCBpcyBiZWluZyB1c2VkIGlu
LXBsYWNlLCBhcyBpdCBpcyBkdXJpbmcgZWFybHkKPiBib290LCBhbmQgKmlmKiB0aGUgWGVuIGlt
YWdlIGlzIGxvYWRlZCBoaWdoZXIgdGhhbiAxNk1pQiwgbGdkdCBkb2Vzbid0Cj4gd29yay4gVGhh
dCdzIGhhbGYgYSBkYXkgb2YgbXkgbGlmZSBJIHdhbnQgYmFjay4KCkJ1dCBpc24ndCB0aGlzIGFu
IGlzc3VlIGV2ZW4gaW5kZXBlbmRlbnQgb2YgeW91ciBzZXJpZXM/IEkuZS4gZG9lc24ndAp0aGlz
IHdhbnQgdG8gYmUgZml4ZWQgaW4gYSBzZXBhcmF0ZSAodG8gYmUgYmFja3BvcnRlZCkgcGF0Y2g/
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
