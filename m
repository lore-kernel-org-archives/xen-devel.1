From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH v2 19/23] vixen: Fix Vixen adaptation of
	send_global_virq()
Date: Sun, 7 Jan 2018 12:28:35 -0800
Message-ID: <1515356919-922-20-git-send-email-aliguori@amzn.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sjiq=ec=amzn.com=prvs=538cba048=aliguori@srs-us1.protection.inumbo.net>)
 id 1eYHZC-0004ac-Ue
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 20:29:14 +0000
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
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSmFuIEguIFNjaMO2bmhlcnIgPGpzY2hvZW5oQGFtYXpvbi5kZT4KClRoZSBmdW5jdGlv
biBvcmlnaW5hbGx5IGRpZCB0aGUgZm9sbG93aW5nIHVuY29uZGl0aW9uYWxseToKCiAgIHNlbmRf
Z3Vlc3RfZ2xvYmFsX3ZpcnEoZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV0gPzogaGFyZHdhcmVf
ZG9tYWluLCB2aXJxKTsKClRoZSBuZXcgdmFyaWFudCBzaG91bGQgcmVmbGVjdCB0aGUgbm9uLVZp
eGVuIGNhc2UgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogSmFuIEguIFNjaMO2bmhlcnIgPGpz
Y2hvZW5oQGFtYXpvbi5kZT4KU2lnbmVkLW9mZi1ieTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9y
aUBhbWF6b24uY29tPgotLS0KIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jIHwgNSArKysrLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVs
LmMKaW5kZXggODVmZjdlMC4uM2RlZTczYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ldmVudF9j
aGFubmVsLmMKKysrIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMKQEAgLTg0MCw3ICs4NDAs
MTAgQEAgdm9pZCBzZW5kX2dsb2JhbF92aXJxKHVpbnQzMl90IHZpcnEpCiAgICAgQVNTRVJUKHZp
cnEgPCBOUl9WSVJRUyk7CiAgICAgQVNTRVJUKHZpcnFfaXNfZ2xvYmFsKHZpcnEpKTsKIAotICAg
IHNlbmRfZ3Vlc3RfZ2xvYmFsX3ZpcnEoZ2xvYmFsX3ZpcnFfaGFuZGxlcnNbdmlycV0gPzogaGFy
ZHdhcmVfZG9tYWluLCB2aXJxKTsKKyAgICBpZiAoIGdsb2JhbF92aXJxX2hhbmRsZXJzW3ZpcnFd
ICkKKyAgICAgICAgc2VuZF9ndWVzdF9nbG9iYWxfdmlycShnbG9iYWxfdmlycV9oYW5kbGVyc1t2
aXJxXSwgdmlycSk7CisgICAgZWxzZSBpZiAoICFpc192aXhlbigpICkKKyAgICAgICAgc2VuZF9n
dWVzdF9nbG9iYWxfdmlycShoYXJkd2FyZV9kb21haW4sIHZpcnEpOwogfQogCiBpbnQgc2V0X2ds
b2JhbF92aXJxX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3QgdmlycSkKLS0gCjEu
OS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
