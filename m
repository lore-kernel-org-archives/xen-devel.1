From: John Thomson <git@johnthomson.fastmail.com.au>
Subject: [PATCH] tools/ocaml/libs/xc fix gcc-8 format-truncation
 warning
Date: Tue, 15 May 2018 11:48:43 +1000
Message-ID: <20180515014843.19642-1-git@johnthomson.fastmail.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wvsr=ic=johnthomson.fastmail.com.au=git@srs-us1.protection.inumbo.net>)
 id 1fIP5Y-0005xi-PW
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 01:49:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: christian.lindig@citrix.com, John Thomson <git@johnthomson.fastmail.com.au>, dave@recoil.org
List-Id: xen-devel@lists.xenproject.org

IENDICAgICAgIHhlbmN0cmxfc3R1YnMubwp4ZW5jdHJsX3N0dWJzLmM6IEluIGZ1bmN0aW9uICdm
YWlsd2l0aF94Yyc6CnhlbmN0cmxfc3R1YnMuYzo2NToxNzogZXJyb3I6ICdzbnByaW50Zicgb3V0
cHV0IG1heSBiZSB0cnVuY2F0ZWQgYmVmb3JlIHRoZSBsYXN0IGZvcm1hdCBjaGFyYWN0ZXIgWy1X
ZXJyb3I9Zm9ybWF0LXRydW5jYXRpb249XQogICAgICAiJWQ6ICVzOiAlcyIsIGVycm9yLT5jb2Rl
LAogICAgICAgICAgICAgICAgIF4KeGVuY3RybF9zdHVicy5jOjY0OjQ6IG5vdGU6ICdzbnByaW50
Zicgb3V0cHV0IDYgb3IgbW9yZSBieXRlcyAoYXNzdW1pbmcgMTAyOSkgaW50byBhIGRlc3RpbmF0
aW9uIG9mIHNpemUgMTAyOAogICAgc25wcmludGYoZXJyb3Jfc3RyLCBzaXplb2YoZXJyb3Jfc3Ry
KSwKICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICIlZDog
JXM6ICVzIiwgZXJyb3ItPmNvZGUsCiAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAg
ICAgIHhjX2Vycm9yX2NvZGVfdG9fZGVzYyhlcnJvci0+Y29kZSksCiAgICAgIH5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIGVycm9yLT5tZXNzYWdlKTsKICAgICAgfn5+
fn5+fn5+fn5+fn5+CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1h
a2VbOF06ICoqKiBbL2J1aWxkL3hlbi1naXQvc3JjL3hlbi90b29scy9vY2FtbC9saWJzL3hjLy4u
Ly4uL01ha2VmaWxlLnJ1bGVzOjM3OiB4ZW5jdHJsX3N0dWJzLm9dIEVycm9yIDEKbQoKU2lnbmVk
LW9mZi1ieTogSm9obiBUaG9tc29uIDxnaXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1Pgot
LS0KIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
b2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmxfc3R1YnMuYwppbmRleCBmOTcwNzBjOGIwLi5kNDMwOWFkOTdlIDEwMDY0NAotLS0gYS90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYworKysgYi90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYwpAQCAtNTQsNyArNTQsNyBAQAogCiBzdGF0aWMgdm9pZCBOb3JldHVy
biBmYWlsd2l0aF94Yyh4Y19pbnRlcmZhY2UgKnhjaCkKIHsKLQljaGFyIGVycm9yX3N0clsxMDI4
XTsKKwljaGFyIGVycm9yX3N0cltYQ19NQVhfRVJST1JfTVNHX0xFTiArIDZdOwogCWlmICh4Y2gp
IHsKIAkJY29uc3QgeGNfZXJyb3IgKmVycm9yID0geGNfZ2V0X2xhc3RfZXJyb3IoeGNoKTsKIAkJ
aWYgKGVycm9yLT5jb2RlID09IFhDX0VSUk9SX05PTkUpCi0tIAoyLjE3LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
