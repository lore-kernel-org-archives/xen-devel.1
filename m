From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/4] xen/console: Bug fixes and doc improvement
Date: Tue,  2 Apr 2019 17:42:34 +0100
Message-ID: <20190402164238.1815-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j360=SE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hBMUv-0005x6-GU
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:42:53 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgY29udGFpbnMgYSBidW5jaCBvZiBidWcgZml4ZXMgZm9yIHRo
ZSBoeXBlcmNhbGwgQ09OU09MRUlPX3dyaXRlCmFuZCBzb21lIGRvY3VtZW50YXRpb24uCgpOb3Rl
IHRoZSBwYXRjaCAjMiB3YXMgb3JpZ2luYWxseSBzZW50IGluIHN0YW5kYWxvbmUsIEkgaGF2ZSBp
bmNsdWRlZCBoZXJlCndpdGggY29tbWVudHMgYWRkcmVzc2VkIHRvIGtlZXAgZXZlcnl0aGluZyB0
b2dldGhlci4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoNCk6CiAgeGVuL2NvbnNvbGU6IFByb3Bl
cmx5IGJ1ZmZlciBkb21VIG91dHB1dCB3aGVuIHVzaW5nIENPTlNPTEVJT193cml0ZQogIHhlbi9j
b25zb2xlOiBEb24ndCB0cmVhdCBOVUwgY2hhcmFjdGVyIGFzIHRoZSBlbmQgb2YgdGhlIGJ1ZmZl
cgogIHhlbi9wdWJsaWM6IERvY3VtZW50IEhZUEVSQ0FMTF9jb25zb2xlX2lvKCkKICB4ZW4vY29u
c29sZTogU2ltcGxpZnkgZG9tVSBjb25zb2xlIGhhbmRsaW5nIGluIGd1ZXN0X2NvbnNvbGVfd3Jp
dGUKCiB4ZW4vYXJjaC9hcm0vZWFybHlfcHJpbnRrLmMgICAgICAgfCAgNSArLS0KIHhlbi9jb21t
b24vZ2Ric3R1Yi5jICAgICAgICAgICAgICB8ICA2ICsrLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jICAgICAgICB8IDcxICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlZC5jICAgICAgIHwgIDcgKystLQogeGVuL2RyaXZl
cnMvY2hhci9zZXJpYWwuYyAgICAgICAgIHwgIDggKysrLS0KIHhlbi9kcml2ZXJzL2NoYXIveGVu
X3B2X2NvbnNvbGUuYyB8IDEwICsrKy0tLQogeGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgICAgICAg
ICAgIHwgMTQgKysrKy0tLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL2xmYi5oICAgICAgICAgICB8ICA0
ICstLQogeGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMgICAgICAgICAgIHwgMTQgKysrKy0tLS0KIHhl
bi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgICAgICB8IDIxICsrKysrKysrKysrLQogeGVuL2lu
Y2x1ZGUveGVuL2NvbnNvbGUuaCAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3hlbi9lYXJs
eV9wcmludGsuaCAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS94ZW4vcHZfY29uc29sZS5oICAgICAg
fCAgNCArLS0KIHhlbi9pbmNsdWRlL3hlbi9zZXJpYWwuaCAgICAgICAgICB8ICA0ICstLQogeGVu
L2luY2x1ZGUveGVuL3ZpZGVvLmggICAgICAgICAgIHwgIDQgKy0tCiAxNSBmaWxlcyBjaGFuZ2Vk
LCA5NyBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
