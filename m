From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools/tests: fix an xs-test.c issue
Date: Mon, 20 Aug 2018 09:38:18 +0100
Message-ID: <20180820083818.8464-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frfhf-00036e-3S
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 08:38:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJldCB2YXJpYWJsZSBjYW4gYmUgdXNlZCB1bmluaXRpYWxpc2VkIHdoZW4gaXRlcnMgaXMg
MC4gSW5pdGlhbGlzZQpyZXQgYXQgdGhlIGJlZ2lubmluZyB0byBmaXggdGhpcyBpc3N1ZS4KClJl
cG9ydGVkLWJ5OiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+ClNpZ25lZC1vZmYtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvdGVzdHMveGVuc3RvcmUv
eHMtdGVzdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMveGVuc3RvcmUveHMtdGVzdC5jIGIvdG9v
bHMvdGVzdHMveGVuc3RvcmUveHMtdGVzdC5jCmluZGV4IDE3ZDRhNjZiODUuLmM0Yzk5YzA2NjEg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3RzL3hlbnN0b3JlL3hzLXRlc3QuYworKysgYi90b29scy90
ZXN0cy94ZW5zdG9yZS94cy10ZXN0LmMKQEAgLTY2LDcgKzY2LDcgQEAgc3RhdGljIGludCBjYWxs
X3Rlc3Qoc3RydWN0IHRlc3QgKnRzdCwgaW50IGl0ZXJzLCBib29sIG5vX2Nsb2NrKQogICAgIGNo
YXIgKnN0YWdlID0gIj8iOwogICAgIHN0cnVjdCB0aW1lc3BlYyB0cDEsIHRwMjsKICAgICB1aW50
NjRfdCBuc2VjLCBuc2VjX21pbiwgbnNlY19tYXgsIG5zZWNfc3VtOwotICAgIGludCBpLCByZXQ7
CisgICAgaW50IGksIHJldCA9IDA7CiAKICAgICBuc2VjX21pbiA9IC0xOwogICAgIG5zZWNfbWF4
ID0gMDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
