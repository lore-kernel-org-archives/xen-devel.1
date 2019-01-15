From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 04/15] x86/cpu/mce: Add Hygon Dhyana support
 to the MCA infrastructure
Date: Tue, 15 Jan 2019 06:08:19 -0700
Message-ID: <5C3DDB43020000780020DDB4@prv1-mh.provo.novell.com>
References: <cover.1545284932.git.puwen@hygon.cn>
 <b495fe7a40b55c4de42607fabf12bce10b636515.1545284932.git.puwen@hygon.cn>
 <5C3CB76E020000780020D6C3@prv1-mh.provo.novell.com>
 <37d7079f-f91f-a24e-972f-885d54211108@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjOU1-00039o-B9
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 13:10:21 +0000
In-Reply-To: <37d7079f-f91f-a24e-972f-885d54211108@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDEzOjUyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMS8xNSAwOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjAuMTIuMTggYXQgMTQ6
MTIsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L21j
aGVjay9tY2VfYW1kLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZV9hbWQu
Ywo+Pj4gQEAgLTE2Miw3ICsxNjIsOCBAQCBtY2VxdWlya19sb29rdXBfYW1kX3F1aXJrZGF0YShz
dHJ1Y3QgY3B1aW5mb194ODYgKmMpCj4+PiAgIHsKPj4+ICAgICAgIGludCBpOwo+Pj4gICAKPj4+
IC0gICAgQlVHX09OKGMtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9BTUQpOwo+Pj4gKyAgICBp
ZiAoYy0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRCkKPj4+ICsgICAgICAgIHJldHVybiAw
Owo+PiAKPj4gUGxlYXNlIGNhbiB5b3UgbGVhdmUgdGhpcyB1bnRvdWNoZWQgYW5kIGNoYW5nZSB0
aGUgc2luZ2xlCj4+IGNhbGxlciBpbnN0ZWFkPyBJZiBuZWVkIGJlIGRvd24gdGhlIHJvYWQgKGJ1
dCBvZiBjb3Vyc2UgeW91J2xsCj4+IG5ldmVyIGludHJvZHVjZSBxdWlya3kgYmVoYXZpb3IpLCB3
ZSdkIHRoZW4gYWRkCj4+IG1jZXF1aXJrX2xvb2t1cF9oeWdvbl9xdWlya2RhdGEoKS4KPiAKPiBZ
ZXMsIEkgY2FuIGxlYXZlIHRoaXMgZnVuY3Rpb24gdW50b3VjaGVkLiBBbmQgY2hhbmdlIHRoZSBz
aW5nbGUgY2FsbGVyCj4gYW1kX21jaGVja19pbml0KCk6Cj4gLSAgICBlbnVtIG1jZXF1aXJrX2Ft
ZF9mbGFncyBxdWlya2ZsYWcgPSBtY2VxdWlya19sb29rdXBfYW1kX3F1aXJrZGF0YShjaSk7Cj4g
KyAgICBlbnVtIG1jZXF1aXJrX2FtZF9mbGFncyBxdWlya2ZsYWcgPSAwOwo+ICsKPiArICAgIGlm
IChjaS0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0hZR09OKQo+ICsgICAgICAgIHF1aXJrZmxh
ZyA9IG1jZXF1aXJrX2xvb2t1cF9hbWRfcXVpcmtkYXRhKGNpKTsKPiAKPiBJcyB0aGUgbW9kaWZp
Y2F0aW9uIE9LPwoKWWVzLgoKPiBBbHNvIGFkZCBtY2VxdWlya19sb29rdXBfaHlnb25fcXVpcmtk
YXRhKCkgaXMgYW5vdGhlciBzb2x1dGlvbiwgZXZlbgo+IHRob3VnaCBpdCB3aWxsIGRvIG5vdGhp
bmcgYXQgdGhlIG1vbWVudC4KCk5vIG5lZWQgdG8gaW50cm9kdWNlIGl0IHVudGlsIGl0IHdvdWxk
IGFjdHVhbGx5IGRvIGFueXRoaW5nLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
