Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F253BC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:31:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C274E2084F
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C274E2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK8R5-0007Hv-K9; Fri, 26 Apr 2019 21:31:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8R3-0007Hq-Ky
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:31:09 +0000
X-Inumbo-ID: 9a820410-686a-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9a820410-686a-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 21:31:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC037A78;
 Fri, 26 Apr 2019 14:31:07 -0700 (PDT)
Received: from [10.37.8.211] (unknown [10.37.8.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7271B3F557;
 Fri, 26 Apr 2019 14:31:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
Date: Fri, 26 Apr 2019 22:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 206497@studenti.unimore.it,
 xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426213104.CfppKGB-9saUKpW3fl8idIJeNSLzDgpAaelisGWzgKk@z>

SGksCgpPbiA0LzI2LzE5IDQ6NDggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI2LjA0
LjE5IGF0IDE3OjM4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAyNi8wNC8y
MDE5IDEwOjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI2LjA0LjE5IGF0IDExOjE5
LCA8SnVsaWVuLkdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IFNvIGhvdyBkb2VzIHRoZSBQRFgg
d29yayBmb3IgbWVtb3J5IGJlbG93IDRHQj8gRG8geW91IHN0aWxsIGNhbGwKPj4+PiBwZm5fdG9f
cGR4IG9yIHRob3NlIHBhZ2VzPwo+Pj4KPj4+IE9mIGNvdXJzZS4gV2UgbWVyZWx5IG5ldmVyIGNv
bXByZXNzIGFueSBvZiB0aGUgbG93IDMyIGFkZHJlc3MKPj4+IGJpdHMsIGkuZS4gb3VyIGNob2lj
ZSBpcyBsaW1pdGVkIHRvIGFkZHJlc3MgYml0cyAzMiAuLi4gNTEuCj4+Cj4+IEFoLCB0aGUgY29k
ZSBtYWtlcyBhIGJpdCBtb3JlIHNlbnNlIG9uIHRoZSB4ODYgc2lkZS4gSXMgdGhlcmUgYW55IHJl
YXNvbiB0bwo+PiBsaW1pdCB0byBhZGRyZXNzIGJpdCAzMiAuLiA1MT8KPiAKPiBXZWxsLCB0aGVy
ZSBiZWluZyB2YXJpb3VzIHNwZWNpYWwgdGhpbmdzIGltbWVkaWF0ZWx5IGJlbG93IDRHYgo+IHRo
ZXJlJ3Mgc2ltcGx5IGxpdHRsZSBwb2ludCBpbiB0cnlpbmcgdG8gc3F1YXNoIGFueSBvZiB0aGUg
bG93ZXIgYml0cy4KPiAKPj4gRm9yIEFybSwgd2UgY2FuJ3QgY29tcHJlc3MgYml0cyAwIC4uLiAz
MCBkdWUgdG8gdGhlIGJ1ZGR5IGFsbG9jYXRvciAoc2VlCj4+IHBmbl9wZHhfaG9sZV9zZXR1cCku
IFNvIHdlIGNvdWxkIGlnbm9yZSB0aGUgZmlyc3QgMUdCIG9mIFJBTS4KPiAKPiBCaXRzIDAgLi4u
IDMwIHdvdWxkIGJlIHRoZSBmaXJzdCAyR2IgYWZhaWN0LgoKU29ycnkgSSBtZXNzZWQgdXMgbXkg
bWF0aHMuIEkgbWVhbnQgMCAuLi4gMjkgKE1BWF9PUkRFUiA9IDE4KS4KCkBTdGVmYW5vLCBkbyB5
b3UgdGhpbmsgeW91IGNhbiBoYXZlIGEgbG9vayBhdCBpdD8KCj4gCj4+Pj4gU2VlOgo+Pj4+Cj4+
Pj4gLyoKPj4+PiAgICAgKiBZdWshIEVuc3VyZSB0aGVyZSBpcyBhIG9uZS1wYWdlIGJ1ZmZlciBi
ZXR3ZWVuIFhlbiBhbmQgRG9tIHpvbmVzLCB0bwo+Pj4+ICAgICAqIHByZXZlbnQgbWVyZ2luZyBv
ZiBwb3dlci1vZi10d28gYmxvY2tzIGFjcm9zcyB0aGUgem9uZSBib3VuZGFyeS4KPj4+PiAgICAg
Ki8KPj4+Pgo+Pj4+IEFuZCB0aGUgMCBpcyB5ZXQgYW5vdGhlciBoYWNrIGZvciB0aGUgYnVkZHkg
YWxsb2NhdG9yLgo+Pj4KPj4+IEFoLCB0aGlzIG9uZS4gSXMgdGhpcyBhY3R1YWxseSBhbiBpc3N1
ZSBvbiBBcm0zMj8gaXg4NiBuZWVkZWQKPj4+IHRvIGRlYWwgd2l0aCB0aGUgc2l0dWF0aW9uIGJl
Y2F1c2UgaXRzIGRpcmVjdCBtYXAgcmFuZ2Ugd2FzCj4+PiAxMk1iIGluIHNpemUsIGkuZS4gbm90
IGEgcG93ZXIgb2YgdHdvLiBJZiBpdCdzIG5vdCBhbiBpc3N1ZSAoSQo+Pj4gY2FuJ3QgcmVhbGx5
IGZpZ3VyZSBpdCBvdXQgY29uc2lkZXJpbmcgdGhlcmUgYXJlIG5vIERJUkVDVE1BUF8qCj4+PiBj
b25zdGFudHMgZm9yIEFybTMyIGF0IGFsbCwgb25seSBYRU5IRUFQXyogb25lcyksIEknZCBzdWdn
ZXN0Cj4+PiBwdXR0aW5nIHRoaXMgdWdsaW5lc3MgaW4gYW4gI2lmZGVmIHVzaW5nIGEgQ09ORklH
Xyogb3B0aW9uIG5vdAo+Pj4gc2VsZWN0ZWQgYnkgYW55IHByZXNlbnRseSBzdXBwb3J0ZWQgYXJj
aC4KPj4KPj4gT24gQXJtMzIsIHRoZSBzaXplIG9mIHRoZSB4ZW5oZWFwIGRlcGVuZHMgb24gdGhl
IHBsYXRmb3JtLiBJdCBpcyBjYWxjdWxhdGVkIGJ5Cj4+IHNldHVwX21tIGluIGFyY2gvYXJtL3Nl
dHVwLmMuIEZyb20gbXkgdW5kZXJzdGFuZGluZyBpdCBtYXkgbm90IGJlIGEgcG93ZXIgb2YgMiwK
Pj4gc28gd2Ugd291bGQgYmUgYWZmZWN0ZWQgYnkgdGhlIHByb2JsZW0geW91IG1lbnRpb24gaGVy
ZS4KPj4KPj4gTWF5IEkgYXNrIHdoeSBpdCBpcyBjdXJyZW50bHkgbm90IGJlIGFuIGlzc3VlIG9u
IHg4Nj8gRG8geW91IGFsd2F5cyBwYXNzIGEgcG93ZXIKPj4gb2YgMiB0byBpbml0X3hlbmhlYXBf
cGFnZXM/Cj4gCj4gTm8sIGl0J3MgYmVjYXVzZSBDT05GSUdfU0VQQVJBVEVfWEVOSEVBUCBpcyB1
bmRlZmluZWQgb24KPiAoNjQtYml0KSB4ODYsIGkuZS4gdGhlcmUgc2ltcGx5IGlzIG5vIGJvdW5k
YXJ5IGJldHdlZW4gYm90aCBoZWFwcy4KCk9oLCBzb21laG93IEkgdGhvdWdodCBpdCB3YXMgc2Vw
YXJhdGVkLiBPaywgc28gSSB3b3VsZCBrZWVwIHRoZSBjb2RlIGFzIAppcyBpbiBpbml0X3hlbmhl
YXBfcGFnZXMgdGhlbi4KCkJ1dCBpdCBvY2N1cmVkIHRvIG1lIHRoYXQgd2UgbWF5IHdhbnQgdG8g
cHV0IHRoZSBjaGVjayBpbiAKaW5pdF9oZWFwX3BhZ2VzKCkgcmF0aGVyIHRoYW4gaW5pdF94ZW5o
ZWFwX3BhZ2VzKCkgYXMgd2UgYWxzbyB3YW50IHRvIApjb3ZlciBkb21oZWFwLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
