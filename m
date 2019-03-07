From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] libxl: prepare environment for
 domcreate_stream_done
Date: Thu,  7 Mar 2019 11:56:49 +0100
Message-ID: <20190307105649.8919-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPx7=RK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h1qhz-0002iX-8t
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:57:04 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZ1bmN0aW9uIGRvbWNyZWF0ZV9ib290bG9hZGVyX2RvbmUgbWF5IGJyYW5jaCBlYXJseSB0
bwpkb21jcmVhdGVfc3RyZWFtX2RvbmUsIGluIGNhc2Ugc29tZSBlcnJvciBvY2NvdXJlZC4gSGVy
ZSBzcnMtPmRjcyB3aWxsIGJlCk5VTEwsIHdoaWNoIGxlYWRzIHRvIGEgY3Jhc2guCgpJdCBpcyB1
bmNsZWFyIHdoYXQgdGhlIHB1cnBvc2Ugb2YgdGhhdCBiYWNrcG9pbnRlciBpcy4gUGVyaGFwcyBp
dCBjYW4gYmUKcmVtb3ZlZCwgYW5kIGRvbWNyZWF0ZV9zdHJlYW1fZG9uZSBjb3VsZCB1c2UgQ09O
VEFJTkVSX09GLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgot
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKaW5kZXggYTRlNzRh
NWNkMi4uOTg5Y2U2ZDViZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
KysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTEwOTMsNiArMTA5MywxMCBAQCBz
dGF0aWMgdm9pZCBkb21jcmVhdGVfYm9vdGxvYWRlcl9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAg
ICAgICAgcmV0dXJuOwogICAgIH0KIAorICAgIC8qIFByZXBhcmUgZW52aXJvbm1lbnQgZm9yIGRv
bWNyZWF0ZV9zdHJlYW1fZG9uZSAqLworICAgIGlmICghZGNzLT5zcnMuZGNzKQorICAgICAgICBk
Y3MtPnNycy5kY3MgPSBkY3M7CisKICAgICAvKiBSZXN0b3JlICovCiAgICAgY2FsbGJhY2tzLT5y
ZXN0b3JlX3Jlc3VsdHMgPSBsaWJ4bF9fc3JtX2NhbGxvdXRfY2FsbGJhY2tfcmVzdG9yZV9yZXN1
bHRzOwogCkBAIC0xMTE2LDcgKzExMjAsNiBAQCBzdGF0aWMgdm9pZCBkb21jcmVhdGVfYm9vdGxv
YWRlcl9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgZ290byBvdXQ7CiAKICAgICBkY3Mt
PnNycy5hbyA9IGFvOwotICAgIGRjcy0+c3JzLmRjcyA9IGRjczsKICAgICBkY3MtPnNycy5mZCA9
IHJlc3RvcmVfZmQ7CiAgICAgZGNzLT5zcnMubGVnYWN5ID0gKGRjcy0+cmVzdG9yZV9wYXJhbXMu
c3RyZWFtX3ZlcnNpb24gPT0gMSk7CiAgICAgZGNzLT5zcnMuYmFja19jaGFubmVsID0gZmFsc2U7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
