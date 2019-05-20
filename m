From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/4] x86/boot: Misc improvements to dom0
 construction
Date: Mon, 20 May 2019 11:18:10 +0100
Message-ID: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN6-00084Q-GA
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzdGFydGVkIG91dCBhcyBqdXN0IHBhdGNoIDMsIHRyeWluZyB0byBjbGVhbiB1cCB0aGUg
cmVtYWlucyBvZiB0aGUKcHYtbDF0ZiBkZWJ1Z2dpbmcsIGFuZCBleHBhbmRlZCBhIGxpdHRsZSB1
cG9uIHJlYWRpbmcgdGhlIHN1cnJvdW5kaW5nIGNvZGUuCgpBbmRyZXcgQ29vcGVyICg0KToKICB4
ODYvcHY6IEZpeCBlcnJvciBoYW5kbGluZyBpbiBkb20wX2NvbnN0cnVjdF9wdigpCiAgeDg2L2Jv
b3Q6IFJlbmFtZSBkb20wX3twdmgsdmVyYm9zZX0gdmFyaWFibGVzIHRvIGhhdmUgYW4gb3B0XyBw
cmVmaXgKICB4ODYvYm9vdDogV2lyZSB1cCBkb20wPXNoYWRvdyBmb3IgUFYgZG9tMAogIHg4Ni9i
b290OiBMaW5rIG9wdF9kb20wX3ZlcmJvc2UgdG8gQ09ORklHX1ZFUkJPU0VfREVCVUcKCiBkb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAxNyArKysrKysrKysrKy0tLS0tLQogeGVu
L2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgICAgICAgIHwgMjAgKysrKysrLS0tLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jICAgICAgfCAyNiArKysrKysrKysrKysrKystLS0tLS0tLS0tLQogeGVu
L2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvc2V0dXAuaCAgICAgICB8ICA0ICsrLS0KIDYgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKSwgMzUgZGVsZXRpb25zKC0pCgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
