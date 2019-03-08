From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v2] libxl: prepare environment for
 domcreate_stream_done
Date: Fri,  8 Mar 2019 13:24:15 +0100
Message-ID: <20190308122415.29972-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKkW=RL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h2EY6-0002Cs-VZ
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 12:24:27 +0000
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
LS0KdjI6CiB1bmNvbmRpdGlvbmFsIGFzc2lnbm1lbnQKCiB0b29scy9saWJ4bC9saWJ4bF9jcmVh
dGUuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMKaW5kZXggYTRlNzRhNWNkMi4uYzhiNWVhOTg0YiAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKQEAgLTEwOTMsNiArMTA5Myw5IEBAIHN0YXRpYyB2b2lkIGRvbWNyZWF0ZV9ib290bG9h
ZGVyX2RvbmUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICByZXR1cm47CiAgICAgfQogCisgICAg
LyogUHJlcGFyZSBlbnZpcm9ubWVudCBmb3IgZG9tY3JlYXRlX3N0cmVhbV9kb25lICovCisgICAg
ZGNzLT5zcnMuZGNzID0gZGNzOworCiAgICAgLyogUmVzdG9yZSAqLwogICAgIGNhbGxiYWNrcy0+
cmVzdG9yZV9yZXN1bHRzID0gbGlieGxfX3NybV9jYWxsb3V0X2NhbGxiYWNrX3Jlc3RvcmVfcmVz
dWx0czsKIApAQCAtMTExNiw3ICsxMTE5LDYgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Jvb3Rs
b2FkZXJfZG9uZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIGdvdG8gb3V0OwogCiAgICAgZGNz
LT5zcnMuYW8gPSBhbzsKLSAgICBkY3MtPnNycy5kY3MgPSBkY3M7CiAgICAgZGNzLT5zcnMuZmQg
PSByZXN0b3JlX2ZkOwogICAgIGRjcy0+c3JzLmxlZ2FjeSA9IChkY3MtPnJlc3RvcmVfcGFyYW1z
LnN0cmVhbV92ZXJzaW9uID09IDEpOwogICAgIGRjcy0+c3JzLmJhY2tfY2hhbm5lbCA9IGZhbHNl
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
