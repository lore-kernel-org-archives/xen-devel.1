From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH MM-PART2 v2 09/19] xen/arm64: head: Correctly
 report the HW CPU ID
Date: Tue, 14 May 2019 13:21:26 +0100
Message-ID: <20190514122136.28215-18-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRe-0008UP-76
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:10 +0000
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgYXJlIG5vIHJlYXNvbiB0byBjb25zaWRlciB0aGUgSFcgQ1BVIElEIHdpbGwgYmUgMCB3
aGVuIHRoZQpwcm9jZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJl
c3QsIHRoaXMgd2lsbCByZXN1bHQgdG8KY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0IG9m
IFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQpNUElEUl9FTDEuCgpTbyByZW1v
dmUgdGhlIHplcm9pbmcgYW5kIGxvZ2ljIHRvIGNoZWNrIGlmIHRoZSBDUFUgaXMgcGFydCBvZiBh
CnVuaXByb2Nlc3NvciBzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNv
dkBlcGFtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkn
cyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA2IC0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggYjk1N2ViOTBm
Yi4uMDgwOTRhMjczZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0yNzcsMTUgKzI3Nyw5IEBAIEdMT0JBTChp
bml0X3NlY29uZGFyeSkKICAgICAgICAgbW92ICAgeDI2LCAjMSAgICAgICAgICAgICAgICAvKiBY
MjYgOj0gc2tpcF96ZXJvX2JzcyAqLwogCiBjb21tb25fc3RhcnQ6Ci0gICAgICAgIG1vdiAgIHgy
NCwgIzAgICAgICAgICAgICAgICAgLyogeDI0IDo9IENQVSBJRC4gSW5pdGlhbHkgemVybyB1bnRp
bCB3ZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpbmQgdGhhdCBt
dWx0aXByb2Nlc3NvciBleHRlbnNpb25zIGFyZQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqIHByZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICAqLwogICAgICAgICBt
cnMgICB4MCwgbXBpZHJfZWwxCi0gICAgICAgIHRibnogIHgwLCBfTVBJRFJfVVAsIDFmICAgICAg
LyogVW5pcHJvY2Vzc29yIHN5c3RlbT8gKi8KLQogICAgICAgICBsZHIgICB4MTMsID0ofk1QSURS
X0hXSURfTUFTSykKICAgICAgICAgYmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBNYXNr
IG91dCBmbGFncyB0byBnZXQgQ1BVIElEICovCi0xOgogCiAgICAgICAgIC8qIE5vbi1ib290IENQ
VXMgd2FpdCBoZXJlIHVudGlsIF9fY3B1X3VwIGlzIHJlYWR5IGZvciB0aGVtICovCiAgICAgICAg
IGNieiAgIHgyMiwgMWYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
