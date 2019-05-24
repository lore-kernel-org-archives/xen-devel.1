From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
Date: Fri, 24 May 2019 17:24:21 +0100
Message-ID: <3c51d11a-7a3c-02b5-be74-9b8684b17c30@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KQqo=TY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hUCzc-0006QS-D4
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 16:24:28 +0000
In-Reply-To: <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xMC8xOSAyOjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQEAgLTEwOTksMTkgKzEx
MDAsMTkgQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5X2NvdW50Kys7Cj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICBtZm4gPSBsMWVfZ2V0X3BmbihsMWVb
aTFdKTsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVChtZm5fdmFsaWQoX21mbiht
Zm4pKSk7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICBtMnBmbiA9IGdldF9ncGZuX2Zyb21f
bWZuKG1mbik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBtZm4gPSBsMWVfZ2V0X21mbihs
MWVbaTFdKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVChtZm5fdmFsaWQobWZu
KSk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBtMnBmbiA9IGdldF9wZm5fZnJvbV9tZm4o
bWZuKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmICggbTJwZm4gIT0gZ2ZuICYmCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgIT0gcDJtX21taW9fZGlyZWN0ICYm
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFwMm1faXNfZ3JhbnQodHlwZSkgJiYK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIXAybV9pc19zaGFyZWQodHlwZSkgKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtYmFkKys7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKCJtaXNt
YXRjaDogZ2ZuICUjbHggLT4gbWZuICUjbHgiCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICIgLT4gZ2ZuICUjbHhcbiIsIGdmbiwgbWZuLCBtMnBmbik7Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5USygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1m
biAlI2x4Igo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBn
Zm4gJSNseFxuIiwgZ2ZuLCBtZm4sIG0ycGZuKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcmludGsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBtZm4gJSJQUklfbWZuIiAtPiBnZm4g
JSNseFxuIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuLCBtZm5f
eChtZm4pLCBtMnBmbik7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5U
SygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlIlBSSV9tZm4iIC0+IGdmbiAlI2x4XG4iLAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuLCBtZm5feChtZm4p
LCBtMnBmbik7Cj4gCj4gR2VvcmdlLCBkbyB3ZSByZWFsbHkgbWVhbiB0byBoYXZlIHByaW50aygp
IGFuZCBQMk1fUFJJTlRLKCkgaGVyZT8KCkxvb2tzIGxpa2UgdGhpcyB3YXMgaW50cm9kdWNlZCAo
YnkgbWUhKSBpbiBhNTg5ZmY2YzE3OTsgbXkgYmVzdCBndWVzcyBpcwp0aGF0IGl0IHdhcyBkdWUg
dG8gYSBiYWQgcmViYXNlIG1lcmdlLgoKSSdsbCBsZWF2ZSBpdCB0byBKdWxpZW4gdG8gZGVjaWRl
IGlmIGhlIHdhbnRzIHRvIGNsZWFuIHRoaXMgdXAgb3IgbGVhdmUKaXQgYmUuCgogLUdlb3JnZQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
