From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 09:24:37 +0100
Message-ID: <20180928082437.15140-3-wei.liu2@citrix.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5o4p-00081v-Cn
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 08:24:43 +0000
In-Reply-To: <20180928082437.15140-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBoZWxwcyBjYXB0dXJlIGlzc3VlcyBiZWZvcmUgY29uc29sZSBpcyBpbml0aWFsaXNlZC4g
VGhlIGltcGFjdCBpcwptaW5pbWFsIGJlY2F1c2UgaXQgb25seSBhZmZlY3RzIFhlbiBydW5uaW5n
IGluIGFzIGEgZ3Vlc3QuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgNyArKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwppbmRl
eCBlNDgwMzlkZDgyLi5iYmVjOTgzMDRlIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2Nv
bnNvbGUuYworKysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwpAQCAtOTEsNyArOTEsOCBA
QCBzdGF0aWMgdWludDMyX3QgY29ucmluZ2MsIGNvbnJpbmdwOwogc3RhdGljIGludCBfX3JlYWRf
bW9zdGx5IHNlcmNvbl9oYW5kbGUgPSAtMTsKIAogI2lmZGVmIENPTkZJR19YODYKLXN0YXRpYyBi
b29sIF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuOyAvKiBjb25zb2xlPXhlbiAqLworLyog
U2V0IHRvIHRydWUgYXQgc3RhcnQgb2YgZGF5IHRvIGNhdGNoIGVhcmx5IGJvb3QgaXNzdWVzICov
CitzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9jb25zb2xlX3hlbiA9IHRydWU7IC8qIGNv
bnNvbGU9eGVuICovCiAjZW5kaWYKIAogc3RhdGljIERFRklORV9TUElOTE9DSyhjb25zb2xlX2xv
Y2spOwpAQCAtODIxLDYgKzgyMiwxMCBAQCB2b2lkIF9faW5pdCBjb25zb2xlX2luaXRfcHJlaXJx
KHZvaWQpCiAKICAgICBzZXJpYWxfaW5pdF9wcmVpcnEoKTsKIAorI2lmZGVmIENPTkZJR19YODYK
KyAgICBvcHRfY29uc29sZV94ZW4gPSBmYWxzZTsKKyNlbmRpZgorCiAgICAgLyogV2hlcmUgc2hv
dWxkIGNvbnNvbGUgb3V0cHV0IGdvPyAqLwogICAgIGZvciAoIHAgPSBvcHRfY29uc29sZTsgcCAh
PSBOVUxMOyBwID0gc3RyY2hyKHAsICcsJykgKQogICAgIHsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
