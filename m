From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12 5/8] pvh/dom0: warn when dom0_mem
 is not set to a fixed value
Date: Thu, 7 Feb 2019 16:39:26 +0100
Message-ID: <20190207153926.sxzpv5ansoa6azg2@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-6-roger.pau@citrix.com>
 <5C5AE70F02000078002144E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9m6e=QO=citrix.com=prvs=934266883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grlmh-0008Re-Ca
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 15:40:15 +0000
Content-Disposition: inline
In-Reply-To: <5C5AE70F02000078002144E9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDYsIDIwMTkgYXQgMDY6NTQ6MjNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjAxLjE5IGF0IDExOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVGhlcmUgaGF2ZSBiZWVuIHNldmVyYWwgcmVwb3J0cyBvZiB0aGUgZG9tMCBidWls
ZGVyIHJ1bm5pbmcgb3V0IG9mCj4gPiBtZW1vcnkgd2hlbiBidWlsZGlnbiBhIFBWSCBkb20wIHdp
dGhvdXQgaGF2aW5nZiBzcGVjaWZpZWQgYSBkb20wX21lbQo+IAo+ICJidWlsZGluZyIgYW5kICJo
YXZpbmciCj4gCj4gPiB2YWx1ZS4gUHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2UgaWYgZG9tMF9tZW0g
aXMgbm90IHNldCB0byBhIGZpeGVkIHZhbHVlCj4gPiB3aGVuIGJvb3RpbmcgaW4gUFZIIG1vZGUu
Cj4gCj4gV2h5IGRvZXMgaXQgbmVlZCB0byBiZSBhIGZpeGVkIHZhbHVlPyBJLmUuIHdoeSBjYW4n
dCB5b3Ugc2ltcGx5Cj4gcHV0IHRoaXMgd2FybmluZyBuZXh0IHRvIHdoZXJlIHRoZSBkZWZhdWx0
IGdldHMgZXN0YWJsaXNoZWQsCj4gd2hlbiBucl9wYWdlcyBpcyB6ZXJvPwoKQWNrLCBidXQgSSBn
dWVzcyB5b3UgbGlrZWx5IGFsc28gd2FudCB0byBjaGFuZ2UgdGhlIHByaW50ZWQgd2FybmluZyBz
bwppdCBkb2VzIHNheSAiZml4ZWQiPwoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxk
LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKPiA+IEBAIC0zNDQsNiArMzQ0
LDEwIEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRvbTBfY29tcHV0ZV9ucl9wYWdlcygKPiA+ICAg
ICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gPiAgICAgICAg
ICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9NRU0pOwo+ID4gIAo+ID4gKyAgICBpZiAoIGlz
X2h2bV9kb21haW4oZCkgJiYgIWRvbTBfc2l6ZS5ucl9wYWdlcyApCj4gPiArICAgICAgICBwcmlu
dGsoCj4gPiArIldBUk5JTkc6IGNvbnNpZGVyIHNldHRpbmcgZG9tMF9tZW0gdG8gYSBmaXhlZCB2
YWx1ZSB3aGVuIHVzaW5nIFBWSCBtb2RlXG4iKTsKPiAKPiBQcmV0dHkgdW51c3VhbCBpbmRlbnRh
dGlvbi4gSXMgdGhlcmUgYW55IHJlYXNvbiBmb3IgeW91IGRvaW5nIHNvPwoKRGlkIGl0IHRoYXQg
d2F5IHRvIGF2b2lkIHNwbGl0dGluZyBhbmQgdG8gYXR0ZW1wdCB0byBrZWVwIHRoZSBsaW5lIGFz
CnNob3J0IGFzIHBvc3NpYmxlLiBXb3VsZCB5b3UgcHJlZmVyIG1lIHRvIHNwbGl0IHRoZSBtZXNz
YWdlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
