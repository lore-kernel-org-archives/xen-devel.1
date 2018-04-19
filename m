From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Thu, 19 Apr 2018 17:22:28 +0100
Message-ID: <20180419162227.vo7cgh6tqe5npu3w@citrix.com>
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
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g8v3=hi=citrix.com=prvs=6400f7f3c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f9CKR-0002Zx-Fa
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:22:35 +0000
Content-Disposition: inline
In-Reply-To: <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDU6MTQ6MzhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wNC8xOCAxNTo1NCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgQXBy
IDE5LCAyMDE4IGF0IDAxOjAxOjUzUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4g
T24gMTkvMDQvMTggMTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+PiBPbiAxOS4wNC4x
OCBhdCAxMjozMCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+PiAtLS0gYS90b29scy9m
aXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4gPj4+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4t
ZGlyL01ha2VmaWxlCj4gPj4+PiBAQCAtNDEsMjEgKzQxLDIyIEBAIGxpbmtmYXJtLnN0YW1wOiAk
KERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKPiA+Pj4+ICAkKEQpOiBsaW5rZmFybS5zdGFt
cAo+ID4+Pj4gIAkkKE1BS0UpIC1DICQoRCkveGVuIGRpc3RjbGVhbgo+ID4+Pj4gIAo+ID4+Pj4g
LS5QSE9OWTogc2hpbS0lY29uZmlnCj4gPj4+PiAtc2hpbS0lY29uZmlnOiAkKEQpIEZPUkNFCj4g
Pj4+PiAtCSQoTUFLRSkgLUMgJChEKS94ZW4gJCpjb25maWcgXAo+ID4+PiBJIHRoaW5rIHRoZXJl
IHdhcyBhIHJlYXNvbiBmb3IgdGhlICUgYW5kICQqLgo+ID4+IFRoZSBvbmx5IG9uZSBJIGNvdWxk
IHRoaW5rIG9mIGlzIHRoZSBwb3NzaWJpbGl0eSB0byBkbwo+ID4+Cj4gPj4gbWFrZSBzaGltLWRl
ZmF1bHRjb25maWcKPiA+Pgo+ID4+IG9yIHNpbWlsYXIgY2FsbHMuIFF1ZXN0aW9uIGlzIHdobyB3
aWxsIGV2ZXIgbmVlZCB0aGF0LiBJbiBjYXNlIGl0IGlzCj4gPj4gYmVsaWV2ZWQgdG8gYmUgdmFs
dWFibGUgSSBjYW4ga2VlcCBpdC4KPiA+IE5vdCBsaWtlbHkgSSB0aGluay4KPiAKPiBVc2luZyBg
bWFrZSBzaGltLW1lbnVjb25maWdgIHdhcyBhIHNwZWNpZmljIHVzZWNhc2UgZm9yIG15IG9yaWdp
bmFsCj4gdmVyc2lvbiwgYnV0IHdpdGggdGhpcyBkaWZmZXJlbmNlIGluIHJlcHJlc2VudGF0aW9u
LCB0aGUgdXNlY2FzZSBoYXMKPiBtb3N0bHkgZ29uZSBhd2F5Lgo+IAo+IFdpdGggdGhpcyBjaGFu
Z2UgaW4gcGxhY2UsIHdoYXQgaXMgdGhlIGV4cGVjdGVkIHdvcmtmbG93IGZvciBtYWtpbmcgYW4K
PiB1cGRhdGUgdG8gdGhlIGNvbmZpZ3VyYXRpb24/Cj4gCgpKdXN0IGNvbW1pdCB0aGUgbXVzdC1o
YXZlJ3MgdG8gdGhlIHRyYWNrZWQgZmlsZSBhbmQgbGV0IFhlbidzIGJ1aWxkCnN5c3RlbSBoYW5k
bGUgdGhlIHJlc3Q/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
