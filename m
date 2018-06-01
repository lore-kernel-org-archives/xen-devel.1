From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 22/31] libxl_qmp: Simplify
 qmp_response_type() prototype
Date: Fri, 1 Jun 2018 15:37:11 +0100
Message-ID: <20180601143720.24637-23-anthony.perard@citrix.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rmms=it=citrix.com=prvs=6833cd46b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fOlVi-0002DP-Uj
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 14:58:34 +0000
In-Reply-To: <20180601143720.24637-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIHRoZSBsaWJ4bF9fcW1wX2hhbmRsZXIqIGFyZ3VtZW50IHNvIHRoZSBmdW5jdGlvbiBj
YW4gYmUgcmV1c2VkCmxhdGVyIGluIGEgZGlmZmVyZW50IGNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9xbXAuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMg
Yi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwppbmRleCAwMmVhZTFmNWNlLi4wZTdlYzU0YjlmIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4bC9saWJ4
bF9xbXAuYwpAQCAtMjgwLDggKzI4MCw3IEBAIHN0YXRpYyBpbnQgZW5hYmxlX3FtcF9jYXBhYmls
aXRpZXMobGlieGxfX3FtcF9oYW5kbGVyICpxbXApCiAgKiBIZWxwZXJzCiAgKi8KIAotc3RhdGlj
IGxpYnhsX19xbXBfbWVzc2FnZV90eXBlIHFtcF9yZXNwb25zZV90eXBlKGxpYnhsX19xbXBfaGFu
ZGxlciAqcW1wLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqbykKK3N0YXRpYyBsaWJ4bF9fcW1wX21lc3Nh
Z2VfdHlwZSBxbXBfcmVzcG9uc2VfdHlwZShjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKm8pCiB7
CiAgICAgbGlieGxfX3FtcF9tZXNzYWdlX3R5cGUgdHlwZTsKICAgICBsaWJ4bF9fanNvbl9tYXBf
bm9kZSAqbm9kZSA9IE5VTEw7CkBAIC0zNDcsNyArMzQ2LDcgQEAgc3RhdGljIGludCBxbXBfaGFu
ZGxlX3Jlc3BvbnNlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wLAogewog
ICAgIGxpYnhsX19xbXBfbWVzc2FnZV90eXBlIHR5cGUgPSBMSUJYTF9fUU1QX01FU1NBR0VfVFlQ
RV9JTlZBTElEOwogCi0gICAgdHlwZSA9IHFtcF9yZXNwb25zZV90eXBlKHFtcCwgcmVzcCk7Cisg
ICAgdHlwZSA9IHFtcF9yZXNwb25zZV90eXBlKHJlc3ApOwogICAgIExPR0QoREVCVUcsIHFtcC0+
ZG9taWQsICJtZXNzYWdlIHR5cGU6ICVzIiwgbGlieGxfX3FtcF9tZXNzYWdlX3R5cGVfdG9fc3Ry
aW5nKHR5cGUpKTsKIAogICAgIHN3aXRjaCAodHlwZSkgewotLSAKQW50aG9ueSBQRVJBUkQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
