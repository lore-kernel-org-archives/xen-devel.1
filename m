From: Paul Semel <semelpaul@gmail.com>
Subject: [PATCH v3 4/7] add nspin_sleep function to time manager
Date: Mon,  9 Apr 2018 16:35:40 +0200
Message-ID: <20180409143543.4568-4-semelpaul@gmail.com>
References: <20180409143543.4568-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=he/8=g6=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f5XWd-0004sF-AV
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 14:12:03 +0000
Received: by mail-wm0-x243.google.com with SMTP id 66so13154220wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 07:12:02 -0700 (PDT)
In-Reply-To: <20180409143543.4568-1-semelpaul@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wipawel@amazon.de, Paul Semel <phentex@amazon.de>, roger.pau@citrix.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUGF1bCBTZW1lbCA8cGhlbnRleEBhbWF6b24uZGU+Cgp0aGlzIGZ1bmN0aW9uIHNwaW4g
c2xlZXBzIGZvciB0IG5hbm9zZWNvbmRzCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIFNlbWVsIDxwaGVu
dGV4QGFtYXpvbi5kZT4KLS0tCiBjb21tb24vdGltZS5jIHwgMTIgKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMg
Yi9jb21tb24vdGltZS5jCmluZGV4IGQwYzllZDIuLjQ3NzBiOWEgMTAwNjQ0Ci0tLSBhL2NvbW1v
bi90aW1lLmMKKysrIGIvY29tbW9uL3RpbWUuYwpAQCAtMTM5LDYgKzEzOSwxOCBAQCBpbnQgZ2V0
dGltZW9mZGF5KHN0cnVjdCB0aW1ldmFsICp0cCwgdm9pZCAqcmVzdHJpY3QgdHpwKQogICAgIHJl
dHVybiAwOwogfQogCitzdGF0aWMgaW5saW5lIHZvaWQgbnNwaW5fc2xlZXAodWludDY0X3QgdCkK
K3sKKyAgICB1aW50NjRfdCBjdXJyID0gc2luY2VfYm9vdF90aW1lKCk7CisgICAgdWludDY0X3Qg
ZW5kID0gY3VyciArIHQ7CisKKyAgICBpZiAoIGVuZCA8IGN1cnIgKQorICAgICAgICBwYW5pYygi
ZW5kIHZhbHVlIG92ZXJmbG93cyBjb3VudGVyXG4iKTsKKworICAgIHdoaWxlICggc2luY2VfYm9v
dF90aW1lKCkgPCBlbmQgKQorICAgICAgICBhc20gdm9sYXRpbGUgKCJwYXVzZSIpOworfQorCiAv
KgogICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwotLSAKMi4xNi4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
