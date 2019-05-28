From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 1/2] x86: init_hypercall_page() cleanup
Date: Tue, 28 May 2019 05:31:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA4E6B9@SHSMSX104.ccr.corp.intel.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hVUhc-0004rE-A1
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 05:31:12 +0000
In-Reply-To: <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE1heSAyMywgMjAxOSA2OjIwIFBNDQo+IA0KPiBUaGUgdmFyaW91
cyBwaWVjZXMgb2YgdGhlIGh5cGVyY2FsbCBwYWdlIGluZnJhc3RydWN0dXJlIGhhdmUgZ3Jvd24N
Cj4gb3JnYW5pY2FsbHkgb3ZlciB0aW1lIGFuZCBlbmRlZCB1cCBpbiBhIGJpdCBvZiBhIG1lc3Mu
DQo+IA0KPiAgKiBSZW5hbWUgYWxsIGZ1bmN0aW9ucyB0byBiZSBvZiB0aGUgZm9ybSAqX2luaXRf
aHlwZXJjYWxsX3BhZ2UoKS4gIFRoaXMNCj4gICAgbWFrZXMgdGhlbSBzb21ld2hhdCBzaG9ydGVy
LCBhbmQgbWVhbnMgdGhleSBjYW4gYWN0dWFsbHkgYmUgZ3JlcHBlZA0KPiAgICBmb3IgaW4gb25l
IGdvLg0KPiAgKiBNb3ZlIGluaXRfaHlwZXJjYWxsX3BhZ2UoKSB0byBkb21haW4uYy4gIFRoZSA2
NC1iaXQgdHJhcHMuYyBpc24ndCBhDQo+ICAgIHRlcnJpYmx5IGFwcHJvcHJpYXRlIHBsYWNlIGZv
ciBpdCB0byBsaXZlLg0KPiAgKiBEcm9wIGFuIG9ic29sZXRlIGNvbW1lbnQgZnJvbSBodm1faW5p
dF9oeXBlcmNhbGxfcGFnZSgpIGFuZCBkcm9wIHRoZQ0KPiAgICBkb21haW4gcGFyYW1ldGVyIGZy
b20gaHZtX2Z1bmNzLmluaXRfaHlwZXJjYWxsX3BhZ2UoKSBhcyBpdCBpc24ndA0KPiAgICBuZWNl
c3NhcnkuDQo+ICAqIFJlYXJyYW5nZSB0aGUgbG9naWMgaW4gdGhlIGVhY2ggZnVuY3Rpb24gdG8g
YXZvaWQgbmVlZGluZyBleHRyYSBsb2NhbA0KPiAgICB2YXJpYWJsZXMsIGFuZCB0byB3cml0ZSB0
aGUgcGFnZSBpbiBvbmUgc2luZ2xlIHBhc3MuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
