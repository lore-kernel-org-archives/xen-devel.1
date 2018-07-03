From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 0/8] PVH MTRR initial state
Date: Tue, 3 Jul 2018 10:17:07 +0200
Message-ID: <20180703081707.j2wrvlcyw7ld3ieu@mac.bytemobile.com>
References: <20180608095934.20995-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iwop=jt=citrix.com=prvs=715f702c9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1faGVP-0006t7-BP
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 08:17:47 +0000
Content-Disposition: inline
In-Reply-To: <20180608095934.20995-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdW4gMDgsIDIwMTggYXQgMTE6NTk6MjZBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEhlbGxvLAo+IAo+IFRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBzZXQgYSBzYW5lIGlu
aXRpYWwgTVRSUiBzdGF0ZSBmb3IgYm90aCBEb20wIGFuZAo+IERvbVUgUFZIIGd1ZXN0cy4gTm90
ZSB0aGF0IGZvciBEb20wIHRoZSBob3N0IE1UUlIgc3RhdGUgaXMgdXNlZCwgT1RPSAo+IGZvciBE
b21VIHRoZSBkZWZhdWx0IE1UUlIgdHlwZSBpcyBzZXQgdG8gd3JpdGUtYmFjay4KPiAKPiBUaGlz
IHNob3VsZCBhdm9pZCBndWVzdHMgaGF2aW5nIHRvIHNldHVwIHNvbWUga2luZCBvZiBNVFJSIHN0
YXRlIGluCj4gb3JkZXIgdG8gYm9vdC4KPiAKPiBUaGlzIGhhcyBiZWVuIHJlYmFzZWQgb24gdG9w
IG9mIGEgY291cGxlIG9mIGZpeGVzL2ltcHJvdmVtZW50cyBmcm9tIEphbiwKPiB3aGljaCBhcmUg
YWxzbyBpbmNsdWRlZCBpbiB0aGUgc2VyaWVzLgo+IAo+IFRoYW5rcywgUm9nZXIuCj4gCj4gSmFu
IEJldWxpY2ggKDIpOgo+ICAgeDg2L0hWTTogaW1wcm92ZSBNVFJSIGxvYWQgY2hlY2tzCj4gICB4
ODYvbXRycjogc3BsaXQgImVuYWJsZWQiIGZpZWxkIGludG8gdHdvIGJvb2xlYW4gZmxhZ3MKPiAK
PiBSb2dlciBQYXUgTW9ubmUgKDYpOgo+ICAgbXRycjogaW50cm9kdWNlIG1hc2sgdG8gZ2V0IFZD
TlQgZnJvbSBNVFJSY2FwIE1TUgo+ICAgaHZtL210cnI6IGFkZCBlbWFjcyBsb2NhbCB2YXJpYWJs
ZXMgYmxvY2sgd2l0aCBmb3JtYXR0aW5nIGluZm8KPiAgIGh2bS9tdHJyOiB1c2UgdGhlIGhhcmR3
YXJlIG51bWJlciBvZiB2YXJpYWJsZSByYW5nZXMgZm9yIERvbTAKPiAgIGh2bS9tdHJyOiBjb3B5
IGhhcmR3YXJlIHN0YXRlIGZvciBEb20wCj4gICBsaWJ4Yy9wdmg6IHNldCBkZWZhdWx0IE1UUlIg
dHlwZSB0byB3cml0ZS1iYWNrCj4gICBkb2NzL3B2aDogZG9jdW1lbnQgaW5pdGlhbCBNVFJSIHN0
YXRlCgpIZWxsbywKClBhdGNoZXMgIzIsICMzLCAjNCBhbmQgIzggZG9uJ3QgaGF2ZSBhbnkgcmV2
aWV3cyB5ZXQuIE5vdyB0aGF0IHRoZQp2cGNpIE1TSSBmaXhlcyBoYXZlIGJlZW4gY29tbWl0dGVk
IHRoZSBpbml0aWFsIE1UUlIgc3RhdGUgaXMgdGhlIGxhc3QKY2h1bmsgbWlzc2luZyBpbiBvcmRl
ciB0byBnZXQgaW5pdGlhbCBQVkggRG9tMCBzdXBwb3J0IGZ1bGx5CmZ1bmN0aW9uYWwuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
