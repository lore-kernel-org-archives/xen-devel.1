From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH RFC 2/3] automation: build stubdom and
 rombios, and tools on 32 bit
Date: Fri, 6 Jul 2018 13:52:43 -0500
Message-ID: <20180706185243.ayme7uxq7axkr2ei@doug-macbook.localdomain>
References: <20180523102040.16299-1-wei.liu2@citrix.com>
 <20180523102040.16299-3-wei.liu2@citrix.com>
 <13b83460-a84b-0888-0261-2c7bb5085594@cardoe.com>
 <20180529232824.pd56wtwl5idqjubm@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jkxw=jw=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1fbVqY-0007Qa-Gv
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 18:52:46 +0000
Received: by mail-yb0-x242.google.com with SMTP id s8-v6so4939764ybe.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jul 2018 11:52:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180529232824.pd56wtwl5idqjubm@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMTI6Mjg6MjRBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIE1heSAyOSwgMjAxOCBhdCAxMjoxODo0MEFNIC0wNTAwLCBEb3VnIEdvbGRzdGVp
biB3cm90ZToKPiA+IE9uIDUvMjMvMTggNToyMCBBTSwgV2VpIExpdSB3cm90ZToKPiA+IAo+ID4g
PiAgCj4gPiA+ICAjIFNlYUJJT1MgY2Fubm90IGJlIGJ1aWx0IHdpdGggY2xhbmcKPiA+ID4gQEAg
LTIwLDEyICsxOCw2IEBAIGlmIFtbICIke0NDfSIgPT0gImNsYW5nIiBdXTsgdGhlbgo+ID4gPiAg
ICAgIGNmZ2FyZ3MrPSgiLS13aXRoLXN5c3RlbS1zZWFiaW9zPS91c3Ivc2hhcmUvc2VhYmlvcy9i
aW9zLmJpbiIpCj4gPiA+ICBmaQo+ID4gPiAgCj4gPiA+IC1pZiBbWyAiJHtYRU5fVEFSR0VUX0FS
Q0h9IiA9PSAieDg2XzY0IiBdXTsgdGhlbgo+ID4gPiAtICAgIGNmZ2FyZ3MrPSgiLS1lbmFibGUt
dG9vbHMiKQo+ID4gPiAtZWxzZQo+ID4gPiAtICAgIGNmZ2FyZ3MrPSgiLS1kaXNhYmxlLXRvb2xz
IikgIyB3ZSBkb24ndCBoYXZlIHRoZSBjcm9zcyBkZXBlbmRzIGluc3RhbGxlZAo+ID4gPiAtZmkK
PiA+ID4gLQo+ID4gCj4gPiBUaGlzIHN0aWxsIGhvcnJpYmx5IGZhaWxzIHdoZW4gdGFyZ2V0aW5n
IGFybSBiZWNhdXNlIHdlIGhhdmUgdG8gYWN0dWFsbHkKPiA+IGV4ZWN1dGUgYSBjb21waWxlZCBi
aW5hcnkgb24gdGhlIGhvc3QuIFRoZSB0b29scyBidWlsZCBzeXN0ZW0gZG9lc24ndAo+ID4gc2Vl
bSB0byBjb21wcmVoZW5kIGhvc3QgIT0gdGFyZ2V0Lgo+ID4gCj4gCj4gT0suIExldCdzIG9ubHkg
ZW5hYmxlIHRvb2xzIGJ1aWxkIGZvciB4ODYgZm9yIG5vdy4KPiAKPiA+IEEgZmV3IHBlb3BsZSBo
YXZlIHN0ZXBwZWQgZm9yd2FyZCB3aXRoIGlkZWFzIGFuZCBzYWlkIHRoZXknZCB0YWtlIHBvaW50
Cj4gPiBvbiB0aGUgcGF0Y2hlcyBidXQgSSBoYXZlbid0IHNlZW4gYW55dGhpbmcgbGFuZCB5ZXQu
Cj4gPiAKPiAKPiBBbnkgcmVmZXJlbmNlPwo+IAo+IFdlaS4KClN0ZWZhbm8gb3JpZ2luYWxseSBv
ZmZlcmVkIEkgYmVsaWV2ZS4gSGUgYWxzbyBvZmZlcmVkIHRvIGhlbHAgd2l0aCBzb21lCm9mIHRo
ZSBiaXRzIGFnYWluIGF0IHRoZSBTdW1taXQuIE1hdHQgU3BlbmNlciBzdWdnZXN0ZWQgdGhhdCBB
Uk0gY291bGQKaGVscCBvdXQgd2l0aCBpbmZvIG9uIGhvdyB0byBidWlsZCB0aGUgY29udGFpbmVy
cyBhbmQgcG90ZW50aWFsbHkgc29tZQpyZXNvdXJjZXMgd2hlcmUgdGhleSBjb3VsZCBydW4gYXMg
d2VsbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
