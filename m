From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH 13/22] vixen: Use SCHEDOP_shutdown to shutdown
	the machine
Date: Sat, 6 Jan 2018 14:54:28 -0800
Message-ID: <1515279277-16301-14-git-send-email-aliguori@amzn.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fck6=eb=amzn.com=prvs=537d23ce5=aliguori@srs-us1.protection.inumbo.net>)
 id 1eXxNC-0006Qq-M9
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 22:55:30 +0000
In-Reply-To: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSmFuIEguIFNjaMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KCldoaWxlIHRoZSBo
d2RvbV9zaHV0ZG93bigpIGlzIGFibGUgdG8gcmVib290IHRoZSBzeXN0ZW0sIGl0IGZhaWxzIHRv
CnByb3Blcmx5IHBvd2VyIGl0IG9mZi4gV2l0aCBTQ0hFRE9QX3NodXRkb3duLCB3ZSBkZWxlZ2F0
ZSB0aGUgcHJvYmxlbS4KClNpZ25lZC1vZmYtYnk6IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2Vu
aEBhbWF6b24uZGU+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1h
em9uLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jIHwgMTQgKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
b21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggYjRkNjc5ZS4uZWRlMzc3YyAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBA
IC00Miw2ICs0Miw3IEBACiAjaW5jbHVkZSA8eGVuL3RyYWNlLmg+CiAjaW5jbHVkZSA8eGVuL3Rt
ZW0uaD4KICNpbmNsdWRlIDxhc20vc2V0dXAuaD4KKyNpbmNsdWRlIDxhc20vZ3Vlc3Qvdml4ZW4u
aD4KIAogLyogTGludXggY29uZmlnIG9wdGlvbjogcHJvcGFnZXRlZCB0byBkb21haW4wICovCiAv
KiB4ZW5fcHJvY2Vzc29yX3BtYml0czogeGVuIGNvbnRyb2wgQ3gsIFB4LCAuLi4gKi8KQEAgLTY5
Myw2ICs2OTQsMTcgQEAgdm9pZCBfX2RvbWFpbl9jcmFzaF9zeW5jaHJvbm91cyh2b2lkKQogfQog
CiAKK3N0YXRpYyB2b2lkIHZpeGVuX3NodXRkb3duKHU4IHJlYXNvbikKK3sKKyAgICBzdHJ1Y3Qg
c2NoZWRfc2h1dGRvd24gc2NoZWRfc2h1dGRvd24gPSB7IC5yZWFzb24gPSByZWFzb24gfTsKKwor
ICAgIGlmICghb3B0X25vcmVib290KQorICAgICAgICBIWVBFUlZJU09SX3NjaGVkX29wKFNDSEVE
T1Bfc2h1dGRvd24sICZzY2hlZF9zaHV0ZG93bik7CisKKyAgICAvKiBGYWxsYmFjaywgaW4gY2Fz
ZSB0aGUgaHlwZXJjYWxsIGZhaWxzICovCisgICAgaHdkb21fc2h1dGRvd24ocmVhc29uKTsKK30K
KyAKIHZvaWQgZG9tYWluX3NodXRkb3duKHN0cnVjdCBkb21haW4gKmQsIHU4IHJlYXNvbikKIHsK
ICAgICBzdHJ1Y3QgdmNwdSAqdjsKQEAgLTcwMyw2ICs3MTUsOCBAQCB2b2lkIGRvbWFpbl9zaHV0
ZG93bihzdHJ1Y3QgZG9tYWluICpkLCB1OCByZWFzb24pCiAgICAgICAgIGQtPnNodXRkb3duX2Nv
ZGUgPSByZWFzb247CiAgICAgcmVhc29uID0gZC0+c2h1dGRvd25fY29kZTsKIAorICAgIGlmICgg
aXNfdml4ZW4oKSApCisgICAgICAgIHZpeGVuX3NodXRkb3duKHJlYXNvbik7CiAgICAgaWYgKCBp
c19oYXJkd2FyZV9kb21haW4oZCkgKQogICAgICAgICBod2RvbV9zaHV0ZG93bihyZWFzb24pOwog
Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
