From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/6] x86: introduce dr_mask_idx() helper
 function...
Date: Fri, 08 Mar 2019 09:58:01 -0700
Message-ID: <5C829F19020000780021CC80@prv1-mh.provo.novell.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h2Iow-0006In-Ul
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 16:58:06 +0000
In-Reply-To: <20190107120258.17897-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEzOjAyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0yMDIsMTMgKzIwMSwxMCBAQCBpbnQgZ3Vlc3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYs
IHVpbnQzMl90IG1zciwgdWludDY0X3QgKnZhbCkKPiAgICAgICAgICAgKi8KPiAgI2lmZGVmIENP
TkZJR19IVk0KPiAgICAgICAgICBpZiAoIHYgPT0gY3VycmVudCAmJiBpc19odm1fZG9tYWluKGQp
ICYmIHYtPmFyY2guaHZtLmZsYWdfZHJfZGlydHkgKQo+IC0gICAgICAgICAgICByZG1zcmwobXNy
LCAqdmFsKTsKPiAtICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIHJkbXNybChtc3IsIG1zcnMt
PmRyX21hc2tbZHJfbWFza19pZHgobXNyKV0pOwo+ICAjZW5kaWYKPiAtICAgICAgICAgICAgKnZh
bCA9IG1zcnMtPmRyX21hc2tbCj4gLSAgICAgICAgICAgICAgICBhcnJheV9pbmRleF9ub3NwZWMo
KG1zciA9PSBNU1JfQU1ENjRfRFIwX0FERFJFU1NfTUFTSykKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA/IDAgOiAobXNyIC0gTVNSX0FNRDY0X0RSMV9BRERSRVNTX01BU0sg
KyAxKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKG1z
cnMtPmRyX21hc2spKV07Cj4gKwo+ICsgICAgICAgICp2YWwgPSBtc3JzLT5kcl9tYXNrW2RyX21h
c2tfaWR4KG1zcildOwo+ICAgICAgICAgIGJyZWFrOwoKV2hpbGUgSSBkb24ndCByZWFsbHkgbWlu
ZCB0aGlzIGJlaGF2aW9yYWwgY2hhbmdlIChvZiB1cGRhdGluZyAqbXNycyksCkknZCBsaWtlIHRv
IGdldCBBbmRyZXcncyBvcGluaW9uIG9uIHRoaXMgZnJvbSBhIGNvbmNlcHR1YWwgcG92LgoKPiBA
QCAtMzE3LDYgKzMxOCwyNiBAQCBzdHJ1Y3QgdmNwdV9tc3JzCj4gICAgICB9IHhzczsKPiAgfTsK
PiAgCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGRyX21hc2tfaWR4KHVpbnQzMl90IG1z
cikKPiArewo+ICsgICAgc3dpdGNoIChtc3IpCgpNaXNzaW5nIGJsYW5rcyBpbW1lZGlhdGVseSBp
bnNpZGUgdGhlIHBhcmVudGhlc2VzLgoKPiArICAgIHsKPiArICAgIGRlZmF1bHQ6Cj4gKyAgICAg
ICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gKyAgICAgICAgLyogRmFsbHRocm91Z2ggKi8KPiAr
ICAgIGNhc2UgTVNSX0FNRDY0X0RSMF9BRERSRVNTX01BU0s6Cj4gKyAgICAgICAgcmV0dXJuIDA7
Cj4gKwo+ICsgICAgY2FzZSBNU1JfQU1ENjRfRFIxX0FERFJFU1NfTUFTSyAuLi4gTVNSX0FNRDY0
X0RSM19BRERSRVNTX01BU0s6Cj4gKyAgICB7Cj4gKyAgICAgICAgc3RydWN0IHZjcHVfbXNycyBt
c3JzOyAvKiBvbmx5IHVzZWQgZm9yIEFSUkFZX1NJWkUoKSAqLwoKSSBkb24ndCB0aGluayB5b3Ug
bmVlZCB0aGlzIC0geW91IGNhbiB1c2UgZS5nLgpBUlJBWV9TSVpFKGN1cnJlbnQtPmFyY2gudmNw
dS5tc3JzLmRyX21hc2spLCBjYW4ndCB5b3U/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
