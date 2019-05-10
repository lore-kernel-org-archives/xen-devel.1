From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
Date: Fri, 10 May 2019 14:27:53 +0100
Message-ID: <02c7a05b-be08-432a-d941-7d5623b8956c@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP5ZP-0003XW-A6
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:28:15 +0000
In-Reply-To: <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4gQEAgLTI3OTUsNTQg
KzI3OTUsNTQgQEAgdm9pZCBhdWRpdF9wMm0oc3RydWN0IGRvbWFpbiAqZCwKPj4gICAgICBzcGlu
X2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4+ICAgICAgcGFnZV9saXN0X2Zvcl9lYWNoICgg
cGFnZSwgJmQtPnBhZ2VfbGlzdCApCj4+ICAgICAgewo+PiAtICAgICAgICBtZm4gPSBtZm5feChw
YWdlX3RvX21mbihwYWdlKSk7Cj4+ICsgICAgICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBhZ2UpOwo+
PiAgCj4+IC0gICAgICAgIFAyTV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lI2x4
XG4iLCBtZm4pOwo+PiArICAgICAgICBQMk1fUFJJTlRLKCJhdWRpdGluZyBndWVzdCBwYWdlLCBt
Zm49JSJQUklfbWZuIlxuIiwgbWZuX3gobWZuKSk7Cj4+ICAKPj4gICAgICAgICAgb2QgPSBwYWdl
X2dldF9vd25lcihwYWdlKTsKPj4gIAo+PiAgICAgICAgICBpZiAoIG9kICE9IGQgKQo+PiAgICAg
ICAgICB7Cj4+IC0gICAgICAgICAgICBQMk1fUFJJTlRLKCJ3cm9uZyBvd25lciAlI2x4IC0+ICVw
KCV1KSAhPSAlcCgldSlcbiIsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1mbiwgb2QsIChv
ZD9vZC0+ZG9tYWluX2lkOi0xKSwgZCwgZC0+ZG9tYWluX2lkKTsKPj4gKyAgICAgICAgICAgIFAy
TV9QUklOVEsoIndyb25nIG93bmVyICUiUFJJX21mbiIgLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwK
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3gobWZuKSwgb2QsIChvZD9vZC0+ZG9tYWlu
X2lkOi0xKSwgZCwgZC0+ZG9tYWluX2lkKTsKPiBQbGVhc2UgYmUgY2FyZWZ1bCBub3QgdG8gZHJv
cCAweCBwcmVmaXhlcyBmcm9tIHRoZSByZXN1bHRpbmcgb3V0cHV0Cj4gKHdoaWNoIGFyZSBhbiBl
ZmZlY3Qgb2YgdGhlICMgZmxhZyB0aGF0IHlvdSBkZWxldGUpLCBhdCBsZWFzdCB3aGVuCj4gbG9n
IG1lc3NhZ2VzIGNvbnRhaW4gYSBtaXggb2YgaGV4IGFuZCBkZWMgbnVtYmVycy4gKEkgYW0sIGJ0
dywKPiBub3QgY29udmluY2VkIHRoYXQgc3dpdGNoaW5nIHRvIFBSSV9tZm4gaGVyZSBpcyBoZWxw
ZnVsLikKPgo+IEFsc28gd291bGQgeW91IG1pbmQgZml4aW5nIHRoZSBmb3JtYXR0aW5nIChtaXNz
aW5nIGJsYW5rcykgaGVyZT8KClBsZWFzZSBhbHNvIGZpeCB0aGUgb2Q/IGNvbmRpdGlvbmFsIHdo
aWxlIG1ha2luZyB0aGlzIGNoYW5nZS7CoCAlcGQgd2FzCnNwZWNpZmljYWxseSBkZXNpZ25lZCB0
byBjb3BlIHdpdGggYSBOVUxMIHBvaW50ZXIgdG8gYXZvaWQgZ3ltbmFzdGljcwpsaWtlIHRoaXMg
aW4gZGVidWdnaW5nIGNvZGUuCgpJJ2QgcmV3cml0ZSBpdCBlbnRpcmVseSB0byBzb21ldGhpbmcg
bGlrZSAibWZuICUiUFJJX21mbiIgb3duZXIgJXBkICE9CiVwZFxuIgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
