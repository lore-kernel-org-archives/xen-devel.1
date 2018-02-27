From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] fuzz/x86_emulate: fix bounds for input
 size
Date: Tue, 27 Feb 2018 10:39:31 +0000
Message-ID: <6ce2fed1-7b1f-ef5a-5954-c14b35212b5d@citrix.com>
References: <20180223163009.b42xfl3euanth3b7@citrix.com>
 <20180223224857.10212-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7dn/=fv=citrix.com=prvs=589f73368=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eqcfb-000565-P3
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 10:39:39 +0000
In-Reply-To: <20180223224857.10212-1-semelpaul@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Semel <semelpaul@gmail.com>, xen-devel@lists.xenproject.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, wei.liu2@citrix.com, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAxMDo0OCBQTSwgUGF1bCBTZW1lbCB3cm90ZToKPiBUaGUgbWF4aW11bSBz
aXplIGZvciB0aGUgaW5wdXQgc2l6ZSB3YXMgc2V0IHRvIElOUFVUX1NJWkUsIHdoaWNoIGlzIGFj
dHVhbGx5Cj4gdGhlIHNpemUgb2YgdGhlIGRhdGEgYXJyYXkgaW5zaWRlIHRoZSBmdXp6X2NvcnB1
cyBzdHJ1Y3R1cmUgYW5kIHNvIHdhcyBub3QKPiBhYmxpbmcgdXNlciAob3IgQUZMKSB0byBmaWxs
IGluIHRoZSB3aG9sZSBzdHJ1Y3R1cmUuIENoYW5naW5nIHRvCj4gc2l6ZW9mKHN0cnVjdCBmdXp6
X2NvcnB1cykgY29ycmVjdCB0aGlzIHByb2JsZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBT
ZW1lbCA8c2VtZWxwYXVsQGdtYWlsLmNvbT4KCkhleSBQYXVsLAoKVGhhbmtzIGZvciB0aGUgcGF0
Y2guICBMb29raW5nIGEgYml0IG1vcmUgYXQgdGhlIGNvZGUgb3ZlciB0aGUgd2Vla2VuZCwKSSBm
aWd1cmVkIG91dCB3aGF0IHRoYXQgQlVJTERfQlVHX09OKCkgaXMgZm9yIC0tIGluIGFmbF9oYXJu
ZXNzLmMsIHdlCnN0YXRpY2FsbHkgYWxsb2NhdGUgYSBidWZmZXIgb2Ygc2l6ZSBJTlBVVF9TSVpF
IHRvIGhvbGQgdGhlIGZ1enogZGF0YS4KVGhlIEJVSUxEX0JVR19PTigpIGlzIHRvIG1ha2Ugc3Vy
ZSB0aGF0IHRoaXMgYnVmZmVyIGlzIGFsd2F5cyBiaWcgZW5vdWdoCnRvIGhvbGQgdGhlIG1pbmlt
dW0gaW5wdXQgc2l6ZS4gIEFuZCBpbmNyZWFzaW5nIHRoZSBzaXplIGFjY2VwdGVkIGJ5CkxMVk1G
dXp6ZXJUZXN0T25lSW5wdXQoKSB3b24ndCBoYXZlIGFueSBlZmZlY3QgZm9yIGFueWJvZHkgdXNp
bmcKYWZsLWhhcm5lc3MsIGFzIHRoZSBzaXplIHBhc3NlZCBpbiB3aWxsIG5ldmVyIGJlIGxhcmdl
ciB0aGFuIElOUFVUX1NJWkUuCgpBcmUgeW91IHJ1bm5pbmcgYWZsLWhhcm5lc3MsIG9yIGFyZSB5
b3UgdXNpbmcgZnV6ei1lbXVsIGRpcmVjdGx5IHNvbWUKb3RoZXIgd2F5IChlLmcuLCB0aHJvdWdo
IEdvb2dsZSdzIGZ1enppbmcgc2VydmljZSk/CgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
