From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v3 1/9] xen/grant-table: Export
 gnttab_{alloc|free}_pages as GPL
Date: Tue, 12 Jun 2018 16:41:52 +0300
Message-ID: <20180612134200.17456-2-andr2000__29100.9277957075$1528810870$gmane$org@gmail.com>
References: <20180612134200.17456-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=byzt=i6=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fSjYq-0007g1-WC
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 13:42:13 +0000
Received: by mail-lf0-x244.google.com with SMTP id j13-v6so36078166lfb.13
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 06:42:12 -0700 (PDT)
In-Reply-To: <20180612134200.17456-1-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: andr2000@gmail.com, daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKT25seSBnbnR0YWJfe2FsbG9jfGZyZWV9X3BhZ2VzIGFyZSBleHBvcnRlZCBhcyBF
WFBPUlRfU1lNQk9MCndoaWxlIGFsbCB0aGUgcmVzdCBhcmUgZXhwb3J0ZWQgYXMgRVhQT1JUX1NZ
TUJPTF9HUEwsIHRodXMKZWZmZWN0aXZlbHkgbWFraW5nIGl0IG5vdCBwb3NzaWJsZSBmb3Igbm9u
LUdQTCBkcml2ZXIgbW9kdWxlcwp0byB1c2UgZ3JhbnQgdGFibGUgbW9kdWxlLiBFeHBvcnQgZ250
dGFiX3thbGxvY3xmcmVlfV9wYWdlcyBhcwpFWFBPUlRfU1lNQk9MX0dQTCBzbyBhbGwgdGhlIGV4
cG9ydHMgYXJlIGFsaWduZWQuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIGIvZHJpdmVycy94ZW4vZ3Jh
bnQtdGFibGUuYwppbmRleCAyN2JlMTA3ZDY0ODAuLmJhMzZmZjNlNDkwMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYworKysgYi9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5j
CkBAIC03OTksNyArNzk5LDcgQEAgaW50IGdudHRhYl9hbGxvY19wYWdlcyhpbnQgbnJfcGFnZXMs
IHN0cnVjdCBwYWdlICoqcGFnZXMpCiAKIAlyZXR1cm4gMDsKIH0KLUVYUE9SVF9TWU1CT0woZ250
dGFiX2FsbG9jX3BhZ2VzKTsKK0VYUE9SVF9TWU1CT0xfR1BMKGdudHRhYl9hbGxvY19wYWdlcyk7
CiAKIC8qKgogICogZ250dGFiX2ZyZWVfcGFnZXMgLSBmcmVlIHBhZ2VzIGFsbG9jYXRlZCBieSBn
bnR0YWJfYWxsb2NfcGFnZXMoKQpAQCAtODIwLDcgKzgyMCw3IEBAIHZvaWQgZ250dGFiX2ZyZWVf
cGFnZXMoaW50IG5yX3BhZ2VzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQogCX0KIAlmcmVlX3hlbmJh
bGxvb25lZF9wYWdlcyhucl9wYWdlcywgcGFnZXMpOwogfQotRVhQT1JUX1NZTUJPTChnbnR0YWJf
ZnJlZV9wYWdlcyk7CitFWFBPUlRfU1lNQk9MX0dQTChnbnR0YWJfZnJlZV9wYWdlcyk7CiAKIC8q
IEhhbmRsaW5nIG9mIHBhZ2VkIG91dCBncmFudCB0YXJnZXRzIChHTlRTVF9lYWdhaW4pICovCiAj
ZGVmaW5lIE1BWF9ERUxBWSAyNTYKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
