From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] MMIO emulation fixes
Date: Fri, 10 Aug 2018 11:37:12 +0100
Message-ID: <20180810103714.5112-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3eyy=kz=citrix.com=prvs=753083691=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fo4nI-0000Ta-24
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 10:37:20 +0000
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
cmNoL3g4Ni9odm0vZW11bGF0ZS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KIHhlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYyAgIHwgMTUgKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
