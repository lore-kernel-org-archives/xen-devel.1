From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 10:19:16 +0000
Message-ID: <2b65df73-cb0b-5bc5-6921-0576f9d85da3@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
 <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
 <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
 <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+3mG=RR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h4NSM-0002gx-In
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:19:22 +0000
In-Reply-To: <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMy8xNC8xOSAxMDoxNCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxNC8wMy8yMDE5IDEwOjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEphbiwKPj4KPj4g
T24gMy8xNC8xOSA3OjUyIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEzLjAzLjE5
IGF0IDE4OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IE9uIDEzLzAzLzIw
MTkgMTU6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjoz
NSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCj4+Pj4+PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4+Pj4g
QEAgLTIxMjEsOSArMjEyMSw5IEBAIHZvaWQgaW5pdF94ZW5oZWFwX3BhZ2VzKHBhZGRyX3QgcHMs
IHBhZGRyX3QgcGUpCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgKiBZdWshIEVuc3VyZSB0aGVyZSBp
cyBhIG9uZS1wYWdlIGJ1ZmZlciBiZXR3ZWVuIFhlbiBhbmQKPj4+Pj4+IERvbSB6b25lcywgdG8K
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCAqIHByZXZlbnQgbWVyZ2luZyBvZiBwb3dlci1vZi10d28g
YmxvY2tzIGFjcm9zcyB0aGUgem9uZQo+Pj4+Pj4gYm91bmRhcnkuCj4+Pj4+PiAgwqDCoMKgwqDC
oMKgwqAgKi8KPj4+Pj4+IC3CoMKgwqAgaWYgKCBwcyAmJiAhaXNfeGVuX2hlYXBfbWZuKHBhZGRy
X3RvX3BmbihwcyktMSkgKQo+Pj4+Pj4gK8KgwqDCoCBpZiAoIHBzICYmICFpc194ZW5faGVhcF9t
Zm4oX21mbihwYWRkcl90b19wZm4ocHMpLTEpKSApCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHMgKz0gUEFHRV9TSVpFOwo+Pj4+Pj4gLcKgwqDCoCBpZiAoICFpc194ZW5faGVhcF9tZm4o
cGFkZHJfdG9fcGZuKHBlKSkgKQo+Pj4+Pj4gK8KgwqDCoCBpZiAoICFpc194ZW5faGVhcF9tZm4o
bWFkZHJfdG9fbWZuKHBlKSkgKQo+Pj4+Pgo+Pj4+PiBXaHkgbWFkZHJfdG9fbWZuKCkgaGVyZSBi
dXQgc3RpbGwgcGFkZHJfdG9fcGZuKCkgYWJvdmU/IE9oLAo+Pj4+PiB3ZSBkb24ndCBoYXZlIGFu
eSBtZm5fc3ViKCksIEkgc2VlLgo+Pj4+Cj4+Pj4gWWVzIHdlIGRvbid0IGhhdmUgbWZuX3N1Yigp
IChvciBldmVuIGdmbl9zdWIoKSkuIEkgb25seSBmb3VuZCBhCj4+Pj4gY291cGxlIG9mIHBsYWNl
cwo+Pj4+IHdoZXJlIHN1Y2ggaGVscGVycyBtaWdodCBiZSB1c2VmdWwuIEkgY2FuIGludHJvZHVj
ZSB0aGUgMiBoZWxwZXJzIGlmCj4+Pj4geW91IHRoaW5rCj4+Pj4gaXQgaXMgd29ydGggaXQuCj4+
Pgo+Pj4gV2VsbCwgSSBndWVzcyBpbiB0aGUgZW5kIEknbSBmaW5lIGVpdGhlciB3YXkuIEl0IHNp
bXBseSBzdHJ1Y2sgbWUKPj4+IGFzIG9kZCBhdCB0aGUgZmlyc3QgZ2xhbmNlIHRoYXQgeW91IHVz
ZSBtYWRkcl90b19tZm4oKSBpbiBvbmUKPj4+IGNhc2UgYnV0IG5vdCB0aGUgb3RoZXIuCj4+Cj4+
IEkgd2FudGVkIHRvIGF2b2lkIGFkZGluZyBtZm5feCguLi4pIG9uIHRoZSBsaW5lOgo+Pgo+PiBf
bWZuKG1mbl94KG1hZGRyX3RvX21mbihwcykpIC0gMSkKPj4KPj4gSSB3aWxsIGxvb2sgdG8gaW50
cm9kdWNlIG1mbl9zdWIoKS9nZm5fc3ViKCkuCj4gCj4gWW91IGRvIGtub3cgdGhhdCBtZm5fYWRk
KG1mbiwgLTEpIHdpbGwgRFRSVD8KCkl0IGRpZG4ndCBvY2N1ciB0byBtZSB1bnRpbCB5b3Ugc2Fp
ZCBpdC4gSSB3aWxsIHVzZSB0aGF0IHRoZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
