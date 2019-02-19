From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 1/4] x86/mm: split p2m ioreq server pages
 special handling into helper
Date: Tue, 19 Feb 2019 05:47:34 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C94BC2B@SHSMSX104.ccr.corp.intel.com>
References: <20190218172727.19644-1-roger.pau@citrix.com>
 <20190218172727.19644-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BFGP=Q2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gvyFs-0002hN-GX
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 05:47:44 +0000
In-Reply-To: <20190218172727.19644-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogVHVlc2RheSwgRmVicnVhcnkgMTksIDIwMTkgMToyNyBBTQ0KPiANCj4gU28gdGhhdCBp
dCBjYW4gYmUgc2hhcmVkIGJ5IGJvdGggZXB0LCBucHQgYW5kIHNoYWRvdyBjb2RlLCBpbnN0ZWFk
IG9mDQo+IGR1cGxpY2F0aW5nIGl0Lg0KPiANCj4gTm8gY2hhbmdlIGluIGZ1bmN0aW9uYWxpdHkg
aW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4uIHdpdGggb25lDQpzbWFsbCBjb21tZW50Og0KDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQg
cDJtX2VudHJ5X21vZGlmeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPiBwMm1fdHlwZV90IG50
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwg
dW5zaWduZWQgaW50IGxldmVsKQ0KPiArew0KPiArICAgIGlmICggbGV2ZWwgIT0gMSB8fCBudCA9
PSBvdCApDQo+ICsgICAgICAgIHJldHVybjsNCg0KYmFzZWQgb24gdHlwZSBjaGVjaywgZG9lcyBp
dCBtYWtlIG1vcmUgc2Vuc2UgdG8gY2FsbCBpdA0KcDJtX2VudHJ5X21vZGlmeV90eXBlPw0KDQpU
aGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
