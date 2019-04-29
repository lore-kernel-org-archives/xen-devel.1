Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA8DC43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 15:19:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762E42063F
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 15:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762E42063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL83T-0005x1-SJ; Mon, 29 Apr 2019 15:18:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL83S-0005ww-E7
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:18:54 +0000
X-Inumbo-ID: 18bee938-6a92-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18bee938-6a92-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:18:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 09:18:50 -0600
Message-Id: <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 09:18:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
In-Reply-To: <20190426172138.14669-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429151847.7OcX7GKJMY8liqtS98GnBN4nwQTO2msQ7C5emdjw-yk@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
UGF0Y2ggY2Y0YjMwZGNhMGEgIkFkZCBkZWJ1ZyBjb2RlIHRvIGRldGVjdCBpbGxlZ2FsIHBhZ2Vf
bG9jayBhbmQgcHV0X3BhZ2VfdHlwZQo+IG9yZGVyaW5nIiBhZGRlZCBleHRyYSBzYW5pdHkgY2hl
Y2tpbmcgdG8gcGFnZV9sb2NrL3BhZ2VfdW5sb2NrIGZvciBkZWJ1ZyBidWlsZHMKPiB3aXRoIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgbm8gaHlwZXJ2aXNvciBwYXRoIGV2ZXIgbG9ja3MgdHdvIHBhZ2Vz
IGF0IG9uY2UuCj4gCj4gVGhpcyBhc3N1bXB0aW9uIGRvZXNuJ3QgaG9sZCBkdXJpbmcgbWVtb3J5
IHNoYXJpbmcgc28gd2UgaW50cm9kdWNlIHNlcGFyYXRlCj4gZnVuY3Rpb25zLCBwYWdlX2xvY2tf
bWVtc2hyIGFuZCBwYWdlX3VubG9ja19tZW1zaHIsIHRvIGJlIHVzZWQgZXhjbHVzaXZlbHkKPiBp
biB0aGUgbWVtb3J5IHNoYXJpbmcgc3Vic3lzdGVtLgoKQ29tcGxldGVseSBieXBhc3NpbmcgdGhl
c2UgY2hlY2tzIGxvb2tzIHVuZGVzaXJhYmxlIHRvIG1lLCB0bwpiZSBob25lc3QuIE90b2ggYXMg
ZGlzY3Vzc2VkIG1lbS1zaGFyaW5nIGlzIGFidXNpbmcgdGhlIGxvY2sKYW55d2F5LiBTbyBpZiB0
aGlzIGlzIHRvIHJlbWFpbiB0aGF0IHdheSwgSSB3b25kZXIgd2hldGhlciB0aGUKYmV0dGVyIGNv
dXJzZSBvZiBhY3Rpb24gd291bGRuJ3QgYmUgdG8gc3RvcCBhYnVzaW5nIHRoZQpmdW5jdGlvbnMs
IGNsb25pbmcgdGhlbSB0byBjb250aW51ZSB1c2luZyB0aGUgUEdUX2xvY2tlZCBmbGFnLgpJIHdv
dWxkIHRoZW4gd29uZGVyIHdoZXRoZXIgZS5nLiB0aGUgY2hlY2tpbmcgb2YgUEdUX3ZhbGlkYXRl
ZAp3b3VsZCBhY3R1YWxseSBiZSBuZWVkZWQgaW4gdGhlIGNsb25lZCBmdW5jdGlvbnMgLSB0aGF0
J3MgYWdhaW4KYSBmbGFnIHdoaWNoIG91Z2h0IHRvIGhhdmUgbWVhbmluZyBtYWlubHkgKGV4Y2x1
c2l2ZWx5PykgZm9yCmhhbmRsaW5nIG9mIFBWIGd1ZXN0cy4KCj4gLS0tIGEveGVuL2FyY2gveDg2
L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC0yMDMwLDEyICsyMDMwLDExIEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBjdXJyZW50X2xvY2tlZF9wYWdlX25lX2NoZWNrKHN0cnVjdCBw
YWdlX2luZm8gKnBhZ2UpIHsKPiAgI2RlZmluZSBjdXJyZW50X2xvY2tlZF9wYWdlX25lX2NoZWNr
KHgpIHRydWUKPiAgI2VuZGlmCj4gIAo+IC1pbnQgcGFnZV9sb2NrKHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2UpCj4gKyNpZiBkZWZpbmVkKENPTkZJR19QVikgfHwgZGVmaW5lZChDT05GSUdfSEFTX01F
TV9TSEFSSU5HKQo+ICtzdGF0aWMgaW50IF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkKCkFzIHBlciBhYm92ZSwgcGVyc29uYWxseSBJJ20gYWdhaW5zdCBpbnRyb2R1Y2luZwpwYWdl
X3ssdW59bG9ja19tZW1zaHIoKSwgYXMgdGhhdCBtYWtlcyB0aGUgYWJ1c2UgZXZlbiBtb3JlCmxv
b2sgbGlrZSBwcm9wZXIgdXNlLiBCdXQgaWYgdGhpcyB3YXMgdG8gYmUga2VwdCB0aGlzIHdheSwg
bWF5IEkKYXNrIHRoYXQgeW91IHN3aXRjaCBpbnQgLT4gYm9vbCBpbiB0aGUgcmV0dXJuIHR5cGVz
IGF0IHRoaXMgb2NjYXNpb24/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
