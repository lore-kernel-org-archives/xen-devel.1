From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] x86: Further CPUID/MSR cleanup
Date: Mon, 2 Jul 2018 10:57:24 +0100
Message-ID: <1530525447-28347-1-git-send-email-andrew.cooper3@citrix.com>
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

VGhpcyBpcyBmdXJ0aGVyIGNsZWFudXAgd29yayB0byBoZWxwIHRoZSBmb3J0aGNvbWluZyB0b29s
c3RhY2sgQ1BVSUQvTVNSIHdvcmsuCgpBbmRyZXcgQ29vcGVyICgzKToKICB0b29scy9saWJ4Yzog
RHJvcCB4Y19jcHVpZF90b19zdHIoKQogIHg4Ni9tc3I6IERyb3Age01JU0NfRU5BQkxFUyxQTEFU
Rk9STV9JTkZPfS5hdmFpbGFibGUKICB4ODYvbXNyOiBVc2UgdGhlIGFyY2hpdGVjdHVyYWwgbGF5
b3V0IGZvciBNU1Jfe01JU0NfRU5BQkxFUyxQTEFURk9STV9JTkZPfQoKIHRvb2xzL2xpYnhjL2lu
Y2x1ZGUveGVuY3RybC5oIHwgIDIgLS0KIHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jICAgIHwg
MjUgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyAg
ICAgfCAgMSAtCiB4ZW4vYXJjaC94ODYvbXNyLmMgICAgICAgICAgICB8IDM5ICsrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaCAg
ICAgfCAxNyArKysrKysrKysrKy0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCA2OCBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
