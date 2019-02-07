From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 31/55] efi: add emacs block to boot.c
Date: Thu, 7 Feb 2019 16:44:32 +0000
Message-ID: <20190207164456.9260-32-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn0h-0000bJ-AA
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:58:47 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vY29t
bW9uL2VmaS9ib290LmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24v
ZWZpL2Jvb3QuYwppbmRleCAxZDE0MjBmMDJjLi4zODY4MjkzZDA2IDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL2VmaS9ib290LmMKKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCkBAIC0xNzA1LDMg
KzE3MDUsMTMgQEAgdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpCiAjZW5kaWYKIH0K
ICNlbmRpZgorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgorICogbW9kZTogQworICogYy1maWxl
LXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZzZXQ6IDQKKyAqIHRhYi13aWR0aDogNAorICog
aW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
