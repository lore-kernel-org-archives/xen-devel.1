From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/3] libxl/vsnd: add missing error checks
Date: Tue, 10 Jul 2018 14:46:05 +0100
Message-ID: <20180710134607.20302-2-wei.liu2@citrix.com>
References: <20180710134607.20302-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcsy4-0006Og-Fs
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 13:46:12 +0000
In-Reply-To: <20180710134607.20302-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, al1img@gmail.com, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmVwb3J0ZWQtYnk6IENvdmVyaXR5ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfdnNuZC5jIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3Zz
bmQuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3ZzbmQuYwppbmRleCBjZjQ2ZTNkZGIxLi45NTcwYTRj
ZjBlIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF92c25kLmMKKysrIGIvdG9vbHMvbGli
eGwvbGlieGxfdnNuZC5jCkBAIC0xOTIsNiArMTkyLDcgQEAgc3RhdGljIGludCBsaWJ4bF9fcGNt
X2Zyb21feGVuc3RvcmUobGlieGxfX2djICpnYywgY29uc3QgY2hhciAqcGF0aCwKICAgICAgICAg
ICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvIlhFTlNORF9GSUVMRF9ERVZJQ0VfTkFNRSwg
cGF0aCksIE5VTEwpOwogCiAgICAgcmMgPSBsaWJ4bF9fcGFyYW1zX2Zyb21feGVuc3RvcmUoZ2Ms
IHBhdGgsICZwY20tPnBhcmFtcyk7CisgICAgaWYgKHJjKSBnb3RvIG91dDsKIAogICAgIHBjbS0+
c3RyZWFtcyA9IE5VTEw7CiAgICAgcGNtLT5udW1fdnNuZF9zdHJlYW1zID0gMDsKQEAgLTI1Myw2
ICsyNTQsNyBAQCBzdGF0aWMgaW50IGxpYnhsX192c25kX2Zyb21feGVuc3RvcmUobGlieGxfX2dj
ICpnYywgY29uc3QgY2hhciAqbGlieGxfcGF0aCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZlX3BhdGgpLCBOVUxMKTsKIAogICAgIHJjID0gbGlieGxfX3BhcmFtc19mcm9tX3hlbnN0
b3JlKGdjLCBmZV9wYXRoLCAmdnNuZC0+cGFyYW1zKTsKKyAgICBpZiAocmMpIGdvdG8gb3V0Owog
CiAgICAgdnNuZC0+cGNtcyA9IE5VTEw7CiAgICAgdnNuZC0+bnVtX3ZzbmRfcGNtcyA9IDA7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
