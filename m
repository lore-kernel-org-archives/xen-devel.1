From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 09/32] libxl_qmp: Remove unused yajl_ctx from
 handler
Date: Fri, 27 Jul 2018 15:05:51 +0100
Message-ID: <20180727140614.13256-10-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3Nt-0005SL-Bm
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:06:21 +0000
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCgpO
b3RlczoKICAgIHY0OgogICAgLSBBY2tlZAogICAgLSBGaXggc3ViamVjdCBzL2Zvcm0vZnJvbS8K
CiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX3FtcC5jCmluZGV4IDc5NjVlZTM3YjkuLmM1ZTA1ZTU2NzkgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3FtcC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC0x
MTIsNyArMTEyLDYgQEAgc3RydWN0IGxpYnhsX19xbXBfaGFuZGxlciB7CiAgICAgaW50IHdhaXRf
Zm9yX2lkOwogCiAgICAgY2hhciBidWZmZXJbUU1QX1JFQ0VJVkVfQlVGRkVSX1NJWkUgKyAxXTsK
LSAgICBsaWJ4bF9feWFqbF9jdHggKnlhamxfY3R4OwogCiAgICAgbGlieGxfY3R4ICpjdHg7CiAg
ICAgdWludDMyX3QgZG9taWQ7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
