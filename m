From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC v4 1/8] Port WARN_ON_ONCE() from Linux
Date: Tue, 23 Jan 2018 16:13:42 +0000
Message-ID: <20180123161342.ev32hdjtjrcxpgsj@citrix.com>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-2-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4kka=es=citrix.com=prvs=55463bd4c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ee1Co-0003v8-HS
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 16:13:50 +0000
Content-Disposition: inline
In-Reply-To: <20171219031703.23420-2-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, Ian.Jackson@citrix.com, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTgsIDIwMTcgYXQgMDg6MTY6NTZQTSAtMDcwMCwgU2FtZWVyIEdvZWwgd3Jv
dGU6Cj4gUG9ydCBXQVJOX09OX09OQ0UgbWFjcm8gZnJvbSBMaW51eC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBTYW1lZXIgR29lbCA8c2FtZWVyLmdvZWxAbGluYXJvLm9yZz4KPiAtLS0KPiAgeGVuL2lu
Y2x1ZGUveGVuL2xpYi5oIHwgMTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpYi5oIGIveGVu
L2luY2x1ZGUveGVuL2xpYi5oCj4gaW5kZXggZWQwMGFlMTM3OS4uODMyMDZjMDg0OCAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGli
LmgKPiBAQCAtMTEsNiArMTEsMTcgQEAKPiAgI2RlZmluZSBCVUdfT04ocCkgIGRvIHsgaWYgKHVu
bGlrZWx5KHApKSBCVUcoKTsgIH0gd2hpbGUgKDApCj4gICNkZWZpbmUgV0FSTl9PTihwKSBkbyB7
IGlmICh1bmxpa2VseShwKSkgV0FSTigpOyB9IHdoaWxlICgwKQo+ICAKPiArI2RlZmluZSBXQVJO
X09OX09OQ0UocCkJKHsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHN0YXRpYyBi
b29sIF9fc2VjdGlvbigiLmRhdGEudW5saWtlbHkiKSBfX3dhcm5lZDsgXAoKWW91IGludHJvZHVj
ZWQgYSBuZXcgc2VjdGlvbiB3aXRob3V0IGNvcnJlc3BvbmRpbmcgY2hhbmdlcyB0bwp7YXJtLHg4
Nn0veGVuLmxkcy5TCgo+ICsgICAgaW50IF9fcmV0X3dhcm5fb25jZSA9ICEhKHApOyAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgaWYgKHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSAmJiAhX193
YXJuZWQpKSB7ICAgXAo+ICsgICAgICAgIF9fd2FybmVkID0gdHJ1ZTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgICAgIFdBUk5fT04oMSk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAoKVGhpcyBpc24ndCByZWFsbHkgYSBkaXJlY3QgcG9ydCBmcm9tIExpbnV4
LiBBdCB0aGlzIHBvaW50IEkgd29uZGVyIHdoeQp5b3UgZGlkbid0IHVzZSBXQVJOKCkgZGlyZWN0
bHk/CgpXZWkuCgo+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICsgICAgdW5saWtlbHkoX19yZXRfd2Fybl9vbmNlKTsgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICt9KQo+ICsKPiAgI2lmIF9fR05VQ19fID4gNCB8fCAoX19HTlVDX18gPT0g
NCAmJiBfX0dOVUNfTUlOT1JfXyA+PSA2KQo+ICAvKiBGb3JjZSBhIGNvbXBpbGF0aW9uIGVycm9y
IGlmIGNvbmRpdGlvbiBpcyB0cnVlICovCj4gICNkZWZpbmUgQlVJTERfQlVHX09OKGNvbmQpICh7
IF9TdGF0aWNfYXNzZXJ0KCEoY29uZCksICIhKCIgI2NvbmQgIikiKTsgfSkKPiAtLSAKPiAyLjE0
LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
