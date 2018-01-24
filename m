From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH] intel_iommu: allow updating FEADDR and FEUADDR
	with one 64bit write
Date: Wed, 24 Jan 2018 15:18:48 +0100
Message-ID: <20180124141848.3969-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvvy=et=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1eeLu7-0007rb-K0
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 14:19:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

QWxsb3cgdXBkYXRpbmcgdGhvc2UgdHdvIGFkamFjZW50IDMyYml0IGZpZWxkcyB3aXRoIG9uZSA2
NGJpdCB3cml0ZS4KVGhpcyBmaXhlcyBxZW11IGNyYXNoIHdoZW4gYm9vdGluZyBYZW4gaW5zaWRl
LgoKU2VlIGRpc2N1c3Npb24gb24gWGVuIHNpZGUgb2YgdGhlIHRoaW5nIGhlcmU6Cmh0dHA6Ly94
ZW4ubWFya21haWwub3JnL21lc3NhZ2UvNm1ybWVtcm5taHh2YXhiYQoKU2lnbmVkLW9mZi1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPgotLS0KIGh3L2kzODYvaW50ZWxfaW9tbXUuYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaTM4
Ni9pbnRlbF9pb21tdS5jIGIvaHcvaTM4Ni9pbnRlbF9pb21tdS5jCmluZGV4IDJlODQxY2RlMjcu
LmQyMTRkY2UyNzcgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvaW50ZWxfaW9tbXUuYworKysgYi9ody9p
Mzg2L2ludGVsX2lvbW11LmMKQEAgLTIxMjksOCArMjEyOSwxMiBAQCBzdGF0aWMgdm9pZCB2dGRf
bWVtX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsCiAKICAgICAvKiBGYXVsdCBFdmVu
dCBBZGRyZXNzIFJlZ2lzdGVyLCAzMi1iaXQgKi8KICAgICBjYXNlIERNQVJfRkVBRERSX1JFRzoK
LSAgICAgICAgYXNzZXJ0KHNpemUgPT0gNCk7Ci0gICAgICAgIHZ0ZF9zZXRfbG9uZyhzLCBhZGRy
LCB2YWwpOworICAgICAgICBhc3NlcnQoc2l6ZSA9PSA0IHx8IHNpemUgPT0gOCk7CisgICAgICAg
IGlmIChzaXplID09IDQpIHsKKyAgICAgICAgICAgIHZ0ZF9zZXRfbG9uZyhzLCBhZGRyLCB2YWwp
OworICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgdnRkX3NldF9xdWFkKHMsIGFkZHIsIHZh
bCk7CisgICAgICAgIH0KICAgICAgICAgYnJlYWs7CiAKICAgICAvKiBGYXVsdCBFdmVudCBVcHBl
ciBBZGRyZXNzIFJlZ2lzdGVyLCAzMi1iaXQgKi8KLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
