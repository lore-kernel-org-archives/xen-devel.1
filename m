From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/2] make-flight: Run some shadow paging
 tests (`hap=false')
Date: Thu, 5 Apr 2018 14:04:18 +0100
Message-ID: <1522933458-17629-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1522933458-17629-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/x8/=g2=citrix.com=prvs=6261e79ed=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f44ZC-0005lo-Qa
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 13:04:38 +0000
In-Reply-To: <1522933458-17629-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGZvdXIgdGVzdHMgdG8gbW9zdCBmbGlnaHRzOgoKICAgIHRlc3QtYW1kNjQtYW1kNjQteGwt
c2hhZG93CiAgICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC1zaGFk
b3cKICAgIHRlc3QtYW1kNjQtaTM4Ni14bC1zaGFkb3cKICAgIHRlc3QtYW1kNjQtaTM4Ni14bC1x
ZW11dS1kZWJpYW5odm0tYW1kNjQtc2hhZG93CgpUaGVzZSBhcmUgdGhlIHNhbWUgYXMgdGhlIGNv
cnJlc3BvbmRpbmcgb25lcyB3aXRob3V0IC1zaGFkb3csIGV4Y2VwdAp0aGF0IHRoZXkgc2V0IHhl
bl9ib290X2FwcGVuZCB0byBgaGFwPWZhbHNlJywgc28gdGhhdCB0aGF0IHdpbGwgYmUKcGFzc2Vk
IHRvIHRoZSBoeXBlcnZpc29yIHRvIGZvcmNlIHNoYWRvdyBwYWdpbmcuCgpDQzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogbWFrZS1mbGlnaHQgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbWFrZS1mbGlnaHQgYi9tYWtlLWZsaWdodAppbmRleCAx
YThmMGE2Li42YjUzYzk0IDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtlLWZsaWdo
dApAQCAtNTAwLDYgKzUwMCwxNiBAQCBkb19ydGRzX3Rlc3RzICgpIHsKICAgICAgICAgICAgICRk
ZWJpYW5fcnVudmFycyBhbGxfaG9zdGZsYWdzPSRtb3N0X2hvc3RmbGFncwogfQogCitkb19zaGFk
b3dfdGVzdHMgKCkgeworICBqb2JfY3JlYXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRrZXJuLSRkb20w
YXJjaC14bC1zaGFkb3cgICAgICAgICAgICAgIFwKKyAgICAgICB0ZXN0LWRlYmlhbiB4bCAkeGVu
YXJjaCAkZG9tMGFyY2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgICAg
ICBndWVzdHNfdmNwdXM9NCB4ZW5fYm9vdF9hcHBlbmQ9J2hhcD1mYWxzZScgICAgICAgICAgICAg
ICAgXAorICAgICAgICAgICAgJGRlYmlhbl9ydW52YXJzIGFsbF9ob3N0ZmxhZ3M9JG1vc3RfaG9z
dGZsYWdzCisKKyAgZG9faHZtX2RlYmlhbl90ZXN0X29uZSBkZWJpYW5odm0geGwgc2VhYmlvcyBm
YWxzZSAnJyAtc2hhZG93IFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAieGVuX2Jvb3RfYXBw
ZW5kPWhhcD1mYWxzZSIKK30KKwogZG9feHRmX3Rlc3RzICgpIHsKICAgaWYgISBicmFuY2hfd2Fu
dHNfeHRmX3Rlc3RzOyB0aGVuCiAgICAgICByZXR1cm4KQEAgLTg0OCw2ICs4NTgsOCBAQCB0ZXN0
X21hdHJpeF9kb19vbmUgKCkgewogICBkb19weWdydWJfdGVzdHMKICAgZG9fcHZncnViX3Rlc3Rz
CiAKKyAgZG9fc2hhZG93X3Rlc3RzCisKICAgZG9feHRmX3Rlc3RzCiAgIGRvX2xpdmVwYXRjaF90
ZXN0cwogfQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
