From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 0/4] Functional and documentation
 improvements to dom0 setup
Date: Mon, 31 Dec 2018 15:16:19 +0000
Message-ID: <1546269383-32166-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXhwYW5kZWQgc29tZXdoYXQgZnJvbSB2MS4gIFNlZSBwYXRjaGVzIGZvciBkZXRhaWxzLgoKQW5k
cmV3IENvb3BlciAoNCk6CiAgeGVuL2RvbTA6IEltcHJvdmUgZG9jdW1lbnRhdGlvbiBmb3IgZG9t
MD0gYW5kIGRvbTAtaW9tbXU9CiAgeDg2L2RvbTA6IEltcHJvdmUgZG9tMD0gdXNlYWJpbGl0eQog
IHhlbi9kb20wOiBEcm9wIGlvbW11X2h3ZG9tX2luY2x1c2l2ZSBlbnRpcmVseQogIHhlbi9kb20w
OiBBZGQgYSBkb20wLWlvbW11PW5vbmUgb3B0aW9uCgogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUubWFya2Rvd24gICB8IDEzMCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICAgIHwgIDE0ICsrLS0KIHhlbi9jb21t
b24va2VybmVsLmMgICAgICAgICAgICAgICAgICAgfCAgMjAgKysrKysrCiB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vc21tdS5jICAgIHwgICA0IC0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9pb21tdS5jICAgICAgIHwgICA4ICstLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3g4
Ni92dGQuYyB8ICAgNiAtLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICB8
ICAxNCArLS0tCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgIHwgICAyICst
CiB4ZW4vaW5jbHVkZS94ZW4vbGliLmggICAgICAgICAgICAgICAgIHwgICA3ICsrCiA5IGZpbGVz
IGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCAxMDAgZGVsZXRpb25zKC0pCgotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
