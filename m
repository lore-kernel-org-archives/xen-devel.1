From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 0/5] Reduce hard power cycles,
 part 2 (FreeBSD, fixes)
Date: Fri, 25 Jan 2019 14:50:41 +0000
Message-ID: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1alE=QB=citrix.com=prvs=9210a8ee7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gn2op-00081B-KG
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:50:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXBsYWNlcyB0aGUgYERPIE5PVCBBUFBMWScgcGF0Y2ggMjYvMjYgZnJvbSB0aGUgcGFy
dCAxIHNlcmllcy4KSXQgYWxzbyBjb250YWlucyBzb21lIG90aGVyIGZpeGVzL2ltcHJvdmVtZW50
cy4KCklhbiBKYWNrc29uICg1KToKICBmbGlnaHRfb3RoZXJqb2I6IFVzZSBjb25mZXNzIHJhdGhl
ciB0aGFuIGRpZQogIHBvd2VyOiBzc2g6IEZpeCBoYW5kbGluZyBvZiAkZGVsYXkKICBwb3dlcjog
c3NoOiBSZWR1Y2UgdGltZW91dCBmb3Igc2NyaXB0IGZyYWdtZW50CiAgcG93ZXI6IHRzLWZyZWVi
c2QtaG9zdC1pbnN0YWxsOiBVc2UgcG93ZXJfcmVib290X2F0dGVtcHRzCiAgcG93ZXI6IHNzaDog
V2FpdCBmb3IgdGhlIHRhcmdldCB0byBhcHBlYXIgdG8gZ28gZG93bgoKIE9zc3Rlc3QucG0gICAg
ICAgICAgICAgIHwgIDQgKysrLQogT3NzdGVzdC9QRFUvc3NoLnBtICAgICAgfCAgNCArKy0tCiB0
cy1mcmVlYnNkLWhvc3QtaW5zdGFsbCB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
