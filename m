From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 13/25] argo: implement the register op
Date: Fri, 04 Jan 2019 06:22:19 -0700
Message-ID: <5C2F5E0B020000780020A37A@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <20181212164721.hag6gc3akcm2gvhd@mac>
 <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
 <20181220125218.75t3cr3ehc6e4u6n@mac.citrite.net>
 <CACMJ4GaG8kZBkcFiEWMi_ENdJ4uX=c2YxFpgu_sKjUab7618dA@mail.gmail.com>
 <20190104085704.ga7wsqonhbzpv5as@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gfPQf-0005Yn-Fv
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 13:22:25 +0000
In-Reply-To: <20190104085704.ga7wsqonhbzpv5as@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE5IGF0IDA5OjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgRGVjIDIxLCAyMDE4IGF0IDAzOjA1OjAzUE0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiBPbiBUaHUsIERlYyAyMCwgMjAxOCBhdCA0OjUyIEFNIFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4gPgo+PiA+IE9uIFdlZCwgRGVj
IDE5LCAyMDE4IGF0IDA5OjQxOjU5UE0gLTA4MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+
PiA+ID4gT24gV2VkLCBEZWMgMTIsIDIwMTggYXQgODo0OCBBTSBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gPiA+Cj4+ID4gPiA+IE9uIEZyaSwgTm92
IDMwLCAyMDE4IGF0IDA1OjMyOjUyUE0gLTA4MDAsIENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+
PiA+IFRoZW4gSSB3b25kZXIgd2h5IHlvdSBuZWVkIHN1Y2ggY2hlY2sgaW4gYW55IGNhc2UgaWYg
dGhlIGNvZGUgY2FuCj4+ID4gaGFuZGxlIHN1Y2ggY2FzZXMsIHRoZSBtb3JlIHRoYW4gdGhlIGNo
ZWNrIGl0c2VsZiBpcyByYWN5Lgo+PiAKPj4gT0ssIHNvIGF0IHRoZSByb290IG9mIHRoZSBxdWVz
dGlvbiBoZXJlIGlzOiBkb2VzIGl0IG1hdHRlciB3aGF0IHRoZSBwMm0KPj4gdHlwZSBvZiB0aGUg
bWVtb3J5IGlzIGF0IHRoZXNlIHBvaW50czoKPj4gCj4+IDEpIHdoZW4gdGhlIGdmbiBpcyB0cmFu
c2xhdGVkIHRvIG1mbiwgYXQgdGhlIHRpbWUgb2YgcmluZyByZWdpc3RyYXRpb24KPiAKPiBUaGlz
IGlzIHRoZSBpbXBvcnRhbnQgY2hlY2ssIGJlY2F1c2UgdGhhdCdzIHdoZXJlIHlvdSBzaG91bGQg
dGFrZSBhCj4gcmVmZXJlbmNlIHRvIHRoZSBwYWdlLiBJbiB0aGlzIGNhc2UgeW91IHNob3VsZCBj
aGVjayB0aGF0IHRoZSBwYWdlIGlzCj4gb2YgcmFtX3J3IHR5cGUuCj4gCj4+IDIpIHdoZW4gdGhl
IGh5cGVydmlzb3Igd3JpdGVzIGludG8gZ3Vlc3QgbWVtb3J5Ogo+PiAgICAgLSB3aGVyZSB0aGUg
dHhfcHRyIGluZGV4IGlzIGluaXRpYWxpemVkIGluIHRoZSByZWdpc3RlciBvcAo+PiAgICAgLSB3
aGVyZSByaW5nYnVmIGRhdGEgaXMgd3JpdHRlbiBpbiBzZW5kdgo+PiAgICAgLSB3aGVyZSByaW5n
IGRlc2NyaXB0aW9uIGRhdGEgaXMgd3JpdHRlbiBpbiBub3RpZnkKPiAKPiBBcyBsb25nIGFzIHlv
dSBrZWVwIGEgcmVmZXJlbmNlIHRvIHRoZSBwYWdlcyB0aGF0IGFyZSBwYXJ0IG9mIHRoZSByaW5n
Cj4geW91IGRvbid0IG5lZWQgdG8gZG8gYW55IGNoZWNrcyB3aGVuIHdyaXRpbmcvcmVhZGluZyBm
cm9tIHRoZW0uIElmIHRoZQo+IGd1ZXN0IG1lc3NlcyB1cCBpdCdzIHAybSBhbmQgZG9lcyBjaGFu
Z2UgdGhlIGdmbiAtPiBtZm4gbWFwcGluZ3MgZm9yCj4gcGFnZXMgdGhhdCBhcmUgcGFydCBvZiB0
aGUgcmluZyB0aGF0J3MgdGhlIGd1ZXN0IHByb2JsZW0sIHRoZQo+IGh5cGVydmlzb3Igc3RpbGwg
aGFzIGEgcmVmZXJlbmNlIHRvIHRob3NlIHBhZ2VzIHNvIHRoZXkgd29uJ3QgYmUKPiByZXVzZWQu
CgpGb3IgdXNlIGNhc2VzIGxpa2UgaW50cm9zcGVjdGlvbiB0aGlzIG1heSBub3QgYmUgZnVsbHkg
Y29ycmVjdCwKYnV0IGl0IG1heSBhbHNvIGJlIHRoYXQgbXkgdW5kZXJzdGFuZGluZyB0aGVyZSBp
c24ndCBmdWxseQpjb3JyZWN0LiBJZiBpbnRyb3NwZWN0aW9uIGFnZW50cyBjYXJlIGFib3V0IF9h
bnlfIHdyaXRlcyB0bwphIHBhZ2UsIGh5cGVydmlzb3Igb25lcyAod2hpY2ggaW4gbW9zdCBjYXNl
cyBhcmUgbWVyZWx5CndyaXRlcyBvbiBiZWhhbGYgb2YgdGhlIGd1ZXN0KSBtaWdodCBtYXR0ZXIg
YXMgd2VsbC4gSSB0aGluawp0byBkZWNpZGUgd2hldGhlciBwYWdlIGFjY2Vzc2VzIG5lZWQgdG8g
YmUgYWNjb21wYW5pZWQKYnkgYW55IGNoZWNrcyAoYW5kIGlmIHNvLCB3aGljaCBvbmVzKSBvbmUg
bmVlZHMgdG8KLSBlc3RhYmxpc2ggd2hhdCBwMm0gdHlwZSB0cmFuc2l0aW9ucyBhcmUgcG9zc2li
bGUgZm9yIGEKICBnaXZlbiBwYWdlLAotIHZlcmlmeSB3aGF0IHJlc3RyaWN0aW9ucyBtYXkgb2Nj
dXIgImJlaGluZCB0aGUgYmFjayIgb2YKICB0aGUgZW50aXR5IHdhbnRpbmcgdG8gZG8gdGhlIGFj
Y2Vzc2VzLAotIGV4cGxvcmUgd2hldGhlciBkb2luZyB0aGUgZXh0cmEgY2hlY2tpbmcgYXQgcDJt
IHR5cGUKICBjaGFuZ2UgdGltZSB3b3VsZG4ndCBiZSBiZXR0ZXIgdGhhbiBhdCB0aGUgdGltZSBv
ZiBhY2Nlc3MuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
