From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v12 1/9] iommu: introduce the concept of
 DFN...
Date: Mon, 1 Oct 2018 11:16:50 +0100
Message-ID: <34fb8626-e07d-1cc9-10d3-1a4ce4bd26b4@arm.com>
References: <20180927143333.17516-1-paul.durrant@citrix.com>
 <20180927143333.17516-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g6vG2-00036Z-En
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 10:16:54 +0000
In-Reply-To: <20180927143333.17516-2-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA5LzI3LzIwMTggMDM6MzMgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPiAu
Li5tZWFuaW5nICdkZXZpY2UgRE1BIGZyYW1lIG51bWJlcicgaS5lLiBhIGZyYW1lIG51bWJlciBt
YXBwZWQgaW4gdGhlIElPTU1VCj4gKHJhdGhlciB0aGFuIHRoZSBNTVUpIGFuZCBoZW5jZSB1c2Vk
IGZvciBETUEgYWRkcmVzcyB0cmFuc2xhdGlvbi4KPiAKPiBUaGlzIHBhdGNoIGlzIGEgbGFyZ2Vs
eSBjb3NtZXRpYyBjaGFuZ2UgdGhhdCBzdWJzdGl0dXRlcyB0aGUgdGVybXMgJ2dmbicKPiBhbmQg
J2dhZGRyJyBmb3IgJ2RmbicgYW5kICdkYWRkcicgaW4gYWxsIHRoZSBwbGFjZXMgd2hlcmUgdGhl
IGZyYW1lIG51bWJlcgo+IG9yIGFkZHJlc3MgcmVsYXRlIHRvIGEgZGV2aWNlIHJhdGhlciB0aGFu
IHRoZSBDUFUuCj4gCj4gVGhlIHBhcnRzIHRoYXQgYXJlIG5vdCBwdXJlbHkgY29zbWV0aWMgYXJl
Ogo+IAo+ICAgLSB0aGUgaW50cm9kdWN0aW9uIG9mIGEgdHlwZS1zYWZlIGRlY2xhcmF0aW9uIG9m
IGRmbl90IGFuZCBkZWZpbml0aW9uIG9mCj4gICAgIElOVkFMSURfREZOIHRvIG1ha2UgdGhlIHN1
YnN0aXR1dGlvbiBvZiBnZm5feChJTlZBTElEX0dGTikgbWVjaGFuaWNhbC4KPiAgIC0gdGhlIGlu
dHJvZHVjdGlvbiBvZiBfX2Rmbl90b19kYWRkciBhbmQgX19kYWRkcl90b19kZm4gKGFuZCB0eXBl
LXNhZmUKPiAgICAgdmFyaWFudHMgd2l0aG91dCB0aGUgbGVhZGluZyBfXykgd2l0aCBzb21lIHVz
ZSBvZiB0aGUgZm9ybWVyLgo+IAo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGNvbnZlcnQgY29k
ZSB0byBtYWtlIHVzZSBvZiB0eXBlLXNhZmUgREZOcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgoKRm9yIHRoZSBBUk0gYml0czoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
