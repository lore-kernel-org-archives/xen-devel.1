From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] vvmx: fixes after CR4 trapping
	optimizations
Date: Wed, 7 Mar 2018 05:48:34 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19102EE4D@SHSMSX101.ccr.corp.intel.com>
References: <20180302161929.31883-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i2xp=f5=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1etRwV-00038o-13
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 05:48:47 +0000
In-Reply-To: <20180302161929.31883-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogU2F0dXJkYXksIE1hcmNoIDMsIDIwMTggMTI6MTkgQU0NCj4gDQo+IENvbW1pdCA0MDY4
MTcgZG9lc24ndCB1cGRhdGUgbmVzdGVkIFZNWCBjb2RlIGluIG9yZGVyIHRvIHRha2UgaW50bw0K
PiBhY2NvdW50IEwxIENSNCBob3N0IG1hc2sgd2hlbiBuZXN0ZWQgZ3Vlc3QgKEwyKSB3cml0ZXMg
dG8gQ1I0LCBhbmQNCj4gdGh1cyB0aGUgbWFzayB3cml0dGVuIHRvIENSNF9HVUVTVF9IT1NUX01B
U0sgaXMgbGlrZWx5IG5vdCBhcw0KPiByZXN0cmljdGl2ZSBhcyBpdCBzaG91bGQgYmUuDQo+IA0K
PiBBbHNvIHRoZSBWVk1DUyBHVUVTVF9DUjQgdmFsdWUgc2hvdWxkIGJlIHVwZGF0ZWQgdG8gbWF0
Y2ggdGhlDQo+IHVuZGVybHlpbmcgdmFsdWUgd2hlbiBzeW5jaW5nIHRoZSBWVk1DUyBzdGF0ZS4N
Cj4gDQo+IEZpeGVzOiA0MDY4MTcgKCJ2bXgvaGFwOiBvcHRpbWl6ZSBDUjQgdHJhcHBpbmciKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4N
Cg0KQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
