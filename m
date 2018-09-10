From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v19 13/13] x86/domctl: Don't pause the whole
 domain if only getting vcpu state
Date: Mon, 10 Sep 2018 07:25:35 -0600
Message-ID: <5B9670CF02000078001E6C56@prv1-mh.provo.novell.com>
References: <20180910123640.496-1-aisaila@bitdefender.com>
 <20180910123640.496-14-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180910123640.496-14-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE0OjM2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9zYXZlLmMKPiBAQCAtMTU1LDYgKzE1NSwxMSBAQCBpbnQgaHZtX3NhdmVfb25lKHN0cnVjdCBk
b21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlY29kZSwgdW5zaWduZWQgaW50IGluc3RhbmNlLAo+
ICAgICAgaWYgKCAhY3R4dC5kYXRhICkKPiAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAgCj4g
KyAgICBpZiAoIGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0ua2luZCA9PSBIVk1TUl9QRVJfVkNQ
VSApCj4gKyAgICAgICAgdmNwdV9wYXVzZShkLT52Y3B1W2luc3RhbmNlXSk7CgpJcyB0aGVyZSBh
bnkgcmVhc29uIHdoeSB5b3UgZG9uJ3QgdXNlIHYgaGVyZSBhbmQgLi4uCgo+ICsgICAgZWxzZQo+
ICsgICAgICAgIGRvbWFpbl9wYXVzZShkKTsKPiArCj4gICAgICBpZiAoIChydiA9IGh2bV9zcl9o
YW5kbGVyc1t0eXBlY29kZV0uc2F2ZSh2LCAmY3R4dCkpICE9IDAgKQo+ICAgICAgICAgIHByaW50
ayhYRU5MT0dfR19FUlIgIkhWTSVkIHNhdmU6IGZhaWxlZCB0byBzYXZlIHR5cGUgJSJQUkl1MTYi
ICglZClcbiIsCj4gICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgdHlwZWNvZGUsIHJ2KTsK
PiBAQCAtMTg2LDYgKzE5MSwxMSBAQCBpbnQgaHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCB0eXBlY29kZSwgdW5zaWduZWQgaW50IGluc3RhbmNlLAo+ICAgICAgICAg
IH0KPiAgICAgIH0KPiAgCj4gKyAgICBpZiAoIGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0ua2lu
ZCA9PSBIVk1TUl9QRVJfVkNQVSApCj4gKyAgICAgICAgdmNwdV91bnBhdXNlKGQtPnZjcHVbaW5z
dGFuY2VdKTsKCi4uLiBoZXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
