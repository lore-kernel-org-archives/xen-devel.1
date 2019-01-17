From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 10/14] argo: implement the notify op
Date: Thu, 17 Jan 2019 05:04:55 -0700
Message-ID: <5C406F67020000780020EA57@prv1-mh.provo.novell.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-11-git-send-email-christopher.w.clark@gmail.com>
 <20190115161750.xl6shidfys2vjfx6@mac>
 <CACMJ4GYfVNfjn0c1gNSPyNRnTbvuhenDMWd-aAybkSuupjVzhQ@mail.gmail.com>
 <20190117111210.224ewn3ycdy6fhci@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk6Rj-0002Mi-4p
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 12:06:55 +0000
In-Reply-To: <20190117111210.224ewn3ycdy6fhci@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDEyOjEyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDE2LCAyMDE5IGF0IDEwOjU0OjQ4UE0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiBPbiBUdWUsIEphbiAxNSwgMjAxOSBhdCA4OjE5IEFNIFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4gPiBPbiBUdWUsIEphbiAxNSwg
MjAxOSBhdCAwMToyNzo0MkFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPj4gPiA+
ICsvKiBTdWZmaWNpZW50IHNwYWNlIHRvIHF1ZXVlIHNwYWNlX3JlcXVpcmVkIGJ5dGVzIGV4aXN0
cyAqLwo+PiA+ID4gKyNkZWZpbmUgWEVOX0FSR09fUklOR19EQVRBX0ZfU1VGRklDSUVOVCAgKDFV
IDw8IDMpCj4+ID4KPj4gPiBJIHdvdWxkIHJld29yZCB0aGlzIGFzOgo+PiA+Cj4+ID4gIlN1ZmZp
Y2llbnQgc3BhY2UgdG8gcXVldWUgc3BhY2VfcmVxdWlyZWQgYnl0ZXMgbWlnaHQgZXhpc3RzIgo+
PiA+Cj4+ID4gQmVjYXVzZSBBRkFJQ1QgYXMgc29vbiBhcyB0aGUgaHlwZXJ2aXNvciBkcm9wcyB0
aGUgTDMgbG9jayB0aGUgc3BhY2UKPj4gPiBhdmFpbGFibGUgbWlnaHQgY2hhbmdlLCBzbyB0aGUg
cmVjaXBpZW50IG9mIHRoZSBub3RpZmljYXRpb24gb3IgdGhlCj4+ID4gcmV0dXJuIGZyb20gdGhl
IGh5cGVyY2FsbCBzaG91bGRuJ3QgZXhwZWN0IHRoYXQgdGhlcmUgX211c3RfIGJlCj4+ID4gc3Bh
Y2VfcmVxdWlyZWQgYXZhaWxhYmxlIHNwYWNlIG9uIHRoZSByaW5nLgo+PiAKPj4gYWNrLiBkb2Vz
IHRoaXMgbG9vayBvaz8gLToKPj4gCj4+ICsgKiBTdWZmaWNpZW50IHNwYWNlIHRvIHF1ZXVlIHNw
YWNlX3JlcXVpcmVkIGJ5dGVzIGhhcyBiZWNvbWUgYXZhaWxhYmxlLgo+PiArICogSWYgbWVzc2Fn
ZXMgaGF2ZSBiZWVuIHNlbnQsIGl0IG1heSBub3Qgc3RpbGwgYmUgYXZhaWxhYmxlLgo+IAo+IEkg
dGhpbmsgbXkgc3VnZ2VzdGlvbiB3YXMgc2hvcnRlciBhbmQgY2xlYXJlciwgYnV0IEknbSBub3Qg
YSBuYXRpdmUKPiBzcGVha2VyIHNvIGlmIHlvdSB0aGluayB0aGUgYWJvdmUgaXMgYmV0dGVyIGFu
ZCBubyBvbmUgZWxzZSBjb21wbGFpbnMKPiB0aGF0J3MgZmluZSBmb3IgbWUuCgpGV0lXIEknZCBi
ZSBmaW5lIHdpdGggZWl0aGVyLCBidXQgd2l0aCBhIHNtYWxsIGFkanVzdG1lbnQgaW4gZWFjaCBj
YXNlOgpJbiB5b3VycyB0aGUgdHJhaWxpbmcgInMiIGxvb2tzIHdyb25nLiBJbiBDaHJpc3RvcGhl
cidzIEknZCBzdWdnZXN0IGl0IHRvCmJlICJJZiBmdXJ0aGVyIG1lc3NhZ2VzIGhhdmUgYmVlbiBz
ZW50LCAuLi4iLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
