From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 30/45] xen/sched: rework and rename
 vcpu_force_reschedule()
Date: Mon, 6 May 2019 10:51:46 +0200
Message-ID: <9111da86-634d-14a9-1862-b828265b0195@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-31-jgross@suse.com> <5CCFF238020000780022C0F9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNZLh-0002Mg-P6
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:51:49 +0000
In-Reply-To: <5CCFF238020000780022C0F9@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxMDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC04MDgsMjEgKzgw
OCwyNCBAQCBzdGF0aWMgdm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQo+
PiAgfQo+PiAgCj4+ICAvKgo+PiAtICogRm9yY2UgYSBWQ1BVIHRocm91Z2ggYSBkZXNjaGVkdWxl
L3Jlc2NoZWR1bGUgcGF0aC4KPj4gLSAqIEZvciBleGFtcGxlLCB1c2luZyB0aGlzIHdoZW4gc2V0
dGluZyB0aGUgcGVyaW9kaWMgdGltZXIgcGVyaW9kIG1lYW5zIHRoYXQKPj4gLSAqIG1vc3QgcGVy
aW9kaWMtdGltZXIgc3RhdGUgbmVlZCBvbmx5IGJlIHRvdWNoZWQgZnJvbSB3aXRoaW4gdGhlIHNj
aGVkdWxlcgo+PiAtICogd2hpY2ggY2FuIHRodXMgYmUgZG9uZSB3aXRob3V0IG5lZWQgZm9yIHN5
bmNocm9uaXNhdGlvbi4KPj4gKyAqIFNldCB0aGUgcGVyaW9kaWMgdGltZXIgb2YgYSB2Y3B1Lgo+
PiAgICovCj4+IC12b2lkIHZjcHVfZm9yY2VfcmVzY2hlZHVsZShzdHJ1Y3QgdmNwdSAqdikKPj4g
K3ZvaWQgdmNwdV9zZXRfcGVyaW9kaWNfdGltZXIoc3RydWN0IHZjcHUgKnYsIHNfdGltZV90IHZh
bHVlKQo+PiAgewo+PiAtICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBpdGVtX3NjaGVkdWxlX2xvY2tf
aXJxKHYtPnNjaGVkX2l0ZW0pOwo+PiArICAgIHNfdGltZV90IG5vdyA9IE5PVygpOwo+PiAgCj4+
IC0gICAgaWYgKCB2LT5zY2hlZF9pdGVtLT5pc19ydW5uaW5nICkKPj4gLSAgICAgICAgdmNwdV9t
aWdyYXRlX3N0YXJ0KHYpOwo+PiArICAgIGlmICggdiAhPSBjdXJyZW50ICkKPj4gKyAgICAgICAg
dmNwdV9wYXVzZSh2KTsKPj4gKyAgICBlbHNlCj4+ICsgICAgICAgIHN0b3BfdGltZXIoJnYtPnBl
cmlvZGljX3RpbWVyKTsKPj4gIAo+PiAtICAgIGl0ZW1fc2NoZWR1bGVfdW5sb2NrX2lycShsb2Nr
LCB2LT5zY2hlZF9pdGVtKTsKPj4gKyAgICB2LT5wZXJpb2RpY19wZXJpb2QgPSB2YWx1ZTsKPj4g
KyAgICB2LT5wZXJpb2RpY19sYXN0X2V2ZW50ID0gbm93Owo+IAo+IEJ5IHRoZSB0aW1lIHlvdSBj
b21lIGhlcmUsIE5PVygpIG1heSBhbHJlYWR5IGJlIHBhc3Qgbm93ICsgdmFsdWUuCj4gSXQncyBu
b3QgY2xlYXIgdG8gbWUgd2hldGhlciB0aGF0J2xsIHdvcmsgY29ycmVjdGx5OyBJIHRoaW5rIGl0
IHdvdWxkIGJlCj4gYmV0dGVyIHRvIGxhdGNoIE5PVygpIG9ubHkgYXQgdGhpcyBwb2ludC4KCkkg
YWdyZWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
