From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 03/10] x86/spec_ctrl: Merge bti_ist_info and
 use_shadow_spec_ctrl into spec_ctrl_flags
Date: Mon, 14 May 2018 16:13:55 +0100
Message-ID: <20180514151355.mn2mkmdbnauntvhi@citrix.com>
References: <1526035094-14343-1-git-send-email-andrew.cooper3@citrix.com>
 <1526035094-14343-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1526035094-14343-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTEsIDIwMTggYXQgMTE6Mzg6MDdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBbGwgMyBiaXRzIG9mIGluZm9ybWF0aW9uIGhlcmUgYXJlIGNvbnRyb2wgZmxhZ3Mg
Zm9yIHRoZSBlbnRyeS9leGl0IGNvZGUKPiBiZWhhdmlvdXIuICBUcmVhdCB0aGVtIGFzIHN1Y2gs
IHJhdGhlciB0aGFuIGhhdmluZyB0d28gZGlmZmVyZW50IHZhcmlhYmxlcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhpcyBw
YXRjaCBkb2VzIHdoYXQgaXQgc2F5cyBvbiB0aGUgdGluLgoKRldJVzoKClJldmlld2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9zcGVjX2N0cmxfYXNtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3NwZWNfY3RybF9h
c20uaAo+IGluZGV4IGU4ZThmOWEuLjk3ZGEwOGIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9zcGVjX2N0cmxfYXNtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NwZWNf
Y3RybF9hc20uaAo+IEBAIC0yMCw5ICsyMCwxMCBAQAo+ICAjaWZuZGVmIF9fWDg2X1NQRUNfQ1RS
TF9BU01fSF9fCj4gICNkZWZpbmUgX19YODZfU1BFQ19DVFJMX0FTTV9IX18KPiAgCj4gLS8qIEVu
Y29kaW5nIG9mIHRoZSBib3R0b20gYml0cyBpbiBjcHVpbmZvLmJ0aV9pc3RfaW5mbyAqLwo+IC0j
ZGVmaW5lIEJUSV9JU1RfV1JNU1IgKDEgPDwgMSkKPiAtI2RlZmluZSBCVElfSVNUX1JTQiAgICgx
IDw8IDIpCj4gKy8qIEVuY29kaW5nIG9mIGNwdWluZm8uc3BlY19jdHJsX2ZsYWdzICovCj4gKyNk
ZWZpbmUgU0NGX3VzZV9zaGFkb3cgKDEgPDwgMCkKPiArI2RlZmluZSBTQ0ZfaXN0X3dybXNyICAo
MSA8PCAxKQo+ICsjZGVmaW5lIFNDRl9pc3RfcnNiICAgICgxIDw8IDIpCj4gIAoKRmFuY3kgdHVy
bmluZyB0aGVtIGludG8gMXUgPDwgWCB3aGlsZSB5b3UncmUgYXQgaXQ/CgpXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
