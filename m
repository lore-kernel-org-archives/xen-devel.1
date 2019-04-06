From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
Date: Sat, 6 Apr 2019 17:59:12 +0530
Message-ID: <20190406122912.GA403__11058.569284954$1554614681$gmane$org@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ShOz=SI=gmail.com=hariprasad.kelam@srs-us1.protection.inumbo.net>)
 id 1hCkRk-0002Lv-8o
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 12:29:20 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3so4539184pga.6
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2019 05:29:18 -0700 (PDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlcyBwYXNzaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IDAgdG8gTlVMTCB0byBhdm9pZCBiZWxv
dyBzcGFyc2UKd2FybmluZwoKIENIRUNLICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVz
LmMKZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6NzAwOjUxOiB3YXJuaW5nOiBVc2lu
ZyBwbGFpbiBpbnRlZ2VyIGFzCk5VTEwgcG9pbnRlcgoKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNh
ZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVu
LXBjaWJhY2sveGVuYnVzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5i
dXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCmluZGV4IDIzZjdmNmUuLjgz
M2IyZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCisrKyBi
L2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCkBAIC02OTcsNyArNjk3LDcgQEAgc3Rh
dGljIGludCB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYs
CiAJLyogV2UgbmVlZCB0byBmb3JjZSBhIGNhbGwgdG8gb3VyIGNhbGxiYWNrIGhlcmUgaW4gY2Fz
ZQogCSAqIHhlbmQgYWxyZWFkeSBjb25maWd1cmVkIHVzIQogCSAqLwotCXhlbl9wY2lia19iZV93
YXRjaCgmcGRldi0+YmVfd2F0Y2gsIE5VTEwsIDApOworCXhlbl9wY2lia19iZV93YXRjaCgmcGRl
di0+YmVfd2F0Y2gsIE5VTEwsIE5VTEwpOwogCiBvdXQ6CiAJcmV0dXJuIGVycjsKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
