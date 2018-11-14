From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/3] Provide mechanism to set UUID for Dom0
Date: Wed, 14 Nov 2018 18:17:29 +0000
Message-ID: <20181114181732.19013-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=efFe=NZ=citrix.com=prvs=849cc1f13=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMzkN-0001s7-CQ
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 18:18:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, edvin.torok@citrix.com, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMyk6CiAgdG9vbHM6IHVwZGF0ZSBleGFtcGxlcy9SRUFETUUKICB0b29scy9oZWxw
ZXJzOiBtYWtlIGdlbl9zdHViX2pzb25fY29uZmlnIGFjY2VwdCBhbiBVVUlEIGFyZ3VtZW50CiAg
eGVuLWluaXQtZG9tMDogc2V0IERvbTAgVVVJRCBpZiByZXF1ZXN0ZWQKCiB0b29scy9leGFtcGxl
cy9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMSArCiB0b29scy9leGFtcGxlcy9SRUFETUUgICAg
ICAgICAgICAgICAgfCAyNiArKysrKystLS0tLS0tLQogdG9vbHMvZXhhbXBsZXMvZG9tMC11dWlk
ICAgICAgICAgICAgIHwgIDAKIHRvb2xzL2hlbHBlcnMvTWFrZWZpbGUgICAgICAgICAgICAgICB8
ICAzICstCiB0b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uYyAgICAgICAgfCAgNSArKy0KIHRv
b2xzL2hlbHBlcnMvaW5pdC1kb20tanNvbi5oICAgICAgICB8ICAzICstCiB0b29scy9oZWxwZXJz
L2luaXQteGVuc3RvcmUtZG9tYWluLmMgfCAgMiArLQogdG9vbHMvaGVscGVycy94ZW4taW5pdC1k
b20wLmMgICAgICAgIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiA4
IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL2V4YW1wbGVzL2RvbTAtdXVpZAoKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
