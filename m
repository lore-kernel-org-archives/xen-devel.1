From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Fri, 29 Jun 2018 08:53:24 +0200
Message-ID: <20180629065324.ofs7465vxa456txg@mac.bytemobile.com>
References: <20180628153809.50172-1-roger.pau@citrix.com>
 <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oe8d=jp=citrix.com=prvs=7113d518c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fYnHH-0005ED-HK
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 06:53:07 +0000
Content-Disposition: inline
In-Reply-To: <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, daniel.kiper@oracle.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMTE6MzU6MjRQTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IDA2LzI4LzE4
IDU6MzggUE0gPj4+Cj4gPmxsZCAodGhlIGxsdm0gbGlua2VyKSBoYXMgc29tZSBpc3N1ZXMgd2l0
aCBYZW4gbGlua2VyIHNjcmlwdC4gSXQKPiA+ZG9lc24ndCB1bmRlcnN0YW5kICd8fCcgaW4gYXNz
ZXJ0IGV4cHJlc3Npb25zOgo+ID4KPiA+bGQgICAgLW1lbGZfeDg2XzY0X2Zic2QgIC1UIHhlbi5s
ZHMgLU4gcHJlbGluay5vIC0tYnVpbGQtaWQ9c2hhMSBcCj4gPi9yb290L3NyYy94ZW4veGVuL2Nv
bW1vbi9zeW1ib2xzLWR1bW15Lm8gLW8gL3Jvb3Qvc3JjL3hlbi94ZW4vLnhlbi1zeW1zLjAKPiA+
bGQ6IGVycm9yOiB4ZW4ubGRzOjI2MDogbWFsZm9ybWVkIG51bWJlcjogfAo+ID4+Pj4gQVNTRVJU
KF9faW1hZ2VfYmFzZV9fID4gKCgoKCgoKCgoMjYxID4+IDgpICogMHhmZmZmMDAwMDAwMDAwMDAw
KSB8ICgyNjEgPDwgMzkpKSkgKyAoKDEgPDwgMzkpIC8gMikpICsgKDY0IDw8IDMwKSkgKyAoMSA8
PCAzMCkpICsgKDEgPDwgMzApKSkgfHwKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCj4gPgo+ID5BbmQgZG9lc24ndCB3b3JrIHByb3Blcmx5IHdpdGggdGhlICdERUZJTkVEKGZv
bykgPyBmb28gOiAuLi4nCj4gPmV4cHJlc3Npb246Cj4gPgo+ID5sZCAgICAtbWVsZl94ODZfNjRf
ZmJzZCAgLVQgeGVuLmxkcyAtTiBwcmVsaW5rLm8gLS1idWlsZC1pZD1zaGExIFwKPiA+L3Jvb3Qv
c3JjL3hlbi94ZW4vY29tbW9uL3N5bWJvbHMtZHVtbXkubyAtbyAvcm9vdC9zcmMveGVuL3hlbi8u
eGVuLXN5bXMuMAo+ID5sZDogZXJyb3I6IHhlbi5sZHM6MjMzOiBzeW1ib2wgbm90IGZvdW5kOiBl
ZmkKPiA+Cj4gPkZpeCB0aGUgZmlyc3QgaXNzdWUgYnkgdXNpbmcgJ3wnIGluc3RlYWQgb2YgJ3x8
JywgYW5kIHRoZSBzZWNvbmQgb25lCj4gPmJ5IGRlZmluaW5nIHRoZSBlZmkgc3ltYm9sIGJhc2Vk
IG9uIHRoZSBFRkkgZGVmaW5lIChsaWtlIGl0IHdhcyBkb25lCj4gPnByaW9yIHRvIGNvbW1pdCBi
MTk5YzQ0YWZhKS4KPiAKPiBIbW0sIHRoZSBzZWNvbmQgb25lIGlzIGEgZGlyZWN0IHJldmVydCBv
ZiB0aGUgb3JpZ2luYWwgY29tbWl0J3MgaHVuay4gVGhlcmUgbXVzdAo+IGhhdmUgYmVlbiBhIHJl
YXNvbiBmb3IgRGFuaWVsIHRvIGNoYW5nZSBpdCwgYW5kIGhlbmNlIHVuZG9pbmcgaXQgbWlnaHQg
YnJlYWsgd2hhdAo+IGhlIHdhbnRzIG5lZWRzLiBZb3Ugc2hvdWxkIGhhdmUgQ2MtZWQgaGltIHJp
Z2h0IGF3YXkuCgpJbiBmYWN0IEkgdGhvdWdoIEkgQ2MnZWQgRGFuaWVsLCBidXQgSSBjbGVhcmx5
IGRpZG4ndC4gVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
