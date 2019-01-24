From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 24/26] sg-report-host-history: Move SET
 LOCAL into transaction
Date: Thu, 24 Jan 2019 18:46:11 +0000
Message-ID: <20190124184613.2720-25-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk2J-0005Gw-5w
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:47:35 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2V0cyByaWQgb2YgdGhpcyB3YXJuaW5nOgogIFdBUk5JTkc6ICBTRVQgTE9DQUwgY2FuIG9ubHkg
YmUgdXNlZCBpbiB0cmFuc2FjdGlvbiBibG9ja3MKClRoaXMgc3VnZ2VzdHMgdGhhdCB0aGlzIGNv
ZGUgd2FzIHByZXZpb3VzbHkgbm90IGVmZmVjdGl2ZS4uLgoKU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogc2ctcmVwb3J0LWhvc3QtaGlz
dG9yeSB8IDExICsrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkgYi9zZy1y
ZXBvcnQtaG9zdC1oaXN0b3J5CmluZGV4IDg3MWFkNWZlLi41MTgxNDUzNCAxMDA3NTUKLS0tIGEv
c2ctcmVwb3J0LWhvc3QtaGlzdG9yeQorKysgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CkBAIC0y
NjYsMTUgKzI2NiwxNiBAQCBkYl9yZXRyeSgkZGJoX3Rlc3RzLCBbXSwgc3ViIHsKICAgICBjb21w
dXRlZmxpZ2h0c3JhbmdlKCk7CiB9KTsKIAotJGRiaF90ZXN0cy0+ZG8oIlNFVCBMT0NBTCBlbmFi
bGVfc2Vxc2Nhbj1mYWxzZSIpOwotIyBPdGhlcndpc2UgdGhlIFBvc3RncmVTUUwgcXVlcnkgcGxh
bm5lciBsaWtlcyB0byBkbyBhIGNvbXBsZXRlIHNjYW4KLSMgb2YgdGhlIHJ1bnZhcnMgdGFibGUs
IHJhdGhlciB0aGFuIHdhbGtpbmcgYmFja3dhcmRzIHRocm91Z2ggdGhlCi0jIGZsaWdodHMgdW50
aWwgaXQgaGFzIHdoYXQgd2UndmUgdG9sZCBpdCBpcyBlbm91Z2guCi0KIGZvcmVhY2ggbXkgJGhv
c3QgKEBBUkdWKSB7CiAgICAgaWYgKCRob3N0ID1+IG0vXmZsaWdodDovKSB7CiAJbXkgJGZsaWdo
dD0kJzsgIyc7CiAJZGJfcmV0cnkoJGRiaF90ZXN0cywgW10sIHN1YiB7CisgICAgICAgICAgICAk
ZGJoX3Rlc3RzLT5kbygiU0VUIExPQ0FMIGVuYWJsZV9zZXFzY2FuPWZhbHNlIik7CisgICAgICAg
ICAgICAjIE90aGVyd2lzZSB0aGUgUG9zdGdyZVNRTCBxdWVyeSBwbGFubmVyIGxpa2VzIHRvIGRv
IGEKKyAgICAgICAgICAgICMgY29tcGxldGUgc2NhbiBvZiB0aGUgcnVudmFycyB0YWJsZSwgcmF0
aGVyIHRoYW4gd2Fsa2luZworICAgICAgICAgICAgIyBiYWNrd2FyZHMgdGhyb3VnaCB0aGUgZmxp
Z2h0cyB1bnRpbCBpdCBoYXMgd2hhdCB3ZSd2ZQorICAgICAgICAgICAgIyB0b2xkIGl0IGlzIGVu
b3VnaC4KKwogCSAgICBvdXIgJGhvc3RzaW5mbGlnaHRxIC8vPSBkYl9wcmVwYXJlKDw8RU5EKTsK
IAkgICAgICAgIFNFTEVDVCBESVNUSU5DVCB2YWwKIAkJICBGUk9NIHJ1bnZhcnMKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
