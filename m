From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v6 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Thu, 24 Jan 2019 10:08:31 +0000
Message-ID: <ce2446ef-61ea-379f-8133-cb5a511f2557@arm.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-3-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w3Qo=QA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmbw7-0005i1-Sw
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 10:08:39 +0000
In-Reply-To: <1548295503-15946-3-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wMS8yMDE5IDAyOjA0LCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiBQcmVz
ZW5jZSBpcyBnYXRlZCB1cG9uIENPTkZJR19BUkdPLgo+IAo+IFJlZ2lzdGVycyB0aGUgaHlwZXJj
YWxsIHByZXZpb3VzbHkgcmVzZXJ2ZWQgZm9yIHRoaXMuCj4gVGFrZXMgNSBhcmd1bWVudHMsIGRv
ZXMgbm90aGluZyBhbmQgcmV0dXJucyAtRU5PU1lTLgo+IAo+IFdpbGwgYmUgYXZvaWRpbmcgYSBj
b21wYXQgQUJJIGJ5IHVzaW5nIGZpeGVkLXNpemUgdHlwZXMgaW4gaHlwZXJjYWxsIG9wcyBzbwo+
IEhZUEVSQ0FMTCwgcmF0aGVyIHRoYW4gQ09NUEFUX0NBTEwsIGlzIHRoZSBjb3JyZWN0IG1hY3Jv
IGZvciB0aGUgaHlwZXJjYWxsCj4gdGFibGVzLgo+IAo+IEV2ZW4gdGhvdWdoIGhhbmRsZXMgd2ls
bCBiZSB1c2VkIGZvciAodXAgdG8pIHR3byBvZiB0aGUgYXJndW1lbnRzIHRvIHRoZQo+IGh5cGVy
Y2FsbCwgdGhlcmUgd2lsbCBiZSBubyBuZWVkIGZvciBhbnkgWExBVF8qIHRyYW5zbGF0aW9uIGZ1
bmN0aW9ucwo+IGJlY2F1c2UgdGhlIHJlZmVyZW5jZWQgZGF0YSBzdHJ1Y3R1cmVzIGhhdmUgYmVl
biBjb25zdHJ1Y3RlZCB0byBiZSBleGFjdGx5Cj4gdGhlIHNhbWUgc2l6ZSBhbmQgYml0IHBhdHRl
cm4gb24gYm90aCAzMi1iaXQgYW5kIDY0LWJpdCBndWVzdHMsIGFuZCBwYWRkZWQKPiB0byBiZSBp
bnRlZ2VyIG11bHRpcGxlcyBvZiAzMiBiaXRzIGluIHNpemUuIFRoaXMgbWVhbnMgdGhhdCB0aGUg
c2FtZQo+IGNvcHlfdG9fZ3Vlc3QgYW5kIGNvcHlfZnJvbV9ndWVzdCBsb2dpYyBjYW4gYmUgcmVs
aWVkIHVwb24gdG8gcGVyZm9ybSBhcwo+IHJlcXVpcmVkIHdpdGhvdXQgYW55IGZ1cnRoZXIgaW50
ZXJ2ZW50aW9uLiBUZXN0aW5nIGNvbW11bmljYXRpb24gd2l0aCAzMgo+IGFuZCA2NCBiaXQgZ3Vl
c3RzIGhhcyBjb25maXJtZWQgdGhpcyB3b3JrcyBhcyBpbnRlbmRlZC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29t
Pgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gdjIgQ29w
eXJpZ2h0IGxpbmU6IGFkZCAyMDE5Cj4gdjIgZmVlZGJhY2sgIzMgSmFuOiBkcm9wICJtZXNzYWdl
IiBmcm9tIGFyZ29fbWVzc2FnZV9vcAo+IHYyIGZlZWRiYWNrICMzIEphbjogYWRkIEFja2VkLWJ5
Cj4gdjEgZmVlZGJhY2sgIzE1IEphbjogaGFuZGxlIHVwcGVyLWhhbHZlcyBvZiBoeXBlcmNhbGwg
YXJncwo+IHYxIGZlZWRiYWNrICMxNSBKYW46IHVzZSB1bnNpZ25lZCB3aGVyZSBuZWdhdGl2ZSB2
YWx1ZXMgaW1wb3NzaWJsZQo+IC0tLQo+ICAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9w
YWdlLlMgfCAgMiArLQo+ICAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyAgICAgICAgfCAg
MyArKysKPiAgIHhlbi9hcmNoL3g4Ni9oeXBlcmNhbGwuYyAgICAgICAgICAgIHwgIDMgKysrCj4g
ICB4ZW4vYXJjaC94ODYvcHYvaHlwZXJjYWxsLmMgICAgICAgICB8ICAzICsrKwoKU29ycnkgZm9y
IG5vdGljaW5nIHF1aXRlIGxhdGUgaW4gdGhlIHByb2Nlc3MuIERvbid0IHlvdSBuZWVkIHRvIGFk
ZCB0aGUgCmh5cGVyY2FsbCBpbiB4ZW4vYXJjaC9hcm0vdHJhcHMuYz8KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
