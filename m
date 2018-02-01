From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC] firmware/shim: fix Xen tree setup
Date: Thu, 1 Feb 2018 10:25:32 +0000
Message-ID: <20180201102532.bstfkwjavpcafu65@MacBook-Pro-de-Roger.local>
References: <5A72030902000078001A4165@prv-mh.provo.novell.com>
 <20180201100153.oqzfeqm7xb7sxmit@MacBook-Pro-de-Roger.local>
 <5A72F5E002000078001A4439@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehC3v-0001ZF-Mc
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:25:47 +0000
Content-Disposition: inline
In-Reply-To: <5A72F5E002000078001A4439@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDEsIDIwMTggYXQgMDM6MTE6MjhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAxLjAyLjE4IGF0IDExOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKYW4gMzEsIDIwMTggYXQgMDk6NTU6MjFBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+
ID4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiA+PiBAQCAtMTYsMTgg
KzE2LDE4IEBAIERFUF9GSUxFUz0kKGZvcmVhY2ggaSwgJChMSU5LX0ZJTEVTKSwgJCgKPiA+PiAg
Cj4gPj4gIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKPiA+
PiAgCW1rZGlyIC1wICQoRCkKPiA+PiAtCXNldCAtZQo+ID4+ICAJcm0gLWYgbGlua2Zhcm0uc3Rh
bXAudG1wCj4gPj4gKwlzZXQgLWU7IFwKPiA+PiAgCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyks
IFwKPiA+PiAgCQkgKG1rZGlyIC1wICQoRCkvJChkKTsgXAo+ID4+ICAJCSAgY2QgJChEKS8kKGQp
OyBcCj4gPj4gIAkJICBmaW5kICQoWEVOX1JPT1QpLyQoZCkvIC10eXBlIGQgfFwKPiA+PiAtCQkJ
c2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJncyBta2RpciAtcCk7KQo+ID4+ICsJ
CQlzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdzIG1rZGlyIC1wKTspIFwKPiA+
PiAgCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKPiA+PiAgCQkoY2QgJChYRU5fUk9PVCk7
IFwKPiA+PiAtCQkgZmluZCAkKGQpICEgLXR5cGUgbCAtdHlwZSBmIFwKPiA+PiAtCQkgJChhZGRw
cmVmaXggISAtcGF0aCAsICcqLltvZGExXScgJyouZFsxMl0nKSkgXAo+ID4+IC0JCSA+PiBsaW5r
ZmFybS5zdGFtcC50bXAgOyApCj4gPj4gKwkJIGZpbmQgJChkKSAteHR5cGUgZiBcCj4gPiAKPiA+
IE5vIHh0eXBlIHBsZWFzZS4gRG9lcyBpdCB3b3JrIHdpdGggc29tZXRoaW5nIGxpa2U6Cj4gPiAK
PiA+IGBmaW5kIC1IICQoZCkgLXR5cGUgZmAKPiAKPiBBaCwgeWVzLCBkaWRuJ3QgdGhpbmsgb2Yg
dGhhdCBvbmUuIEJ1dCBwZXJoYXBzIC1MIHJhdGhlciB0aGFuIC1IPwoKVWgsIHllcywgc29ycnks
IGRlZmluaXRlbHkgbWVhbnQgLUwuCgpJIGd1ZXNzIC1IIHdpbGwgbmV2ZXIgYmUgbmVlZGVkLCBz
aW5jZSB0aGF0IHdvdWxkIG9ubHkgYmUgaGVscGZ1bCB3aGVuCiQoZCkgaXMgYSBzeW1ib2xpYyBs
aW5rLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
