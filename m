From: Manjunath Patil <manjunath.b.patil@oracle.com>
Subject: [PATCH v2] xen-blkfront: fix kernel panic with
 negotiate_mq error path
Date: Tue, 30 Oct 2018 09:49:21 -0700
Message-ID: <1540918161-31283-1-git-send-email-manjunath.b.patil__7946.23722690648$1540918041$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=azuv=nk=oracle.com=manjunath.b.patil@srs-us1.protection.inumbo.net>)
 id 1gHXC2-00073g-Jh
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:48:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, konrad.wilk@oracle.com, roger.pau@citrix.com
Cc: axboe@kernel.dk, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

aW5mby0+bnJfcmluZ3MgaXNuJ3QgYWRqdXN0ZWQgaW4gY2FzZSBvZiBFTk9NRU0gZXJyb3IgZnJv
bQpuZWdvdGlhdGVfbXEoKS4gVGhpcyBsZWFkcyB0byBrZXJuZWwgcGFuaWMgaW4gZXJyb3IgcGF0
aC4KClR5cGljYWwgY2FsbCBzdGFjayBpbnZvbHZpbmcgcGFuaWMgLQogIzggcGFnZV9mYXVsdCBh
dCBmZmZmZmZmZjgxNzU5MzZmCiAgICBbZXhjZXB0aW9uIFJJUDogYmxraWZfZnJlZV9yaW5nKzMz
XQogICAgUklQOiBmZmZmZmZmZmEwMTQ5NDkxICBSU1A6IGZmZmY4ODA0Zjc2NzNjMDggIFJGTEFH
UzogMDAwMTAyOTIKIC4uLgogIzkgYmxraWZfZnJlZSBhdCBmZmZmZmZmZmEwMTQ5YWFhIFt4ZW5f
YmxrZnJvbnRdCiAjMTAgdGFsa190b19ibGtiYWNrIGF0IGZmZmZmZmZmYTAxNGM4Y2QgW3hlbl9i
bGtmcm9udF0KICMxMSBibGtiYWNrX2NoYW5nZWQgYXQgZmZmZmZmZmZhMDE0ZWE4YiBbeGVuX2Js
a2Zyb250XQogIzEyIHhlbmJ1c19vdGhlcmVuZF9jaGFuZ2VkIGF0IGZmZmZmZmZmODE0MjQ2NzAK
ICMxMyBiYWNrZW5kX2NoYW5nZWQgYXQgZmZmZmZmZmY4MTQyNmRjMwogIzE0IHhlbndhdGNoX3Ro
cmVhZCBhdCBmZmZmZmZmZjgxNDIyZjI5CiAjMTUga3RocmVhZCBhdCBmZmZmZmZmZjgxMGFiZTZh
CiAjMTYgcmV0X2Zyb21fZm9yayBhdCBmZmZmZmZmZjgxNzU0MDc4CgpDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwpGaXhlczogN2VkOGNlMWM1ZmM3ICgieGVuLWJsa2Zyb250OiBtb3ZlIG5lZ290
aWF0ZV9tcSB0byBjb3ZlciBhbGwgY2FzZXMgb2YgbmV3IFZCRHMiKQpTaWduZWQtb2ZmLWJ5OiBN
YW5qdW5hdGggUGF0aWwgPG1hbmp1bmF0aC5iLnBhdGlsQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8ICAgIDEgKwogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrZnJvbnQuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKaW5kZXggNDI5ZDIwMS4u
NWQ4NGRhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYworKysgYi9k
cml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCkBAIC0xOTE5LDYgKzE5MTksNyBAQCBzdGF0aWMg
aW50IG5lZ290aWF0ZV9tcShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykKIAkJCSAgICAgIEdG
UF9LRVJORUwpOwogCWlmICghaW5mby0+cmluZm8pIHsKIAkJeGVuYnVzX2Rldl9mYXRhbChpbmZv
LT54YmRldiwgLUVOT01FTSwgImFsbG9jYXRpbmcgcmluZ19pbmZvIHN0cnVjdHVyZSIpOworCQlp
bmZvLT5ucl9yaW5ncyA9IDA7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KIAotLSAKMS43LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
