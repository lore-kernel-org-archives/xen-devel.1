From: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH v2 2/2] autotools: Remove the configure
 script and just use autoconf
Date: Mon, 20 May 2019 09:37:45 -0700
Message-ID: <CAKmqyKPeY9zdOWZ8D2ApQHxHqSnUgJ43D7qTn9GY1LqrO9JoFQ@mail.gmail.com>
References: <20190517223152.29839-1-alistair.francis@wdc.com>
 <20190517223152.29839-2-alistair.francis@wdc.com>
 <5CE25FB70200007800230769@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Re5x=TU=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hSlKV-0004Tp-Io
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:40:03 +0000
Received: by mail-lj1-x243.google.com with SMTP id h11so11767681ljb.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 09:40:01 -0700 (PDT)
In-Reply-To: <5CE25FB70200007800230769@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Alistair Francis <alistair.francis@wdc.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTowNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE4LjA1LjE5IGF0IDAwOjMxLCA8YWxpc3RhaXIuZnJh
bmNpc0B3ZGMuY29tPiB3cm90ZToKPiA+IERvbid0IGhhcmRjb2RlIG9sZCB2ZXJzaW9ucyBvZiBj
b25maWd1cmUgaW4gdGhlIHNvdXJjZSBjb2RlLCBpbnN0ZWFkCj4gPiBsZXQncyBqdXN0IHVzZSBh
dXRvY29uZiB0byBnZW5lcmF0ZSB0aGVtLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWly
IEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4KPgo+IEZvciB0aGUgcmVjb3JkIC0g
SSBzdHJvbmdseSBkaXNhZ3JlZSB0byB0aGlzIHVubGVzcyB0aGVyZSdzIGEgZ2VuZXJhbAo+IG1v
dmVtZW50IGluIEdOVSBwcm9qZWN0cyB0b3dhcmRzIHN1Y2ggYSBtb2RlbC4gQWxsIHByb2plY3Rz
IEkgd29yawo+IHdpdGggYXQgbGVhc3QgZXZlcnkgbm93IGFuIHRoZW4gKGJpbnV0aWxzLCBnZGIs
IGdjYywgZ2xpYmMsIGFuZCBhIGZldwo+IGxlc3MgcHJvbWluZW50IG90aGVycykgYXJlIG5vdCwg
YWZhaWEsIG1vdmluZyBpbnRvIHRoaXMgZGlyZWN0aW9uLiAoSQo+IG5vdGljZSB0aGF0IGdpdCBh
bmQgbWFrZSwgZm9yIGV4YW1wbGUsIGRvbid0IGhhdmUgaXQgaW4gdGhlaXIgZ2l0IHRyZWVzLAo+
IGJ1dCBkbyBoYXZlIGl0IGluIHJlbGVhc2UgdGFyYmFsbHMuKQo+Cj4gQXMgYW4gYXNpZGUgLSB0
aGlzIGRpZmZzdGF0Cj4KPiA+IC0tLQo+ID4gIC5naXRpZ25vcmUgICAgICAgIHwgICAgIDUgKwo+
ID4gIGNvbmZpZ3VyZSAgICAgICAgIHwgIDM2MTggLS0tLS0tLS0tLS0tLS0tCj4gPiAgZG9jcy9j
b25maWd1cmUgICAgfCAgMzQyNyAtLS0tLS0tLS0tLS0tLQo+ID4gIHN0dWJkb20vY29uZmlndXJl
IHwgIDQ4NzAgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIHRvb2xzL2NvbmZpZ3VyZSAgIHwgMTEw
ODAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICA1IGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMjI5OTUgZGVsZXRpb25zKC0pCj4KPiBzaG93
cyB0aGF0IHlvdSBkb24ndCBjYXJlIHRvIHVwZGF0ZSBhbnkgb2YgdGhlIGRvY3VtZW50YXRpb24g
YXQKPiBhbGwsIHlldCBJIHRoaW5rIHN1Y2ggYSBjaGFuZ2Ugd291bGQgYWxtb3N0IGNlcnRhaW5s
eSBuZWVkIHRvIGRvIHNvLAo+IGJlc2lkZXMgYWxzbyBtYWtpbmcgc3VyZSB0aGlzIGdldHMgcG9p
bnRlZCBvdXQgaW4gdGhlIG5leHQgcmVsZWFzZSdzCj4gcmVsZWFzZSBub3Rlcy4gVGhlcmUgYXJl
IGFsc28gbWFrZWZpbGVzIHdoaWNoIHBvaW50IG91dCB0aGF0Cj4gLi9jb25maWd1cmUgbmVlZHMg
cnVubmluZyBmaXJzdC4gU3VjaCBlcnJvciBtZXNzYWdlcyB3b3VsZCBhbHNvCj4gbmVlZCBtb2Rp
ZmljYXRpb24uCgpUaGF0J3MgZmFpciwgSSBkaWRuJ3QgcmVhbGlzZSB0aGUgZG9jdW1lbnRhdGlv
biBjb250YWlucyBzdGVwcyB0bwpidWlsZC4gVGhhdCB3aWxsIG5lZWQgdXBkYXRpbmcuCgpJdCBs
b29rcyBsaWtlIHBlb3BsZSBhcmVuJ3QgaW4gZmF2b3VyIG9mIHRoaXMgKGFuZCBJIGRvbid0IG1p
bmQgZWl0aGVyCndheSkgc28gSSB0aGluayB0aGlzIHdpbGwgYmUgZHJvcHBlZC4gTXkgbWFpbiBj
b25jZXJuIGlzIHBhdGNoIDEuCgpBbGlzdGFpcgoKPgo+IEFuIGJ5IG5vdCB1cGRhdGluZyBkb2N1
bWVudGF0aW9uIGl0IGFsc28gcmVtYWlucyB1bmNsZWFyCj4gd2hhdCB0aGUgbWluaW11bSBhdXRv
Y29uZiB2ZXJzaW9uIHdvdWxkIGJlIHRoYXQncyByZXF1aXJlZC4gWWV0Cj4gYXMgcG9pbnRlZCBv
dXQgaW4gdGhlIGVhcmxpZXIgZGlzY3Vzc2lvbiwgdG8gYmUgYWJsZSB0byBidWlsZCBvbgo+IG9s
ZGVyIGRpc3Ryb3MgaXQgaXMgZXNzZW50aWFsIHRvIGtub3cgdGhpcyAoaS5lLiB3aGV0aGVyIHRv
IGZpcnN0IGJ1aWxkCj4gYSBtb3JlIG1vZGVybiBvbmUgdGhlcmUpLgo+Cj4gSmFuCj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
