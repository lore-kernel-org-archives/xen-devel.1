From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/2] x86/xstate: Fixes and improvements to
 xsetbv handling
Date: Wed, 18 Jul 2018 18:20:11 +0100
Message-ID: <1531934413-10052-1-git-send-email-andrew.cooper3@citrix.com>
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

QW5kcmV3IENvb3BlciAoMik6CiAgeDg2L3hzdGF0ZTogVXNlIGEgZ3Vlc3RzIENQVUlEIHBvbGlj
eSwgcmF0aGVyIHRoYW4gYWxsb3dpbmcgYWxsIGZlYXR1cmVzCiAgeDg2L3hzdGF0ZTogTWFrZSBl
cnJvcnMgaW4geHN0YXRlIGNhbGN1bGF0aW9ucyBtb3JlIG9idmlvdXMgYnkgY3Jhc2hpbmcgdGhl
IGRvbWFpbgoKIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgfCAgMiArLQogeGVuL2FyY2gv
eDg2L2h2bS9odm0uYyAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYveHN0YXRlLmMgICAgICAg
IHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2
L3hzdGF0ZS5oIHwgIDUgKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
