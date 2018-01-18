From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 6/7] firmware/shim: fix build process to use
	POSIX find options
Date: Thu, 18 Jan 2018 11:02:51 +0000
Message-ID: <20180118110252.41504-7-roger.pau@citrix.com>
References: <20180118110252.41504-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lqax=en=citrix.com=prvs=549fb6881=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ec7za-0005ve-Lf
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 11:04:22 +0000
In-Reply-To: <20180118110252.41504-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIC1wcmludGYgZmluZCBvcHRpb24gaXMgbm90IFBPU0lYIGNvbXBhdGlibGUsIHNvIHJlcGxh
Y2UgaXQgd2l0aAphbm90aGVyIHJ1bmUuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgogLSBEcm9wIHRoZSBleGVjIHJ1bmUgYW5kIGluc3RlYWQgcHJvY2VzcyB0
aGUgd2hvbGUgb3V0cHV0IGF0IG9uY2UuCi0tLQogdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtl
ZmlsZSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZSBiL3Rvb2xz
L2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKaW5kZXggYWRmNmMzMWU4ZC4uNTNlYjNiNjU0MyAx
MDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQorKysgYi90b29scy9m
aXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCkBAIC0yMSw3ICsyMSw4IEBAIGxpbmtmYXJtLnN0YW1w
OiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKIAkkKGZvcmVhY2ggZCwgJChMSU5LX0RJ
UlMpLCBcCiAJCSAobWtkaXIgLXAgJChEKS8kKGQpOyBcCiAJCSAgY2QgJChEKS8kKGQpOyBcCi0J
CSAgZmluZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBkIC1wcmludGYgIi4vJVBcbiIgfCAgeGFy
Z3MgbWtkaXIgLXApOykKKwkJICBmaW5kICQoWEVOX1JPT1QpLyQoZCkvIC10eXBlIGQgfFwKKwkJ
CXNlZCAncyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIgLXApOykKIAkkKGZv
cmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCiAJCShjZCAkKFhFTl9ST09UKTsgXAogCQkgZmluZCAk
KGQpICEgLXR5cGUgbCAtdHlwZSBmIFwKLS0gCjIuMTUuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
