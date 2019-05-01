From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 09/15] arch replumbing:
 ts-debian-di-install: Use $gho->{Arch}
Date: Wed, 1 May 2019 11:48:33 +0100
Message-ID: <20190501104839.21621-10-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnL-0005gK-JR
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:59 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
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

VGhpcyBpcyBqdXN0IHRpZHlpbmcgdXAuICBUaGUgb25seSBlZmZlY3QgaXMgdGhhdCBub3cgdGhl
c2Ugd291bGQKaG9ub3VyICRye2FsbF9ndWVzdF9hcmNofSBhcyBhIGZhbGxiYWNrLiAgQnV0IHJp
Z2h0IG5vdywKJHJ7R1VFU1RfYXJjaH0gd2lsbCBhbHdheXMgYmUgc2V0LCBhbmQgdGhhdCBpcyB3
aGF0IGVuZHMgdXAgaW4KJGdoby0+e0FyY2h9LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZGViaWFuLWRpLWluc3RhbGwgfCAy
ICstCiB0cy1kZWJpYW4taW5zdGFsbCAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1kaS1pbnN0
YWxsIGIvdHMtZGViaWFuLWRpLWluc3RhbGwKaW5kZXggNWNiM2QzNWQuLjlhYmI0OTU2IDEwMDc1
NQotLS0gYS90cy1kZWJpYW4tZGktaW5zdGFsbAorKysgYi90cy1kZWJpYW4tZGktaW5zdGFsbApA
QCAtMTc0LDcgKzE3NCw3IEBAIEVORAogfQogCiBzdWIgZ2luc3RhbGwgKCkgewotICAgIG15ICRh
cmNoPSAkcnsiJGdoby0+e0d1ZXN0fV9hcmNoIn07CisgICAgbXkgJGFyY2g9ICRnaG8tPntBcmNo
fTsKICAgICBteSAkbWV0aG9kPSAkcnsiJGdoby0+e0d1ZXN0fV9tZXRob2QifTsKIAogICAgIG15
ICR0bXBkaXI9ICIvcm9vdC8kZmxpZ2h0LSRqb2ItZGkiOwpkaWZmIC0tZ2l0IGEvdHMtZGViaWFu
LWluc3RhbGwgYi90cy1kZWJpYW4taW5zdGFsbAppbmRleCA1YmJhZWFkMC4uZjA3ZGQ2NzYgMTAw
NzU1Ci0tLSBhL3RzLWRlYmlhbi1pbnN0YWxsCisrKyBiL3RzLWRlYmlhbi1pbnN0YWxsCkBAIC00
Nyw3ICs0Nyw3IEBAIHN1YiBwcmVwICgpIHsKIH0KIAogc3ViIGdpbnN0YWxsICgpIHsKLSAgICBt
eSAkYXJjaD0gJHJ7IiRnaG8tPntHdWVzdH1fYXJjaCJ9OworICAgIG15ICRhcmNoPSAkZ2hvLT57
QXJjaH07CiAgICAgbXkgJGFyY2hhcmc9IGRlZmluZWQoJGFyY2gpID8gIi0tYXJjaCAkYXJjaCIg
OiAnJzsKICAgICBteSAkZ3N1aXRlPSBkZWJpYW5fZ3Vlc3Rfc3VpdGUoJGdobyk7CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
