From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 02/13] domctl: add tee_op domctl
Date: Mon, 3 Sep 2018 18:16:40 +0100
Message-ID: <5575c1a8-5894-6324-b577-3480f66e6ad7@arm.com>
References: <1535993677-20816-1-git-send-email-volodymyr_babchuk@epam.com>
 <1535993677-20816-3-git-send-email-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ajax=lr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fwsSy-00038Y-Qt
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 17:16:44 +0000
In-Reply-To: <1535993677-20816-3-git-send-email-volodymyr_babchuk@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8wOS8xOCAxNzo1NCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gQ3VycmVu
dGx5IHRoaXMgY2FsbCB1c2VkIG9ubHkgdG8gZW5hYmxlIFRFRSBzdXBwb3J0IGZvciBhIGRvbWFp
bi4KPiAKPiBJdCBpcyBwbGFuZWQgdG8gZXh0ZW5kIGl0IHdoZW4gdGhlcmUgd2lsbCBiZSBtdWx0
aXBsZSBURUUKPiBtZWRpYXRvcnMsIHNvIHRvb2xzdGFjayBjYW4gZGV0ZXJtaW5lIHdoaWNoIFRF
RSBpcyBhdmFpbGFibGUKPiBvbiBhIHBsYXRmb3JtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9k
eW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiAtLS0KPiAgIHhlbi9h
cmNoL2FybS9kb21jdGwuYyAgICAgICB8IDEwICsrKysrKysrKysKPiAgIHhlbi9pbmNsdWRlL3B1
YmxpYy9kb21jdGwuaCB8ICA4ICsrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWN0bC5jIGIveGVuL2Fy
Y2gvYXJtL2RvbWN0bC5jCj4gaW5kZXggNDU4N2M3NS4uZjEyOGQzNCAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tY3RsLmMKPiBAQCAt
MTMsNiArMTMsNyBAQAo+ICAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+ICAgI2luY2x1ZGUgPHhl
bi90eXBlcy5oPgo+ICAgI2luY2x1ZGUgPHhzbS94c20uaD4KPiArI2luY2x1ZGUgPGFzbS1hcm0v
dGVlL3RlZS5oPgo+ICAgI2luY2x1ZGUgPHB1YmxpYy9kb21jdGwuaD4KPiAgIAo+ICAgdm9pZCBh
cmNoX2dldF9kb21haW5faW5mbyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+IEBAIC0xNzEsNiAr
MTcyLDE1IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwg
c3RydWN0IGRvbWFpbiAqZCwKPiAgIAo+ICAgICAgICAgICByZXR1cm4gcmM7Cj4gICAgICAgfQo+
ICsgICAgY2FzZSBYRU5fRE9NQ1RMX3RlZV9vcDoKPiArICAgICAgICBzd2l0Y2ggKCBkb21jdGwt
PnUudGVlX29wLmNtZCApCj4gKyAgICAgICAgewo+ICsgICAgICAgIGNhc2UgWEVOX0RPTUNUTF9U
RUVfT1BfRU5BQkxFOgo+ICsgICAgICAgICAgICByZXR1cm4gdGVlX2VuYWJsZShkKTsKPiArCj4g
KyAgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAg
ICAgfQoKSSBkb24ndCB0aGluayBhIGRvbWN0bCBpcyBuZWNlc3NhcnkgZm9yIHRoaXMuIFlvdSBj
YW4gYWRkIGEgZmxhZyBpbiAKeGVuX2FyY2hfZG9tYWluY29uZmlnLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
