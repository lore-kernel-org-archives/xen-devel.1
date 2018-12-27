From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/5] x86/dom0: allow stealing RAM from a region
 that starts in the low 1MB
Date: Thu, 27 Dec 2018 16:26:35 +0100
Message-ID: <20181227152638.41648-3-roger.pau@citrix.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcXYq-0003Xe-Ls
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:27:00 +0000
In-Reply-To: <20181227152638.41648-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXMgbG9uZyBhcyB0aGUgbWVtb3J5IHN0b2xlbiBpcyBhbHdheXMgYWJvdmUgMU1CLiBUaGlzIGFs
bG93cyB0aGUgUFZICkRvbTAgYnVpbGRlciB0byBiZSB1c2VkIG9uIGEgbWVtb3J5IG1hcCB0aGF0
IG9ubHkgaGFzIGEgc2luZ2xlIFJBTQpyZWdpb24gc3RhcnRpbmcgYXQgMC4KClJlcG9ydGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDcgKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCmluZGV4IDkx
ZGMyN2RjM2UuLjI0Y2MxNWYyOGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9i
dWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCkBAIC0xNTQsMTIgKzE1
NCwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfc3RlYWxfcmFtKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGxvbmcgc2l6ZSwKICAgICB7CiAgICAgICAgIHN0cnVjdCBlODIwZW50cnkgKmVu
dHJ5ID0gJmQtPmFyY2guZTgyMFtpXTsKIAotICAgICAgICBpZiAoIGVudHJ5LT50eXBlICE9IEU4
MjBfUkFNIHx8IGVudHJ5LT5hZGRyICsgZW50cnktPnNpemUgPiBsaW1pdCB8fAotICAgICAgICAg
ICAgIGVudHJ5LT5hZGRyIDwgTUIoMSkgKQorICAgICAgICBpZiAoIGVudHJ5LT50eXBlICE9IEU4
MjBfUkFNIHx8IGVudHJ5LT5hZGRyICsgZW50cnktPnNpemUgPiBsaW1pdCApCiAgICAgICAgICAg
ICBjb250aW51ZTsKIAogICAgICAgICAqYWRkciA9IChlbnRyeS0+YWRkciArIGVudHJ5LT5zaXpl
IC0gc2l6ZSkgJiB+KGFsaWduIC0gMSk7Ci0gICAgICAgIGlmICggKmFkZHIgPCBlbnRyeS0+YWRk
ciApCisgICAgICAgIGlmICggKmFkZHIgPCBlbnRyeS0+YWRkciB8fAorICAgICAgICAgICAgIC8q
IERvbid0IHN0ZWFsIGZyb20gdGhlIGxvdyAxTUIgZHVlIHRvIHRoZSBjb3B5aW5nIGRvbmUgdGhl
cmUuICovCisgICAgICAgICAgICAgKmFkZHIgPCBNQigxKSApCiAgICAgICAgICAgICBjb250aW51
ZTsKIAogICAgICAgICBlbnRyeS0+c2l6ZSA9ICphZGRyIC0gZW50cnktPmFkZHI7Ci0tIAoyLjE3
LjIgKEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
