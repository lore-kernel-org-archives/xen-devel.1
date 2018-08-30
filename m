From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/6] VMX: correct PDPTE load checks
Date: Thu, 30 Aug 2018 01:24:45 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912E107C@SHSMSX101.ccr.corp.intel.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CAD02000078001D5D55@prv1-mh.provo.novell.com>
 <5d4aa341-60eb-7170-72f6-a9845e1a4f81@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bxg0=ln=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fvBkf-0002Jk-Ek
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 01:28:01 +0000
In-Reply-To: <5d4aa341-60eb-7170-72f6-a9845e1a4f81@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI4LCAyMDE4IDk6MTIgUE0NCj4gPiArICAgIHZhbGlk
X21hc2sgPSAoKDFVTEwgPDwgdi0+ZG9tYWluLT5hcmNoLmNwdWlkLT5leHRkLm1heHBoeXNhZGRy
KSAtDQo+IDEpICYNCj4gPiArICAgICAgICAgICAgICAgICAoUEFHRV9NQVNLIHwgX1BBR0VfQVZB
SUwgfCBfUEFHRV9QUkVTRU5UKTsNCj4gDQo+IEhvdyBkaWQgeW91IGNvbWUgYWNyb3NzIHRoaXMg
bGlzdD/CoCBUaGUgb25seSB2YWxpZCBiaXRzIGFyZSBQcmVzZW50LCBQV1QNCj4gYW5kIFBDRCwg
d2hpbGUgdGhlIHVwcGVyIG5pYmJsZSBvZiBjb250cm9sIGJpdHMgaXMgZG9jdW1lbnRlZCBhcyBp
Z25vcmVkDQo+IHJhdGhlciB0aGFuIHJlc2VydmVkLg0KDQpBZ3JlZSB0aGF0IFBXVC9QQ0Qgc2hv
dWxkIGJlIGFkZGVkIHRvIG1hc2sgdG9vLiBfUEFHRV9BVkFJTCBpcyByaWdodA0KaGVyZSBzdGFu
ZGluZyBmb3IgaWdub3JlZCBiaXRzLg0KDQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
