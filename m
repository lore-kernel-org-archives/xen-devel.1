From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/3] xen: Improvements to the vcpu
 create/destroy paths
Date: Thu, 6 Sep 2018 20:25:31 +0100
Message-ID: <1536261934-1236-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB0aGUgc3RhcnQgb2YgdGhlIHdvcmsgdG8gbWFrZSB0aGUgdmNwdV9kZXN0cm95KCkg
Y29kZSBpZGVtcG90ZW50LCBzbwp2Y3B1IGNvbnN0cnVjdGlvbiBjYW4gYmUgbW92ZWQgaW50byBk
b21haW5fY3JlYXRlKCkgYW5kIHN1Y2Nlc3NmdWxseSB1bndvdW5kCm9uIGVycm9yLgoKQW5kcmV3
IENvb3BlciAoMyk6CiAgeGVuL3ZjcHU6IFJlbmFtZSB0aGUgY29tbW9uIGludGVyZmFjZXMgZm9y
IGNvbnNpc3RlbmN5CiAgeGVuL3ZjcHU6IEludHJvZHVjZSB2Y3B1X2Rlc3Ryb3koKQogIHhlbi92
Y3B1OiBSZXdvcmsgc2FuaXR5IGNoZWNrcyBpbiB2Y3B1X2NyZWF0ZSgpCgogeGVuL2FyY2gvYXJt
L2RvbWFpbi5jICAgICAgIHwgIDYgKystLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwg
IDQgKy0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgfCAgMSAtCiB4ZW4vYXJjaC94ODYv
ZG9tMF9idWlsZC5jICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgIHwgIDQg
Ky0tCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgfCAgMSAtCiB4ZW4vY29tbW9uL2RvbWFp
bi5jICAgICAgICAgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICB8ICAyICstCiB4ZW4vY29tbW9uL3Nj
aGVkdWxlLmMgICAgICAgfCAgNCArLS0KIHhlbi9pbmNsdWRlL3hlbi9kb21haW4uaCAgICB8IDEw
ICsrKy0tLQogMTAgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25z
KC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
