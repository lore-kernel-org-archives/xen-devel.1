From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] xen: fix frontend driver disconnected from
	xenbus on removal
Date: Thu,  1 Feb 2018 10:57:18 +0200
Message-ID: <1517475439-10541-1-git-send-email-andr2000__32715.1850834072$1517475407$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pmqj=e3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ehAgV-0002e1-DM
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 08:57:31 +0000
Received: by mail-lf0-x244.google.com with SMTP id 63so24991416lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 00:57:30 -0800 (PST)
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
YW0uY29tPgoKSGksIGFsbCEKCldoaWxlIHdvcmtpbmcgb24gRFJNIFBWIGZyb250ZW5kIGRyaXZl
ciBJIGZhY2VkIGFuIGlzc3VlIHdpdGgKZHJpdmVyIHJlbW92YWwsIGUuZy4gd2hlbiBkcml2ZXIn
cyAucmVtb3ZlIGNhbGxiYWNrIGlzIGNhbGxlZAp0aGUgZHJpdmVyIGlzIGFscmVhZHkgZGlzY29u
bmVjdGVkIGZvcm0gdGhlIHhlbmJ1cyBhbmQgaXQgaXMgbm90CnBvc3NpYmxlIHRvIHN5bmNocm9u
aXplIHRoZSBwcm9jZXNzIG9mIHJlbW92YWwgd2l0aCB0aGUgYmFja2VuZC4KQmFja2VuZCBpbiBt
eSBjYXNlIGlzIGEgdXNlci1zcGFjZSBhcHBsaWNhdGlvbiwgc28gdGhpcyBtYXkgZXhwbGFpbgp3
aHkgYmFja2VuZHMgd2hpY2ggYXJlIGtlcm5lbCBtb2R1bGVzIGRvIG5vdCBzdWZmZXIgZnJvbSB0
aGlzOgppdCBzZWVtcyB0aGF0IHVzZXItc3BhY2UgaXMgY2x1bXN5IGFuZCBpdHMgc3RhdGVzIGFy
ZSBub3QgZGVsaXZlcmVkCnRocm91Z2ggeGVuYnVzIGZhc3QgZW5vdWdoLgoKVGhlIG9idmlvdXMg
d2F5IHRvIGZpeCB0aGlzIGJlaGF2aW9yIGlzIHRvIGRpc2Nvbm5lY3QgZnJvbnRlbmQKZHJpdmVy
cyBmcm9tIHhlbmJ1cyBfYWZ0ZXJfIHRoZWlyIC5yZW1vdmUgY2FsbGJhY2sgaXMgY2FsbGVkLgoK
VGhhbmsgeW91LApPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbwoKT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gKDEpOgogIHhlbjogZml4IGZyb250ZW5kIGRyaXZlciBkaXNjb25uZWN0ZWQgZnJvbSB4ZW5i
dXMgb24gcmVtb3ZhbAoKIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
