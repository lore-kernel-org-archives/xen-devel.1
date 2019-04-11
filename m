From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/3] OvmfPkg/XenSupport: remove usage of
 prefetchable PCI host bridge aperture
Date: Thu, 11 Apr 2019 14:07:32 +0100
Message-ID: <20190411130732.GK1435@perard.uk.xensource.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-2-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xe+J=SN=citrix.com=prvs=9977b2ae1=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEZQt-0001Rw-1N
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:07:59 +0000
Content-Disposition: inline
In-Reply-To: <1554779560-26204-2-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, edk2-devel@lists.01.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, lersek@redhat.com, devel@edk2.groups.io
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDQ6MTI6MzhBTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhpcyBhcGVydHVyZSBkb2Vzbid0IGV4aXN0IGluIFFFTVUtWEVOIGFuZCBodm1s
b2FkZXIgcGxhY2VzIEJBUnMKPiBpbiBhcmJpdHJhcnkgb3JkZXIgZGlzcmVnYXJkaW5nIHByZWZl
dGNoYWJsZSBiaXQuIFRoaXMgbWFrZXMKPiBwcmVmZXRjaGFibGUgYW5kIG5vbi1wcmVmZXRjaGFi
bGUgQkFScyB0byBmb2xsb3cgZWFjaCBvdGhlciB0aGF0J3MKPiBxdWl0ZSBsaWtlbHkgd2l0aCBQ
Q0kgcGFzc3Rocm91Z2ggZGV2aWNlcy4gSW4gdGhhdCBjYXNlLCB0aGUgZXhpc3RpbmcKPiBjb2Rl
LCB0aGF0IHRyaWVzIHRvIHdvcmsgb3V0IGFwZXJ0dXJlIGJvdW5kYXJpZXMgYnkgcmVhZGluZyBo
dm1sb2FkZXIKPiBCQVIgcGxhY2VtZW50LCB3aWxsIHJlcG9ydCBhIGJvZ3VzIHByZWZldGNoYWJs
ZSBhcGVydHVyZSB3aGljaCBvdmVybGFwcwo+IHdpdGggdGhlIHJlZ3VsYXIgb25lLiBJdCB3aWxs
IGV2ZW50dWFsbHkgdHJpZ2dlciBhbiBhc3NlcnRpb24gaW4KPiBEWEUgUENJIGluaXRpYWxpemF0
aW9uIGNvZGUuCj4gCj4gRG8gdGhlIHNhbWUgdGhpbmcgYXMgT1ZNRiBvbiBRRU1VLUtWTSBhbmQg
cGFzcyBhIG5vbi1leGlzdGluZyBhcGVydHVyZQo+IHRoZXJlLiBJdCdzIG5vdCBuZWNlc3Nhcnkg
dG8gcGFzcyBhZGRpdGlvbmFsIGFsbG9jYXRpb24gZmxhZ3MgYXMgd2Ugc2V0Cj4gUmVzb3VyY2VB
c3NpZ25lZCBmbGFnIG9uIHRoZSByb290IGJyaWRnZSB3aGljaCBtZWFucyB0aGV5IHdpbGwgYmUg
aWdub3JlZC4KPiAKPiBDb250cmlidXRlZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBB
Z3JlZW1lbnQgMS4xCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhp
bmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAqIHJlbW92ZSB1c2FnZSBv
ZiBwcmVmZXRjaGFibGUgYXBlcnR1cmUgZW50aXJlbHkKPiAqIGV4cGxhaW5lZCByYXRpb25hbGUg
Zm9yIHRoZSBjaGFuZ2UgaW4gdGhlIGRlc2NyaXB0aW9uCj4gLS0tCgpSZXZpZXdlZC1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
