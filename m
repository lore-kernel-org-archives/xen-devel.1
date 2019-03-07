From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] xen,
 cpu_hotplug: Prevent an out of bounds access
Date: Thu, 7 Mar 2019 08:41:22 +0300
Message-ID: <20190307054122.GB4517@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xcB/=RK=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1h1lms-0005vF-05
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 05:41:46 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Alex Nixon <alex.nixon@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlICJjcHUiIHZhcmlhYmxlIGNvbWVzIGZyb20gdGhlIHNzY2FuZigpIHNvIFNtYXRjaCBtYXJr
cyBpdCBhcwp1bnRydXN0ZWQgZGF0YS4gIFdlIGNhbid0IHBhc3MgYSBoaWdoZXIgdmFsdWUgdGhh
biAibnJfY3B1X2lkcyIgdG8KY3B1X3Bvc3NpYmxlKCkgb3IgaXQgcmVzdWx0cyBpbiBhbiBvdXQg
b2YgYm91bmRzIGFjY2Vzcy4KCkZpeGVzOiBkNjhkODJhZmQ0YzggKCJ4ZW46IGltcGxlbWVudCBD
UFUgaG90cGx1Z2dpbmciKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy94ZW4vY3B1X2hvdHBsdWcuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMgYi9kcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jCmlu
ZGV4IGIxMzU3YWE0YmM1NS4uZjE5MmI2ZjQyZGE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9j
cHVfaG90cGx1Zy5jCisrKyBiL2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMKQEAgLTU0LDcgKzU0
LDcgQEAgc3RhdGljIGludCB2Y3B1X29ubGluZSh1bnNpZ25lZCBpbnQgY3B1KQogfQogc3RhdGlj
IHZvaWQgdmNwdV9ob3RwbHVnKHVuc2lnbmVkIGludCBjcHUpCiB7Ci0JaWYgKCFjcHVfcG9zc2li
bGUoY3B1KSkKKwlpZiAoY3B1ID49IG5yX2NwdV9pZHMgfHwgIWNwdV9wb3NzaWJsZShjcHUpKQog
CQlyZXR1cm47CiAKIAlzd2l0Y2ggKHZjcHVfb25saW5lKGNwdSkpIHsKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
