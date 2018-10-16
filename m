From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] arch/x86: Add registers to vm_event
Date: Tue, 16 Oct 2018 11:25:30 +0100
Message-ID: <d69720c7-0df7-6ddc-8da0-c46f4c897fd3@citrix.com>
References: <20181015145209.23162-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g94e=m4=citrix.com=prvs=820d23aae=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gCMXt-0007B4-UB
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 10:25:49 +0000
In-Reply-To: <20181015145209.23162-1-aisaila@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMTggMTU6NTIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+IFRoaXMg
cGF0Y2ggYWRkcyBhIGNvdXBsZSBvZiByZWdzIHRvIHRoZSB2bV9ldmVudCB0aGF0IGFyZSB1c2Vk
IGJ5Cj4gdGhlIGludHJvc3BlY3Rpb24uIFRoZSBiYXNlLCBsaW1pdCBhbmQgYXIKPiBiaXRzIGFy
ZSBjb21wcmVzc2VkIGludG8gYSB1aW50NjRfdCB1bmlvbiBzbyBhcyBub3QgdG8gZW5sYXJnZSB0
aGUKPiB2bV9ldmVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvdm1fZXZlbnQuYyAgICAg
ICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIHhlbi9pbmNsdWRl
L3B1YmxpYy92bV9ldmVudC5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMKPiBpbmRleCAxNWRlNDNjM2U2Li4yODhkYTAwODdmIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni92bV9ldmVudC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPiBAQCAtMTcx
LDEzICsxNzEsNDIgQEAgdm9pZCB2bV9ldmVudF9maWxsX3JlZ3Modm1fZXZlbnRfcmVxdWVzdF90
ICpyZXEpCj4gICAgICByZXEtPmRhdGEucmVncy54ODYubXNyX2xzdGFyID0gY3R4dC5tc3JfbHN0
YXI7Cj4gIAo+ICAgICAgaHZtX2dldF9zZWdtZW50X3JlZ2lzdGVyKGN1cnIsIHg4Nl9zZWdfZnMs
ICZzZWcpOwo+IC0gICAgcmVxLT5kYXRhLnJlZ3MueDg2LmZzX2Jhc2UgPSBzZWcuYmFzZTsKPiAr
ICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5mcy5maWVsZHMuYmFzZSA9IHNlZy5iYXNlOwo+ICsgICAg
cmVxLT5kYXRhLnJlZ3MueDg2LmZzLmZpZWxkcy5saW1pdCA9IHNlZy5saW1pdDsKPiArICAgIHJl
cS0+ZGF0YS5yZWdzLng4Ni5mcy5maWVsZHMuYXIgPSBzZWcuYXR0cjsKPiArICAgIHJlcS0+ZGF0
YS5yZWdzLng4Ni5mc19zZWwgPSBzZWcuc2VsOwoKVGhpcyBpc24ndCBjb3JyZWN0IGZvciB0aGUg
bGltaXQuwqAgVGhlIHBhY2tpbmcgbG9naWMgbmVlZHMgdG8gbG9vawpzb21ldGhpbmcgbGlrZToK
CmlmICggc2VnLmF0dHIuZyApCsKgwqDCoCByZXEtPmRhdGEucmVncy54ODYuZnMuZmllbGRzLmxp
bWl0ID0gc2VnLmxpbWl0ID4+IDEyOwplbHNlCsKgwqDCoCByZXEtPmRhdGEucmVncy54ODYuZnMu
ZmllbGRzLmxpbWl0ID0gc2VnLmxpbWl0OwoKT3RoZXJ3aXNlIHlvdSB0cnVuY2F0ZSB0aGUgcmVz
dWx0IGluIHRoZSBkZWZhdWx0IGNhc2UuCgpGdXJ0aGVybW9yZSwgSSdkIHJlY29tbWVuZCBjcmVh
dGluZyBhIGhlbHBlciBmdW5jdGlvbiBmb3IgcGFja2luZy4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
