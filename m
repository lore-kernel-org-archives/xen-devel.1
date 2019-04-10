From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 55/62] make-flight: shadow test: Disable
 kpti in guests
Date: Wed, 10 Apr 2019 15:24:01 +0100
Message-ID: <20190410142408.22848-56-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAY-0006z0-Bp
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:42 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2luY2UgU3BlY3RyZS9NZWx0ZG93biwgc2hhZG93IGhhcyBiZWVuIGEgbG90IHNsb3dlciwgZXNw
ZWNpYWxseSB3aXRoCktQVEkgaW4gdGhlIGd1ZXN0LiAgRW1waXJpY2FsbHksIHRvbyBzbG93ICh3
aXRoIHRoZSBrZXJuZWwgZnJvbSBEZWJpYW4Kc3RyZXRjaCkuCgpDQzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogbWFrZS1mbGlnaHQgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1m
bGlnaHQKaW5kZXggMTUxYjE0MzUuLjFlM2ViZDVjIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAor
KysgYi9tYWtlLWZsaWdodApAQCAtNDkzLDYgKzQ5Myw3IEBAIGRvX3NoYWRvd190ZXN0cyAoKSB7
CiAgICAgICAgICAgICAkZGViaWFuX3J1bnZhcnMgYWxsX2hvc3RmbGFncz0kbW9zdF9ob3N0Zmxh
Z3MKIAogICBkb19odm1fZGViaWFuX3Rlc3Rfb25lIGRlYmlhbmh2bSB4bCBzZWFiaW9zIGZhbHNl
ICcnIC1zaGFkb3cgXAorICAgICAgICAgICAgICAgICAgICAgICAgIGFsbF9ndWVzdF9saW51eF9i
b290X2FwcGVuZD1ub3B0aSBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgInhlbl9ib290X2Fw
cGVuZD1oYXA9ZmFsc2UiCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
