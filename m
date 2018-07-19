From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 00:58:48 -0600
Message-ID: <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg2tq-0001Ik-JT
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 06:58:54 +0000
In-Reply-To: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDAxOjMzLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IFdoZW4gY3Jvc3MtY29tcGlsaW5nIGZvciB4ODYgd2l0aCBnY2MgOC4xLCB0aGUg
Z2VuZXJhdGlvbiBvZgo+IGNvbXBhdC9jYWxsYmFjay5pIGZhaWxzIGR1ZSB0byB0aGUgcmVkZWZp
bml0aW9uIG9mIF9fT0JKRUNUX0ZJTEVfXyBhbmQKPiBfX09CSkVDVF9MQUJFTF9fIHZhcmlhYmxl
cyBvbiB0aGUgY29tcGlsZXIgY29tbWFuZCBsaW5lIGR1cmluZyB0aGUgc2hpbQo+IGJ1aWxkOgo+
IAo+IHwgPGNvbW1hbmQtbGluZT46IGVycm9yOiAiX19PQkpFQ1RfRklMRV9fIiByZWRlZmluZWQg
Wy1XZXJyb3JdCj4gfCA8Y29tbWFuZC1saW5lPjogbm90ZTogdGhpcyBpcyB0aGUgbG9jYXRpb24g
b2YgdGhlIHByZXZpb3VzIGRlZmluaXRpb24KPiB8IDxjb21tYW5kLWxpbmU+OiBlcnJvcjogIl9f
T0JKRUNUX0xBQkVMX18iIHJlZGVmaW5lZCBbLVdlcnJvcl0KPiB8IDxjb21tYW5kLWxpbmU+OiBu
b3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgo+IHwg
Y2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiB8IE1ha2VmaWxlOjY5
OiByZWNpcGUgZm9yIHRhcmdldCAnY29tcGF0L2NhbGxiYWNrLmknIGZhaWxlZAoKRmlyc3Qgb2Yg
YWxsLCBhcyB0byB0aGUgdGl0bGUgLSBpcyB0aGlzIHJlYWxseSBqdXN0IGFmZmVjdGluZyBjYWxs
YmFjay5pPyBJZiBzbywKd2h5PyBJZiBub3QsIHRoZSB0aXRsZSBzaG91bGQgYmUgZ2VuZXJhbGl6
ZWQuCgo+IF9fT0JKRUNUX0xBQkVMX18gaXMgYWxyZWFkeSB1bnNldC1iZWZvcmUtc2V0IGluIG9u
ZSBsb2NhdGlvbiB3aGVyZSBpdCBpcwo+IGRlZmluZWQgaW4geGVuL2FyY2gveDg2L1J1bGVzLm1r
IDsgdGhpcyBwYXRjaCBhcHBsaWVzIHRoZSBzYW1lIHRvIHRoZQo+IG90aGVyIGRlZmluZSBzaXRl
IGluIHRoZSBzYW1lIGZpbGUuCj4gCj4gX19PQkpFQ1RfRklMRV9fIGlzIGhhbmRsZWQgc2ltaWxh
cmx5OiBhbiB1bmRlZmluZSBzdGF0ZW1lbnQgaXMgYWRkZWQKPiBiZWZvcmUgaXRzIGRlZmluaXRp
b24gaW4geGVuL1J1bGVzLm1rCgpOb3cgd2hhdCB5b3UgZmFpbCB0byBleHBsYWluIGlzIHdoYXQg
dGhlc2UgZG91YmxlIGRlZmluaXRpb25zIHJlc3VsdApmcm9tLiBVbmRlcnN0YW5kaW5nIHRoYXQg
bXkgc3VnZ2VzdCBhbHRlcm5hdGl2ZSBhcHByb2FjaGVzIHRvCmFkZHJlc3NpbmcgdGhlIGlzc3Vl
LiBGb3IgZXhhbXBsZSB0aGVyZSBtYXkgbWUgdW5kdWUgcHJvcGFnYXRpb24Kb2YgQ0ZMQUdTIGF0
IHNvbWUgbGF5ZXIuCgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4gLS0tCj4gUGxlYXNlIHVzZSBteSBnbWFpbCBh
ZGRyZXNzIGZvciBhbnkgY29ycmVzcG9uZGVuY2UgdG8gbWUuCgpJIHRoaW5rIGl0IGlzIGdlbmVy
YWxseSBjb25zaWRlcmVkIGJhZCBwcmFjdGljZSB0byBoYXZlIEZyb206IGFuZCBTLW8tYgpkaWZm
ZXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
