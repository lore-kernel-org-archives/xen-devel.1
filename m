Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42D2C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:38:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CEE7206E0
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CEE7206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK2vZ-0001b7-4M; Fri, 26 Apr 2019 15:38:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK2vX-0001b2-KV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:38:15 +0000
X-Inumbo-ID: 4d979c38-6839-11e9-a886-976e35939363
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d979c38-6839-11e9-a886-976e35939363;
 Fri, 26 Apr 2019 15:38:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A84080D;
 Fri, 26 Apr 2019 08:38:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68363F5C1;
 Fri, 26 Apr 2019 08:38:11 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
Date: Fri, 26 Apr 2019 16:38:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
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
Message-ID: <20190426153810.WYw5EqBojRw0rAqrzSi_jtONtKLon1oZgGocq55n0x4@z>

SGkgSmFuLAoKT24gMjYvMDQvMjAxOSAxMDo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjYuMDQuMTkgYXQgMTE6MTksIDxKdWxpZW4uR3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDI2
LzA0LzIwMTkgMTA6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjUuMDQuMTkgYXQg
MjM6MjcsIDxKdWxpZW4uR3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMjUvMDQvMjAxOSAx
ODo1MSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IEZvciBhIGZpcnN0IHdlIG5lZWQg
dG8gZ2F0aGVyIGZlZWRiYWNrIGZyb20gY29udHJpYnV0b3JzIHRoYXQga25vdyBhIGJpdAo+Pj4+
IG1vcmUgb2YgdGhlIGNvZGUgdGhhdCBtYXkgYmUgYWZmZWN0ZWQuIEFGQUlDVCwgdGhlcmUgYXJl
IG9ubHkgdHdvIHBpZWNlcwo+Pj4+IHdoZXJlIHdlIGhhbmQgb3ZlciBtZW1vcnkgdG8gY29tbW9u
IGNvZGU6Cj4+Pj4gICAgICAgIC0gUERYOiBUaGUgcHJvYmxlbSBpcyBwYXNzaW5nIDAgdG8gcGR4
X2luaXRfbWFzaygpIHdpbGwgcmVzdWx0IHRvIGEKPj4+PiB+MCBtYXNrIGRlZmVhdGluZyB0aGUg
Y29tcHJlc3Npb24gbGF0ZXIgb24uCj4+Pgo+Pj4gT24geDg2IHRoZSBmdW5jdGlvbiBnZXRzIGNh
bGxlZCBvbmx5IGZvciBtZW1vcnkgYmxvY2tzIGFib3ZlIDRHYi4KPj4+IFF1ZXN0aW9uIGlzIHdo
ZXRoZXIgb24gQXJtIHlvdSBhbHNvIGhhdmUgc29tZSBhZCBob2MgYm91bmRhcnkKPj4+IGJlbG93
IHdoaWNoIHRoZXJlJ3Mgbm8gcG9pbnQgdG8gbG9vayBmb3IgYml0cyB0byBjb21wYWN0LiBJZiBu
b3QgSQo+Pj4gd29uZGVyIHdoeSB5b3UgY2FsbCB0aGUgZnVuY3Rpb24gYXQgYWxsOyBhdCB0aGUg
dmVyeSBsZWFzdCAoYXMgeW91Cj4+PiBzZWVtIHRvIGltcGx5KSBpdCBzaG91bGRuJ3QgYmUgY2Fs
bGVkIHdoZW4KPj4+IGJvb3RpbmZvLm1lbS5iYW5rWzBdLnN0YXJ0IGlzIHplcm8uCj4+Cj4+IFNv
IGhvdyBkb2VzIHRoZSBQRFggd29yayBmb3IgbWVtb3J5IGJlbG93IDRHQj8gRG8geW91IHN0aWxs
IGNhbGwKPj4gcGZuX3RvX3BkeCBvciB0aG9zZSBwYWdlcz8KPiAKPiBPZiBjb3Vyc2UuIFdlIG1l
cmVseSBuZXZlciBjb21wcmVzcyBhbnkgb2YgdGhlIGxvdyAzMiBhZGRyZXNzCj4gYml0cywgaS5l
LiBvdXIgY2hvaWNlIGlzIGxpbWl0ZWQgdG8gYWRkcmVzcyBiaXRzIDMyIC4uLiA1MS4KCkFoLCB0
aGUgY29kZSBtYWtlcyBhIGJpdCBtb3JlIHNlbnNlIG9uIHRoZSB4ODYgc2lkZS4gSXMgdGhlcmUg
YW55IHJlYXNvbiB0byAKbGltaXQgdG8gYWRkcmVzcyBiaXQgMzIgLi4gNTE/CgpGb3IgQXJtLCB3
ZSBjYW4ndCBjb21wcmVzcyBiaXRzIDAgLi4uIDMwIGR1ZSB0byB0aGUgYnVkZHkgYWxsb2NhdG9y
IChzZWUgCnBmbl9wZHhfaG9sZV9zZXR1cCkuIFNvIHdlIGNvdWxkIGlnbm9yZSB0aGUgZmlyc3Qg
MUdCIG9mIFJBTS4KCj4gCj4+Pj4gICAgICAgIC0gQnVkZHkgYWxsb2NhdG9yOiBKYW4gaGFzIGJl
ZW4gc3VnZ2VzdGluZyB0byBzdGljayBhIGNoZWNrIGluCj4+Pj4gaW5pdF94ZW5oZWFwX3BhZ2Vz
KCkuIFRoaXMgd291bGQgZ28gdGhlIG90aGVyIHVnbGluZXNzIGV4aXN0aW5nIHRvIGRlYWwKPj4+
PiB3aXRoIHRoZSBidWRkeSBhbGxvY2F0b3IuCj4+Pgo+Pj4gQW5kIHRoaXMgd291bGQgdGhlbiBh
bHNvIHRha2UgY2FyZSBvZiBmdXR1cmUgYXJjaGl0ZWN0dXJlcyBYZW4gbWF5Cj4+PiBnZXQgcG9y
dGVkIHRvLiAoTm8gaWRlYSB3aGF0IG90aGVyIHVnbGluZXNzIHlvdSByZWZlciB0by4pCj4+Cj4+
IFNlZToKPj4KPj4gLyoKPj4gICAgKiBZdWshIEVuc3VyZSB0aGVyZSBpcyBhIG9uZS1wYWdlIGJ1
ZmZlciBiZXR3ZWVuIFhlbiBhbmQgRG9tIHpvbmVzLCB0bwo+PiAgICAqIHByZXZlbnQgbWVyZ2lu
ZyBvZiBwb3dlci1vZi10d28gYmxvY2tzIGFjcm9zcyB0aGUgem9uZSBib3VuZGFyeS4KPj4gICAg
Ki8KPj4KPj4gQW5kIHRoZSAwIGlzIHlldCBhbm90aGVyIGhhY2sgZm9yIHRoZSBidWRkeSBhbGxv
Y2F0b3IuCj4gCj4gQWgsIHRoaXMgb25lLiBJcyB0aGlzIGFjdHVhbGx5IGFuIGlzc3VlIG9uIEFy
bTMyPyBpeDg2IG5lZWRlZAo+IHRvIGRlYWwgd2l0aCB0aGUgc2l0dWF0aW9uIGJlY2F1c2UgaXRz
IGRpcmVjdCBtYXAgcmFuZ2Ugd2FzCj4gMTJNYiBpbiBzaXplLCBpLmUuIG5vdCBhIHBvd2VyIG9m
IHR3by4gSWYgaXQncyBub3QgYW4gaXNzdWUgKEkKPiBjYW4ndCByZWFsbHkgZmlndXJlIGl0IG91
dCBjb25zaWRlcmluZyB0aGVyZSBhcmUgbm8gRElSRUNUTUFQXyoKPiBjb25zdGFudHMgZm9yIEFy
bTMyIGF0IGFsbCwgb25seSBYRU5IRUFQXyogb25lcyksIEknZCBzdWdnZXN0Cj4gcHV0dGluZyB0
aGlzIHVnbGluZXNzIGluIGFuICNpZmRlZiB1c2luZyBhIENPTkZJR18qIG9wdGlvbiBub3QKPiBz
ZWxlY3RlZCBieSBhbnkgcHJlc2VudGx5IHN1cHBvcnRlZCBhcmNoLgoKT24gQXJtMzIsIHRoZSBz
aXplIG9mIHRoZSB4ZW5oZWFwIGRlcGVuZHMgb24gdGhlIHBsYXRmb3JtLiBJdCBpcyBjYWxjdWxh
dGVkIGJ5IApzZXR1cF9tbSBpbiBhcmNoL2FybS9zZXR1cC5jLiBGcm9tIG15IHVuZGVyc3RhbmRp
bmcgaXQgbWF5IG5vdCBiZSBhIHBvd2VyIG9mIDIsIApzbyB3ZSB3b3VsZCBiZSBhZmZlY3RlZCBi
eSB0aGUgcHJvYmxlbSB5b3UgbWVudGlvbiBoZXJlLgoKTWF5IEkgYXNrIHdoeSBpdCBpcyBjdXJy
ZW50bHkgbm90IGJlIGFuIGlzc3VlIG9uIHg4Nj8gRG8geW91IGFsd2F5cyBwYXNzIGEgcG93ZXIg
Cm9mIDIgdG8gaW5pdF94ZW5oZWFwX3BhZ2VzPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
