From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v2 1/9] xen/grant-table: Export
 gnttab_{alloc|free}_pages as GPL
Date: Fri,  1 Jun 2018 14:41:24 +0300
Message-ID: <20180601114132.22596-2-andr2000__13557.4673222893$1527853222$gmane$org@gmail.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=em/r=it=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fOiRE-0006vf-4O
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 11:41:44 +0000
Received: by mail-lf0-x243.google.com with SMTP id r2-v6so14364920lff.4
 for <xen-devel@lists.xenproject.org>; Fri, 01 Jun 2018 04:41:42 -0700 (PDT)
In-Reply-To: <20180601114132.22596-1-andr2000@gmail.com>
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
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Ci0tLQogZHJpdmVycy94ZW4vZ3Jh
bnQtdGFibGUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jIGIvZHJp
dmVycy94ZW4vZ3JhbnQtdGFibGUuYwppbmRleCAyN2JlMTA3ZDY0ODAuLmJhMzZmZjNlNDkwMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYworKysgYi9kcml2ZXJzL3hlbi9n
cmFudC10YWJsZS5jCkBAIC03OTksNyArNzk5LDcgQEAgaW50IGdudHRhYl9hbGxvY19wYWdlcyhp
bnQgbnJfcGFnZXMsIHN0cnVjdCBwYWdlICoqcGFnZXMpCiAKIAlyZXR1cm4gMDsKIH0KLUVYUE9S
VF9TWU1CT0woZ250dGFiX2FsbG9jX3BhZ2VzKTsKK0VYUE9SVF9TWU1CT0xfR1BMKGdudHRhYl9h
bGxvY19wYWdlcyk7CiAKIC8qKgogICogZ250dGFiX2ZyZWVfcGFnZXMgLSBmcmVlIHBhZ2VzIGFs
bG9jYXRlZCBieSBnbnR0YWJfYWxsb2NfcGFnZXMoKQpAQCAtODIwLDcgKzgyMCw3IEBAIHZvaWQg
Z250dGFiX2ZyZWVfcGFnZXMoaW50IG5yX3BhZ2VzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQogCX0K
IAlmcmVlX3hlbmJhbGxvb25lZF9wYWdlcyhucl9wYWdlcywgcGFnZXMpOwogfQotRVhQT1JUX1NZ
TUJPTChnbnR0YWJfZnJlZV9wYWdlcyk7CitFWFBPUlRfU1lNQk9MX0dQTChnbnR0YWJfZnJlZV9w
YWdlcyk7CiAKIC8qIEhhbmRsaW5nIG9mIHBhZ2VkIG91dCBncmFudCB0YXJnZXRzIChHTlRTVF9l
YWdhaW4pICovCiAjZGVmaW5lIE1BWF9ERUxBWSAyNTYKLS0gCjIuMTcuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
