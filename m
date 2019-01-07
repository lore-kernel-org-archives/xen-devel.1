From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] string: avoid undefined behavior in
 strrchr()
Date: Mon, 7 Jan 2019 10:49:03 +0100
Message-ID: <270e0e52-d344-7d7d-d044-820bedda13f3@suse.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
 <5C331E3E020000780020AB50@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AFjD=PP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ggRWt-0008Ty-8y
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 09:49:07 +0000
In-Reply-To: <5C331E3E020000780020AB50@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHByZS1kZWNyZW1l
bnQgd291bGQgbm90IG9ubHkgY2F1c2UgbWlzYmVoYXZpb3Igd2hlbiB3cmFwcGluZyAoYmVuaWdu
Cj4gYmVjYXVzZSB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IE5VTEwgcG9pbnRlcnMgcGFzc2VkIGlu
KSwgYnV0IG1heSBhbHNvCj4gY3JlYXRlIGEgcG9pbnRlciBwb2ludGluZyBvdXRzaWRlIHRoZSBv
YmplY3QgdGhhdCB0aGUgcGFzc2VkIGluIHBvaW50ZXIKPiBwb2ludHMgdG8gKGl0IHdvbid0IGJl
IGRlLXJlZmVyZW5jZWQgdGhvdWdoKS4gVXNlIHBvc3QtZGVjcmVtZW50IChhbmQgPgo+IGluc3Rl
YWQgb2YgPj0gKSBpbnN0ZWFkLgoKVGhpcyBjb21taXQgbWVzc2FnZSBkb2Vzbid0IG1hdGNoIHRo
ZSBwYXRjaC4gVGhlcmUgaXMgbm8gcG9zdC1kZWNyZW1lbnQKYW5kICc+JyBpbnZvbHZlZC4KCldp
dGggdGhhdCBmaXhlZCB5b3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQg
YWxzbwo+IC0gY29udmVydCBib2d1cyBzcGFjZSAocGFydGx5IDcgb2YgdGhlbSkgaW5kZW50YXRp
b24gdG8gTGludXggc3R5bGUgdGFiCj4gICBvbmUsCj4gLSBhZGQgdHdvIGJsYW5rIGxpbmVzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAt
LS0gYS94ZW4vY29tbW9uL3N0cmluZy5jCj4gKysrIGIveGVuL2NvbW1vbi9zdHJpbmcuYwo+IEBA
IC0xNzQsMTIgKzE3NCwxMyBAQCBjaGFyICooc3RyY2hyKShjb25zdCBjaGFyICpzLCBpbnQgYykK
PiAgICovCj4gIGNoYXIgKihzdHJyY2hyKShjb25zdCBjaGFyICpzLCBpbnQgYykKPiAgewo+IC0g
ICAgICAgY29uc3QgY2hhciAqcCA9IHMgKyBzdHJsZW4ocyk7Cj4gLSAgICAgICBkbyB7Cj4gLSAg
ICAgICAgICAgaWYgKCpwID09IChjaGFyKWMpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAoY2hh
ciAqKXA7Cj4gLSAgICAgICB9IHdoaWxlICgtLXAgPj0gcyk7Cj4gLSAgICAgICByZXR1cm4gTlVM
TDsKPiArCWNvbnN0IGNoYXIgKnAgPSBzICsgc3RybGVuKHMpOwo+ICsKPiArCWZvciAoOyAqcCAh
PSAoY2hhciljOyAtLXApCj4gKwkJaWYgKHAgPT0gcykKPiArCQkJcmV0dXJuIE5VTEw7Cj4gKwo+
ICsJcmV0dXJuIChjaGFyICopcDsKPiAgfQo+ICAjZW5kaWYKPiAgCj4gCj4gCj4gCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
