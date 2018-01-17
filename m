From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 6/6] firmware/shim: fix build process to use
	POSIX find options
Date: Wed, 17 Jan 2018 09:48:14 +0000
Message-ID: <20180117094814.32772-7-roger.pau@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ebkM1-0004lP-Uv
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 09:49:57 +0000
In-Reply-To: <20180117094814.32772-1-roger.pau@citrix.com>
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
ZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9v
bHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUv
eGVuLWRpci9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKaW5kZXgg
YWRmNmMzMWU4ZC4uZGU3NTRjNzUyZSAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRp
ci9NYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCkBAIC0yMSw3
ICsyMSw4IEBAIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UK
IAkkKGZvcmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCiAJCSAobWtkaXIgLXAgJChEKS8kKGQpOyBc
CiAJCSAgY2QgJChEKS8kKGQpOyBcCi0JCSAgZmluZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlwZSBk
IC1wcmludGYgIi4vJVBcbiIgfCAgeGFyZ3MgbWtkaXIgLXApOykKKwkJICBmaW5kICQoWEVOX1JP
T1QpLyQoZCkvIC10eXBlIGQgLWV4ZWMgc2ggLWMgXAorCQkgICAgICAiZWNobyB7fSB8IHNlZCAn
cyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIgLXAiIFw7KTspCiAJJChmb3Jl
YWNoIGQsICQoTElOS19ESVJTKSwgXAogCQkoY2QgJChYRU5fUk9PVCk7IFwKIAkJIGZpbmQgJChk
KSAhIC10eXBlIGwgLXR5cGUgZiBcCi0tIAoyLjE1LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
