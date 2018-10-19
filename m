From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/16] x86: make construct_dom0 build
 with !CONFIG_PV
Date: Fri, 19 Oct 2018 16:04:00 +0100
Message-ID: <37086af0-a24a-e23a-b71f-3ff93d035c5d@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <b7b033adf8a230464f1feef1f053d8060a6bad5e.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wxwm=m7=citrix.com=prvs=8238c2210=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gDWKN-0007ln-DE
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:04:39 +0000
In-Reply-To: <b7b033adf8a230464f1feef1f053d8060a6bad5e.1539959287.git-series.wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiB2MjogcGFuaWMgaW5zdGVhZC4KPiAtLS0K
PiAgeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyB8ICA5ICsrKysrKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4gaW5k
ZXggZGNkN2FmYi4uMGYwOTc3ZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWls
ZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+IEBAIC01MTAsOCArNTEwLDEz
IEBAIGludCBfX2luaXQgY29uc3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9k
dWxlX3QgKmltYWdlLAo+ICAgICAgfQo+ICAjZW5kaWYKPiAgCj4gLSAgICByYyA9IChpc19odm1f
ZG9tYWluKGQpID8gZG9tMF9jb25zdHJ1Y3RfcHZoIDogZG9tMF9jb25zdHJ1Y3RfcHYpCj4gLSAg
ICAgICAgIChkLCBpbWFnZSwgaW1hZ2VfaGVhZHJvb20sIGluaXRyZCwgY21kbGluZSk7Cj4gKyAg
ICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+ICsgICAgICAgIHJjID0gZG9tMF9jb25zdHJ1Y3Rf
cHZoKGQsIGltYWdlLCBpbWFnZV9oZWFkcm9vbSwgaW5pdHJkLCBjbWRsaW5lKTsKPiArICAgIGVs
c2UgaWYgKCBpc19wdl9kb21haW4oZCkgKQo+ICsgICAgICAgIHJjID0gZG9tMF9jb25zdHJ1Y3Rf
cHYoZCwgaW1hZ2UsIGltYWdlX2hlYWRyb29tLCBpbml0cmQsIGNtZGxpbmUpOwo+ICsgICAgZWxz
ZQo+ICsgICAgICAgIHBhbmljKCJDYW5ub3QgY29uc3RydWN0IERvbTAuIE5vIGd1ZXN0IGludGVy
ZmFjZSBhdmFpbGFibGUuIik7CgpcbiBhbmQgeW91IGNhbiBkcm9wIHRoZSBmaW5hbCBmdWxsIHN0
b3AuCgpXaXRoIHRoYXQsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKPiArCj4gICAgICBpZiAoIHJjICkKPiAgICAgICAgICByZXR1cm4gcmM7
Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
