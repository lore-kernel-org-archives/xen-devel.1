From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/4] x86/vmx: Properly flush the TLB when an
 altp2m is modified
Date: Thu, 28 Feb 2019 05:50:52 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C96B393@SHSMSX104.ccr.corp.intel.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMCwgMjAxOSA2OjE5IEFNDQo+IA0KPiBNb2Rp
ZmljYWl0b25zIHRvIGFuIGFsdHAybSBtYXJrIHRoZSBwMm0gYXMgbmVlZGluZyBmbHVzaGluZywg
YnV0IHRoaXMgd2FzDQoNCk1vZGlmaWNhdGlvbnMNCg0KPiBuZXZlciB3aXJlZCB1cCBpbiB0aGUg
cmV0dXJuLXRvLWd1ZXN0IHBhdGguICBBcyBhIHJlc3VsdCwgc3RhbGUgVExCIGVudHJpZXMNCj4g
Y2FuIHJlbWFpbiBhZnRlciByZXN1bWluZyB0aGUgZ3Vlc3QuDQo+IA0KPiBJbiBwcmFjdGljZSwg
dGhpcyBtYW5pZmVzdHMgYXMgYSBtaXNzaW5nIEVQVF9WSU9MQVRJT04gb3IgI1ZFIGV4Y2VwdGlv
bg0KPiB3aGVuDQo+IHRoZSBndWVzdCBzdWJzZXF1ZW50bHkgYWNjZXNzZXMgYSBwYWdlIHdoaWNo
IGhhcyBoYWQgaXRzIHBlcm1pc3Npb25zDQo+IHJlZHVjZWQuDQo+IA0KPiB2bXhfdm1lbnRlcl9o
ZWxwZXIoKSBub3cgaGFzIDExIHAybXMgdG8gcG90ZW50aWFsbHkgaW52YWxpZGF0ZSwgYnV0IGlz
c3VpbmcNCj4gMTENCj4gSU5WRVBUIGluc3RydWN0aW9ucyBpc24ndCBjbGV2ZXIuICBJbnN0ZWFk
LCBjb3VudCBob3cgbWFueSBjb250ZXh0cyBuZWVkDQo+IGludmFsaWRhdGluZywgYW5kIHVzZSBJ
TlZFUFRfQUxMX0NPTlRFWFQgaWYgdHdvIG9yIG1vcmUgYXJlIGluIG5lZWQgb2YNCj4gZmx1c2hp
bmcuDQo+IA0KPiBUaGlzIGRvZXNuJ3QgaGF2ZSBhbiBYU0EgYmVjYXVzZSBhbHRwMm0gaXMgbm90
IHlldCBhIHNlY3VyaXR5LXN1cHBvcnRlZA0KPiBmZWF0dXJlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6
IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
