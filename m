From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 08:40:13 +0200
Message-ID: <8a73d86e-27ee-2d11-50ef-01070a9746ad@suse.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
 <20180419145453.ahbpxclr5isbhdcm@citrix.com>
 <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9PiS-0002ns-Fu
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 06:40:16 +0000
In-Reply-To: <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDQvMTggMTg6MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTkvMDQvMTggMTU6
NTQsIFdlaSBMaXUgd3JvdGU6Cj4+IE9uIFRodSwgQXByIDE5LCAyMDE4IGF0IDAxOjAxOjUzUE0g
KzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxOS8wNC8xOCAxMjo0NywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTkuMDQuMTggYXQgMTI6MzAsIDxqZ3Jvc3NAc3VzZS5j
b20+IHdyb3RlOgo+Pj4+PiAtLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+
Pj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPj4+Pj4gQEAgLTQxLDIx
ICs0MSwyMiBAQCBsaW5rZmFybS5zdGFtcDogJChERVBfRElSUykgJChERVBfRklMRVMpIEZPUkNF
Cj4+Pj4+ICAkKEQpOiBsaW5rZmFybS5zdGFtcAo+Pj4+PiAgCSQoTUFLRSkgLUMgJChEKS94ZW4g
ZGlzdGNsZWFuCj4+Pj4+ICAKPj4+Pj4gLS5QSE9OWTogc2hpbS0lY29uZmlnCj4+Pj4+IC1zaGlt
LSVjb25maWc6ICQoRCkgRk9SQ0UKPj4+Pj4gLQkkKE1BS0UpIC1DICQoRCkveGVuICQqY29uZmln
IFwKPj4+PiBJIHRoaW5rIHRoZXJlIHdhcyBhIHJlYXNvbiBmb3IgdGhlICUgYW5kICQqLgo+Pj4g
VGhlIG9ubHkgb25lIEkgY291bGQgdGhpbmsgb2YgaXMgdGhlIHBvc3NpYmlsaXR5IHRvIGRvCj4+
Pgo+Pj4gbWFrZSBzaGltLWRlZmF1bHRjb25maWcKPj4+Cj4+PiBvciBzaW1pbGFyIGNhbGxzLiBR
dWVzdGlvbiBpcyB3aG8gd2lsbCBldmVyIG5lZWQgdGhhdC4gSW4gY2FzZSBpdCBpcwo+Pj4gYmVs
aWV2ZWQgdG8gYmUgdmFsdWFibGUgSSBjYW4ga2VlcCBpdC4KPj4gTm90IGxpa2VseSBJIHRoaW5r
Lgo+IAo+IFVzaW5nIGBtYWtlIHNoaW0tbWVudWNvbmZpZ2Agd2FzIGEgc3BlY2lmaWMgdXNlY2Fz
ZSBmb3IgbXkgb3JpZ2luYWwKPiB2ZXJzaW9uLCBidXQgd2l0aCB0aGlzIGRpZmZlcmVuY2UgaW4g
cmVwcmVzZW50YXRpb24sIHRoZSB1c2VjYXNlIGhhcwo+IG1vc3RseSBnb25lIGF3YXkuCj4gCj4g
V2l0aCB0aGlzIGNoYW5nZSBpbiBwbGFjZSwgd2hhdCBpcyB0aGUgZXhwZWN0ZWQgd29ya2Zsb3cg
Zm9yIG1ha2luZyBhbgo+IHVwZGF0ZSB0byB0aGUgY29uZmlndXJhdGlvbj8KCllvdSBjYW4gc3Rp
bGwgY2QgdG8gdG9vbHMvZmlybXdhcmUveGVuLWRpci94ZW4tcm9vdC94ZW4gYW5kIGRvIHRoZQoi
bWFrZSBtZW51Y29uZmlnIiB0aGVyZS4gQWZ0ZXJ3YXJkcyBjb3B5IHRoZSByZXN1bHRpbmcgLmNv
bmZpZyB0bwouLi8uLi9zaGltLmNvbmZpZyBhbmQgeW91IGhhdmUgdGhlIHNhbWUgcmVzdWx0LiBR
dWVzdGlvbiBpcyB3aGV0aGVyCnlvdSB3YW50IHRvIGRvIHRoYXQgaW4gY2FzZSB3ZSBhcmUgc3Ry
aXBwaW5nIGRvd24gc2hpbS5jb25maWcgbGF0ZXIuCgpBYm92ZSBhc3N1bWVzIFYyIG9mIG15IHBh
dGNoIHdpbGwgYmUgdGFrZW4sIG9mIGNvdXJzZS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
