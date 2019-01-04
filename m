From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] x86/dom0: add missing flag to printf
 format for PVH
Date: Fri, 04 Jan 2019 07:21:26 -0700
Message-ID: <5C2F6BE6020000780020A3DA@prv1-mh.provo.novell.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
 <20181227152638.41648-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfQLs-0002KJ-Jg
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 14:21:32 +0000
In-Reply-To: <20181227152638.41648-4-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjEyLjE4IGF0IDE2OjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtMTI0LDcgKzEyNCw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgb3JkZXIpOwo+ICAgICAgICAgIGlmICggcmMgIT0g
MCApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBwcmludGsoIkZhaWxlZCB0byBwb3B1bGF0
ZSBtZW1vcnk6IFslI2x4LCVseCk6ICVkXG4iLAo+ICsgICAgICAgICAgICBwcmludGsoIkZhaWxl
ZCB0byBwb3B1bGF0ZSBtZW1vcnk6IFslI2x4LCUjbHgpOiAlZFxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgIHN0YXJ0LCBzdGFydCArICgxVUwgPDwgb3JkZXIpLCByYyk7CgpJIHRoaW5rIHRoZSBj
aGFuZ2Ugd291bGQgYmV0dGVyIGhhdmUgYmVlbiB0aGUgb3RoZXIgd2F5IGFyb3VuZDoKU2VyaWFs
IGNvbnNvbGUgYmFuZHdpZHRoIGNvbnNpZGVyYXRpb25zIChsaWtlIGFsc28gbWVudGlvbmVkCmVs
c2V3aGVyZSBvbiBhIGZldyBvY2Nhc2lvbnMpIHNob3VsZCBsZWFkIHRvIGEgcHJlZmVyZW5jZSBv
ZgpzaG9ydGVyIG1lc3NhZ2VzLCBhcyBsb25nIGFzIHRoaW5ncyBkb24ndCBiZWNvbWUgYW1iaWd1
b3VzLgpBbWJpZ3VpdHkgaXMgbm90IGFuIGlzc3VlIGhlcmUgLSBwcmludGluZyBvZiBNRk5zIGlu
IGRlY2ltYWwgaXMKZW50aXJlbHkgdXNlbGVzcyBpbW8sIGFuZCBwcmludGluZyBvZiBlcnJvciBj
b2RlcyBpbiBoZXggKHRoZSBtb3JlCnRoYXQgdGhleSdyZSBuZWdhdGl2ZSkgc2hvdWxkIGJlIGNv
bnNpZGVyZWQgYmFkIHByYWN0aWNlIGF0IGJlc3QuCkhlbmNlIGEgbWl4IG9mIGhleCBhbmQgZGVj
IGhlcmUgd291bGQgYmUgbm90IGFuIGlzc3VlIGF0IGFsbCwKd2l0aG91dCBhbnkgMHggcHJlZml4
ZXMuCgpCdXQgdGhpcyBpcyBhbiBlcnJvciBwYXRoLCBzbyBteSByZXBseSBpcyBub3QgbWVhbnQg
dG8gYmUgYSBjYWxsCmZvciBmdXJ0aGVyIGFjdGlvbiBpbiB0aGlzIHNwZWNpZmljIGNhc2UuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
