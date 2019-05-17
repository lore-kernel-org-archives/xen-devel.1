From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] installs: Disable cron
Date: Fri, 17 May 2019 15:03:35 +0100
Message-ID: <20190517140335.18141-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xWi3=TR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRdTA-00078t-OO
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 14:04:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHByZXNlbmNlIG9mIGNyb24gY2F1c2VzIGxlYWsgY2hlY2sgZmFpbHVyZXMsIHNpbmNlIGNy
b24gbWF5IHJ1bgpwcm9jZXNzZXMgdGhhdCB0aGUgbGVhayBjaGVja2VyIGRldGVjdHMuICBEaXNh
YmxlIGl0LCBzaW5jZSBub25lIG9mCm91ciBpbnN0YWxscyBsaXZlIGxvbmcgZW5vdWdoIGZvciB0
aGlzIHRvIG1hdHRlci4KCkRvIHRoaXMgaW4gaG9zdF9pbnN0YWxsX3Bvc3Rib290X2NvbXBsZXRl
IHNpbmNlIGl0IHNlZW1zIHRvIG1lIGxpa2Ugd2UKZG9uJ3Qgd2FudCB0aGlzIGluIGd1ZXN0cyBh
bnkgbW9yZSB0aGFuIHdlIHdhbnQgaXQgaW4gaG9zdHMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0
LnBtIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGQ4
N2I2Yzg5Li5lNTU0YWYzOCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysg
Yi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0zMDA2LDYgKzMwMDYsOCBAQCBzdWIgZ3Vlc3Rf
ZWRpdGNvbmZpZ19ub2NkICgkJCkgewogc3ViIGhvc3RfaW5zdGFsbF9wb3N0Ym9vdF9jb21wbGV0
ZSAoJCkgewogICAgIG15ICgkaG8pID0gQF87CiAgICAgdGFyZ2V0X2NvcmVfZHVtcF9zZXR1cCgk
aG8pOworICAgIHRhcmdldF9jbWRfcm9vdCgkaG8sICJ1cGRhdGUtcmMuZCBjcm9uIGRpc2FibGUi
KTsKKyAgICB0YXJnZXRfY21kX3Jvb3QoJGhvLCAic2VydmljZSBjcm9uIHN0b3AiKTsKICAgICB0
YXJnZXRfY21kX3Jvb3QoJGhvLCAidXBkYXRlLXJjLmQgb3NzdGVzdC1jb25maXJtLWJvb3RlZCBz
dGFydCA5OSAyIC4iKTsKICAgICB0YXJnZXRfaHR0cHNfbWl0bV9wcm94eV9zZXR1cCgkaG8pOwog
fQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
