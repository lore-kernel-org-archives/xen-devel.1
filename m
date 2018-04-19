From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Thu, 19 Apr 2018 17:14:38 +0100
Message-ID: <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
 <20180419145453.ahbpxclr5isbhdcm@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bix4=hi=citrix.com=prvs=64008f423=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f9CCn-0001sn-Rf
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:14:41 +0000
In-Reply-To: <20180419145453.ahbpxclr5isbhdcm@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDQvMTggMTU6NTQsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMTksIDIwMTgg
YXQgMDE6MDE6NTNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTkvMDQvMTgg
MTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTkuMDQuMTggYXQgMTI6MzAsIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIv
TWFrZWZpbGUKPj4+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+Pj4g
QEAgLTQxLDIxICs0MSwyMiBAQCBsaW5rZmFybS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklM
RVMpIEZPUkNFCj4+Pj4gICQoRCk6IGxpbmtmYXJtLnN0YW1wCj4+Pj4gIAkkKE1BS0UpIC1DICQo
RCkveGVuIGRpc3RjbGVhbgo+Pj4+ICAKPj4+PiAtLlBIT05ZOiBzaGltLSVjb25maWcKPj4+PiAt
c2hpbS0lY29uZmlnOiAkKEQpIEZPUkNFCj4+Pj4gLQkkKE1BS0UpIC1DICQoRCkveGVuICQqY29u
ZmlnIFwKPj4+IEkgdGhpbmsgdGhlcmUgd2FzIGEgcmVhc29uIGZvciB0aGUgJSBhbmQgJCouCj4+
IFRoZSBvbmx5IG9uZSBJIGNvdWxkIHRoaW5rIG9mIGlzIHRoZSBwb3NzaWJpbGl0eSB0byBkbwo+
Pgo+PiBtYWtlIHNoaW0tZGVmYXVsdGNvbmZpZwo+Pgo+PiBvciBzaW1pbGFyIGNhbGxzLiBRdWVz
dGlvbiBpcyB3aG8gd2lsbCBldmVyIG5lZWQgdGhhdC4gSW4gY2FzZSBpdCBpcwo+PiBiZWxpZXZl
ZCB0byBiZSB2YWx1YWJsZSBJIGNhbiBrZWVwIGl0Lgo+IE5vdCBsaWtlbHkgSSB0aGluay4KClVz
aW5nIGBtYWtlIHNoaW0tbWVudWNvbmZpZ2Agd2FzIGEgc3BlY2lmaWMgdXNlY2FzZSBmb3IgbXkg
b3JpZ2luYWwKdmVyc2lvbiwgYnV0IHdpdGggdGhpcyBkaWZmZXJlbmNlIGluIHJlcHJlc2VudGF0
aW9uLCB0aGUgdXNlY2FzZSBoYXMKbW9zdGx5IGdvbmUgYXdheS4KCldpdGggdGhpcyBjaGFuZ2Ug
aW4gcGxhY2UsIHdoYXQgaXMgdGhlIGV4cGVjdGVkIHdvcmtmbG93IGZvciBtYWtpbmcgYW4KdXBk
YXRlIHRvIHRoZSBjb25maWd1cmF0aW9uPwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
