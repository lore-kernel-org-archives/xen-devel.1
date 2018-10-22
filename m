From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] arm: fix Dom0 creation after ef72c93df9
Date: Mon, 22 Oct 2018 14:40:21 +0100
Message-ID: <20181022134021.30090-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebok=nc=citrix.com=prvs=8264c92cc=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gEaRV-0006h9-7L
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 13:40:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QVJNIERvbTAgY3JlYXRpb24gd2FzIGJyb2tlbiBieSB0aGUgc2FpZCBjb21taXQgYmVjYXVzZSBB
Uk0gbmVpdGhlcgpwcm92aWRlZCBYRU5fRE9NQ1RMX0NERl9odm1fZ3Vlc3Qgbm9yIGhhZCBDT05G
SUdfUFYgc2V0LgoKU2V0IFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCBmbGFnIGZvciBBUk0gRG9t
MCB0byBmaXggdGhlIGlzc3VlLiBBbHNvCnNldCBYRU5fRE9NQ1RMX0NERl9oYXAgd2hpbGUgYXQg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL2FybS9zZXR1cC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CmluZGV4IGVhMjQ5NWE3M2IuLjgwZjAwMjg2ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC02OTMsNiArNjkzLDcgQEAgdm9p
ZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlzX29mZnNldCwKICAgICBz
dHJ1Y3QgYm9vdG1vZHVsZSAqeGVuX2Jvb3Rtb2R1bGU7CiAgICAgc3RydWN0IGRvbWFpbiAqZG9t
MDsKICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9jZmcgPSB7CisgICAg
ICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCB8IFhFTl9ET01DVExfQ0RGX2hh
cCwKICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLAogICAgICAgICAubWF4X2dyYW50X2Zy
YW1lcyA9IGdudHRhYl9kb20wX2ZyYW1lcygpLAogICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1l
cyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJhbWVzLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
