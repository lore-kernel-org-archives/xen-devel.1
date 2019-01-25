From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Fri, 25 Jan 2019 10:55:37 -0800
Message-ID: <CACMJ4GYiPhma+tKVefFSHqroVeEj+pGaQN2h2AnH=gtDDoJhww@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-3-git-send-email-christopher.w.clark@gmail.com>
 <ce2446ef-61ea-379f-8133-cb5a511f2557@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G6kZ=QB=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gn6dt-000700-7R
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 18:55:53 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so7656533lff.10
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jan 2019 10:55:51 -0800 (PST)
In-Reply-To: <ce2446ef-61ea-379f-8133-cb5a511f2557@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMjowOCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMjQvMDEvMjAxOSAwMjowNCwgQ2hyaXN0
b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiBQcmVzZW5jZSBpcyBnYXRlZCB1cG9uIENPTkZJR19BUkdP
Lgo+ID4KPiA+IFJlZ2lzdGVycyB0aGUgaHlwZXJjYWxsIHByZXZpb3VzbHkgcmVzZXJ2ZWQgZm9y
IHRoaXMuCj4gPiBUYWtlcyA1IGFyZ3VtZW50cywgZG9lcyBub3RoaW5nIGFuZCByZXR1cm5zIC1F
Tk9TWVMuCj4gPgo+ID4gV2lsbCBiZSBhdm9pZGluZyBhIGNvbXBhdCBBQkkgYnkgdXNpbmcgZml4
ZWQtc2l6ZSB0eXBlcyBpbiBoeXBlcmNhbGwgb3BzIHNvCj4gPiBIWVBFUkNBTEwsIHJhdGhlciB0
aGFuIENPTVBBVF9DQUxMLCBpcyB0aGUgY29ycmVjdCBtYWNybyBmb3IgdGhlIGh5cGVyY2FsbAo+
ID4gdGFibGVzLgo+ID4KPiA+IEV2ZW4gdGhvdWdoIGhhbmRsZXMgd2lsbCBiZSB1c2VkIGZvciAo
dXAgdG8pIHR3byBvZiB0aGUgYXJndW1lbnRzIHRvIHRoZQo+ID4gaHlwZXJjYWxsLCB0aGVyZSB3
aWxsIGJlIG5vIG5lZWQgZm9yIGFueSBYTEFUXyogdHJhbnNsYXRpb24gZnVuY3Rpb25zCj4gPiBi
ZWNhdXNlIHRoZSByZWZlcmVuY2VkIGRhdGEgc3RydWN0dXJlcyBoYXZlIGJlZW4gY29uc3RydWN0
ZWQgdG8gYmUgZXhhY3RseQo+ID4gdGhlIHNhbWUgc2l6ZSBhbmQgYml0IHBhdHRlcm4gb24gYm90
aCAzMi1iaXQgYW5kIDY0LWJpdCBndWVzdHMsIGFuZCBwYWRkZWQKPiA+IHRvIGJlIGludGVnZXIg
bXVsdGlwbGVzIG9mIDMyIGJpdHMgaW4gc2l6ZS4gVGhpcyBtZWFucyB0aGF0IHRoZSBzYW1lCj4g
PiBjb3B5X3RvX2d1ZXN0IGFuZCBjb3B5X2Zyb21fZ3Vlc3QgbG9naWMgY2FuIGJlIHJlbGllZCB1
cG9uIHRvIHBlcmZvcm0gYXMKPiA+IHJlcXVpcmVkIHdpdGhvdXQgYW55IGZ1cnRoZXIgaW50ZXJ2
ZW50aW9uLiBUZXN0aW5nIGNvbW11bmljYXRpb24gd2l0aCAzMgo+ID4gYW5kIDY0IGJpdCBndWVz
dHMgaGFzIGNvbmZpcm1lZCB0aGlzIHdvcmtzIGFzIGludGVuZGVkLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5j
b20+Cj4gPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4KPiA+
IHYyIENvcHlyaWdodCBsaW5lOiBhZGQgMjAxOQo+ID4gdjIgZmVlZGJhY2sgIzMgSmFuOiBkcm9w
ICJtZXNzYWdlIiBmcm9tIGFyZ29fbWVzc2FnZV9vcAo+ID4gdjIgZmVlZGJhY2sgIzMgSmFuOiBh
ZGQgQWNrZWQtYnkKPiA+IHYxIGZlZWRiYWNrICMxNSBKYW46IGhhbmRsZSB1cHBlci1oYWx2ZXMg
b2YgaHlwZXJjYWxsIGFyZ3MKPiA+IHYxIGZlZWRiYWNrICMxNSBKYW46IHVzZSB1bnNpZ25lZCB3
aGVyZSBuZWdhdGl2ZSB2YWx1ZXMgaW1wb3NzaWJsZQo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcmNhbGxfcGFnZS5TIHwgIDIgKy0KPiA+ICAgeGVuL2FyY2gveDg2L2h2bS9o
eXBlcmNhbGwuYyAgICAgICAgfCAgMyArKysKPiA+ICAgeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5j
ICAgICAgICAgICAgfCAgMyArKysKPiA+ICAgeGVuL2FyY2gveDg2L3B2L2h5cGVyY2FsbC5jICAg
ICAgICAgfCAgMyArKysKPgo+IFNvcnJ5IGZvciBub3RpY2luZyBxdWl0ZSBsYXRlIGluIHRoZSBw
cm9jZXNzLiBEb24ndCB5b3UgbmVlZCB0byBhZGQgdGhlCj4gaHlwZXJjYWxsIGluIHhlbi9hcmNo
L2FybS90cmFwcy5jPwoKT0sgLS0gdGhhbmtzLiBXaWxsIHRha2UgYSBsb29rLgoKQ2hyaXN0b3Bo
ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
