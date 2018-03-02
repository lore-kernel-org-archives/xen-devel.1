From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: invpcid support
Date: Fri, 2 Mar 2018 15:20:40 +0000
Message-ID: <20180302152040.yjcerbkclburtu5o@citrix.com>
References: <20180302144713.13311-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lugh=fy=citrix.com=prvs=592fbcc37=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ermUL-0007QZ-0G
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 15:20:49 +0000
Content-Disposition: inline
In-Reply-To: <20180302144713.13311-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDIsIDIwMTggYXQgMDI6NDc6MTNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBQcm92aWRlIHRoZSBmdW5jdGlvbnMgbmVlZGVkIGZvciBkaWZmZXJlbnQgbW9kZXMuIEFuZCBj
cHVfaGFzX2ludnBjaWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiAtLS0KPiBUaGlzIGlzIHVzZWZ1bCBmb3IgSnVlcmdlbidzIFhQVEkgaW1wcm92
ZW1lbnQgc2VyaWVzLgo+IAo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L1J1bGVzLm1r
ICAgICAgICAgICAgfCAgMSArCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZS5oIHwg
IDEgKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2ludnBjaWQuaCAgICB8IDc1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2ludnBj
aWQuaAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvUnVsZXMubWsgYi94ZW4vYXJjaC94
ODYvUnVsZXMubWsKPiBpbmRleCA5ODk3ZGVhYWI5Li5jOTQxMDU5ZjQyIDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawo+IEBA
IC0yMyw2ICsyMyw3IEBAICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywicmRzZWVkICVl
YXgiLC1ESEFWRV9HQVNfUkRTRUVEKQo+ICAkKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0Ms
Ii5lcXUgXCJ4XCIkJChjb21tYSkxIiwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAtVV9fT0JK
RUNUX0xBQkVMX18gLURIQVZFX0dBU19RVU9URURfU1lNIFwKPiAgICAgICAgICAgICAgICAgICAg
ICAgJy1EX19PQkpFQ1RfTEFCRUxfXz0kKHN1YnN0ICQoQkFTRURJUikvLCwkKENVUkRJUikpLyQk
QCcpCj4gKyQoY2FsbCBhcy1pbnNuLWNoZWNrLENGTEFHUyxDQywiaW52cGNpZCAoJXJheCkkJChj
b21tYSklcmF4IiwtREhBVkVfR0FTX0lOVlBDSUQpCgpBaCwgYW5kIHRoaXMgYWxzbyBuZWVkcyB0
byBiZSByZXBsYWNlZCB3aXRoIGFzLW9wdGlvbi1hZGQuCgpXZWkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
