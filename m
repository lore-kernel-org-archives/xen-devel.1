From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 11/16] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Thu, 13 Sep 2018 16:43:48 +0100
Message-ID: <20180913154348.u473tkh5mzy3podd@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-12-wei.liu2@citrix.com>
 <CABfawh=aBbV8P=iA3u17p1D3v=LspGUTyd-gjVsSEPuQn+y8=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p4g3=l3=citrix.com=prvs=78776abe6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0Tmf-0002x8-6y
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 15:43:57 +0000
Content-Disposition: inline
In-Reply-To: <CABfawh=aBbV8P=iA3u17p1D3v=LspGUTyd-gjVsSEPuQn+y8=g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDM6Mjc6MzdQTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDQsIDIwMTgsIDEwOjI5IEFNIFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+ID4gR29pbmcgdGhyb3VnaCB0aGUgY29kZSwgSEFQLCBF
UFQsIFBvRCBhbmQgQUxUUDJNIGRlcGVuZCBvbiBIVk0gY29kZS4KPiA+IFB1dCB0aGVzZSBjb21w
b25lbnRzIHVuZGVyIENPTkZJR19IVk0uIFRoaXMgZnVydGhlciByZXF1aXJlcyBwdXR0aW5nCj4g
PiBvbmUgb2YgdGhlIHZtIGV2ZW50IHVuZGVyIENPTkZJR19IVk0uCj4gPgo+ID4gQWx0cDJtIHJl
cXVpcmVzIGEgYml0IG1vcmUgYXR0ZW50aW9uIGJlY2F1c2UgaXRzIGNvZGUgaXMgZW1iZWRkZWQg
aW4KPiA+IGdlbmVyaWMgeDg2IHAybSBjb2RlLgo+ID4KPiA+IEFsc28gbWFrZSBoYXBfZW5hYmxl
ZCBldmFsdWF0ZSB0byBmYWxzZSB3aGVuICFDT05GSUdfSFZNLiBNYWtlIHN1cmUgaXQKPiA+IGV2
YWx1YXRlIGl0cyBwYXJhbWV0ZXIgdG8gYXZvaWQgdW51c2VkIHZhcmlhYmxlIHdhcm5pbmdzIGlu
IGl0cyB1c2Vycy4KPiA+Cj4gPiBBbHNvIHNvcnQgaXRlbXMgaW4gTWFrZWZpbGUgd2hpbGUgYXQg
aXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
PiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZSAgICAgICAgIHwgMTEgKysrKysr
LS0tLS0KPiA+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jICAgICB8IDE4ICsrKysrKysr
KysrKysrKysrLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgIHwgIDIgKysK
PiA+ICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICB8IDIzICsrKysrKysrKysrKy0t
LS0tLS0tLS0tCj4gPiAgeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAgICAgICAgfCAgMiArKwo+
ID4KPiAKPiBBcyBiZWZvcmUsIHBsZWFzZSBvbmx5IGFwcGx5IENPTkZJR19IVk0gaWZkZWZzIHRv
IHg4NiBzcGVjaWZpYyBwYXJ0cy4gV2UKPiBoYXZlIGFuIGFsdHAybSBpbXBsZW1lbnRhdGlvbiBm
b3IgQVJNIHRoYXQgaXMgcGxhbm5lZCB0byBiZSBwb3N0ZWQgYWdhaW4gdG8KPiB0aGUgbWFpbGlu
Z2xpc3QgaW4gdGhlIG5lYXIgZnV0dXJlLgoKSSB0YWtlIHRoYXQgeW91IGFyZSBzcGVjaWZpY2Fs
bHkgdGFsa2luZyBhYm91dCBjb21tb24vdm1fZXZlbnQuYyBiZWNhdXNlCnRoYXQncyB0aGUgb25s
eSBjb21tb24gY29kZSBoZXJlIGluIHRoZSBsaXN0IG9mIGZpbGUuCgpJIGhhdmUgc3dpdGNoZWQg
dG8gcHJvdmlkZSBhIHN0dWIgZm9yIHAybV9hbHRwMm1fY2hlY2sgaW4geDg2IGhlYWRlcgppbnN0
ZWFkLgoKV2VpLgoKPiAKPiBUaGFua3MsCj4gVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
