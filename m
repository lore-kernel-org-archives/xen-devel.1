From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Tue, 3 Jul 2018 18:02:27 +0200
Message-ID: <20180703160227.GF4670@olila.local.net-space.pl>
References: <20180628153809.50172-1-roger.pau@citrix.com>
 <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zuia=jt=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1faNlE-0000wf-G3
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 16:02:36 +0000
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
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
ZmkKClRoaXMgc21lbGxzIGxpa2UgbGxkIGJ1Zy4gZWZpIHN5bWJvbCBpcyBjbGVhcmx5IHVuZGVm
aW5lZCBpbiBwcmVsaW5rLm8KKGxsZCBkb2VzIG5vdCBzdXBwb3J0IGkzODZwZXAgZW11bGF0aW9u
KToKCiAxMTE0NzogMDAwMDAwMDAwMDAwMDAwMCAgICAgMCBOT1RZUEUgIEdMT0JBTCBISURERU4g
ICBVTkQgZWZpCgpIb3dldmVyLCBzdXJwcmlzaW5nbHkgREVGSU5FRCgpIHN0YXRlcyB0aGF0IGl0
IGlzIGFuZCB0ZXJuYXJ5IG9wZXJhdG9yCmZpcmVzIGFkZHJlc3MgY2FsY3VsYXRpb24gZnJvbSB1
bmRlZmluZWQgc3ltYm9sLiBTbywgSSB0aGluayB0aGF0IGxsZApoYXZlIHRvIGJlIGZpeGVkIGlu
c3RlYWQgb2YgWGVuLiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBiaW51dGlscyBsZAp3b3JrcyB3
aXRob3V0IGFueSBpc3N1ZS4KCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
