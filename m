From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/6] x86/vmx: Simplify PAT handling during
 vcpu construction
Date: Tue, 5 Jun 2018 07:57:26 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1911F3F73@SHSMSX101.ccr.corp.intel.com>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
 <1527517678-1779-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527517678-1779-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogTW9uZGF5LCBNYXkgMjgsIDIwMTggMTA6MjggUE0NCj4gDQo+IFRoZSBob3N0IFBB
VCB2YWx1ZSBpcyBhIGNvbXBpbGUgdGltZSBjb25zdGFudCwgYW5kIGRvZXNuJ3QgbmVlZCB0byBi
ZSByZWFkDQo+IG91dA0KPiBvZiBoYXJkd2FyZS4gIE1lcmdlIHRoaXMgaWYgYmxvY2sgaW50byB0
aGUgcHJldmlvdXMgYmxvY2ssIHdoaWNoIGhhcyBhbg0KPiBpZGVudGljYWwgY29uZGl0aW9uLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCg0KQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
