From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 5/6] x86/vmx: Defer vmx_vmcs_exit() as long
 as possible in construct_vmcs()
Date: Tue, 5 Jun 2018 08:00:10 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1911F3F98@SHSMSX101.ccr.corp.intel.com>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
 <1527517678-1779-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527517678-1779-6-git-send-email-andrew.cooper3@citrix.com>
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
Cj4gU2VudDogTW9uZGF5LCBNYXkgMjgsIDIwMTggMTA6MjggUE0NCj4gDQo+IHBhZ2luZ191cGRh
dGVfcGFnaW5nX21vZGVzKCkgYW5kIHZteF92bGFwaWNfbXNyX2NoYW5nZWQoKSBib3RoDQo+IG9w
ZXJhdGUgb24gdGhlDQo+IFZNQ1MgYmVpbmcgY29uc3RydWN0ZWQuICBBdm9pZCBkcm9wcGluZyBh
bmQgcmUtYWNxdWlyaW5nIHRoZSByZWZlcmVuY2UNCj4gbXVsdGlwbGUgdGltZXMuDQo+IA0KDQpB
Y2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
