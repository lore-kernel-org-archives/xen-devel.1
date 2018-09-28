From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libgnttab: Fix build following c/s
 3d3feaa4560
Date: Fri, 28 Sep 2018 16:59:16 +0100
Message-ID: <1538150356-8474-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VkVSU18xLjIgY2FuJ3QgZXh0ZW5kIGl0c2VsZi4gIEl0IHNob3VsZCBleHRlbmQgVkVSU18xLjEK
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Ci0tLQpDQzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnMvZ250dGFiL2xpYnhlbmdudHRh
Yi5tYXAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90b29scy9saWJzL2dudHRhYi9saWJ4ZW5nbnR0YWIubWFwIGIvdG9v
bHMvbGlicy9nbnR0YWIvbGlieGVuZ250dGFiLm1hcAppbmRleCBlMTVmNmU5Li5kMmE5YjdlIDEw
MDY0NAotLS0gYS90b29scy9saWJzL2dudHRhYi9saWJ4ZW5nbnR0YWIubWFwCisrKyBiL3Rvb2xz
L2xpYnMvZ250dGFiL2xpYnhlbmdudHRhYi5tYXAKQEAgLTM1LDQgKzM1LDQgQEAgVkVSU18xLjIg
ewogCQl4ZW5nbnR0YWJfZG1hYnVmX2V4cF93YWl0X3JlbGVhc2VkOwogCQl4ZW5nbnR0YWJfZG1h
YnVmX2ltcF90b19yZWZzOwogCQl4ZW5nbnR0YWJfZG1hYnVmX2ltcF9yZWxlYXNlOwotfSBWRVJT
XzEuMjsKK30gVkVSU18xLjE7Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
