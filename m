From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Tue, 15 Jan 2019 02:01:52 -0700
Message-ID: <5C3DA180020000780020DA53@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <90a21420-9f9f-7a8f-32e5-b00e3e3bd1d0@citrix.com>
 <CACMJ4GZHU+8431ToXqPjU=_a1MhYiih-R=OcPqXei88a0=yJZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjKbc-0001Kw-0Q
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 09:01:56 +0000
In-Reply-To: <CACMJ4GZHU+8431ToXqPjU=_a1MhYiih-R=OcPqXei88a0=yJZA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Tim Deegan <tim@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDA4OjIxLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDE0LCAyMDE5IGF0IDY6NTggQU0gQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA3LzAxLzIwMTkgMDc6NDIs
IENocmlzdG9waGVyIENsYXJrIHdyb3RlOgo+PiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYwo+PiA+ICsrKyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
Ywo+PiA+IEBAIC0xODIsNiArMTgyLDE3IEBAIFBlcm1pdCBYZW4gdG8gdXNlICJBbHdheXMgUnVu
bmluZyBBUElDIFRpbWVyIiBzdXBwb3J0IG9uIGNvbXBhdGlibGUgaGFyZHdhcmUKPj4gPiAgaW4g
Y29tYmluYXRpb24gd2l0aCBjcHVpZGxlLiAgVGhpcyBvcHRpb24gaXMgb25seSBleHBlY3RlZCB0
byBiZSB1c2VmdWwgZm9yCj4+ID4gIGRldmVsb3BlcnMgd2lzaGluZyBYZW4gdG8gZmFsbCBiYWNr
IHRvIG9sZGVyIHRpbWluZyBtZXRob2RzIG9uIG5ld2VyIGhhcmR3YXJlLgo+PiA+Cj4+ID4gKyMj
IyBhcmdvCj4+ID4gKz4gYD0gPGJvb2xlYW4+YAo+PiA+ICsKPj4gPiArPiBEZWZhdWx0OiBgZmFs
c2VgCj4+ID4gKwo+PiA+ICtFbmFibGUgdGhlIEFyZ28gaHlwZXJ2aXNvci1tZWRpYXRlZCBpbnRl
cmRvbWFpbiBjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KPj4gPiArCj4+ID4gK1RoaXMgYWxsb3dz
IGRvbWFpbnMgYWNjZXNzIHRvIHRoZSBBcmdvIGh5cGVyY2FsbCwgd2hpY2ggc3VwcG9ydHMgcmVn
aXN0cmF0aW9uCj4+ID4gK29mIG1lbW9yeSByaW5ncyB3aXRoIHRoZSBoeXBlcnZpc29yIHRvIHJl
Y2VpdmUgbWVzc2FnZXMsIHNlbmRpbmcgbWVzc2FnZXMgdG8KPj4gPiArb3RoZXIgZG9tYWlucyBi
eSBoeXBlcmNhbGwgYW5kIHF1ZXJ5aW5nIHRoZSByaW5nIHN0YXR1cyBvZiBvdGhlciBkb21haW5z
Lgo+Pgo+PiBQbGVhc2UgZG8gaW5jbHVkZSBhIG5vdGUgYWJvdXQgQ09ORklHX0FSR08uICBJIGtu
b3cgdGhpcyBkb2MgaXMKPj4gaW5jb25zaXN0ZW50IG9uIHRoZSBtYXR0ZXIgKGFzIEtjb25maWcg
cG9zdGRhdGVzIHRoZSB3cml0dGVuIGVudHJpZXMKPj4gaGVyZSksIGJ1dCBJIGhhdmUgYmVlbiB0
cnlpbmcgdG8gZml4IHVwLCBhbmQgbm93IGFib3V0IGhhbGYgb2YgdGhlCj4+IGRvY3VtZW50YXRp
b24gZG9lcyBtZW50aW9uIGFwcHJvcHJpYXRlIEtjb25maWcgaW5mb3JtYXRpb24uCj4gCj4gQWNr
LCBub3RlIGFkZGVkLgoKSnVzdCB0byB2b2ljZSBteSB2aWV3IGhlcmU6IFdoaWxlIEkgYWdyZWUg
dGhhdCBzb21lIGZvcm0gb2YgaW5kaWNhdGlvbgpzaG91bGQgYmUgYWRkZWQsIEkgZG9uJ3QgdGhp
bmsgQ09ORklHX0FSR08gc2hvdWxkIGJlIG1lbnRpb25lZC4KQ09ORklHXyogaW4gZ2VuZXJhbCBh
cmUgbGlrZWx5IG1lYW5pbmdsZXNzIHRvIHRoZSBtYWluIGF1ZGllbmNlIG9mCnRoaXMgZmlsZSAo
YWRtaW5zIHJhdGhlciB0aGFuIGRldmVsb3BlcnMpLiBIZW5jZSB0aGUgd29yZGluZyBzaG91bGQg
YmUKbW9zdGx5IGluZGVwZW5kZW50IG9mIHRoZSBwcmVjaXNlIGNvbmZpZyBvcHRpb24gbmFtZTsg
dGhlcmUgbWF5IHRoZW4KYmUgYW4gYW5ub3RhdGlvbiBuYW1pbmcgdGhlIG9wdGlvbi4gT21pdHRp
bmcgdGhlIG9wdGlvbiBuYW1lLCBvdG9oLApoYXMgdGhlIGJlbmVmaXQgb2Ygbm90IGJlYXJpbmcg
dGhlIHJpc2sgb2YgZ29pbmcgc3RhbGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
