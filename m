From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 2/9] x86/vmx: Internal cleanup for MSR
 load/save infrastructure
Date: Sun, 27 May 2018 03:30:34 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19119307E@SHSMSX101.ccr.corp.intel.com>
References: <1526988046-22948-1-git-send-email-andrew.cooper3@citrix.com>
 <1526988046-22948-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1526988046-22948-3-git-send-email-andrew.cooper3@citrix.com>
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
Cj4gU2VudDogVHVlc2RheSwgTWF5IDIyLCAyMDE4IDc6MjEgUE0NCj4gDQo+ICAqIFVzZSBhbiBh
cmNoX3ZteF9zdHJ1Y3QgbG9jYWwgdmFyaWFibGUgdG8gcmVkdWNlIGxhdGVyIGNvZGUgdm9sdW1l
Lg0KPiAgKiBVc2Ugc3RhcnQvdG90YWwgaW5zdGVhZCBvZiBtc3JfYXJlYS9tc3JfY291bnQuICBU
aGlzIGlzIGluIHByZXBhcmF0aW9uIGZvcg0KPiAgICBtb3JlIGZpbmVncmFpbmVkIGhhbmRsaW5n
IHdpdGggbGF0ZXIgY2hhbmdlcy4NCj4gICogVXNlIGVudC9lbmQgcG9pbnRlcnMgKGFnYWluIGZv
ciBwcmVwYXJhdGlvbiksIGFuZCB0byBtYWtlIHRoZQ0KPiB2bXhfYWRkX21zcigpDQo+ICAgIGxv
Z2ljIGVhc2llciB0byBmb2xsb3cuDQo+ICAqIE1ha2UgdGhlIG1lbW9yeSBhbGxvY2F0aW9uIGJs
b2NrIG9mIHZteF9hZGRfbXNyKCkgdW5saWtlbHksIGFuZA0KPiBjYWxjdWxhdGUNCj4gICAgdmly
dF90b19tYWRkcigpIGp1c3Qgb25jZS4NCj4gDQo+IE5vIHByYWN0aWNhbCBjaGFuZ2UgdG8gZnVu
Y3Rpb25hbGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
