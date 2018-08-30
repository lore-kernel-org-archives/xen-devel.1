From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/7] x86/hvm: Rename v->arch.hvm_vcpu to
 v->arch.hvm
Date: Thu, 30 Aug 2018 08:52:35 -0600
Message-ID: <5B8804B302000078001E391B@prv1-mh.provo.novell.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE5OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+PiBPbiAyOC4wOC4xOCBhdCAxOTozOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+IFRoZSB0cmFpbGluZyBfdmNwdSBzdWZmaXggaXMgcmVkdW5kYW50LCBidXQgYWRk
cyB0byBjb2RlIHZvbHVtZS4gIERyb3AgaXQuCj4gCj4gUmVmbG93IGxpbmVzIGFzIGFwcHJvcHJp
YXRlLCBhbmQgc3dpdGNoIHRvIHVzaW5nIHRoZSBuZXcgWEZSRUUvZXRjIHdyYXBwZXJzCj4gd2hl
cmUgYXBwbGljYWJsZS4KCkkgY291bGRuJ3QgZmluZCBhbnkgc3VjaCBjb252ZXJzaW9uLCBzbyBw
ZXJoYXBzIGJldHRlciB0byBkZWxldGUgdGhhdApwYXJ0IG9mIHRoZSBkZXNjcmlwdGlvbi4KCj4g
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cgo+IEBAIC0zODg4LDE5ICszODg2LDE5IEBAIHZvaWQgaHZtX3ZjcHVf
cmVzZXRfc3RhdGUoc3RydWN0IHZjcHUgKnYsIHVpbnQxNl90IGNzLCB1aW50MTZfdCBpcCkKPiAg
ICAgIHYtPmFyY2gudXNlcl9yZWdzLnJpcCA9IGlwOwo+ICAgICAgbWVtc2V0KCZ2LT5hcmNoLmRl
YnVncmVnLCAwLCBzaXplb2Yodi0+YXJjaC5kZWJ1Z3JlZykpOwo+ICAKPiAtICAgIHYtPmFyY2gu
aHZtX3ZjcHUuZ3Vlc3RfY3JbMF0gPSBYODZfQ1IwX0VUOwo+ICsgICAgdi0+YXJjaC5odm0uZ3Vl
c3RfY3JbMF0gPSBYODZfQ1IwX0VUOwo+ICAgICAgaHZtX3VwZGF0ZV9ndWVzdF9jcih2LCAwKTsK
PiAgCj4gLSAgICB2LT5hcmNoLmh2bV92Y3B1Lmd1ZXN0X2NyWzJdID0gMDsKPiArICAgIHYtPmFy
Y2guaHZtLmd1ZXN0X2NyWzJdID0gMDsKPiAgICAgIGh2bV91cGRhdGVfZ3Vlc3RfY3IodiwgMik7
Cj4gIAo+IC0gICAgdi0+YXJjaC5odm1fdmNwdS5ndWVzdF9jclszXSA9IDA7Cj4gKyAgICB2LT5h
cmNoLmh2bS5ndWVzdF9jclszXSA9IDA7Cj4gICAgICBodm1fdXBkYXRlX2d1ZXN0X2NyKHYsIDMp
Owo+ICAKPiAtICAgIHYtPmFyY2guaHZtX3ZjcHUuZ3Vlc3RfY3JbNF0gPSAwOwo+ICsgICAgdi0+
YXJjaC5odm0uZ3Vlc3RfY3JbNF0gPSAwOwo+ICAgICAgaHZtX3VwZGF0ZV9ndWVzdF9jcih2LCA0
KTsKPiAgCj4gLSAgICB2LT5hcmNoLmh2bV92Y3B1Lmd1ZXN0X2VmZXIgPSAwOwo+ICsgICAgdi0+
YXJjaC5odm0uZ3Vlc3RfZWZlciA9IDA7Cj4gICAgICBodm1fdXBkYXRlX2d1ZXN0X2VmZXIodik7
CgpOb3RpY2luZyB0aGlzLCBhIHRob3VnaHQgdW5yZWxhdGVkIHRvIHRoaXMgc2VyaWVzOiBXb3Vs
ZG4ndCB3ZSBiZSBiZXR0ZXIgb2ZmCnNldHRpbmcgYWxsIHRoZSBzdHJ1Y3R1cmUgZmllbGRzIGZp
cnN0LCBhbmQgb25seSB0aGVuIGludm9rZSBhbGwgdGhlIGZ1bmN0aW9ucz8KSnVzdCBsaWtlIGFy
Y2hfc2V0X2luZm9faHZtX2d1ZXN0KCkgZG9lcz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
