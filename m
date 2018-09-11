From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 0/3] x86: Cleanup of MSR handling for Xen and
 Viridian ranges
Date: Tue, 11 Sep 2018 19:56:14 +0100
Message-ID: <1536692177-15675-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U3BsaXQgYXBhcnQgZnJvbSB2MiwgdG8gbWFrZSBhbGwgdGhlIGRpc3BhdGNoaW5nIGNvZGUgb2J2
aW91cyBpbiBwYXRjaCAxLiAgU2VlCmluZGl2aWR1YWwgcGF0Y2hlcyBmb3IgY2hhbmdlcy4KCkFu
ZHJldyBDb29wZXIgKDMpOgogIHg4Ni9tc3I6IERpc3BhdGNoIFhlbiBhbmQgVmlyaWRpYW4gTVNS
cyBmcm9tIGd1ZXN0X3t3cixyZH1tc3IoKQogIHg4Ni92aXJpZGFuOiBDbGVhbiB1cCBWaXJpZGlh
biBNU1IgaW5mcmFzdHJ1Y3R1cmUKICB4ODY6IENsZWFuIHVwIHRoZSBYZW4gTVNSIGluZnJhc3Ry
dWN0dXJlCgogeGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgICB8IDI3ICsrKy0tLS0t
LS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYyAgICAgICAgfCA0NiAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICAgICB8IDI4ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94
ODYvbXNyLmMgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0KIHhlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYyAgICAgfCAgNiAtLS0tLQogeGVuL2Fy
Y2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICB8IDI5ICsrKysrKysrKysrLS0tLS0tLS0tLS0t
LQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaCB8IDExICsrLS0tLS0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCAgICB8ICA0ICsrLS0KIDggZmlsZXMgY2hhbmdl
ZCwgNzIgaW5zZXJ0aW9ucygrKSwgMTE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMS40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
