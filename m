From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/15] re-work commit 3e06b989 "IOMMU:
 make page table population preemptible"...
Date: Thu, 02 Aug 2018 02:18:30 -0600
Message-ID: <5B62BE5602000078001DA2E3@prv1-mh.provo.novell.com>
References: <20180801134028.1654-1-paul.durrant@citrix.com>
 <20180801134028.1654-2-paul.durrant@citrix.com>
 <5B62B09A02000078001DA278@prv1-mh.provo.novell.com>
 <74e395deae9549c3a05fccb1241c35ae@AMSPEX02CL03.citrite.net>
 <3d83229e473b4430969e1dbde9ef7125@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zvpq=kr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fl8oc-0004G0-7d
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:18:34 +0000
In-Reply-To: <3d83229e473b4430969e1dbde9ef7125@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA4LjE4IGF0IDEwOjA0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBQYXVsIER1cnJhbnQKPj4gU2VudDogMDIgQXVndXN0IDIwMTggMDk6MDMKPj4g
PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiA+IFNlbnQ6
IDAyIEF1Z3VzdCAyMDE4IDA4OjIwCj4+ID4gPj4+IE9uIDAxLjA4LjE4IGF0IDE1OjQwLCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ID4gLi4udG8gc2ltcGxpZnkgdGhlIGlt
cGxlbWVudGF0aW9uIGFuZCB0dXJuIG5lZWRfaW9tbXUgYmFjayBpbnRvIGEKPj4gPiBib29sZWFu
Lgo+PiA+ID4KPj4gPiA+IEFzIG5vdGVkIGluIFsxXSB0aGUgdHJpLXN0YXRlIG5hdHVyZSBvZiBu
ZWVkX2lvbW11IGFmdGVyIGNvbW1pdAo+PiAzZTA2Yjk4OQo+PiA+IGlzCj4+ID4gPiBjb25mdXNp
bmcsIGFzIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwcmUtZW1wdGlvbiB1c2luZyByZWxtZW1f
bGlzdC4KPj4gPiA+Cj4+ID4gPiBUaGlzIHBhdGNoIGluc3RlYWQgdXNlcyBhIHNpbXBsZSBjb3Vu
dCBvZiBwYWdlcyBhbHJlYWR5IHBvcHVsYXRlZCBzdG9yZWQKPj4gaW4KPj4gPiA+IHRoZSB4ODYg
dmFyaWFudCBvZiBzdHJ1Y3QgYXJjaF9pb21tdSBhbmQgc2tpcHMgb3ZlciB0aGF0IG51bWJlciBv
Zgo+PiBwYWdlcwo+PiA+ID4gaWYgYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgaXMg
cmUtaW52b2tlZCBhZnRlciBwcmUtZW1wdGlvbi4KPj4gPgo+PiA+IFdlbGwsIHllcywgSSB3b3Vs
ZCBoYXZlIHVzZWQgdGhhdCBtb2RlbCBpbiBzYWlkIGNvbW1pdCBpZiBpdCB3YXMgcmVsaWFibGUs
Cj4+ID4gYnV0IGl0IGlzbid0OiBXaGF0IGlmIHRoZSBsaXN0IG9mIHBhZ2VzIGNoYW5nZWQgYmV0
d2VlbiB0d28gKHJlLSlpbnZvY2F0aW9ucz8KPj4gCj4+IElzIHRoYXQgcmVhbGx5IGdvaW5nIHRv
IGhhcHBlbj8gVGhpcyBpcyB0aGUgcmVzdWx0IG9mIGEgZG9tY3RsLCB3aGljaCBpcyBhIHRvb2xz
LQo+PiBvbmx5IGh5cGVyY2FsbCByaWdodD8KPiAKPiBPaCwgSSBzZWUgd2hhdCB5b3UgbWVhbi4u
LiB0aGUgZ3Vlc3QgY291bGQgZG8gc29tZXRoaW5nIGxpa2UgYSAKPiBkZWNyZWFzZV9yZXNlcnZh
dGlvbi4uLiBJIHdhcyBvdmVybG9va2luZyB0aGF0IHNldHRpbmcgdXAgdGhlIGlvbW11IGlzIAo+
IGhhcHBlbmluZyB3aGlsZSB0aGUgZ3Vlc3QgaXMgbGl2ZS4gV291bGQgaXQgYmUgcmVhc29uYWJs
ZSB0byBkb21haW5fcGF1c2UoKSAKPiBmb3Igc2FmZXR5IHRoZW4/CgpJJ20gaGVzaXRhbnQgdG8g
c2VlIGRvbWFpbnMgKG9yIHZjcHVzKSBwYXVzZWQgb3RoZXIgdGhhbiB3aGVuIGFic29sdXRlbHkK
bmVjZXNzYXJ5LiBJZiBldmVyeW9uZSBlbHNlIHRoaW5rcyB0aGlzIGlzIGEgZ29vZCBpZGVhIGhl
cmUsIEkgdGhpbmsgSSB3b24ndApvYmplY3QsIGJ1dCBwbGVhc2UgZG9uJ3QgZm9yZ2V0IHRoYXQg
YW55IHBhdXNpbmcgZm9yIHBlcmhhcHMgYW4gZXh0ZW5kZWQKcGVyaW9kIG9mIHRpbWUgbWF5IGNh
dXNlIHRoZSBndWVzdCB0byBtaXNiZWhhdmUgc3Vic2VxdWVudGx5LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
