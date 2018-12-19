From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Wed, 19 Dec 2018 15:38:07 +0000
Message-ID: <ba36b8bc-f0cb-4a46-790f-bc0d6d73af9b@arm.com>
References: <20181206153427.35260-1-paul.durrant@citrix.com>
 <20181206153427.35260-4-paul.durrant@citrix.com>
 <99210306-5102-a710-2a1a-251ba504f651@arm.com>
 <025e2f5c1d8c426485d44a1308ded118@AMSPEX02CL02.citrite.net>
 <4b73be1fb98146488f158c4172c526c3@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NFW0=O4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZdvI-0004I2-KB
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 15:38:12 +0000
In-Reply-To: <4b73be1fb98146488f158c4172c526c3@AMSPEX02CL02.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Ian Jackson <Ian.Jackson@citrix.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNy8xMi8yMDE4IDA5OjA4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gQEAgLTM0
NSw3ICszNTIsMjYgQEAgaW50IGlvbW11X2xlZ2FjeV9tYXAoc3RydWN0IGRvbWFpbiAqZCwgZGZu
X3QgZGZuLAo+Pj4gbWZuX3QgbWZuLAo+Pj4+ICAgICAgICByZXR1cm4gcmM7Cj4+Pj4gICAgfQo+
Pj4+Cj4+Pj4gLWludCBpb21tdV9sZWdhY3lfdW5tYXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3Qg
ZGZuLCB1bnNpZ25lZCBpbnQKPj4+IHBhZ2Vfb3JkZXIpCj4+Pj4gK2ludCBpb21tdV9sZWdhY3lf
bWFwKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLAo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgdW5zaWduZWQgaW50IGZsYWdz
KQo+Pj4+ICt7Cj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPSAwOwo+Pj4KPj4+
IG5ld2xpbmUgaGVyZS4KPj4KPj4gQWggeWVzLgo+IAo+IEFjdHVhbGx5LCBoYW5nIG9uLi4uIG5v
LiBXaHkgd291bGQgSSBuZWVkIGEgbmV3bGluZSBiZXR3ZWVuIHR3byBzdGFjayB2YXJpYWJsZSBp
bml0aWFsaXphdGlvbnM/CgpZZXMuIFNvcnJ5IEkgbWlzcmVhZCB0aGUgY29kZS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
