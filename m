From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/11] x86/emul: Unfold %cr4.de handling in
 x86emul_read_dr()
Date: Wed, 06 Jun 2018 08:20:51 -0600
Message-ID: <5B17EDC302000078001C8CEF@prv1-mh.provo.novell.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528120755-17455-6-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE4IGF0IDE1OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgKGFzIGN1cnItPmFyY2guZGVidWdyZWdbNV0gaXMg
emVybyB3aGVuIERFIGlzIGNsZWFyKSwgYnV0Cj4gdGhpcyBjaGFuZ2Ugc2ltcGxpZmllcyB0aGUg
Zm9sbG93aW5nIHBhdGNoLgoKQSBjb21tZW50IHRvIHRoaXMgZWZmZWN0IHdvdWxkIGJlIGhlbHBm
dWwgLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L3g4Nl9lbXVsYXRlLmMKPiBAQCAtMTAxLDIzICsxMDEsMjkgQEAgaW50IHg4NmVtdWxf
cmVhZF9kcih1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBsb25nICp2YWwsCj4gICAgICBzd2l0
Y2ggKCByZWcgKQo+ICAgICAgewo+ICAgICAgY2FzZSAwIC4uLiAzOgo+IC0gICAgY2FzZSA2Ogo+
ICAgICAgICAgICp2YWwgPSBjdXJyLT5hcmNoLmRlYnVncmVnW3JlZ107Cj4gICAgICAgICAgYnJl
YWs7Cj4gIAo+ICsgICAgY2FzZSA0Ogo+ICsgICAgICAgIGlmICggY3Vyci0+YXJjaC5wdl92Y3B1
LmN0cmxyZWdbNF0gJiBYODZfQ1I0X0RFICkKPiArICAgICAgICAgICAgZ290byB1ZF9mYXVsdDsK
PiArCj4gKyAgICAgICAgLyogRmFsbHRocm91Z2ggKi8KPiArICAgIGNhc2UgNjoKPiArICAgICAg
ICAqdmFsID0gY3Vyci0+YXJjaC5kZWJ1Z3JlZ1s2XTsKPiArICAgICAgICBicmVhazsKPiArCj4g
KyAgICBjYXNlIDU6Cj4gKyAgICAgICAgaWYgKCBjdXJyLT5hcmNoLnB2X3ZjcHUuY3RybHJlZ1s0
XSAmIFg4Nl9DUjRfREUgKQo+ICsgICAgICAgICAgICBnb3RvIHVkX2ZhdWx0Owo+ICsKPiArICAg
ICAgICAvKiBGYWxsdGhyb3VnaCAqLwo+ICAgICAgY2FzZSA3Ogo+ICAgICAgICAgICp2YWwgPSAo
Y3Vyci0+YXJjaC5kZWJ1Z3JlZ1s3XSB8Cj4gICAgICAgICAgICAgICAgICBjdXJyLT5hcmNoLmRl
YnVncmVnWzVdKTsKCi4uLiBzb21ld2hlcmUgYWJvdmUgaGVyZS4gV2l0aCB0aGF0CkFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
