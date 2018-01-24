From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: fix GET_STACK_END
Date: Wed, 24 Jan 2018 20:26:26 +0000
Message-ID: <20180124202626.2506-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vftr=et=citrix.com=prvs=555ec31fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eeRcw-0000sv-9o
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 20:26:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QUlVSSB0aGUgcHVycG9zZSBvZiBoYXZpbmcgdGhlIC5pZiBkaXJlY3RpdmUgaXMgdG8gbWFrZSBH
RVRfU1RBQ0tfRU5ECndvcmsgd2l0aCBhbnkgZ2VuZXJhbCBwdXJwb3NlIHJlZ2lzdGVycy4gVGhl
IGNvZGUgYXMtaXMgd291bGQgcHJvZHVjZQp0aGUgd3JvbmcgcmVzdWx0IGZvciByOC4gRml4IGl0
LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9hc21fZGVmbnMuaAppbmRleCBkMmQ5MWNhMWZhLi42YTJiODMzZGI2IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvYXNtX2RlZm5zLmgKQEAgLTEyMCw3ICsxMjAsNyBAQCB2b2lkIHJldF9mcm9tX2ludHIo
dm9pZCk7CiAKICNkZWZpbmUgU1RBQ0tfQ1BVSU5GT19GSUVMRChmaWVsZCkgKDEgLSBDUFVJTkZP
X3NpemVvZiArIENQVUlORk9fIyNmaWVsZCkKICNkZWZpbmUgR0VUX1NUQUNLX0VORChyZWcpICAg
ICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAuaWYgLkxyIyNyZWcgPiA4OyAgICAgICAg
ICAgICAgICAgICAgICAgICBcCisgICAgICAgIC5pZiAuTHIjI3JlZyA+PSA4OyAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgICAgICAgbW92cSAkU1RBQ0tfU0laRS0xLCAlciMjcmVnOyAgICAg
ICAgICAgICAgXAogICAgICAgICAuZWxzZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAgICAgICAgIG1vdmwgJFNUQUNLX1NJWkUtMSwgJWUjI3JlZzsgICAgICAgICAgICAg
IFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
