From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Thu, 28 Mar 2019 17:44:43 +0000
Message-ID: <232d7494-4976-4028-4cef-76f9bef85981@citrix.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TpF7=R7=citrix.com=prvs=9832a876b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h9Z56-00022b-H9
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 17:44:48 +0000
In-Reply-To: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yOC8xOSA1OjAzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBSZXBvcnRlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYXQgc2VlbXMgdG8gZml4IGFsbCB0aGUg
b25lcyByZWxhdGVkIHRvIHRoZSBjcmFzaGVzIEkgd2FzIHNlZWluZzoKClRlc3RlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKPiAtLS0KPiBUaGlzIGlzIHN1
cmVseSBhIHN0YWJsZSB0cmVlIGNhbmRpZGF0ZSwgdW5sZXNzIGl0IGNvdWxkIHN0aWxsIG1ha2Ug
aXQKPiBpbnRvIDQuMTIgYmVmb3JlIHRoZSByZWxlYXNlLgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMKPiBAQCAtMzUxMSw3ICszNTExLDcgQEAgeDg2X2VtdWxhdGUoCj4g
ICAgICB9Cj4gIAo+ICAgICAgLyogV2l0aCBhIG1lbW9yeSBvcGVyYW5kLCBmZXRjaCB0aGUgbWFz
ayByZWdpc3RlciBpbiB1c2UgKGlmIGFueSkuICovCj4gLSAgICBpZiAoIGVhLnR5cGUgPT0gT1Bf
TUVNICYmIGV2ZXgub3Btc2sgKQo+ICsgICAgaWYgKCBlYS50eXBlID09IE9QX01FTSAmJiBjcHVf
aGFzX2F2eDUxMmYgJiYgZXZleC5vcG1zayApCj4gICAgICB7Cj4gICAgICAgICAgdWludDhfdCAq
c3RiID0gZ2V0X3N0dWIoc3R1Yik7Cj4gIAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
