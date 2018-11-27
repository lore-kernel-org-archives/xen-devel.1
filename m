From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] Increase framebuffer size to todays
 standards
Date: Tue, 27 Nov 2018 02:44:34 -0700
Message-ID: <5BFD12020200007800200418@prv1-mh.provo.novell.com>
References: <20181125191405.3028-1-olaf@aepfle.de>
 <5BFBCB7F02000078001FFD9B@prv1-mh.provo.novell.com>
 <20181126170335.01a6ac58.olaf@aepfle.de>
 <5BFC1C3A02000078002001EA@prv1-mh.provo.novell.com>
 <ce1163a4-35fb-c0a2-4deb-97fa2f348692@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2mkr=og=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRZv6-0003jb-S6
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:44:40 +0000
In-Reply-To: <ce1163a4-35fb-c0a2-4deb-97fa2f348692@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDEwOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEphbiwKPiAKPiBPbiAxMS8yNi8xOCA0OjE1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMjYuMTEuMTggYXQgMTc6MDMsIDxvbGFmQGFlcGZsZS5kZT4gd3JvdGU6Cj4+PiBBbSBN
b24sIDI2IE5vdiAyMDE4IDAzOjMxOjI3IC0wNzAwCj4+PiBzY2hyaWViICJKYW4gQmV1bGljaCIg
PEpCZXVsaWNoQHN1c2UuY29tPjoKPj4+Cj4+Pj4gQW5kIEkgdGhpbmsgYSBjaGFuZ2UgbGlrZSB0
aGlzIHNob3VsZCAoYSkgYWRkcmVzcyB0aGUgbW9yZSBnZW5lcmFsCj4+Pj4gY2FzZSByYXRoZXIg
dGhhbiBqdXN0IHlvdXIgbGFwdG9wIChvciBsYXB0b3BzIGluIGdlbmVyYWwpIGFuZCAoYikKPj4+
PiBhY3R1YWxseSBhZGQgc29tZSBoZWFkcm9vbS4gSGVuY2UgYXQgdGhlIHZlcnkgbGVhc3QgSSdk
IHNlZSB1cwo+Pj4+IGdvIHRvIDQwOTZ4MzA3Mi4gV0hVWEdBIHdvdWxkIGV2ZW4gY2FsbCBmb3Ig
NzY4MHg0ODAwLgo+Pj4KPj4+IFNvIHNob3VsZCBJIHJlc2VuZCB0aGlzIHBhdGNoIHdpdGggaGln
aGVyIHZhbHVlcywgb3Igc2hvdWxkIEkgcmVtb3ZlCj4+PiB0aGUgYm91bmRzIGNoZWNrIGVudGly
ZWx5PyBOb3Qgc3VyZSB3aGF0IGl0IGlzIHRyeWluZyB0byBhY2hpZXZlLCB0aGUKPj4+IGZyYW1l
YnVmZmVyIG1heSBmYWlsIGVpdGhlciB3YXkgaWYgdGhlIEJJT1MgcHJvdmlkZXMgYm9ndXMgdmFs
dWVzLgo+PiAKPj4gSSBoYXZlIHRvIGZvcndhcmQgdGhpcyBxdWVzdGlvbjogU3RlZmFubyBpbnRy
b2R1Y2VkIGFsbCBmaXZlIE1BWF8qCj4+IHZhbHVlcyBoZXJlIHdoZW4gc3BsaXR0aW5nIG91dCB0
aGUgTEZCIGNvZGUgaW4gY29tbWl0IGU3Y2IzNWU4YjEKPj4gKCJ4ZW46IGludHJvZHVjZSBhIGdl
bmVyaWMgZnJhbWVidWZmZXIgZHJpdmVyIikuIEkgYXBwYXJlbnRseSBkaWRuJ3QKPj4gZXZlbiBu
b3RpY2UgYmFjayB0aGVuIHRoYXQgdGhyZWUgb2YgdGhlbSBhcmUgZW50aXJlbHkgdW51c2VkLCBh
bmQKPj4gdGhlIHR3byBkaW1lbnNpb24gb25lcyBoYWQgbm8gdXBwZXIgYm91bmQgYmVmb3JlLgo+
PiAKPj4gU3RlZmFubzogV2h5IHdlcmUgYWxsIG9mIHRoZXNlIGludHJvZHVjZWQgKHRoZXJlJ3Mg
bm8gZXhwbGFuYXRpb24KPj4gaW4gdGhlIGRlc2NyaXB0aW9uKSBhbmQgd2hhdCB3ZXJlIHRoZSB2
YWx1ZXMgZGVyaXZlZCBmcm9tPyBXaWxsCj4+IGFueXRoaW5nIGJyZWFrIGlmIHdlIHJlbW92ZSB0
aGVtPwo+IAo+IEZXSVcsIGxvb2tpbmcgYXQgdGhlIGxvZ3MsIHRoaXMgd2FzIGludHJvZHVjZWQg
dG8gY2F0ZXIgYXJtIGZyYW1lYnVmZmVyIAo+IGRyaXZlci4gSG93ZXZlciwgd2UgZHJvcHBlZCB0
aGUgb25seSBkcml2ZXIgYSBmZXcgbW9udGhzIGFnbyBhcyBpdCB3YXMgCj4gbm90IG1haW50YWlu
ZWQuIFNvIHg4NiBpcyB0aGUgb25seSB1c2VyIG9mIHRoYXQgY29kZSB0b2RheS4KCkludGVyZXN0
aW5nLiBJIGFzc3VtZSB5b3UgbWVhbiBhcm1faGRsY2QuYy4gSSd2ZSBsb29rZWQgYXQgaXRzCjQu
MTEuMCB2ZXJzaW9uLCBhbmQgSSdtIGFmcmFpZCBJIHN0aWxsIGNhbid0IHNlZSBhIGNvbm5lY3Rp
b24gdG8KdGhlIHF1ZXN0aW9uYWJsZSBNQVhfKiB2YWx1ZXMuIFdoYXRldmVyIHdlIGdvIHdpdGgg
aXMgZ29pbmcKdG8gYmUgYSBiYWNrcG9ydCBjYW5kaWRhdGUgKGFzIG9idmlvdXNseSBzbGlnaHRs
eSBvbGRlciB2ZXJzaW9ucwpvZiBYZW4gd291bGQgYWxzbyBiZXR0ZXIgd29yayBwcm9wZXJseSB3
aXRoIGxhcmdlciBtb25pdG9ycyksCmFuZCBoZW5jZSBJJ2Qgc3RpbGwgbmVlZCB0byB1bmRlcnN0
YW5kIHRoZSBjb3JyZWxhdGlvbiwgcGVyaGFwcwp1bmxlc3MgYmFja3BvcnRpbmcgdGhlIHJlbW92
YWwgb2YgdGhhdCBkcml2ZXIgaXMgYWxzbyBkZXNpcmVkLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
