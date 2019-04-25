Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB94C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 08:55:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057C1218B0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 08:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057C1218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJaAM-0008HB-NN; Thu, 25 Apr 2019 08:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJaAL-0008Gz-Lz
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 08:55:37 +0000
X-Inumbo-ID: e350cd24-6737-11e9-9dc5-3f06d8470133
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e350cd24-6737-11e9-9dc5-3f06d8470133;
 Thu, 25 Apr 2019 08:55:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FABDAD51;
 Thu, 25 Apr 2019 08:55:34 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNDIzMTA1NDU3LjE3NTAy77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?Q?=2ecom=3e_=3c20190423105457=2e17502-2-jgross=40suse=2ecom=3e_=3c5?=
 =?UTF-8?Q?CC175950200007800228E80=40suse=2ecom=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <38c2907c-2749-e66c-1279-7d74bc20bc35@suse.com>
Date: Thu, 25 Apr 2019 10:55:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDQvMjAxOSAxMDo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDQuMTkg
YXQgMTI6NTQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCj4+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPj4gQEAgLTM2
MCw4ICszNjAsOCBAQCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3
ZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCj4+ICAJLyogQ29udmVydCB0aGUgc2l6ZSB0
byBhY3R1YWxseSBhbGxvY2F0ZWQuICovCj4+ICAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5f
UEFHRV9TSElGVCk7Cj4+ICAKPj4gLQlpZiAoKChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9t
YXNrKSkgfHwKPj4gLQkgICAgcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6
ZSkpCj4+ICsJaWYgKChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9tYXNrKSAmJgo+PiArCSAg
ICAhV0FSTl9PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkpCj4+
ICAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKPiAKPiBPbiB0
aGUgYWxsb2NhdGlvbiBzaWRlIHdlIGhhdmUKPiAKPiAJaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0g
MSA8PSBkbWFfbWFzaykpICYmCj4gCSAgICAhcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnko
cGh5cywgc2l6ZSkpCj4gCQkqZG1hX2hhbmRsZSA9IGRldl9hZGRyOwo+IAllbHNlIHsKPiAJCWlm
ICh4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyLAo+IAkJCQkJCSBmbHM2
NChkbWFfbWFzayksIGRtYV9oYW5kbGUpICE9IDApIHsKPiAJCQl4ZW5fZnJlZV9jb2hlcmVudF9w
YWdlcyhod2Rldiwgc2l6ZSwgcmV0LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7Cj4gCQkJcmV0
dXJuIE5VTEw7Cj4gCQl9Cj4gCX0KPiAKPiB3aGljaCBpcyAoYXMgZmFyIGFzIHRoZSBmdW5jdGlv
biBjYWxsIGlzIGNvbmNlcm5lZCkKPiAKPiAJaWYgKChkZXZfYWRkciArIHNpemUgLSAxID4gZG1h
X21hc2spIHx8Cj4gCSAgICByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXpl
KSkKPiAJCXhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24oLi4uKTsKPiAKPiBTbyBJIGRvbid0
IHRoaW5rIHlvdXIgdHJhbnNmb3JtYXRpb24gaXMgY29ycmVjdC4gRXZlbiB3b3JzZSwgYm90aAo+
IHBhcnRzIG9mIHRoZSBjb25kaXRpb24gaW4geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpIGFj
dCBvbiBhbgo+IGFkZHJlc3MgdGhhdCBpcyB0aGUgX3Jlc3VsdF8gb2YgdGhlIHByaW9yCj4geGVu
X2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpLCBpLmUuIHRoZSBhZGRyZXNzIHNob3VsZCBhbHdh
eXMKPiBtYXRjaCBfYm90aF8gY3JpdGVyaWEgYW55d2F5LiBXaGVyZWFzIHdoYXQgeW91IHJlYWxs
eSB3YW50IGlzCj4gdW5kbyB0aGUgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpIG9ubHkg
d2hlbiBpdCBhY3R1YWxseQo+IHdhcyBjYWxsZWQuIE90aGVyd2lzZSB5b3UgYWxzbyBzaGF0dGVy
IGNvbnRpZ3VvdXMgYWxsb2NhdGlvbnMKPiB0aGF0IHdlcmUgY29udGlndW91cyBhbHJlYWR5IGZv
ciBvdGhlciByZWFzb25zIChwZXJoYXBzIGp1c3QKPiBsdWNrKS4KClllcywgdGhhdCBpcyB3aGF0
IHBhdGNoIDMgZG9lcy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
