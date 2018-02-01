From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] xen: fix frontend driver disconnected from
	xenbus on removal
Date: Thu,  1 Feb 2018 10:57:19 +0200
Message-ID: <1517475439-10541-2-git-send-email-andr2000__10210.1447097541$1517475391$gmane$org@gmail.com>
References: <1517475439-10541-1-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pmqj=e3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ehAgW-0002eA-My
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 08:57:32 +0000
Received: by mail-lf0-x242.google.com with SMTP id g72so24979410lfg.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 00:57:31 -0800 (PST)
In-Reply-To: <1517475439-10541-1-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, otubo@redhat.com, boris.ostrovsky@oracle.com, david.vrabel@citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKQ3VycmVudCB4ZW5idXMgZnJvbnRlbmQgZHJpdmVyIHJlbW92YWwgZmxvdyBmaXJz
dCBkaXNjb25uZWN0cwp0aGUgZHJpdmVyIGZyb20geGVuYnVzIGFuZCB0aGVuIGNhbGxzIGRyaXZl
cidzIHJlbW92ZSBjYWxsYmFjay4KVGhpcyBtYWtlcyBpdCBpbXBvc3NpYmxlIGZvciB0aGUgZHJp
dmVyIHRvIGxpc3RlbiB0byBiYWNrZW5kJ3MKc3RhdGUgY2hhbmdlcyBhbmQgc3luY2hyb25pemUg
dGhlIHJlbW92YWwgcHJvY2VkdXJlLgoKRml4IHRoaXMgYnkgcmVtb3Zpbmcgb3RoZXIgZW5kIFhl
bkJ1cyB3YXRjaGVzIGFmdGVyIHRoZQpkcml2ZXIncyByZW1vdmUgY2FsbGJhY2sgaXMgY2FsbGVk
LgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRy
dXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUu
YyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKaW5kZXggNzQ4ODhjYWNkMGIwLi45YzYzY2Qz
ZjQxNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYworKysg
Yi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKQEAgLTI1OCwxMSArMjU4LDExIEBA
IGludCB4ZW5idXNfZGV2X3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQogCiAJRFBSSU5USygi
JXMiLCBkZXYtPm5vZGVuYW1lKTsKIAotCWZyZWVfb3RoZXJlbmRfd2F0Y2goZGV2KTsKLQogCWlm
IChkcnYtPnJlbW92ZSkKIAkJZHJ2LT5yZW1vdmUoZGV2KTsKIAorCWZyZWVfb3RoZXJlbmRfd2F0
Y2goZGV2KTsKKwogCWZyZWVfb3RoZXJlbmRfZGV0YWlscyhkZXYpOwogCiAJeGVuYnVzX3N3aXRj
aF9zdGF0ZShkZXYsIFhlbmJ1c1N0YXRlQ2xvc2VkKTsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
