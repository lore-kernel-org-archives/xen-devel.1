From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next v2 v2 3/5] pygrub: convert python
 scripts to work with 2.6 and up
Date: Wed, 6 Mar 2019 18:23:43 +0000
Message-ID: <73031cb7-83b4-afd5-084f-a4c8822e73a0@citrix.com>
References: <20190306175210.28145-1-wei.liu2@citrix.com>
 <20190306175210.28145-4-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J0hc=RJ=citrix.com=prvs=961d0c8cc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h1bzN-0006OV-Ma
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 19:14:01 +0000
In-Reply-To: <20190306175210.28145-4-wei.liu2@citrix.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDMvMjAxOSAxNzo1MiwgV2VpIExpdSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
cHlncnViL3NyYy9HcnViQ29uZi5weSBiL3Rvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkKPiBp
bmRleCBkYzgxMGQ1NWNiLi45NzkxM2YzOTkzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3B5Z3J1Yi9z
cmMvR3J1YkNvbmYucHkKPiArKysgYi90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5Cj4gQEAg
LTEwMCw3ICsxMDAsNyBAQCBjbGFzcyBfR3J1YkltYWdlKG9iamVjdCk6Cj4gICAgICAgICAgICAg
ICAgICAiICBpbml0cmQ6ICVzXG4iICUoc2VsZi50aXRsZSwgc2VsZi5yb290LCBzZWxmLmtlcm5l
bCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZWxmLmFyZ3MsIHNlbGYu
aW5pdHJkKSkKPiAgICAgIGRlZiBfcGFyc2Uoc2VsZiwgbGluZXMpOgo+IC0gICAgICAgIG1hcChz
ZWxmLnNldF9mcm9tX2xpbmUsIGxpbmVzKQo+ICsgICAgICAgIGxpc3QobWFwKHNlbGYuc2V0X2Zy
b21fbGluZSwgbGluZXMpKQoKQW5vdGhlciBzaXRlIHdoaWNoIHdhbnRzIGEgdHJhbnNmb3JtIGlu
dG8gYSBmb3IgbG9vcC4KCj4gIAo+ICAgICAgZGVmIHJlc2V0KHNlbGYsIGxpbmVzKToKPiAgICAg
ICAgICBzZWxmLl9yb290ID0gc2VsZi5faW5pdHJkID0gc2VsZi5fa2VybmVsID0gc2VsZi5fYXJn
cyA9IE5vbmUKPiBAQCAtNDYyLDEyICs0NjIsMTIgQEAgY2xhc3MgR3J1YjJDb25maWdGaWxlKF9H
cnViQ29uZmlnRmlsZSk6Cj4gICAgICAgICAgCj4gIGlmIF9fbmFtZV9fID09ICJfX21haW5fXyI6
Cj4gICAgICBpZiBsZW4oc3lzLmFyZ3YpIDwgMzoKPiAtICAgICAgICByYWlzZSBSdW50aW1lRXJy
b3IsICJOZWVkIGEgZ3J1YiB2ZXJzaW9uIChcImdydWJcIiBvciBcImdydWIyXCIpIGFuZCBhIGdy
dWIuY29uZiBvciBncnViLmNmZyB0byByZWFkIgo+ICsgICAgICAgIHJhaXNlIFJ1bnRpbWVFcnJv
cigiTmVlZCBhIGdydWIgdmVyc2lvbiAoXCJncnViXCIgb3IgXCJncnViMlwiKSBhbmQgYSBncnVi
LmNvbmYgb3IgZ3J1Yi5jZmcgdG8gcmVhZCIpCgpBcyB5b3UncmUgZWRpdGluZyB0aGlzIGFueXdh
eSwgaXQgd291bGQgYmUgYmV0dGVyIHRvIHN3aXRjaCB0bwoKUnVudGltZUVycm9yKCdOZWVkIGEg
Z3J1YiB2ZXJzaW9uICgiZ3J1YiIgb3IgImdydWIyIikgYW5kIGEgZ3J1Yi5jb25mIG9yIGdydWIu
Y2ZnIHRvIHJlYWQnKQoKClRvIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGVzY2FwaW5nLgoKT3RoZXJ3
aXNlLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
