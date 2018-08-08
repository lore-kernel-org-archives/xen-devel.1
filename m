From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 8 Aug 2018 11:46:50 +0100
Message-ID: <d110b5c9-50b6-a16a-79e3-5d8b76ed34a4@citrix.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <5B6AC62F02000078001DBF2B@prv1-mh.provo.novell.com>
 <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
 <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rtkw=kx=citrix.com=prvs=751d397f3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fnLzR-0006No-Cs
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:46:53 +0000
In-Reply-To: <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMTggMTE6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjA4LjE4IGF0
IDEyOjM4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4+IFNlbnQ6IDA4IEF1Z3VzdCAyMDE4
IDExOjMwCj4+Pgo+Pj4+Pj4gT24gMDguMDguMTggYXQgMTE6MDAsIDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+Pj4gQEAgLTM4NjAsNiArMzg2Niw0NyBAQCBpbnQgbWVtX3NoYXJp
bmdfZ3JlZl90b19nZm4oc3RydWN0Cj4+PiBncmFudF90YWJsZSAqZ3QsIGdyYW50X3JlZl90IHJl
ZiwKPj4+PiAgfQo+Pj4+ICAjZW5kaWYKPj4+Pgo+Pj4+ICsvKiBjYWxsZXIgbXVzdCBob2xkIHdy
aXRlIGxvY2sgKi8KPj4+PiArc3RhdGljIGludCBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm4o
c3RydWN0IGRvbWFpbiAqZCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBpZHgsIG1mbl90ICptZm4pCj4+Pj4gK3sKPj4+PiArICAgIHN0
cnVjdCBncmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90YWJsZTsKPj4+IGNvbnN0Pwo+Pj4KPj4g
SUlSQyB0aGF0IGRpZG4ndCB3b3JrIGJlY2F1c2UgZ250dGFiX2dyb3dfdGFibGUoKSBtb2RpZmll
cyB0aGUgY29udGVudC4KPiBCdXQgeW91IGRvbid0IHBhc3MgZ3QgdG8gdGhlIGZ1bmN0aW9uOgo+
Cj4+Pj4gKyAgICBBU1NFUlQoZ3QtPmd0X3ZlcnNpb24gPT0gMik7Cj4+Pj4gKwo+Pj4+ICsgICAg
aWYgKCBpZHggPj0gbnJfc3RhdHVzX2ZyYW1lcyhndCkgKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAg
ICAgIHVuc2lnbmVkIGxvbmcgbnIgPSBzdGF0dXNfdG9fZ3JhbnRfZnJhbWVzKGlkeCArIDEpOwo+
Pj4+ICsKPj4+PiArICAgICAgICBpZiAoIG5yIDw9IGd0LT5tYXhfZ3JhbnRfZnJhbWVzICkKPj4+
PiArICAgICAgICAgICAgZ250dGFiX2dyb3dfdGFibGUoZCwgbnIpOwo+IF5eXgo+Cj4+Pj4gQEAg
LTM5MDYsNiArMzk0MywzOCBAQCBpbnQgZ250dGFiX21hcF9mcmFtZShzdHJ1Y3QgZG9tYWluICpk
LAo+Pj4gdW5zaWduZWQgbG9uZyBpZHgsIGdmbl90IGdmbiwKPj4+PiAgICAgIHJldHVybiByYzsK
Pj4+PiAgfQo+Pj4+Cj4+Pj4gK2ludCBnbnR0YWJfZ2V0X3NoYXJlZF9mcmFtZShzdHJ1Y3QgZG9t
YWluICpkLCB1bnNpZ25lZCBsb25nIGlkeCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1mbl90ICptZm4pCj4+Pj4gK3sKPj4+PiArICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3Qg
PSBkLT5ncmFudF90YWJsZTsKPj4+PiArICAgIGludCByYzsKPj4+PiArCj4+Pj4gKyAgICBncmFu
dF93cml0ZV9sb2NrKGd0KTsKPj4+PiArCj4+Pj4gKyAgICBpZiAoIGd0LT5ndF92ZXJzaW9uID09
IDAgKQo+Pj4+ICsgICAgICAgIGd0LT5ndF92ZXJzaW9uID0gMTsKPj4+IFNpbmNlIHlvdSd2ZSBt
b3ZlZCB0aGlzIGhlcmUgaW5zdGVhZCBvZiBkcm9wcGluZyBpdCwgd2hhdCByZXF1aXJlbWVudAo+
Pj4gaGF2ZSB5b3UgZm91bmQgZm9yIHRoaXMgdG8gYmUgc2V0IChvdGhlciB0aGFuIHRoZSBBU1NF
UlQoKSB5b3UgcHV0IGluCj4+PiBnbnR0YWJfZ2V0X3NoYXJlZF9mcmFtZV9tZm4oKT8KPj4+Cj4+
IFRoZSBjb2RlIGluIHBhdGNoICMyIGlzIGV4ZWN1dGVkIGJlZm9yZSB0aGUgZ3JhbnQgdGFibGUg
dmVyc2lvbiBpcyBzZXQuIEkgCj4+IGNvdWxkIGFsdGVybmF0aXZlbHkgaGF2ZSBsaWJ4bCBleHBs
aWNpdGx5IHNldCB0aGUgdmVyc2lvbiB0byAxIGJlZm9yZSB0cnlpbmcgCj4+IHRvIHNlZWQgdGhl
IHRhYmxlLgo+IEJ1dCB0aGF0J3Mgbm90IG15IHBvaW50LiBXaGF0J3Mgd3Jvbmcgd2l0aCBsZWF2
aW5nIGl0IGF0IHplcm8/CgpPbiBhIHRhbmdlbnQsIHdoeSBkb2VzIGEgZ250dGFiIHZlcnNpb24g
b2YgMCBleGlzdCBhdCBhbGw/wqAgV2h5IGRvbid0IHdlCmV4cGxpY2l0bHkgaW5pdGlhbGlzZSBp
dCB0byAxIGluIHRoZSBoeXBlcnZpc29yPwoKV2UndmUgaGFkIHBsZW50eSBvZiBYU0FzIHRvIGRv
IHdpdGggbWlzaGFuZGxpbmcgb2YgYSBnbnR0YWIgdmVyc2lvbiBvZgowLsKgIFdoeSBub3QgZml4
IHRoZSBwcm9ibGVtIGF0IGl0cyBzb3VyY2UsIGFuZCBzaW1wbGlmeSB0aGUgZ250dGFiIGNvZGUK
d2hpbGUgd2UgYXJlIGF0IGl0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
