From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 01/11] vpci: move lock
Date: Wed, 26 Sep 2018 04:37:27 -0600
Message-ID: <5BAB616702000078001EC168@prv1-mh.provo.novell.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g57CF-0007DW-JU
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:37:31 +0000
In-Reply-To: <20180717094830.54806-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC02MiwxMiArNzAsMTUgQEAgaW50IF9faHdkb21faW5pdCB2cGNpX2FkZF9oYW5kbGVycyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgICAgIGlmICggIWhhc192cGNpKHBkZXYtPmRvbWFpbikg
KQo+ICAgICAgICAgIHJldHVybiAwOwo+ICAKPiArICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaV9s
b2NrKTsKPiAgICAgIHBkZXYtPnZwY2kgPSB4emFsbG9jKHN0cnVjdCB2cGNpKTsKClBhdHRlcm5z
IGxpa2UgdGhpcyBzaG91bGQgYmUgYXZvaWRlZCB3aGVyZSBwb3NzaWJsZTogSSdkIHByZWZlciBp
ZiB5b3UKY2FsbGVkIHh6YWxsb2MoKSBiZWZvcmUgYWNxdWlyaW5nIHRoZSBsb2NrLCBzdG9yaW5n
IHRoZSByZXN1bHQgaW4gYSBsb2NhbAp2YXJpYWJsZS4KCkFsc28gdGhlIGxvY2tlZCByZWdpb24g
YmVjb21lcyBwcmV0dHkgYmlnIHRoaXMgd2F5LgoKPiBAQCAtMTQ4LDggKzE2MCw2IEBAIGludCB2
cGNpX2FkZF9yZWdpc3RlcihzdHJ1Y3QgdnBjaSAqdnBjaSwgdnBjaV9yZWFkX3QgKnJlYWRfaGFu
ZGxlciwKPiAgICAgIHItPm9mZnNldCA9IG9mZnNldDsKPiAgICAgIHItPnByaXZhdGUgPSBkYXRh
Owo+ICAKPiAtICAgIHNwaW5fbG9jaygmdnBjaS0+bG9jayk7Cj4gLQo+ICAgICAgLyogVGhlIGxp
c3Qgb2YgaGFuZGxlcnMgbXVzdCBiZSBrZXB0IHNvcnRlZCBhdCBhbGwgdGltZXMuICovCj4gICAg
ICBsaXN0X2Zvcl9lYWNoICggcHJldiwgJnZwY2ktPmhhbmRsZXJzICkKPiAgICAgIHsKPiBAQCAt
MTYxLDE0ICsxNzEsMTIgQEAgaW50IHZwY2lfYWRkX3JlZ2lzdGVyKHN0cnVjdCB2cGNpICp2cGNp
LCB2cGNpX3JlYWRfdCAqcmVhZF9oYW5kbGVyLAo+ICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgICBpZiAoIGNtcCA9PSAwICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIHNwaW5fdW5s
b2NrKCZ2cGNpLT5sb2NrKTsKPiAgICAgICAgICAgICAgeGZyZWUocik7Cj4gICAgICAgICAgICAg
IHJldHVybiAtRUVYSVNUOwo+ICAgICAgICAgIH0KPiAgICAgIH0KPiAgCj4gICAgICBsaXN0X2Fk
ZF90YWlsKCZyLT5ub2RlLCBwcmV2KTsKPiAtICAgIHNwaW5fdW5sb2NrKCZ2cGNpLT5sb2NrKTsK
PiAgCj4gICAgICByZXR1cm4gMDsKPiAgfQoKV2l0aCB0aGUgYWJvdmUgaW4gbWluZCwgdGhpcyBp
c24ndCB2ZXJ5IG5pY2UsIGJlY2F1c2UgaXQgcHV0cyBhbiB4bWFsbG9jKCkKaW52b2NhdGlvbiBp
bnNpZGUgYSBsb2NrZWQgcmVnaW9uLgoKQ2FuJ3QgeW91IHNvbHZlIHRoZSByYWNlIHlvdSBtZW50
aW9uIGluIHRoZSBkZXNjcmlwdGlvbiBieSBzaW1wbHkgbGF0Y2hpbmcKcGRldi0+dnBjaSBpbnRv
IGEgbG9jYWwgdmFyaWFibGUgaW4gdnBjaV9yZW1vdmVfZGV2aWNlKCksIGFuZCBzdG9yaW5nCk5V
TEwgaW50byB0aGUgZmllbGQgd2l0aCB0aGUgbG9jayBzdGlsbCBoZWxkPyBUaGF0IHdheSBhbGwg
dGhlIHhmcmVlKClzCnRoZXJlIGNvdWxkIGFwcGFyZW50bHkgbW92ZSBvdXQgb2YgdGhlIGxvY2tl
ZCByZWdpb24gKGlmIG5lZWQgYmUgYnkKZGVmZXJyaW5nIGFsbCBvZiB0aGlzIHRvIGFuIFJDVSBj
YWxsYmFjaykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
