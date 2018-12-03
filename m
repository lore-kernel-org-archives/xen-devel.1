From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 0/3] Remove tmem
Date: Mon, 03 Dec 2018 02:56:05 -0700
Message-ID: <5C04FDB50200007800202190@prv1-mh.provo.novell.com>
References: <20181128135806.20201-1-wei.liu2@citrix.com>
 <23553.28374.811568.188716@mariner.uk.xensource.com>
 <20181130180157.lz4vaos5zjxlshc4@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTkzU-0001mC-3y
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 09:58:12 +0000
In-Reply-To: <20181130180157.lz4vaos5zjxlshc4@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDE5OjAxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBOb3YgMzAsIDIwMTggYXQgMDU6MDk6NDJQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4+IFdlaSBMaXUgd3JpdGVzICgiW1BBVENIIHYyIDAvM10gUmVtb3ZlIHRtZW0iKToKPj4g
PiBJdCBpcyBhZ3JlZWQgdGhhdCB0bWVtIGNhbiBiZSByZW1vdmVkIGZyb20geGVuLmdpdC4gU2Vl
IHRoZSB0aHJlYWQgc3RhcnRpbmcgCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gICAgIAo+PiA+
IGZyb20gPEQ1RTg2NkIyLTk2RjQtNEU4OS05NDFFLTczRjU3OERGMkYxN0BjaXRyaXguY29tPi4K
Pj4gCj4+IFRob3NlIGFyZSBub3RlcyBmcm9tIHNvbWUgcGhvbmUgY2FsbCBhbW9uZ3N0IGluZHVz
dHJ5IHN0YWtlaG9sZGVycy4KPj4gTm9uZSBvZiB0aGUgbWVzc2FnZXMgaGF2ZSBhIFN1YmplY3Qg
bGluZSBtZW50aW9uaW5nIHRtZW0uICBUaGVyZSBpcyBubwo+PiBleHBsYW5hdGlvbiBvZiB0aGUg
YmFzaXMgZm9yIHRoZSBkZWNpc2lvbjsganVzdCBhIGNvbmZpcm1hdGlvbiBmcm9tCj4+IHRoZSBj
dXJyZW50IG1haW50YWluZXJzIHRoYXQgdGhleSB3aWxsIGFjayB0aGUgcmVtb3ZhbC4KPj4gCj4+
IEkgdGhpbmsgdGhpcyBpcyBub3QgcmVhbGx5IGFuIGFwcHJvcHJpYXRlIHdheSB0byBjYXJyeSBv
biEgIFdoYXQgaWYKPj4gdGhlcmUgaXMgc29tZW9uZSBlbHNlIHdobyB3YW50cyB0byBzdGVwIHVw
IHRvIG1haW50YWluIHRoaXMgPyAgV2hhdAo+PiBhYm91dCB1c2VyIGNvbW11bmljYXRpb24gPyAg
R29pbmcgc3RyYWlnaHQgZnJvbSBgU3VwcG9ydGVkJyB0bwo+PiBgRGVsZXRlZCcgc2VlbXMgcmF0
aGVyIHZpZ29yb3VzLgo+IAo+IFN0ZXAgdXAgdG8gbWFpbnRhaW4+IEkgd291bGQgcmF0aGVyIHNh
eSBzdGVwIHVwIHRvIGRldmVsb3AuCj4gCj4gVGhlIHN0YXR1cyBpbiBNQUlOVEFJTkVSUyBpcyB3
cm9uZy4gQWNjb3JkaW5nIHRvIFNVUFBPUlQubWQsIGl0IGlzIG9ubHkKPiBleHBlcmltZW50YWwu
IE91ciBkZWZpbml0aW9uIG9mICJleHBlcmltZW50YWwiIGlzOgo+IAo+ICAgIEZ1bmN0aW9uYWwg
Y29tcGxldGVuZXNzOiBObwo+ICAgIEZ1bmN0aW9uYWwgc3RhYmlsaXR5OiBIZXJlIGJlIGRyYWdv
bnMKPiAgICBJbnRlcmZhY2Ugc3RhYmlsaXR5OiBOb3Qgc3RhYmxlCj4gICAgU2VjdXJpdHkgc3Vw
cG9ydGVkOiBObwoKRXhhY3RseS4gUGx1cyBteSBwcm9wb3NhbCB0byByZW1vdmUgaXQgd2FzIHBv
c3RlZCB0byB4ZW4tZGV2ZWwKb24gQXVnIDMwdGguIEkgZG9uJ3QgdGhpbmsgcmVtb3ZhbCBvZiBh
biBleHBlcmltZW50YWwgZmVhdHVyZQpyZXF1aXJlcyBwb3N0aW5nIHRvIHhlbi1hbm5vdW5jZS4g
SWFuIC0gcGxlYXNlIHJlY29uc2lkZXIgeW91cgpuYWNrLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
