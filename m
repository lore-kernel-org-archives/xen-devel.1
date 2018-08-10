From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/2] MMIO emulation fixes
Date: Fri, 10 Aug 2018 15:48:01 +0100
Message-ID: <20180810144803.12652-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3eyy=kz=citrix.com=prvs=753083691=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fo8hz-0006j6-RE
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 14:48:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgYXJlIHByb2JhYmx5IGJvdGggY2FuZGlkYXRlcyBmb3IgYmFjay1wb3J0LgoKUGF1bCBE
dXJyYW50ICgyKToKICB4ODYvaHZtL2lvcmVxOiBNTUlPIHJhbmdlIGNoZWNraW5nIGNvbXBsZXRl
bHkgaWdub3JlcyBkaXJlY3Rpb24gZmxhZwogIHg4Ni9odm0vZW11bGF0ZTogbWFrZSBzdXJlIHJl
cCBJL08gZW11bGF0aW9uIGRvZXMgbm90IGNyb3NzIEdGTgogICAgYm91bmRhcmllcwoKIHhlbi9h
cmNoL3g4Ni9odm0vZW11bGF0ZS5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogeGVuL2FyY2gv
eDg2L2h2bS9pb3JlcS5jICAgfCAxNSArKysrKysrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
