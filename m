From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH] libxl: libxl__ev_fd_callback: Document
 perhaps-no-retry semantics
Date: Mon, 15 Oct 2018 15:01:07 +0100
Message-ID: <20181015140107.22934-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w2gt=m3=citrix.com=prvs=81941a82a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gC3Rs-0001uv-0n
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 14:02:20 +0000
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDQzOTQ3YjFiMDcuLjE1MzU2NmFjZDAg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMjMyLDYgKzIzMiwxNCBAQCB0eXBlZGVmIHZvaWQgbGli
eGxfX2V2X2ZkX2NhbGxiYWNrKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X2ZkICpldiwKICAg
ICogSXQgaXMgbm90IHBlcm1pdHRlZCB0byBsaXN0ZW4gZm9yIHRoZSBzYW1lIG9yIG92ZXJsYXBw
aW5nIGV2ZW50cwogICAgKiBvbiB0aGUgc2FtZSBmZCB1c2luZyBtdWx0aXBsZSBkaWZmZXJlbnQg
bGlieGxfX2V2X2ZkJ3MuCiAgICAqCisgICAqIE5vdGUgdGhhdCAoZGVwZW5kaW5nIG9uIHRoZSB1
bmRlcmx5aW5nIGV2ZW50IGxvb3AgaW1wbGVtZW50YXRpb24pCisgICAqIGl0IGlzIHBvc3NpYmxl
IHRoYXQgYSB0aGUgZmQgY2FsbGJhY2sgc3lzdGVtIGlzIGBsZXZlbCB0cmlnZ2VyZWQnCisgICAq
IG9yIGBldmVudCB0cmlnZ2VyZWQnLiAgVGhhdCBpcywgdGhlIGNhbGxiYWNrIG1heSBiZSBjYWxs
ZWQgb25seQorICAgKiBvbmNlIGZvciBlYWNoIHRyYW5zaXRpb24gZnJvbSBub3QgcmVhZHkgdG8g
cmVhZHkuICBTbyB0aGUKKyAgICogY2FsbGJhY2sgbXVzdCBnZW5lcmFsbHkgY29udGFpbiBhIGxv
b3Agd2hpY2ggZXhoYXVzdHMgdGhlIGZkLAorICAgKiByYXRoZXIgdGhhbiByZWx5aW5nIG9uIGJl
aW5nIGNhbGxlZCBhZ2FpbiBpZiB0aGUgZmQgaXMgc3RpbGwKKyAgICogcmVhZHkuCisgICAqCiAg
ICAqIChTcHVyaW91cyB3YWtldXBzLCBhbmQgc3B1cmlvdXMgYml0cyBzZXQgaW4gcmV2ZW50cywg
YXJlCiAgICAqIHN1cHByZXNzZWQgYnkgdGhlIGxpYnhsIGV2ZW50IGNvcmUuKQogICAgKi8KLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
