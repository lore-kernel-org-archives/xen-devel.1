From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Thu, 19 Apr 2018 08:19:09 +0200
Message-ID: <35756e6c-dc79-f0a1-df31-bca0495e3352@suse.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-2-jgross@suse.com> <5AD76E5A02000078001BC770@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gvlu=hi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f92ur-0005Fw-U8
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 06:19:33 +0000
In-Reply-To: <5AD76E5A02000078001BC770@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTg6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA0LjE4IGF0
IDEwOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTE2MCw1ICsxNjEsMjAgQEAg
dW5zaWduZWQgaW50IGZsdXNoX2FyZWFfbG9jYWwoY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGlu
dCBmbGFncykKPj4gIAo+PiAgICAgIGxvY2FsX2lycV9yZXN0b3JlKGlycWZsKTsKPj4gIAo+PiAr
ICAgIGlmICggZmxhZ3MgJiBGTFVTSF9ST09UX1BHVEJMICkKPj4gKyAgICAgICAgZ2V0X2NwdV9p
bmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwo+PiArCj4+ICAgICAgcmV0dXJuIGZsYWdz
Owo+PiAgfQo+PiArCj4+ICt2b2lkIGZsdXNoX3Jvb3RfcGd0X21hc2soY3B1bWFza190ICptYXNr
KQo+IAo+IGNvbnN0Cj4gCj4+ICt7Cj4+ICsgICAgaW50IGNwdTsKPiAKPiB1bnNpZ25lZCBpbnQK
PiAKPj4gKyAgICBzdHJ1Y3QgY3B1X2luZm8gKmNwdV9pbmZvOwo+IAo+IERlY2xhcmF0aW9uIGlu
IG1vc3QgbmFycm93IHBvc3NpYmxlIHNjb3BlIHBsZWFzZS4KPiAKPj4gKyAgICBmb3JfZWFjaF9j
cHUoY3B1LCBtYXNrKQo+PiArICAgIHsKPj4gKyAgICAgICAgY3B1X2luZm8gPSAoc3RydWN0IGNw
dV9pbmZvICopKHN0YWNrX2Jhc2VbY3B1XSArIFNUQUNLX1NJWkUpIC0gMTsKPj4gKyAgICAgICAg
Y3B1X2luZm8tPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwo+PiArICAgIH0KPj4gK30KPiAKPiBT
byB3aHkgaXMgdGhpcyBub3Qgc2VuZGluZyBhbiBJUEkgdG8gdHJpZ2dlciB0aGUgRkxVU0hfUk9P
VF9QR1RCTCBwcm9jZXNzaW5nCj4gdmlzaWJsZSBhYm92ZT8KCkl0IGlzIG5vdCBuZWVkZWQgZm9y
IHRoZSBjYXNlIHRoaXMgZnVuY3Rpb24gd2FzIGludHJvZHVjZWQuIE1heWJlIEkKc2hvdWxkIHJl
bmFtZSBpdCB0byBmbHVzaF9yb290X3BndF9tYXNrX2xhenkoKSA/Cgo+IEVzcGVjaWFsbHkgdGhl
IGNhc3QgeW91IG5lZWQgaGVyZSBsb29rcyBxdWl0ZSB1bmRlc2lyYWJsZS4KCkluIGdldF9jcHVf
aW5mbygpIGl0IGlzIGRvbmUgdGhlIHNhbWUgd2F5LiBJIGNhbiBhZGQgYSBjb21tb24gaGVscGVy
CmZ1bmN0aW9uIHRvIGN1cnJlbnQuaAoKPiBQbHVzIEkKPiB0aGluayB0aGlzIGlzIHJhY3kgKGV2
ZW4gaWYgcXVpdGUgdW5saWtlbHkgdG8gdHJpZ2dlcikgd2l0aCBhIENQVSBiZWluZyBicm91Z2h0
IGRvd246Cj4gV2hhdCBpZiBzdGFja19iYXNlW2NwdV0gYmVjb21lcyBOVUxMIGFmdGVyIHlvdSd2
ZSBmb3VuZCB0aGUgcmVzcGVjdGl2ZSBiaXQgaW4KPiBtYXNrIHNldC4gRXNwZWNpYWxseSB3aGVu
IFhlbiBydW5zIGl0c2VsZiB2aXJ0dWFsaXplZCwgKGFsbW9zdCkgYXJiaXRyYXJpbHkgbG9uZwo+
IHBlcmlvZHMgb2YgdGltZSBtYXkgcGFzcyBiZXR3ZWVuIGFueSB0d28gaW5zdHJ1Y3Rpb25zLgoK
UmlnaHQuCgpTbyBlaXRoZXIgSSdtIGFkZGluZyBzb21lIGtpbmQgb2YgbG9ja2luZy9yY3UsIG9y
IEknbSBzd2l0Y2hpbmcgdG8gdXNlCklQSXMgYW5kIGFjY2VzcyByb290X3BndF9jaGFuZ2VkIG9u
bHkgbG9jYWxseS4KCkRvIHlvdSBoYXZlIGFueSBwcmVmZXJlbmNlPwoKCkp1ZXJnZW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
