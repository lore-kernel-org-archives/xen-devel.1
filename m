From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] fix potential null dereference
Date: Fri, 12 Jan 2018 15:40:07 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gk3p=eh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ea8vt-00061q-Jx
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 23:40:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@linaro.org
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

aGFuZGxlcyBjYW4gdGhlb3JldGljYWxseSBiZSBOVUxMLCBjaGVjayBmb3IgaXQgZXhwbGljaXRs
eSBiZWZvcmUKZGVyZWZlcmVuY2luZyBpdC4KCkNJRDogMTM4MTgzOApTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9lZmkvYm9vdC5jIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCmluZGV4IDQ2OWJm
OTguLjQzMWZlMmUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYworKysgYi94ZW4v
Y29tbW9uL2VmaS9ib290LmMKQEAgLTcyOSw3ICs3MjksNyBAQCBzdGF0aWMgRUZJX0dSQVBISUNT
X09VVFBVVF9QUk9UT0NPTCBfX2luaXQgKmVmaV9nZXRfZ29wKHZvaWQpCiAgICAgaWYgKCAhRUZJ
X0VSUk9SKHN0YXR1cykgKQogICAgICAgICBzdGF0dXMgPSBlZmlfYnMtPkxvY2F0ZUhhbmRsZShC
eVByb3RvY29sLCAmZ29wX2d1aWQsIE5VTEwsICZzaXplLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBoYW5kbGVzKTsKLSAgICBpZiAoIEVGSV9FUlJPUihzdGF0dXMpICkK
KyAgICBpZiAoIEVGSV9FUlJPUihzdGF0dXMpIHx8IGhhbmRsZXMgPT0gTlVMTCApCiAgICAgICAg
IHNpemUgPSAwOwogICAgIGZvciAoIGkgPSAwOyBpIDwgc2l6ZSAvIHNpemVvZigqaGFuZGxlcyk7
ICsraSApCiAgICAgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
