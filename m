From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/18] xen/arm64: Suspend to RAM support for
 Xen
Date: Tue, 13 Nov 2018 10:06:58 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811130955250.8259@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
 <alpine.DEB.2.10.1811121819440.8259@sstabellini-ThinkPad-X260>
 <1a7a9a08-b285-9b0a-aab4-4c093cdbb5a7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+wyv=ny=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gMd5a-00078s-D2
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 18:07:02 +0000
In-Reply-To: <1a7a9a08-b285-9b0a-aab4-4c093cdbb5a7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dm@aggios.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, saeed.nowshadi@xilinx.com, Jan Beulich <jbeulich@suse.com>, stefano.stabellini@xilinx.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMyBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTMvMTEvMjAxOCAwMjoyMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
TW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBIaSBNaXJlbGEsCj4g
PiA+IAo+ID4gPiBUaGFuayB5b3UgZm9yIHBvc3RpbmcgdGhlIHNlcmllcy4gQ291bGQgeW91IHBy
b3ZpZGUgYSBicmFuY2ggd2l0aCB0aGUKPiA+ID4gcGF0Y2gKPiA+ID4gYXBwbGllZD8KPiA+ID4g
Cj4gPiA+IE9uIDExLzEyLzE4IDExOjMwIEFNLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+ID4g
PiA+IAo+ID4gPiA+IAo+ID4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gVGhl
IHNlcmllcyBkb2VzIG5vdCBpbmNsdWRlOgo+ID4gPiA+IGEpIFVBUlQgZHJpdmVyLXNwZWNpZmlj
IHN1c3BlbmQvcmVzdW1lIHRoYXQgZ2V0cyBjYWxsZWQgd2hlbiBjb25zb2xlCj4gPiA+ID4gc3Vz
cGVuZHMKPiA+ID4gCj4gPiA+IEkgZmVlbCBpdCB3aWxsIGJlIGRpZmZpY3VsdCB0byB0ZXN0IHRo
aXMgc2VyaWVzIHdpdGhvdXQgVUFSVCBkcml2ZXIKPiA+ID4gc3VwcG9ydC4KPiA+ID4gV291bGQg
aXQgYmUgcG9zc2libGUgdG8gaW50ZWdyYXRlIHRoZW0gaW4gdGhhdCBzZXJpZXM/Cj4gPiAKPiA+
IEFjdHVhbGx5LCB5b3UgY2FuIHRlc3QgdGhpcyBzZXJpZXMgc2ltcGx5IHVzaW5nIHVwc3RyZWFt
IExpbnV4IGFuZAo+ID4gdXBzdHJlYW0gWGVuICsgdGhpcyBzZXJpZXMuIFlvdSBjYW4gdXNlIGVj
aG8gbWVtID4gL3N5cy9wb3dlci9zdGF0ZSBpbgo+ID4gZG9tMCB0byBnbyBpbnRvIHN1c3BlbmQs
IGFuZCBmb3IgZXhhbXBsZSBzZXR1cCBhbiBSVEMgd2FrZXVwIGV2ZW50IHRvCj4gPiB3YWtldXAg
YWZ0ZXIgYSBjZXJ0YWluIGFtb3VudCBvZiB0aW1lLiBGb3IgaW5zdGFuY2UgZWNobyArMzAgPgo+
ID4gL3N5cy9jbGFzcy9ydGMvcnRjMC93YWtlYWxhcm0uCj4gCj4gSSBhbSBxdWl0ZSBzdXJwcmlz
ZWQgdGhpcyBzZXJpZXMgaXMgZW5vdWdoIGdpdmVuIHRoZXJlIGFyZSBhIEJVRygpIGluIHRoZQo+
IHN1c3BlbmQgcGF0aCBmb3IgdGhlIGNvbnNvbGUuCj4gCj4gU28gd2hhdCBpcyB5b3VyIHhlbiBj
b21tYW5kIGxpbmU/CgpObywgSSBtYWRlIGEgbWlzdGFrZSBpbiByZWJhc2luZyBNaXJlbGEncyBi
cmFuY2g6IEkgdGVzdGVkIGEgYnJhbmNoCndoaWNoIGluY2x1ZGVkIHRoZSB0d28gdW5zZW50IHBh
dGNoZXMgdGhhdCByZW1vdmVkIGV4YWN0bHkgdGhlIEJVRygpIHlvdQphcmUgdGFsa2luZyBhYm91
dC4gV2l0aG91dCB0aG9zZSB0d28gcGF0Y2hlcywgWGVuIGlzIHVuYWJsZSB0byByZXN1bWUKY29y
cmVjdGx5IG9uIHRoZSBNUFNvQyBkdWUgdG8gdGhlIFVBUlQuCgpNaXJlbGEsIGl0IGlzIGJldHRl
ciB0byBpbmNsdWRlIHRoZSB0d28gcGF0Y2hlcyBpbiB5b3VyIG5leHQgdmVyc2lvbiBvZgp0aGUg
c2VyaWVzLiBJZiB5b3UgdGhpbmsgdGhleSBhcmUgbm90IHVwIHRvIHF1YWxpdHkgZm9yIGJlaW5n
IG1lcmdlZAp1cHN0cmVhbSwgaS5lLiB0aGV5IGFyZSBqdXN0IGhhY2tzIGZvciB0ZXN0aW5nLCB0
aGF0J3MgT0ssIHRhZyB0aGVtIHdpdGgKW1BBVENIIERPLU5PVC1BUFBMWV0gdG8gbWFrZSBpdCBj
bGVhci4gSXQgaXMgYWxzbyB1c2VmdWwgdG8gcG9zdCBhIGdpdApicmFuY2ggaW4geW91ciAwIGVt
YWlsIHdoZW4gdGhlIHBhdGNoIHNlcmllcyBpcyBsYXJnZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
