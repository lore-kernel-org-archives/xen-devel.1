From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/2] ocaml: remove undefined behaviour in
 systemd_stubs.c
Date: Mon, 23 Jul 2018 10:30:39 +0100
Message-ID: <20180723093039.20382-3-wei.liu2@citrix.com>
References: <20180723093039.20382-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l8wo=kh=citrix.com=prvs=7352c57fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhXB2-0007Kb-KH
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 09:30:48 +0000
In-Reply-To: <20180723093039.20382-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgY29tcGxhaW5zOgoKc3lzdGVtZF9zdHVicy5jOjUxOjg6IGVycm9yOiBzaGlmdGluZyBh
IG5lZ2F0aXZlIHNpZ25lZCB2YWx1ZSBpcyB1bmRlZmluZWQgWy1XZXJyb3IsLVdzaGlmdC1uZWdh
dGl2ZS12YWx1ZV0KICAgICAgICByZXQgPSBWYWxfaW50KC0xVSk7CiAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+CgpTaW1wbHkgY2hhbmdlIHRoZSByZXR1cm4gdmFsdWUgdG8gMC4KClNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDYzogQ2hyaXN0aWFuIExp
bmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpDYzogRGF2aWQgU2NvdHQgPGRhdmVA
cmVjb2lsLm9yZz4KClNlZTogaHR0cHM6Ly9naXRsYWIuY29tL2xpdXcveGVuLy0vam9icy84MzYy
ODgzMwotLS0KIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9zeXN0ZW1kX3N0dWJzLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5jIGIvdG9vbHMvb2NhbWwveGVu
c3RvcmVkL3N5c3RlbWRfc3R1YnMuYwppbmRleCA0OTAxNTZjMDZhLi5kMWRkMzNjOTViIDEwMDY0
NAotLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvc3lzdGVtZF9zdHVicy5jCisrKyBiL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC9zeXN0ZW1kX3N0dWJzLmMKQEAgLTQ4LDcgKzQ4LDcgQEAgQ0FNTHBy
aW0gdmFsdWUgb2NhbWxfc2Rfbm90aWZ5X3JlYWR5KHZhbHVlIGlnbm9yZSkKIAlDQU1McGFyYW0x
KGlnbm9yZSk7CiAJQ0FNTGxvY2FsMShyZXQpOwogCi0JcmV0ID0gVmFsX2ludCgtMVUpOworCXJl
dCA9IFZhbF9pbnQoMCk7CiAKIAlDQU1McmV0dXJuKHJldCk7CiB9Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
