From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/5] iommu: introduce dom0-iommu option
Date: Wed, 1 Aug 2018 12:16:01 +0100
Message-ID: <05e43838-fe37-44c6-2d5e-15e1c2282473@citrix.com>
References: <20180801110340.67695-1-roger.pau@citrix.com>
 <20180801110340.67695-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fkp6y-0004q2-10
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 11:16:12 +0000
In-Reply-To: <20180801110340.67695-3-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMTggMTI6MDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBAQCAtMTE5OCw2ICsx
MjA0LDMyIEBAIGRldGVjdGlvbiBvZiBzeXN0ZW1zIGtub3duIHRvIG1pc2JlaGF2ZSB1cG9uIGFj
Y2Vzc2VzIHRvIHRoYXQgcG9ydC4KPiAgCj4gID4+IEVuYWJsZSBJT01NVSBkZWJ1Z2dpbmcgY29k
ZSAoaW1wbGllcyBgdmVyYm9zZWApLgo+ICAKPiArIyMjIGRvbTAtaW9tbXUKPiArPiBgPSBMaXN0
IG9mIFsgbm9uZSB8IHN0cmljdCB8IHJlbGF4ZWQgXWAKPiArCj4gKz4gU3ViLW9wdGlvbnMgYXJl
IG9mIGJvb2xlYW4ga2luZCBhbmQgY2FuIGJlIHByZWZpeGVkIHdpdGggYG5vLWAgdG8gZWZmZWN0
IHRoZQo+ICs+IGludmVyc2UgbWVhbmluZy4KPiArCj4gKz4gYG5vbmVgCj4gKwo+ICs+IERlZmF1
bHQ6IGBmYWxzZWAKPiArCj4gKz4+IENvbnRyb2wgd2hldGhlciB0byBkaXNhYmxlIERNQSByZW1h
cHBpbmcgZm9yIERvbTAuCgpBcyBhIG1pbm9yIHN0eWxlIGlzc3VlLCBwbGVhc2UgY291bGQgeW91
IGZvbGxvdyB0aGUgc3R5bGUgb2YgdGhlCnNwZWMtY3RybD0/wqAgSSBoYXZlbid0IGhhZCB0aW1l
IHRvIGZpeCB0aGUgaW9tbXU9IGZvcm1hdHRpbmcgdG8gYXZvaWQKdXNpbmcgYmxvY2sgcXVvdGF0
aW9ucyBmb3IgYWxsIHRoZSB0ZXh0LgoKfkFuZHJldwoKPiArCj4gKz4gYHN0cmljdGAKPiArCj4g
Kz4gRGVmYXVsdDogYGZhbHNlYAo+ICsKPiArPj4gQ29udHJvbCB3aGV0aGVyIHRvIHNldCB1cCBE
TUEgcmVtYXBwaW5nIG9ubHkgZm9yIHRoZSBtZW1vcnkgRG9tMCBhY3R1YWxseQo+ICs+PiBnb3Qg
YXNzaWduZWQuCj4gKwo+ICs+IGByZWxheGVkYAo+ICsKPiArPiBEZWZhdWx0OiBgdHJ1ZWAKPiAr
Cj4gKz4+IENvbnRyb2xzIHdoZXRoZXIgdG8gc2V0dXAgRE1BIHJlbWFwcGluZ3MgZm9yIGFsbCB0
aGUgaG9zdCBSQU0gZXhjZXB0IHJlZ2lvbnMKPiArPj4gaW4gdXNlIGJ5IFhlbi4KPiArCj4gICMj
IyBpb21tdVxfZGV2XF9pb3RsYlxfdGltZW91dAo+ICA+IGA9IDxpbnRlZ2VyPmAKPiAgCj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
