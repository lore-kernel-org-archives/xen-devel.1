From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 01:09:30 -0600
Message-ID: <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
References: <20180703160227.GF4670@olila.local.net-space.pl>
 <5B3C7E0602000078001D0DDC@prv1-mh.provo.novell.com>
 <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fd9Fm-0004Jm-C0
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 07:09:34 +0000
In-Reply-To: <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA3LjE4IGF0IDE3OjM1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDEwLCAyMDE4IGF0IDA4OjA5OjA2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTAuMDcuMTggYXQgMTU6NDksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDU6NDc6MTlBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxMC4wNy4xOCBhdCAxMzowMCwgPGRhbmllbC5r
aXBlckBvcmFjbGUuY29tPiB3cm90ZToKPj4gPj4gPiBPbiBNb24sIEp1bCAwOSwgMjAxOCBhdCAw
Njo0NToxNlBNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiA+PiA+PiBTb3JyeSBm
b3IgYXNraW5nIHNvIG1hbnkgcXVlc3Rpb25zLCBidXQgSSB3b3VsZCBsaWtlIHRvIHRyeSB0byBh
dm9pZAo+PiA+PiA+PiB0aGUgREVGSU5FRCBjb25kaXRpb25hbCBpbiB0aGUgbGlua2VyIHNjcmlw
dCBpZiBwb3NzaWJsZS4KPj4gPj4gPiAKPj4gPj4gPiBJZiB5b3Ugd2lzaCB0byBkbyB0aGF0IHRo
ZW4gcHV0IGR1bW15IGVmaSBzeW1ib2wgaW50byAKPj4gPj4gPiB4ZW4vYXJjaC94ODYvZWZpL3N0
dWIuYy4KPj4gPj4gCj4+ID4+IEkgdGhpbmsgSSd2ZSBjbGVhcmx5IG9iamVjdGVkIHRvIHRoYXQg
YmVmb3JlIC0gSSBzaW1wbHkgc2VlIG5vIG5lZWQgZm9yCj4+ID4+IHdhc3RpbmcgdGhlIHNwYWNl
IGluIGFuIEVGSS1pbmNhcGFibGUgYmluYXJ5Lgo+PiA+IAo+PiA+IEJ1dCBzdWNoIHdhc3RlIGlz
IGFsc28gYWRkZWQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHlvdSBkZWZpbmUgdGhlCj4+ID4gc3lt
Ym9sIGl0IGluIHRoZSBsaW5rZXIgc2NyaXB0IG9yIGluIGEgQyBmaWxlPwo+PiAKPj4gSG93IHRo
YXQ/IFRoZXJlJ3Mgbm8gc3BhY2UgYXNzb2NpYXRlZCB3aXRoIHRoZSBzeW1ib2wgd2hlbiBkZWZp
bmVkCj4+IHRoaXMgd2F5LiBGcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiB0aGUgYmluYXJ5LCB0aGUg
c3BhY2UgbGl2ZXMgcGFzdCB0aGUKPj4gZW5kIG9mIHRoZSBpbWFnZSwgYnV0IHNpbmNlIHRoZSBz
eW1ib2wgaXMgbmV2ZXIgYWNjZXNzZWQgKG9yIGVsc2UgY29kZQo+PiBpcyBicm9rZW4gc29tZXdo
ZXJlKSBpbiB0aGUgbm9uLUVGSSBjYXNlLCB0aGlzIGlzIG9rYXkuCj4gCj4gT2ggcmlnaHQsIHRo
YXQncyBub3QgaW5zaWRlIG9mIGFueSBzZWN0aW9uLgo+IAo+IEkndmUgdHJpZWQgcGxhY2luZyBh
biBlZmkgc3ltYm9sIGluc2lkZSBvZiB0aGUgLmRpc2NhcmQgc2VjdGlvbiBidXQKPiB0aGF0IGRv
ZXNuJ3Qgd29yay4KCkluIHdoaWNoIHdheT8KCj4gSSdtIG9wZW4gdG8gc3VnZ2VzdGlvbnMgc2lu
Y2UgSSBkb24ndCBoYXZlIGFueSBtb3JlCj4gaWRlYXMgYWJvdXQgaG93IHRvIGZpeCB0aGlzLgoK
QW5vdGhlciBwb3NzaWJsZSB0aGluZyB0byB0cnkgbWlnaHQgYmUgdG8gbWFrZSB0aGUgZXh0ZXJu
IGRlY2xhcmF0aW9uCm9mIHRoZSBzeW1ib2wgd2VhaywgYW5kIGRyb3AgdGhlIG9mZmVuZGluZyBs
aW5lIGFsdG9nZXRoZXIuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
