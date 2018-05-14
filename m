From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 4/4] libxl: Provide better error message when
 qemu restrict user not found
Date: Mon, 14 May 2018 18:08:59 +0100
Message-ID: <1526317739-17572-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bdup=ib=citrix.com=prvs=665fc3fee=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fIGyE-0002jj-TP
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 17:09:10 +0000
In-Reply-To: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIG1lbnRpb24gb2YgTElCWExfUUVNVV9VU0VSX1JBTkdFX0JBU0UsIGluIGNhc2UgdGhhdCBp
cyB3aGF0IHRoZQp1c2VyIHdhcyBpbnRlbmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5j
IHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGli
eGxfZG0uYwppbmRleCAxOGFkYTY5Li43Mjg5NTA5IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTE2OTksOCArMTY5OSw5
IEBAIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RldmljZV9tb2RlbF9hcmdzX25ldyhsaWJ4bF9f
Z2MgKmdjLAogICAgICAgICB9CiAKICAgICAgICAgTE9HRChFUlJPUiwgZ3Vlc3RfZG9taWQsCi0g
ICAgICAgICAgICAgIkNvdWxkIG5vdCBmaW5kIHVzZXIgJXMlZCBvciAlcywgY2Fubm90IHJlc3Ry
aWN0IiwKLSAgICAgICAgICAgICBMSUJYTF9RRU1VX1VTRVJfQkFTRSwgZ3Vlc3RfZG9taWQsIExJ
QlhMX1FFTVVfVVNFUl9TSEFSRUQpOworICJDb3VsZCBub3QgZmluZCB1c2VyICVzJWQgb3IgJXMg
b3IgcmFuZ2UgYmFzZSBwc2V1ZG8tdXNlciAlcywgY2Fubm90IHJlc3RyaWN0IiwKKyAgICAgICAg
ICAgICBMSUJYTF9RRU1VX1VTRVJfQkFTRSwgZ3Vlc3RfZG9taWQsIExJQlhMX1FFTVVfVVNFUl9T
SEFSRUQsCisgICAgICAgICAgICAgTElCWExfUUVNVV9VU0VSX1JBTkdFX0JBU0UpOwogICAgICAg
ICByZXR1cm4gRVJST1JfSU5WQUw7CiAKIGVuZF9zZWFyY2g6Ci0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
