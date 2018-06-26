From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11 v2 2/3] x86: guard against #NM
Date: Tue, 26 Jun 2018 10:41:52 +0100
Message-ID: <cbd9d68d-47db-e947-14a5-ff3f43490af0@citrix.com>
References: <5B31DC2702000078001CDBEC@prv1-mh.provo.novell.com>
 <5B31DF0502000078001CDC14@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a3a5=jm=citrix.com=prvs=7081fe03c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fXkU0-00083w-4D
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 09:41:56 +0000
In-Reply-To: <5B31DF0502000078001CDC14@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMDc6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEp1c3QgaW4gY2FzZSB3ZSBz
dGlsbCBkb24ndCBnZXQgQ1IwLlRTIGhhbmRsaW5nIHJpZ2h0LCBwcmV2ZW50IGEgaG9zdAo+IGNy
YXNoIGJ5IGhvbm9yaW5nIGV4Y2VwdGlvbiBmaXh1cHMgaW4gZG9fZGV2aWNlX25vdF9hdmFpbGFi
bGUoKS4gVGhpcwo+IHdvdWxkIGluIHBhcnRpY3VsYXIgY292ZXIgZW11bGF0b3Igc3R1YnMgcmFp
c2luZyAjTk0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gLS0tCj4gdjI6IEFkZCBBU1NFUlRfVU5SRUFDSEFCTEUoKS4KPgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKPiBAQCAtMTc0OSw3
ICsxNzQ5LDIxIEBAIHZvaWQgZG9fZGV2aWNlX25vdF9hdmFpbGFibGUoc3RydWN0IGNwdV8KPiAg
ewo+ICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+ICAKPiAtICAgIEJVR19PTigh
Z3Vlc3RfbW9kZShyZWdzKSk7Cj4gKyAgICBpZiAoICFndWVzdF9tb2RlKHJlZ3MpICkKPiArICAg
IHsKPiArICAgICAgICB1bnNpZ25lZCBsb25nIGZpeHVwID0gc2VhcmNoX2V4Y2VwdGlvbl90YWJs
ZShyZWdzKTsKPiArCj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCAiI05NOiAlcCBbJXBz
XSAtPiAlcFxuIiwKCmdwcmludGsoKSBwbGVhc2UuwqAgdGhlIGN1cnJlbnQgdmNwdSBpcyB2ZXJ5
IGxpa2VseSByZWxldmFudCwgYW5kIGl0CndvdWxkIGJlIGV4dHJlbWVseSB1c2VmdWwgdG8gc2Vl
IHRoaXMgbGluZSBpbiByZWxlYXNlIGJ1aWxkcyB3aGVyZSBpdCB0bwpoYXBwZW4uCgo+ICsgICAg
ICAgICAgICAgICAgX3AocmVncy0+cmlwKSwgX3AocmVncy0+cmlwKSwgX3AoZml4dXApKTsKPiAr
ICAgICAgICAvKgo+ICsgICAgICAgICAqIFdlIG11c3RuJ3QgY29tZSBoZXJlLCBidXQgZm9yIHJl
bGVhc2UgYnVpbGRzIGhhdmUgdGhlIHJlY292ZXJ5CgoiV2Ugc2hvdWxkbid0IGJlIGFibGUgdG8g
cmVhY2ggaGVyZS4uLiIKCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+ICsgICAgICAgICAqIGxvZ2ljIGluIHBsYWNlIG5l
dmVydGhlbGVzcy4KPiArICAgICAgICAgKi8KPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUo
KTsKPiArICAgICAgICBCVUdfT04oIWZpeHVwKTsKPiArICAgICAgICByZWdzLT5yaXAgPSBmaXh1
cDsKPiArICAgICAgICByZXR1cm47Cj4gKyAgICB9Cj4gIAo+ICAgICAgdmNwdV9yZXN0b3JlX2Zw
dV9sYXp5KGN1cnIpOwo+ICAKPgo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
