From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 53/62] ts-xen-install: Install
 libpciaccess0
Date: Wed, 10 Apr 2019 15:23:59 +0100
Message-ID: <20190410142408.22848-54-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAe-0007DC-86
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:48 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gInRzLXhlbi1idWlsZC1wcmVwOiBpbnN0YWxsIHBhY2thZ2VzIGZvciBzdWl0ZXMgPmplc3Np
ZSIsCmxpYnBjaWFjY2Vzcy1kZXYgd2FzIGFkZGVkIGZvciB0aGUgYmVuZWZpdCBvZiBxZW11LiAg
bGlidmlydCBuZWVkcyBpdAp0b28uCgpXZSBhbHNvIG5lZWQgdGhlIHJ1bnRpbWUgbGlicmFyeS4g
IFdpdGhvdXQgaXQsIGxpYnZpcnQgZG9lcyBub3Qgc3RhcnQ6CgogIDIwMTktMDQtMDQgMjI6MzU6
MzYuNzYwKzAwMDA6IDM2MjM6IGVycm9yIDogdmlyTW9kdWxlTG9hZEZpbGU6NTMgOiBpbnRlcm5h
bCBlcnJvcjogRmFpbGVkIHRvIGxvYWQgbW9kdWxlICcvdXNyL2xvY2FsL2xpYi9saWJ2aXJ0L2Nv
bm5lY3Rpb24tZHJpdmVyL2xpYnZpcnRfZHJpdmVyX25vZGVkZXYuc28nOiBsaWJwY2lhY2Nlc3Mu
c28uMDogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0cy14ZW4taW5zdGFsbCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMteGVuLWluc3RhbGwgYi90
cy14ZW4taW5zdGFsbAppbmRleCAwM2Y4YzAzZS4uOWY3OGE3NWYgMTAwNzU1Ci0tLSBhL3RzLXhl
bi1pbnN0YWxsCisrKyBiL3RzLXhlbi1pbnN0YWxsCkBAIC01Myw3ICs1Myw4IEBAIHN1YiBwYWNr
YWdlcyAoKSB7CiAJCQkgICAgICAgcWVtdS11dGlscwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG5ldGNhdC1vcGVuYnNkKSk7CiAgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL3NxdWVl
emV8d2hlZXp5fGplc3NpZS8pIHsKLSAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhv
LCBxdyhuZXQtdG9vbHMgbGlibmwtcm91dGUtMy0yMDApKTsKKyAgICAgICAgdGFyZ2V0X2luc3Rh
bGxfcGFja2FnZXMoJGhvLCBxdyhuZXQtdG9vbHMgbGlibmwtcm91dGUtMy0yMDAgCisJCQkJCWxp
YnBjaWFjY2VzczApKTsKICAgICB9CiAgICAgaWYgKCRoby0+e1N1aXRlfSA9fiBtL2plc3NpZS8p
IHsKICAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhsaWJubC1yb3V0ZS0z
LTIwMCkpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
