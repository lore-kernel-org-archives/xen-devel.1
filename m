From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 22/25] xen/evtchn: expose send_guest_global_virq
 for use within Xen
Date: Fri, 30 Nov 2018 17:33:01 -0800
Message-ID: <1543627984-21394-23-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAi-0007K8-Ak
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:34:16 +0000
Received: by mail-it1-x142.google.com with SMTP id h65so1227308ith.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:34:14 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYmUgdXNlZCBieSBBcmdvIGZvciBkZWxpdmVyeSBvZiBub3RpZmljYXRpb25zIHRvIHNvbWUg
Z3Vlc3RzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNs
YXJrNkBiYWVzeXN0ZW1zLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYyB8IDIg
Ky0KIHhlbi9pbmNsdWRlL3hlbi9ldmVudC5oICAgIHwgNyArKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vZXZlbnRfY2hhbm5lbC5jIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMKaW5kZXggM2Rm
ZGU4My4uZWVjM2FjZiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMKKysr
IGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMKQEAgLTc2OSw3ICs3NjksNyBAQCB2b2lkIHNl
bmRfZ3Vlc3RfdmNwdV92aXJxKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCB2aXJxKQogICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJnYtPnZpcnFfbG9jaywgZmxhZ3MpOwogfQogCi1zdGF0aWMg
dm9pZCBzZW5kX2d1ZXN0X2dsb2JhbF92aXJxKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IHZp
cnEpCit2b2lkIHNlbmRfZ3Vlc3RfZ2xvYmFsX3ZpcnEoc3RydWN0IGRvbWFpbiAqZCwgdWludDMy
X3QgdmlycSkKIHsKICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwogICAgIGludCBwb3J0OwpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2V2ZW50LmggYi94ZW4vaW5jbHVkZS94ZW4vZXZlbnQu
aAppbmRleCAxOGMzNzM4Li43NDYzOTI3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vZXZl
bnQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vZXZlbnQuaApAQCAtMjksNiArMjksMTMgQEAgdm9p
ZCBzZW5kX2d1ZXN0X3ZjcHVfdmlycShzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgdmlycSk7CiB2
b2lkIHNlbmRfZ2xvYmFsX3ZpcnEodWludDMyX3QgdmlycSk7CiAKIC8qCisgKiBzZW5kX2d1ZXN0
X2dsb2JhbF92aXJxOgorICogIEBkOiAgICAgICAgRG9tYWluIHRvIHdoaWNoIFZJUlEgc2hvdWxk
IGJlIHNlbnQKKyAqICBAdmlycTogICAgIFZpcnR1YWwgSVJRIG51bWJlciAoVklSUV8qKSwgbXVz
dCBiZSBnbG9iYWwKKyAqLwordm9pZCBzZW5kX2d1ZXN0X2dsb2JhbF92aXJxKHN0cnVjdCBkb21h
aW4gKmQsIHVpbnQzMl90IHZpcnEpOworCisvKgogICogc2VudF9nbG9iYWxfdmlycV9oYW5kbGVy
OiBTZXQgYSBnbG9iYWwgVklSUSBoYW5kbGVyLgogICogIEBkOiAgICAgICAgTmV3IHRhcmdldCBk
b21haW4gZm9yIHRoaXMgVklSUQogICogIEB2aXJxOiAgICAgVmlydHVhbCBJUlEgbnVtYmVyIChW
SVJRXyopLCBtdXN0IGJlIGdsb2JhbAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
