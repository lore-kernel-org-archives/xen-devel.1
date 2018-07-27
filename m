From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 21/32] libxl_qmp: Simplify
 qmp_response_type() prototype
Date: Fri, 27 Jul 2018 15:06:03 +0100
Message-ID: <20180727140614.13256-22-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3jc-0008Ma-8v
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:28:48 +0000
In-Reply-To: <20180727140614.13256-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIHRoZSBsaWJ4bF9fcW1wX2hhbmRsZXIqIGFyZ3VtZW50IHNvIHRoZSBmdW5jdGlvbiBj
YW4gYmUgcmV1c2VkCmxhdGVyIGluIGEgZGlmZmVyZW50IGNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX3FtcC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3FtcC5jCmluZGV4IDc1Zjk1M2Q1MjEuLmFhYmY5YWQ1ZTcgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
CkBAIC0yNzksOCArMjc5LDcgQEAgc3RhdGljIGludCBlbmFibGVfcW1wX2NhcGFiaWxpdGllcyhs
aWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCkKICAqIEhlbHBlcnMKICAqLwogCi1zdGF0aWMgbGlieGxf
X3FtcF9tZXNzYWdlX3R5cGUgcW1wX3Jlc3BvbnNlX3R5cGUobGlieGxfX3FtcF9oYW5kbGVyICpx
bXAsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgbGlieGxfX2pzb25fb2JqZWN0ICpvKQorc3RhdGljIGxpYnhsX19xbXBfbWVzc2FnZV90eXBl
IHFtcF9yZXNwb25zZV90eXBlKGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqbykKIHsKICAgICBs
aWJ4bF9fcW1wX21lc3NhZ2VfdHlwZSB0eXBlOwogICAgIGxpYnhsX19qc29uX21hcF9ub2RlICpu
b2RlID0gTlVMTDsKQEAgLTM0Niw3ICszNDUsNyBAQCBzdGF0aWMgaW50IHFtcF9oYW5kbGVfcmVz
cG9uc2UobGlieGxfX2djICpnYywgbGlieGxfX3FtcF9oYW5kbGVyICpxbXAsCiB7CiAgICAgbGli
eGxfX3FtcF9tZXNzYWdlX3R5cGUgdHlwZSA9IExJQlhMX19RTVBfTUVTU0FHRV9UWVBFX0lOVkFM
SUQ7CiAKLSAgICB0eXBlID0gcW1wX3Jlc3BvbnNlX3R5cGUocW1wLCByZXNwKTsKKyAgICB0eXBl
ID0gcW1wX3Jlc3BvbnNlX3R5cGUocmVzcCk7CiAgICAgTE9HRChERUJVRywgcW1wLT5kb21pZCwg
Im1lc3NhZ2UgdHlwZTogJXMiLCBsaWJ4bF9fcW1wX21lc3NhZ2VfdHlwZV90b19zdHJpbmcodHlw
ZSkpOwogCiAgICAgc3dpdGNoICh0eXBlKSB7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
