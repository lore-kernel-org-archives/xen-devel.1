From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v2 13/23] vixen: Use SCHEDOP_shutdown to
	shutdown the machine
Date: Sun, 7 Jan 2018 12:28:29 -0800
Message-ID: <1515356919-922-14-git-send-email-aliguori@amzn.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sjiq=ec=amzn.com=prvs=538cba048=aliguori@srs-us1.protection.inumbo.net>)
 id 1eYHdj-0007Qg-GK
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 20:33:55 +0000
In-Reply-To: <1515356919-922-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSmFuIEguIFNjaMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KCldoaWxlIHRoZSBo
d2RvbV9zaHV0ZG93bigpIGlzIGFibGUgdG8gcmVib290IHRoZSBzeXN0ZW0sIGl0IGZhaWxzIHRv
CnByb3Blcmx5IHBvd2VyIGl0IG9mZi4gV2l0aCBTQ0hFRE9QX3NodXRkb3duLCB3ZSBkZWxlZ2F0
ZSB0aGUgcHJvYmxlbS4KClNpZ25lZC1vZmYtYnk6IEphbiBILiBTY2jDtm5oZXJyIDxqc2Nob2Vu
aEBhbWF6b24uZGU+Ci0tLQogeGVuL2NvbW1vbi9kb21haW4uYyB8IDE0ICsrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4IGI0ZDY3OWUuLmVkZTM3N2Mg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4u
YwpAQCAtNDIsNiArNDIsNyBAQAogI2luY2x1ZGUgPHhlbi90cmFjZS5oPgogI2luY2x1ZGUgPHhl
bi90bWVtLmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CisjaW5jbHVkZSA8YXNtL2d1ZXN0L3Zp
eGVuLmg+CiAKIC8qIExpbnV4IGNvbmZpZyBvcHRpb246IHByb3BhZ2V0ZWQgdG8gZG9tYWluMCAq
LwogLyogeGVuX3Byb2Nlc3Nvcl9wbWJpdHM6IHhlbiBjb250cm9sIEN4LCBQeCwgLi4uICovCkBA
IC02OTMsNiArNjk0LDE3IEBAIHZvaWQgX19kb21haW5fY3Jhc2hfc3luY2hyb25vdXModm9pZCkK
IH0KIAogCitzdGF0aWMgdm9pZCB2aXhlbl9zaHV0ZG93bih1OCByZWFzb24pCit7CisgICAgc3Ry
dWN0IHNjaGVkX3NodXRkb3duIHNjaGVkX3NodXRkb3duID0geyAucmVhc29uID0gcmVhc29uIH07
CisKKyAgICBpZiAoIW9wdF9ub3JlYm9vdCkKKyAgICAgICAgSFlQRVJWSVNPUl9zY2hlZF9vcChT
Q0hFRE9QX3NodXRkb3duLCAmc2NoZWRfc2h1dGRvd24pOworCisgICAgLyogRmFsbGJhY2ssIGlu
IGNhc2UgdGhlIGh5cGVyY2FsbCBmYWlscyAqLworICAgIGh3ZG9tX3NodXRkb3duKHJlYXNvbik7
Cit9CisgCiB2b2lkIGRvbWFpbl9zaHV0ZG93bihzdHJ1Y3QgZG9tYWluICpkLCB1OCByZWFzb24p
CiB7CiAgICAgc3RydWN0IHZjcHUgKnY7CkBAIC03MDMsNiArNzE1LDggQEAgdm9pZCBkb21haW5f
c2h1dGRvd24oc3RydWN0IGRvbWFpbiAqZCwgdTggcmVhc29uKQogICAgICAgICBkLT5zaHV0ZG93
bl9jb2RlID0gcmVhc29uOwogICAgIHJlYXNvbiA9IGQtPnNodXRkb3duX2NvZGU7CiAKKyAgICBp
ZiAoIGlzX3ZpeGVuKCkgKQorICAgICAgICB2aXhlbl9zaHV0ZG93bihyZWFzb24pOwogICAgIGlm
ICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkKICAgICAgICAgaHdkb21fc2h1dGRvd24ocmVhc29u
KTsKIAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
