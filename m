From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 15:01:42 +0200
Message-ID: <97ede224-2af8-7410-ea78-0677192f9793@suse.com>
References: <20180420064005.14563-1-jgross@suse.com>
 <5AD9C0D302000078001BCEC4@suse.com>
 <c159bcd5-b298-8979-ab54-f95fca9d9fd7@suse.com>
 <5AD9DB6E02000078001BCFC9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9Vfd-0000k6-Io
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 13:01:45 +0000
In-Reply-To: <5AD9DB6E02000078001BCFC9@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTQ6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjA0LjE4IGF0
IDE0OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjAvMDQvMTggMTI6MjgsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjAuMDQuMTggYXQgMDg6NDAsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUK
Pj4+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+Pj4gQEAgLTQxLDE2
ICs0MSwxNCBAQCBsaW5rZmFybS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklMRVMpIEZPUkNF
Cj4+Pj4gICQoRCk6IGxpbmtmYXJtLnN0YW1wCj4+Pj4gIAkkKE1BS0UpIC1DICQoRCkveGVuIGRp
c3RjbGVhbgo+Pj4+ICAKPj4+PiAtLlBIT05ZOiBzaGltLSVjb25maWcKPj4+PiAtc2hpbS0lY29u
ZmlnOiAkKEQpIEZPUkNFCj4+Pj4gLQkkKE1BS0UpIC1DICQoRCkveGVuICQqY29uZmlnIFwKPj4+
PiAtCQlYRU5fQ09ORklHX0VYUEVSVD15IFwKPj4+PiAtCQlLQ09ORklHX0NPTkZJRz0kKENVUkRJ
Uikvc2hpbS5jb25maWcKPj4+PiArJChEKS94ZW4vLmNvbmZpZzogc2hpbS5jb25maWcgJChEKQo+
Pj4KPj4+IERvIHlvdSBuZWVkIHRoZSAkKEQpLyBwcmVmaXggaGVyZSwgLi4uCj4+Pgo+Pj4+ICsJ
Y3AgJDwgJEAKPj4+PiArCSQoTUFLRSkgLUMgJChEKS94ZW4gb2xkZGVmY29uZmlnIFwKPj4+Cj4+
PiAuLi4gaGVyZSwgYW5kIC4uLgo+Pj4KPj4+PiArCQlYRU5fQ09ORklHX0VYUEVSVD15Cj4+Pj4g
IAo+Pj4+IC14ZW4tc2hpbTogJChEKSBzaGltLW9sZGRlZmNvbmZpZwo+Pj4+ICt4ZW4tc2hpbTog
JChEKSAkKEQpL3hlbi8uY29uZmlnCj4+Pgo+Pj4gLi4uIGhlcmU/IEluIHRoZSBtaWRkbGUgY2Fz
ZSB1c2luZyAkKEBEKSBtaWdodCBiZSBiZXR0ZXIgYW55d2F5LiBPdGhlcgo+Pj4gdGhhbiB0aGF0
IExHVE0sIGJ1dCBwbGVhc2UgY29uc2lkZXIgcmVtb3ZpbmcgdGhlIGxpbmUgY29udGludWF0aW9u
cyBmcm9tCj4+PiB0aGUgbWFrZSBpbnZvY2F0aW9ucy4KPj4KPj4gWW91IGFyZSBhd2FyZSBvZiB0
aGUgbGluZSBmdXJ0aGVyIHVwOgo+Pgo+PiBEPXhlbi1yb290Cj4gCj4gT2gsIGluZGVlZC4gVGhp
cyB4ZW4tZGlyL3hlbi1yb290IGhpZXJhcmNoeSBpcyBjb25mdXNpbmcuCj4gCj4+IFNvICQoRCkv
eGVuIGlzIGp1c3QgdGhlIHBhdGggdG8gdGhlIGh5cGVydmlzb3IgcGFydCBvZiB0aGUgc2hpbS4g
VGhpcwo+PiBoYXMgbm90aGluZyB0byBkbyB3aXRoICQoQEQpIG9yIG90aGVyIHZhcmlhbnRzIG9m
IHRoZSBtYWtlIGF1dG9tYXRpYwo+PiB2YXJpYWJsZXMuCj4gCj4gVGhlIHN1Z2dlc3RlZCAkKEBE
KSB3b3VsZCBzdGlsbCBiZSB3b3J0aHdoaWxlIHRvIGhhdmUgaW1vLCBidXQgSSBhZ3JlZQo+IHlv
dSBjYW4ndCBkcm9wIHRoZSAkKEQpLyBwcmVmaXhlcy4KCk9rYXkuIEknbGwgc2VuZCBWMyBzb29u
IHVzaW5nICQoQEQpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
