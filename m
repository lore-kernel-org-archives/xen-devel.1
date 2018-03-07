From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libxc: Correct comment for
	normalise_pagetable()
Date: Wed, 7 Mar 2018 12:15:51 +0000
Message-ID: <1520424951-12312-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBtb3N0IGxpa2VseSBhIGNvcHkvcGFzdGUgbWlzdGFrZS4KClJlcG9ydGVkLWJ5OiBC
cnVubyBBbHZpc2lvIDxicnVuby5hbHZpc2lvQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X3B2LmMgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4
Nl9wdi5jCmluZGV4IGZmNWVmZTkuLmU0YjA5OWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hj
X3NyX3NhdmVfeDg2X3B2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYwpA
QCAtODgyLDcgKzg4Miw3IEBAIHN0YXRpYyBpbnQgd3JpdGVfc2hhcmVkX2luZm8oc3RydWN0IHhj
X3NyX2NvbnRleHQgKmN0eCkKIH0KIAogLyoKLSAqIE5vcm1hbGlzZSBhIHBhZ2V0YWJsZSBmb3Ig
dGhlIG1pZ3JhdGlvbiBzdHJlYW0uICBQZXJmb3JtcyBwZm4tPm1mbgorICogTm9ybWFsaXNlIGEg
cGFnZXRhYmxlIGZvciB0aGUgbWlncmF0aW9uIHN0cmVhbS4gIFBlcmZvcm1zIG1mbi0+cGZuCiAg
KiBjb252ZXJzaW9ucyBvbiB0aGUgcHRlcy4KICAqLwogc3RhdGljIGludCBub3JtYWxpc2VfcGFn
ZXRhYmxlKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsIGNvbnN0IHVpbnQ2NF90ICpzcmMsCi0t
IAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
