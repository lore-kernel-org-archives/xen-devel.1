From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.12] xen/arm: gic-v2: deactivate interrupts
 during initialization
Date: Tue,  5 Feb 2019 13:38:53 -0800
Message-ID: <1549402733-20441-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gr8Qh-0001e6-M4
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 21:38:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, sstabellini@kernel.org, peng.fan@nxp.com
List-Id: xen-devel@lists.xenproject.org

SW50ZXJydXB0cyBjb3VsZCBiZSBBQ1RJVkUgYXQgYm9vdC4gTWFrZSBzdXJlIHRvIGRlYWN0aXZh
dGUgdGhlbSBkdXJpbmcKaW5pdGlhbGl6YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkNDOiBqdWxpZW4uZ3JhbGxAYXJtLmNvbQpD
QzogcGVuZy5mYW5AbnhwLmNvbQpDQzogamdyb3NzQHN1c2UuY29tCi0tLQogeGVuL2FyY2gvYXJt
L2dpYy12Mi5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Mi5jIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCmlu
ZGV4IGU5ZmI4YTAuLjI1Njk4OGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjIuYwor
KysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKQEAgLTM3OSw3ICszNzksMTAgQEAgc3RhdGljIHZv
aWQgX19pbml0IGdpY3YyX2Rpc3RfaW5pdCh2b2lkKQogCiAgICAgLyogRGlzYWJsZSBhbGwgZ2xv
YmFsIGludGVycnVwdHMgKi8KICAgICBmb3IgKCBpID0gMzI7IGkgPCBucl9saW5lczsgaSArPSAz
MiApCisgICAgewogICAgICAgICB3cml0ZWxfZ2ljZCh+MHgwLCBHSUNEX0lDRU5BQkxFUiArIChp
IC8gMzIpICogNCk7CisgICAgICAgIHdyaXRlbF9naWNkKH4weDAsIEdJQ0RfSUNBQ1RJVkVSICsg
KGkgLyAzMikgKiA0KTsKKyAgICB9CiAKICAgICAvKiBUdXJuIG9uIHRoZSBkaXN0cmlidXRvciAq
LwogICAgIHdyaXRlbF9naWNkKEdJQ0RfQ1RMX0VOQUJMRSwgR0lDRF9DVExSKTsKQEAgLTM5NCw2
ICszOTcsNyBAQCBzdGF0aWMgdm9pZCBnaWN2Ml9jcHVfaW5pdCh2b2lkKQogICAgIC8qIFRoZSBm
aXJzdCAzMiBpbnRlcnJ1cHRzIChQUEkgYW5kIFNHSSkgYXJlIGJhbmtlZCBwZXItY3B1LCBzbwog
ICAgICAqIGV2ZW4gdGhvdWdoIHRoZXkgYXJlIGNvbnRyb2xsZWQgd2l0aCBHSUNEIHJlZ2lzdGVy
cywgdGhleSBtdXN0CiAgICAgICogYmUgc2V0IHVwIGhlcmUgd2l0aCB0aGUgb3RoZXIgcGVyLWNw
dSBzdGF0ZS4gKi8KKyAgICB3cml0ZWxfZ2ljZCgweGZmZmZmZmZmLCBHSUNEX0lDQUNUSVZFUik7
IC8qIERpYWN0aXZhdGUgUFBJcyBhbmQgU0dJcyAqLwogICAgIHdyaXRlbF9naWNkKDB4ZmZmZjAw
MDAsIEdJQ0RfSUNFTkFCTEVSKTsgLyogRGlzYWJsZSBhbGwgUFBJICovCiAgICAgd3JpdGVsX2dp
Y2QoMHgwMDAwZmZmZiwgR0lDRF9JU0VOQUJMRVIpOyAvKiBFbmFibGUgYWxsIFNHSSAqLwogCi0t
IAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
