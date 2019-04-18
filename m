From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/21] ts-logs-capture: Do not try to
 capture logs of hosts not allocated
Date: Thu, 18 Apr 2019 17:31:40 +0100
Message-ID: <20190418163158.11408-4-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xG-0001z3-MF
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:06 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
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

TGl0dGxlIHNpZ25pZmljYW50IGNoYW5nZSB3aXRoIGV4aXN0aW5nIG5vbi1icm9rZW4gZmxpZ2h0
cyBldGMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0cy1sb2dzLWNhcHR1cmUgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90cy1sb2dzLWNhcHR1
cmUgYi90cy1sb2dzLWNhcHR1cmUKaW5kZXggYTQyOWJiNzYuLjgzMjM0ZjZmIDEwMDc1NQotLS0g
YS90cy1sb2dzLWNhcHR1cmUKKysrIGIvdHMtbG9ncy1jYXB0dXJlCkBAIC0zMiw3ICszMiwxMiBA
QCBpZiAoISRtam9iZGItPmpvYmRiX2VuYWJsZV9sb2dfY2FwdHVyZSkgewogCiBvdXIgKCR3aGhv
c3QpID0gQEFSR1Y7CiAkd2hob3N0IHx8PSAnaG9zdCc7Ci1vdXIgJGhvPSBzZWxlY3Rob3N0KCR3
aGhvc3QpOworCitvdXIgJGhvPSBzZWxlY3Rob3N0KCR3aGhvc3QsIDEpOworaWYgKCEkaG8pIHsK
KyAgICBsb2dtKCJob3N0ICR3aGhvc3Qgbm90IHNwZWNpZmllZCwgbm90IGNhcHR1cmluZyBsb2dz
Iik7CisgICAgZXhpdCAwOworfQogCiBvdXIgQGd1ZXN0czsKIAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
