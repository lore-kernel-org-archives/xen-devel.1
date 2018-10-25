From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/pvh: don't try to unplug emulated devices
Date: Thu, 25 Oct 2018 09:54:15 +0200
Message-ID: <20181025075415.18798-1-jgross__43296.2971194231$1540453987$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jipu=nf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gFaTE-0006iV-N6
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 07:54:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBYZW4gUFZIIGd1ZXN0IGhhcyBubyBhc3NvY2lhdGVkIHFlbXUgZGV2aWNlIG1vZGVsLCBzbyB0
cnlpbmcgdG8KdW5wbHVnIGFueSBlbXVsYXRlZCBkZXZpY2VzIGlzIG1ha2luZyBubyBzZW5zZSBh
dCBhbGwuCgpCYWlsIG91dCBlYXJseSBmcm9tIHhlbl91bnBsdWdfZW11bGF0ZWRfZGV2aWNlcygp
IHdoZW4gcnVubmluZyBhcyBQVkgKZ3Vlc3QuIFRoaXMgd2lsbCBhdm9pZCBpc3N1aW5nIHRoZSBi
b290IG1lc3NhZ2U6CgpbICAgIDAuMDAwMDAwXSBYZW4gUGxhdGZvcm0gUENJOiB1bnJlY29nbmlz
ZWQgbWFnaWMgdmFsdWUKCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjExClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni94
ZW4vcGxhdGZvcm0tcGNpLXVucGx1Zy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3BsYXRmb3JtLXBjaS11bnBsdWcu
YyBiL2FyY2gveDg2L3hlbi9wbGF0Zm9ybS1wY2ktdW5wbHVnLmMKaW5kZXggNjZhYjk2YTRlMmIz
Li45NmQ3ZjdkMzljYjkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9wbGF0Zm9ybS1wY2ktdW5w
bHVnLmMKKysrIGIvYXJjaC94ODYveGVuL3BsYXRmb3JtLXBjaS11bnBsdWcuYwpAQCAtMTM0LDYg
KzEzNCwxMCBAQCB2b2lkIHhlbl91bnBsdWdfZW11bGF0ZWRfZGV2aWNlcyh2b2lkKQogewogCWlu
dCByOwogCisJLyogUFZIIGd1ZXN0cyBkb24ndCBoYXZlIGVtdWxhdGVkIGRldmljZXMuICovCisJ
aWYgKHhlbl9wdmhfZG9tYWluKCkpCisJCXJldHVybjsKKwogCS8qIHVzZXIgZXhwbGljaXRseSBy
ZXF1ZXN0ZWQgbm8gdW5wbHVnICovCiAJaWYgKHhlbl9lbXVsX3VucGx1ZyAmIFhFTl9VTlBMVUdf
TkVWRVIpCiAJCXJldHVybjsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
