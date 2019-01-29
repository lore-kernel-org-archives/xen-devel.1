From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-4.12] libxl: correctly dispose of dominfo
 list in libxl_name_to_domid
Date: Tue, 29 Jan 2019 11:37:59 +0000
Message-ID: <20190129113759.24272-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fi0R=QF=citrix.com=prvs=925e96482=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1goRiO-0006ud-Bb
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 11:38:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGFtYXMgcmVwb3J0ZWQgc3NpZF9sYWJlbCB3YXMgbGVha2VkLiBVc2UgdGhlIGRlc2lnbmF0ZWQg
ZnVuY3Rpb24gdG8KZnJlZSBkb21pbmZvIGxpc3QgdG8gZml4IHRoZSBsZWFrYWdlLgoKUmVwb3J0
ZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KVGVzdGVkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Ci0tLQpCYWNrcG9ydCBjYW5kaWRhdGUuCi0tLQogdG9v
bHMvbGlieGwvbGlieGxfdXRpbHMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxz
LmMgYi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCmluZGV4IGU1MGUwOTRjNDguLmYzNjBmNWUy
MjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfdXRpbHMuYwpAQCAtOTAsNyArOTAsNyBAQCBpbnQgbGlieGxfbmFtZV90b19kb21p
ZChsaWJ4bF9jdHggKmN0eCwgY29uc3QgY2hhciAqbmFtZSwKICAgICAgICAgfQogICAgICAgICBm
cmVlKGRvbW5hbWUpOwogICAgIH0KLSAgICBmcmVlKGRvbWluZm8pOworICAgIGxpYnhsX2RvbWlu
Zm9fbGlzdF9mcmVlKGRvbWluZm8sIG5iX2RvbWFpbnMpOwogICAgIHJldHVybiByZXQ7CiB9CiAK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
