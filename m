From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/mm/p2m: stop checking for IOMMU
 shared page tables in mmio_order()
Date: Tue, 04 Dec 2018 08:36:19 -0700
Message-ID: <5C069EF30200007800202C52@prv1-mh.provo.novell.com>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
 <20181203174017.11956-5-paul.durrant@citrix.com>
 <5C069B450200007800202C22@prv1-mh.provo.novell.com>
 <dd9518307f2140d7bbae1ebd531d471e@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUCmI-0000Go-AW
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 15:38:26 +0000
In-Reply-To: <dd9518307f2140d7bbae1ebd531d471e@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEyLjE4IGF0IDE2OjIyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDQgRGVjZW1iZXIgMjAxOCAxNToyMQo+
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4gQ2M6IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPj4g
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAKPj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQv
NF0geDg2L21tL3AybTogc3RvcCBjaGVja2luZyBmb3IgSU9NTVUgc2hhcmVkCj4+IHBhZ2UgdGFi
bGVzIGluIG1taW9fb3JkZXIoKQo+PiAKPj4gPj4+IE9uIDAzLjEyLjE4IGF0IDE4OjQwLCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IE5vdyB0aGF0IHRoZSBpb21tdV9tYXAo
KSBhbmQgaW9tbXVfdW5tYXAoKSBvcGVyYXRpb25zIHRha2UgYW4gb3JkZXIKPj4gPiBwYXJhbWV0
ZXIgYW5kIGVsaWRlIGZsdXNoaW5nIHRoZXJlJ3Mgbm8gc3Ryb25nIHJlYXNvbiB3aHkgbW9kaWZ5
aW5nIE1NSU8KPj4gPiByYW5nZXMgaW4gdGhlIHAybSBzaG91bGQgYmUgcmVzdHJpY3RlZCB0byBh
IDRrIGdyYW51bGFyaXR5IHNpbXBseQo+PiBiZWNhdXNlCj4+ID4gdGhlIElPTU1VIGlzIGVuYWJs
ZWQgYnV0IHNoYXJlZCBwYWdlIHRhYmxlcyBhcmUgbm90IGluIG9wZXJhdGlvbi4KPj4gCj4+IEkn
bSBhZnJhaWQgdGhlIHR3byBpbXByb3ZlbWVudHMgYXJlIG5vdCBlbm91Z2ggZm9yIHRoaXMgcmVz
dHJpY3Rpb24KPj4gdG8gYmUgbGlmdGVkOiBUaGVyZSdzIHN0aWxsIG5vIHByZWVtcHRpb24gaW4g
dGhlIHByb2Nlc3Npbmcgb2YgdGhlCj4+IGhpZ2hlciBvcmRlciB2YWx1ZXMuCj4gCj4gV2h5PyAx
RyBvcmRlcnMgYXJlIGFscmVhZHkgcnVsZWQgb3V0IGFuZCB0ZXN0aW5nIHNob3dzIHRoYXQgMk0g
b3JkZXJzIGNhdXNlIAo+IG5vIHByb2JsZW1zIG9uIEVQWUMgc3lzdGVtcy4KCkhtbSwgeWVzLCBh
Z3JlZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
