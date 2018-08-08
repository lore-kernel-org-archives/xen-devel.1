From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/5] xen/blkback: remove unused
 pers_gnts_lock from struct xen_blkif_ring
Date: Wed,  8 Aug 2018 16:25:28 +0200
Message-ID: <20180808142528.31029-6-jgross__13599.8696242043$1533738271$gmane$org@suse.com>
References: <20180808142528.31029-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wssg=kx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fnPPJ-00087l-3p
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 14:25:49 +0000
In-Reply-To: <20180808142528.31029-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org
Cc: axboe@kernel.dk, Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

cGVyc19nbnRzX2xvY2sgaXNuJ3QgYmVpbmcgdXNlZCBhbnl3aGVyZS4gUmVtb3ZlIGl0LgoKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay9jb21tb24uaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oIGIvZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaAppbmRleCAyMzM5YjhkMzljNWUuLjFkMzAw
MmQ3NzNmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9jb21tb24uaAor
KysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2NvbW1vbi5oCkBAIC0yNjksNyArMjY5LDYg
QEAgc3RydWN0IHhlbl9ibGtpZl9yaW5nIHsKIAl3YWl0X3F1ZXVlX2hlYWRfdAlwZW5kaW5nX2Zy
ZWVfd3E7CiAKIAkvKiBUcmVlIHRvIHN0b3JlIHBlcnNpc3RlbnQgZ3JhbnRzLiAqLwotCXNwaW5s
b2NrX3QJCXBlcnNfZ250c19sb2NrOwogCXN0cnVjdCByYl9yb290CQlwZXJzaXN0ZW50X2dudHM7
CiAJdW5zaWduZWQgaW50CQlwZXJzaXN0ZW50X2dudF9jOwogCWF0b21pY190CQlwZXJzaXN0ZW50
X2dudF9pbl91c2U7Ci0tIAoyLjEzLjcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
