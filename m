From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 10:28:32 +0100
Message-ID: <20180420092832.7uwpwgiaq4ak7inh@MacBook-Pro-de-Roger.local>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
 <20180419145453.ahbpxclr5isbhdcm@citrix.com>
 <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
 <20180419162227.vo7cgh6tqe5npu3w@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ijpn=hj=citrix.com=prvs=6414baf61=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f9SLQ-00067A-Du
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 09:28:40 +0000
Content-Disposition: inline
In-Reply-To: <20180419162227.vo7cgh6tqe5npu3w@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDU6MjI6MjhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEFwciAxOSwgMjAxOCBhdCAwNToxNDozOFBNICswMTAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+ID4gT24gMTkvMDQvMTggMTU6NTQsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9uIFRo
dSwgQXByIDE5LCAyMDE4IGF0IDAxOjAxOjUzUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
Cj4gPiA+PiBPbiAxOS8wNC8xOCAxMjo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+Pj4+Pj4g
T24gMTkuMDQuMTggYXQgMTI6MzAsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+ID4gPj4+PiAt
LS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4gPiA+Pj4+ICsrKyBiL3Rvb2xz
L2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiA+ID4+Pj4gQEAgLTQxLDIxICs0MSwyMiBAQCBs
aW5rZmFybS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklMRVMpIEZPUkNFCj4gPiA+Pj4+ICAk
KEQpOiBsaW5rZmFybS5zdGFtcAo+ID4gPj4+PiAgCSQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNs
ZWFuCj4gPiA+Pj4+ICAKPiA+ID4+Pj4gLS5QSE9OWTogc2hpbS0lY29uZmlnCj4gPiA+Pj4+IC1z
aGltLSVjb25maWc6ICQoRCkgRk9SQ0UKPiA+ID4+Pj4gLQkkKE1BS0UpIC1DICQoRCkveGVuICQq
Y29uZmlnIFwKPiA+ID4+PiBJIHRoaW5rIHRoZXJlIHdhcyBhIHJlYXNvbiBmb3IgdGhlICUgYW5k
ICQqLgo+ID4gPj4gVGhlIG9ubHkgb25lIEkgY291bGQgdGhpbmsgb2YgaXMgdGhlIHBvc3NpYmls
aXR5IHRvIGRvCj4gPiA+Pgo+ID4gPj4gbWFrZSBzaGltLWRlZmF1bHRjb25maWcKPiA+ID4+Cj4g
PiA+PiBvciBzaW1pbGFyIGNhbGxzLiBRdWVzdGlvbiBpcyB3aG8gd2lsbCBldmVyIG5lZWQgdGhh
dC4gSW4gY2FzZSBpdCBpcwo+ID4gPj4gYmVsaWV2ZWQgdG8gYmUgdmFsdWFibGUgSSBjYW4ga2Vl
cCBpdC4KPiA+ID4gTm90IGxpa2VseSBJIHRoaW5rLgo+ID4gCj4gPiBVc2luZyBgbWFrZSBzaGlt
LW1lbnVjb25maWdgIHdhcyBhIHNwZWNpZmljIHVzZWNhc2UgZm9yIG15IG9yaWdpbmFsCj4gPiB2
ZXJzaW9uLCBidXQgd2l0aCB0aGlzIGRpZmZlcmVuY2UgaW4gcmVwcmVzZW50YXRpb24sIHRoZSB1
c2VjYXNlIGhhcwo+ID4gbW9zdGx5IGdvbmUgYXdheS4KPiA+IAo+ID4gV2l0aCB0aGlzIGNoYW5n
ZSBpbiBwbGFjZSwgd2hhdCBpcyB0aGUgZXhwZWN0ZWQgd29ya2Zsb3cgZm9yIG1ha2luZyBhbgo+
ID4gdXBkYXRlIHRvIHRoZSBjb25maWd1cmF0aW9uPwo+ID4gCj4gCj4gSnVzdCBjb21taXQgdGhl
IG11c3QtaGF2ZSdzIHRvIHRoZSB0cmFja2VkIGZpbGUgYW5kIGxldCBYZW4ncyBidWlsZAo+IHN5
c3RlbSBoYW5kbGUgdGhlIHJlc3Q/CgorMS4gQXMgYSBiYXJlIG1pbmltdW06CgpDT05GSUdfWEVO
X0dVRVNUPXkKQ09ORklHX1BWSF9HVUVTVD15CkNPTkZJR19QVl9TSElNPXkKQ09ORklHX1BWX1NI
SU1fRVhDTFVTSVZFPXkKCkJ1dCBJIGV4cGVjdCBzb21lIG1vcmUgbWlnaHQgYmUgbmVlZGVkLgoK
SGF2aW5nIGEgZnVsbCBjb25maWcgd2lsbCBhbHdheXMgYmUgYSBQSVRBIGJlY2F1c2UgaXQgd2ls
bCBnZXQgb3V0IG9mCnN5bmNoLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
