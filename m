From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 12/13] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Wed, 11 Jul 2018 12:46:05 +0100
Message-ID: <3569f08f-be8c-15a5-5c5a-4c8bce245a25@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-13-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lp25=j3=citrix.com=prvs=7234a998f=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fdDZS-0002Zs-Rn
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 11:46:10 +0000
In-Reply-To: <20180707110526.35822-13-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
YWRkcyBpb21tdV9vcHMgdG8gYWRkIChtYXApIG9yIHJlbW92ZSAodW5tYXApIGZyYW1lcyBpbiB0
aGUKPiBkb21haW4ncyBJT01NVSBtYXBwaW5ncywgYW5kIGFuIGlvbW11X29wIHRvIHN5bmNocm9u
aXplIChmbHVzaCkgdGhvc2UKPiBtYW5pcHVsYXRpb25zIHdpdGggdGhlIGhhcmR3YXJlLgo+IAo+
IE1hcHBpbmdzIGFkZGVkIGJ5IHRoZSBtYXAgb3BlcmF0aW9uIGFyZSB0cmFja2VkIGFuZCBvbmx5
IHRob3NlIG1hcHBpbmdzCj4gbWF5IGJlIHJlbW92ZWQgYnkgYSBzdWJzZXF1ZW50IHVubWFwIG9w
ZXJhdGlvbi4gRnJhbWVzIGFyZSBzcGVjaWZpZWQgYnkgdGhlCj4gb3duaW5nIGRvbWFpbiBhbmQg
R0ZOLiBJdCBpcywgb2YgY291cnNlLCBwZXJtaXNzYWJsZSBmb3IgYSBkb21haW4gdG8gbWFwCj4g
aXRzIG93biBmcmFtZXMgdXNpbmcgRE9NSURfU0VMRi4KPiAKPiBOT1RFOiBUaGUgb3duaW5nIGRv
bWFpbiBhbmQgR0ZOIG11c3QgYWxzbyBiZSBzcGVjaWZpZWQgaW4gdGhlIHVubWFwCj4gICAgICAg
b3BlcmF0aW9uLCBhcyB3ZWxsIGFzIHRoZSBCRk4sIHNvIHRoYXQgdGhleSBjYW4gYmUgY3Jvc3Mt
Y2hlY2tlZAo+ICAgICAgIHdpdGggdGhlIGV4aXN0ZW50IG1hcHBpbmcuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoZSBjb2RlIG9u
IHRoZSB3aG9sZSBsb29rcyBjb3JyZWN0LCBidXQgSSBkb24ndCBzZWUgYW55IHJlZmVyZW5jZQpj
b3VudGluZy4gIFRoZSBjYWxsIHRvIGdldF9wYWdlZF9nZm4oKSBpbiBpb21tdW9wX3VubWFwKCkg
a2luZCBvZgp1bmRlcmxpbmVzIHRoZSBpc3N1ZSAtLSB3aGF0J3MgdG8gc3RvcCB0aGUgZm9sbG93
aW5nIHNlcXVlbmNlIG9mIGV2ZW50cz8KCiogaW9tbXVvcF9tYXAoKSBwYWdlIEEKKiBzaGFyZShB
KQoqIERNQSB3cml0ZSBpbnRvIEEgIwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
