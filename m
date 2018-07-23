From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 2/2] ocaml: remove undefined behaviour in
 systemd_stubs.c
Date: Mon, 23 Jul 2018 11:26:49 +0100
Message-ID: <20180723102649.31392-3-wei.liu2@citrix.com>
References: <20180723102649.31392-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l8wo=kh=citrix.com=prvs=7352c57fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhY3O-0003wH-72
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 10:26:58 +0000
In-Reply-To: <20180723102649.31392-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgY29tcGxhaW5zOgoKc3lzdGVtZF9zdHVicy5jOjUxOjg6IGVycm9yOiBzaGlmdGluZyBh
IG5lZ2F0aXZlIHNpZ25lZCB2YWx1ZSBpcyB1bmRlZmluZWQgWy1XZXJyb3IsLVdzaGlmdC1uZWdh
dGl2ZS12YWx1ZV0KICAgICAgICByZXQgPSBWYWxfaW50KC0xVSk7CiAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+CgpTaW5jZSBzZF9ub3RpZnlfZmQgaGFzIGEgc2lnbmF0dXJlIG9mIHVuaXQgLT4g
dW5pdCwgd2Ugc2ltcGx5IGNoYW5nZQp0aGUgcmV0dXJuIHZhbHVlIHRvIFZhbF91bml0LgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CkNjOiBEYXZpZCBTY290dCA8
ZGF2ZUByZWNvaWwub3JnPgoKU2VlOiBodHRwczovL2dpdGxhYi5jb20vbGl1dy94ZW4vLS9qb2Jz
LzgzNjI4ODMzCi0tLQogdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c3RlbWRfc3R1YnMuYyB8IDEw
ICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c3RlbWRfc3R1YnMuYyBi
L3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zeXN0ZW1kX3N0dWJzLmMKaW5kZXggNDkwMTU2YzA2YS4u
MzFhMWE1ZDM4NCAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N5c3RlbWRfc3R1
YnMuYworKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5jCkBAIC0zMiwx
MyArMzIsMTAgQEAKIENBTUxwcmltIHZhbHVlIG9jYW1sX3NkX25vdGlmeV9yZWFkeSh2YWx1ZSBp
Z25vcmUpCiB7CiAJQ0FNTHBhcmFtMShpZ25vcmUpOwotCUNBTUxsb2NhbDEocmV0KTsKLQotCXJl
dCA9IFZhbF9pbnQoMCk7CiAKIAlzZF9ub3RpZnkoMSwgIlJFQURZPTEiKTsKIAotCUNBTUxyZXR1
cm4ocmV0KTsKKwlDQU1McmV0dXJuKFZhbF91bml0KTsKIH0KIAogI2Vsc2UKQEAgLTQ2LDEwICs0
Myw3IEBAIENBTUxwcmltIHZhbHVlIG9jYW1sX3NkX25vdGlmeV9yZWFkeSh2YWx1ZSBpZ25vcmUp
CiBDQU1McHJpbSB2YWx1ZSBvY2FtbF9zZF9ub3RpZnlfcmVhZHkodmFsdWUgaWdub3JlKQogewog
CUNBTUxwYXJhbTEoaWdub3JlKTsKLQlDQU1MbG9jYWwxKHJldCk7Ci0KLQlyZXQgPSBWYWxfaW50
KC0xVSk7CiAKLQlDQU1McmV0dXJuKHJldCk7CisJQ0FNTHJldHVybihWYWxfdW5pdCk7CiB9CiAj
ZW5kaWYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
