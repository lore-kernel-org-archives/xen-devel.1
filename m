From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] Input: xen-kbdfront - signal the backend that
 we disconnect
Date: Fri, 15 Mar 2019 11:23:48 +0200
Message-ID: <20190315092348.32613-1-andr2000__48702.6919539616$1552641890$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4s/8=RS=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1h4j4I-0004zx-1N
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 09:23:58 +0000
Received: by mail-lf1-x144.google.com with SMTP id p1so6308223lfk.9
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2019 02:23:56 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, jgross@suse.com, boris.ostrovsky@oracle.com
Cc: andr2000@gmail.com, Volodymyr_Babchuk@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKV2hpbGUgZGlzY29ubmVjdGluZyBmcm9tIHRoZSBiYWNrZW5kIHdlIGNsZWFuIHVw
IHNoYXJlZCByZXNvdXJjZXMKKGV2ZW50IGNoYW5uZWwsIHJpbmcgYnVmZmVyKSwgYnV0IG5ldmVy
IGxldCB0aGUgYmFja2VuZCBrbm93IGFib3V0CnRoYXQuIFRoaXMgbWF5IGxlYWQgdG8gaW5jb25z
aXN0ZW50IGJhY2tlbmQgc3RhdGUgYW5kL29yIHNoYXJlZApyZXNvdXJjZXMgdXNlLgpGaXggdGhp
cyBieSBleHBsaWNpdGx5IGxldHRpbmcgdGhlIGJhY2tlbmQga25vdyB0aGF0IGZyb250ZW5kIGhh
cwpkZXN0cm95ZWQgc2hhcmVkIHJlc291cmNlcyBieSBjaGFuZ2luZyBpdHMgWGVuIGJ1cyBzdGF0
ZSBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KLS0tCiBkcml2ZXJzL2lucHV0L21pc2Mv
eGVuLWtiZGZyb250LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jIGIvZHJpdmVycy9p
bnB1dC9taXNjL3hlbi1rYmRmcm9udC5jCmluZGV4IDI0YmM1YzVkODc2Zi4uZWNiNmU3MTllMGUy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lucHV0L21pc2MveGVuLWtiZGZyb250LmMKKysrIGIvZHJp
dmVycy9pbnB1dC9taXNjL3hlbi1rYmRmcm9udC5jCkBAIC00ODgsNiArNDg4LDggQEAgc3RhdGlj
IGludCB4ZW5rYmRfY29ubmVjdF9iYWNrZW5kKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiAK
IHN0YXRpYyB2b2lkIHhlbmtiZF9kaXNjb25uZWN0X2JhY2tlbmQoc3RydWN0IHhlbmtiZF9pbmZv
ICppbmZvKQogeworCXhlbmJ1c19zd2l0Y2hfc3RhdGUoaW5mby0+eGJkZXYsIFhlbmJ1c1N0YXRl
Q2xvc2luZyk7CisKIAlpZiAoaW5mby0+aXJxID49IDApCiAJCXVuYmluZF9mcm9tX2lycWhhbmRs
ZXIoaW5mby0+aXJxLCBpbmZvKTsKIAlpbmZvLT5pcnEgPSAtMTsKLS0gCjIuMjEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
