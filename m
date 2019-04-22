From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 09/20] xen/arm64: head: Correctly report the HW
 CPU ID
Date: Mon, 22 Apr 2019 17:49:26 +0100
Message-ID: <20190422164937.21350-10-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8q-0004il-Nn
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:04 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgYXJlIG5vIHJlYXNvbiB0byBjb25zaWRlciB0aGUgSFcgQ1BVIElEIHdpbGwgYmUgMCB3
aGVuIHRoZQpwcm9jZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJl
c3QsIHRoaXMgd2lsbCByZXN1bHQgdG8KY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0IG9m
IFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQpNUElEUl9FTDEuCgpTbyByZW1v
dmUgdGhlIHplcm9pbmcgYW5kIGxvZ2ljIHRvIGNoZWNrIGlmIHRoZSBDUFUgaXMgcGFydCBvZiBh
CnVuaXByb2Nlc3NvciBzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA2IC0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggYjk1N2Vi
OTBmYi4uMDgwOTRhMjczZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0yNzcsMTUgKzI3Nyw5IEBAIEdMT0JB
TChpbml0X3NlY29uZGFyeSkKICAgICAgICAgbW92ICAgeDI2LCAjMSAgICAgICAgICAgICAgICAv
KiBYMjYgOj0gc2tpcF96ZXJvX2JzcyAqLwogCiBjb21tb25fc3RhcnQ6Ci0gICAgICAgIG1vdiAg
IHgyNCwgIzAgICAgICAgICAgICAgICAgLyogeDI0IDo9IENQVSBJRC4gSW5pdGlhbHkgemVybyB1
bnRpbCB3ZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpbmQgdGhh
dCBtdWx0aXByb2Nlc3NvciBleHRlbnNpb25zIGFyZQotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIHByZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICAqLwogICAgICAg
ICBtcnMgICB4MCwgbXBpZHJfZWwxCi0gICAgICAgIHRibnogIHgwLCBfTVBJRFJfVVAsIDFmICAg
ICAgLyogVW5pcHJvY2Vzc29yIHN5c3RlbT8gKi8KLQogICAgICAgICBsZHIgICB4MTMsID0ofk1Q
SURSX0hXSURfTUFTSykKICAgICAgICAgYmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBN
YXNrIG91dCBmbGFncyB0byBnZXQgQ1BVIElEICovCi0xOgogCiAgICAgICAgIC8qIE5vbi1ib290
IENQVXMgd2FpdCBoZXJlIHVudGlsIF9fY3B1X3VwIGlzIHJlYWR5IGZvciB0aGVtICovCiAgICAg
ICAgIGNieiAgIHgyMiwgMWYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
