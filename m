From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix GET_STACK_END
Date: Wed, 24 Jan 2018 20:48:09 +0000
Message-ID: <c5e997370c234c448f2aedf406e515e2@AMSPEX02CL02.citrite.net>
References: <20180124202626.2506-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jv/h=et=citrix.com=prvs=555f7260a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eeS4h-0002qV-KC
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 20:55:15 +0000
In-Reply-To: <20180124202626.2506-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogV2VpIExpdSBb
d2VpLmxpdTJAY2l0cml4LmNvbV0KU2VudDogMjQgSmFudWFyeSAyMDE4IDIwOjI2ClRvOiBYZW4t
ZGV2ZWwKQ2M6IFdlaSBMaXU7IEphbiBCZXVsaWNoOyBBbmRyZXcgQ29vcGVyClN1YmplY3Q6IFtQ
QVRDSF0geDg2OiBmaXggR0VUX1NUQUNLX0VORAoKQUlVSSB0aGUgcHVycG9zZSBvZiBoYXZpbmcg
dGhlIC5pZiBkaXJlY3RpdmUgaXMgdG8gbWFrZSBHRVRfU1RBQ0tfRU5ECndvcmsgd2l0aCBhbnkg
Z2VuZXJhbCBwdXJwb3NlIHJlZ2lzdGVycy4gVGhlIGNvZGUgYXMtaXMgd291bGQgcHJvZHVjZQp0
aGUgd3JvbmcgcmVzdWx0IGZvciByOC4gRml4IGl0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KCk9vcHMuICBBY2tlZC1ieTogQW5kcmV3IENvb3BlciDiiaRh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29t4omlCgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaCB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvYXNtX2RlZm5zLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2FzbV9kZWZucy5o
CmluZGV4IGQyZDkxY2ExZmEuLjZhMmI4MzNkYjYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvYXNtX2RlZm5zLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaApA
QCAtMTIwLDcgKzEyMCw3IEBAIHZvaWQgcmV0X2Zyb21faW50cih2b2lkKTsKCiAjZGVmaW5lIFNU
QUNLX0NQVUlORk9fRklFTEQoZmllbGQpICgxIC0gQ1BVSU5GT19zaXplb2YgKyBDUFVJTkZPXyMj
ZmllbGQpCiAjZGVmaW5lIEdFVF9TVEFDS19FTkQocmVnKSAgICAgICAgICAgICAgICAgICAgICAg
IFwKLSAgICAgICAgLmlmIC5MciMjcmVnID4gODsgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICAgICAuaWYgLkxyIyNyZWcgPj0gODsgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAg
ICAgIG1vdnEgJFNUQUNLX1NJWkUtMSwgJXIjI3JlZzsgICAgICAgICAgICAgIFwKICAgICAgICAg
LmVsc2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICBtb3Zs
ICRTVEFDS19TSVpFLTEsICVlIyNyZWc7ICAgICAgICAgICAgICBcCi0tCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
