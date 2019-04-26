Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D92EC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66FF7206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66FF7206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJxND-0005re-M5; Fri, 26 Apr 2019 09:42:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJxNC-0005rZ-62
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:42:26 +0000
X-Inumbo-ID: 982657ab-6807-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 982657ab-6807-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:42:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:42:23 -0600
Message-Id: <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:42:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
In-Reply-To: <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426094220.BhUmz3bUxWnAQLCvwxJOwyww9pZKO0ZOUqdV8eDmoZE@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDExOjE5LCA8SnVsaWVuLkdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI2LzA0LzIwMTkgMTA6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNS4wNC4x
OSBhdCAyMzoyNywgPEp1bGllbi5HcmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDI1LzA0LzIw
MTkgMTg6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IEZvciBhIGZpcnN0IHdlIG5l
ZWQgdG8gZ2F0aGVyIGZlZWRiYWNrIGZyb20gY29udHJpYnV0b3JzIHRoYXQga25vdyBhIGJpdAo+
Pj4gbW9yZSBvZiB0aGUgY29kZSB0aGF0IG1heSBiZSBhZmZlY3RlZC4gQUZBSUNULCB0aGVyZSBh
cmUgb25seSB0d28gcGllY2VzCj4+PiB3aGVyZSB3ZSBoYW5kIG92ZXIgbWVtb3J5IHRvIGNvbW1v
biBjb2RlOgo+Pj4gICAgICAgLSBQRFg6IFRoZSBwcm9ibGVtIGlzIHBhc3NpbmcgMCB0byBwZHhf
aW5pdF9tYXNrKCkgd2lsbCByZXN1bHQgdG8gYQo+Pj4gfjAgbWFzayBkZWZlYXRpbmcgdGhlIGNv
bXByZXNzaW9uIGxhdGVyIG9uLgo+PiAKPj4gT24geDg2IHRoZSBmdW5jdGlvbiBnZXRzIGNhbGxl
ZCBvbmx5IGZvciBtZW1vcnkgYmxvY2tzIGFib3ZlIDRHYi4KPj4gUXVlc3Rpb24gaXMgd2hldGhl
ciBvbiBBcm0geW91IGFsc28gaGF2ZSBzb21lIGFkIGhvYyBib3VuZGFyeQo+PiBiZWxvdyB3aGlj
aCB0aGVyZSdzIG5vIHBvaW50IHRvIGxvb2sgZm9yIGJpdHMgdG8gY29tcGFjdC4gSWYgbm90IEkK
Pj4gd29uZGVyIHdoeSB5b3UgY2FsbCB0aGUgZnVuY3Rpb24gYXQgYWxsOyBhdCB0aGUgdmVyeSBs
ZWFzdCAoYXMgeW91Cj4+IHNlZW0gdG8gaW1wbHkpIGl0IHNob3VsZG4ndCBiZSBjYWxsZWQgd2hl
bgo+PiBib290aW5mby5tZW0uYmFua1swXS5zdGFydCBpcyB6ZXJvLgo+IAo+IFNvIGhvdyBkb2Vz
IHRoZSBQRFggd29yayBmb3IgbWVtb3J5IGJlbG93IDRHQj8gRG8geW91IHN0aWxsIGNhbGwgCj4g
cGZuX3RvX3BkeCBvciB0aG9zZSBwYWdlcz8KCk9mIGNvdXJzZS4gV2UgbWVyZWx5IG5ldmVyIGNv
bXByZXNzIGFueSBvZiB0aGUgbG93IDMyIGFkZHJlc3MKYml0cywgaS5lLiBvdXIgY2hvaWNlIGlz
IGxpbWl0ZWQgdG8gYWRkcmVzcyBiaXRzIDMyIC4uLiA1MS4KCj4+PiAgICAgICAtIEJ1ZGR5IGFs
bG9jYXRvcjogSmFuIGhhcyBiZWVuIHN1Z2dlc3RpbmcgdG8gc3RpY2sgYSBjaGVjayBpbgo+Pj4g
aW5pdF94ZW5oZWFwX3BhZ2VzKCkuIFRoaXMgd291bGQgZ28gdGhlIG90aGVyIHVnbGluZXNzIGV4
aXN0aW5nIHRvIGRlYWwKPj4+IHdpdGggdGhlIGJ1ZGR5IGFsbG9jYXRvci4KPj4gCj4+IEFuZCB0
aGlzIHdvdWxkIHRoZW4gYWxzbyB0YWtlIGNhcmUgb2YgZnV0dXJlIGFyY2hpdGVjdHVyZXMgWGVu
IG1heQo+PiBnZXQgcG9ydGVkIHRvLiAoTm8gaWRlYSB3aGF0IG90aGVyIHVnbGluZXNzIHlvdSBy
ZWZlciB0by4pCj4gCj4gU2VlOgo+IAo+IC8qCj4gICAqIFl1ayEgRW5zdXJlIHRoZXJlIGlzIGEg
b25lLXBhZ2UgYnVmZmVyIGJldHdlZW4gWGVuIGFuZCBEb20gem9uZXMsIHRvCj4gICAqIHByZXZl
bnQgbWVyZ2luZyBvZiBwb3dlci1vZi10d28gYmxvY2tzIGFjcm9zcyB0aGUgem9uZSBib3VuZGFy
eS4KPiAgICovCj4gCj4gQW5kIHRoZSAwIGlzIHlldCBhbm90aGVyIGhhY2sgZm9yIHRoZSBidWRk
eSBhbGxvY2F0b3IuCgpBaCwgdGhpcyBvbmUuIElzIHRoaXMgYWN0dWFsbHkgYW4gaXNzdWUgb24g
QXJtMzI/IGl4ODYgbmVlZGVkCnRvIGRlYWwgd2l0aCB0aGUgc2l0dWF0aW9uIGJlY2F1c2UgaXRz
IGRpcmVjdCBtYXAgcmFuZ2Ugd2FzCjEyTWIgaW4gc2l6ZSwgaS5lLiBub3QgYSBwb3dlciBvZiB0
d28uIElmIGl0J3Mgbm90IGFuIGlzc3VlIChJCmNhbid0IHJlYWxseSBmaWd1cmUgaXQgb3V0IGNv
bnNpZGVyaW5nIHRoZXJlIGFyZSBubyBESVJFQ1RNQVBfKgpjb25zdGFudHMgZm9yIEFybTMyIGF0
IGFsbCwgb25seSBYRU5IRUFQXyogb25lcyksIEknZCBzdWdnZXN0CnB1dHRpbmcgdGhpcyB1Z2xp
bmVzcyBpbiBhbiAjaWZkZWYgdXNpbmcgYSBDT05GSUdfKiBvcHRpb24gbm90CnNlbGVjdGVkIGJ5
IGFueSBwcmVzZW50bHkgc3VwcG9ydGVkIGFyY2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
