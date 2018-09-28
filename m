From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 1/2] x86: make sure module array is large
 enough in pvh-boot.c
Date: Fri, 28 Sep 2018 18:06:31 +0100
Message-ID: <20180928170632.1176-2-wei.liu2@citrix.com>
References: <20180928170632.1176-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5wDx-0002DC-CR
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 17:06:41 +0000
In-Reply-To: <20180928170632.1176-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlbG9jYXRpb24gY29kZSBpbiBfX3N0YXJ0X3hlbiByZXF1aXJlcyBvbmUgZXh0cmEgZWxl
bWVudCBpbiB0aGUKbW9kdWxlIGFycmF5LiBCeSB0aGUgbG9va3Mgb2YgaXQgdGhlIHRlbXBvcmFy
eSBhcnJheSBpcyBhbHJlYWR5IGxhcmdlCmVub3VnaC4gUGFuaWMgaWYgdGhhdCdzIG5vdCB0aGUg
Y2FzZS4KCldoaWxlIGF0IGl0LCB0dXJuIGFuIEFTU0VSVCB0byBwYW5pYygpIGFzIHdlbGwuCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9ndWVzdC9wdmgtYm9vdC5jIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9wdmgtYm9vdC5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKaW5kZXgg
MGU5ZTViZmRmNi4uM2I0NGFlZTkwYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3B2
aC1ib290LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3B2aC1ib290LmMKQEAgLTQyLDcgKzQy
LDE3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjb252ZXJ0X3B2aF9pbmZvKHZvaWQpCiAgICAgbW9k
dWxlX3QgKm1vZDsKICAgICB1bnNpZ25lZCBpbnQgaTsKIAotICAgIEFTU0VSVChwdmhfaW5mby0+
bWFnaWMgPT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSk7CisgICAgaWYgKCBwdmhfaW5mby0+
bWFnaWMgIT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSApCisgICAgICAgIHBhbmljKCJNYWdp
YyB2YWx1ZSBpcyB3cm9uZzogJVhcbiIsIHB2aF9pbmZvLT5tYWdpYyk7CisKKyAgICAvKgorICAg
ICAqIFRlbXBvcmFyeSBtb2R1bGUgYXJyYXkgbmVlZHMgdG8gYmUgYXQgbGVhc3Qgb25lIGVsZW1l
bnQgYmlnZ2VyIHRoYW4KKyAgICAgKiByZXF1aXJlZC4gVGhlIGV4dHJhIGVsZW1lbnQgaXMgdXNl
ZCB0byBhaWQgcmVsb2NhdGlvbi4gU2VlCisgICAgICogYXJjaC94ODYvc2V0dXAuYzpfX3N0YXJ0
X3hlbigpLgorICAgICAqLworICAgIGlmICggQVJSQVlfU0laRShwdmhfbWJpX21vZHMpIDw9IHB2
aF9pbmZvLT5ucl9tb2R1bGVzICkKKyAgICAgICAgcGFuaWMoIlRoZSBtb2R1bGUgYXJyYXkgaXMg
dG9vIHNtYWxsLCBzaXplICVsdSwgcmVxdWVzdGVkICV1LlxuIiwKKyAgICAgICAgICAgICAgQVJS
QVlfU0laRShwdmhfbWJpX21vZHMpLCBwdmhfaW5mby0+bnJfbW9kdWxlcyk7CiAKICAgICAvKgog
ICAgICAqIFR1cm4gaHZtX3N0YXJ0X2luZm8gaW50byBtYmkuIEx1Y2tpbHkgYWxsIG1vZHVsZXMg
YXJlIHBsYWNlZCB1bmRlciA0R0IKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
