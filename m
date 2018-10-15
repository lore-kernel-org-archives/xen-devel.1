From: Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: [PATCH v2] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Mon, 15 Oct 2018 15:25:08 +0200
Message-ID: <20181015132508.23293-1-vliaskovitis__41764.1578162604$1539609866$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ieol=m3=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1gC2sR-00063f-KX
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 13:25:43 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Cc: jgross@suse.com, axboe@kernel.dk, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SWYgYSBibG9jayBkZXZpY2UgaXMgaG90LWFkZGVkIHdoZW4gd2UgYXJlIG91dCBvZiBncmFudHMs
CmdudHRhYl9ncmFudF9mb3JlaWduX2FjY2VzcyBmYWlscyB3aXRoIC1FTk9TUEMgKGxvZyBtZXNz
YWdlICIyOApncmFudGluZyBhY2Nlc3MgdG8gcmluZyBwYWdlIikgaW4gdGhpcyBjb2RlIHBhdGg6
CgogIHRhbGtfdG9fYmxrYmFjayAtPgoJc2V0dXBfYmxrcmluZyAtPgoJCXhlbmJ1c19ncmFudF9y
aW5nIC0+CgkJCWdudHRhYl9ncmFudF9mb3JlaWduX2FjY2VzcwoKYW5kIHRoZSBmYWlsaW5nIHBh
dGggaW4gdGFsa190b19ibGtiYWNrIHNldHMgdGhlIGRyaXZlcl9kYXRhIHRvIE5VTEw6CgogZGVz
dHJveV9ibGtyaW5nOgogICAgICAgIGJsa2lmX2ZyZWUoaW5mbywgMCk7CgogICAgICAgIG11dGV4
X2xvY2soJmJsa2Zyb250X211dGV4KTsKICAgICAgICBmcmVlX2luZm8oaW5mbyk7CiAgICAgICAg
bXV0ZXhfdW5sb2NrKCZibGtmcm9udF9tdXRleCk7CgogICAgICAgIGRldl9zZXRfZHJ2ZGF0YSgm
ZGV2LT5kZXYsIE5VTEwpOwoKVGhpcyByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVyIEJVRyB3aGVu
IGJsa2Zyb250X3JlbW92ZSBhbmQgYmxraWZfZnJlZQp0cnkgdG8gYWNjZXNzIHRoZSBmYWlsaW5n
IGRldmljZSdzIE5VTEwgc3RydWN0IGJsa2Zyb250X2luZm8uCgpTaWduZWQtb2ZmLWJ5OiBWYXNp
bGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+Ci0tLQogZHJpdmVycy9ibG9j
ay94ZW4tYmxrZnJvbnQuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBiL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2Zyb250LmMKaW5kZXggNDI5ZDIwMTMxYzdlLi44ODcxYmY0YzhhMmUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKKysrIGIvZHJpdmVycy9ibG9jay94
ZW4tYmxrZnJvbnQuYwpAQCAtMjQ5Myw2ICsyNDkzLDkgQEAgc3RhdGljIGludCBibGtmcm9udF9y
ZW1vdmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhiZGV2KQogCiAJZGV2X2RiZygmeGJkZXYtPmRl
diwgIiVzIHJlbW92ZWQiLCB4YmRldi0+bm9kZW5hbWUpOwogCisJaWYgKCFpbmZvKQorCQlyZXR1
cm4gMDsKKwogCWJsa2lmX2ZyZWUoaW5mbywgMCk7CiAKIAltdXRleF9sb2NrKCZpbmZvLT5tdXRl
eCk7Ci0tIAoyLjE5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
