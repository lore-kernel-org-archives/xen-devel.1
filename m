From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 02 May 2018 09:01:49 -0600
Message-ID: <5AE9D2DD02000078001C02F0__22433.0144505531$1525273235$gmane$org@prv1-mh.provo.novell.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-4-boris.ostrovsky@oracle.com>
 <5AE973CD02000078001C008E@prv1-mh.provo.novell.com>
 <615b0e30-c360-3ad4-f1b3-0e907d790643@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=toke=hv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDtGW-0007Qk-9s
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:01:56 +0000
In-Reply-To: <615b0e30-c360-3ad4-f1b3-0e907d790643@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA1LjE4IGF0IDE3OjAwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzAyLzIwMTggMDQ6MTYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAzMC4wNC4xOCBhdCAxODoyMywgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IC0tLSBhL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKPj4+ICsrKyBiL2FyY2gveDg2L3hlbi94
ZW4tcHZoLlMKPj4+IEBAIC01NCw2ICs1NCw5IEBACj4+PiAgICogY2hhcmdlIG9mIHNldHRpbmcg
dXAgaXQncyBvd24gc3RhY2ssIEdEVCBhbmQgSURULgo+Pj4gICAqLwo+Pj4gIAo+Pj4gKyNkZWZp
bmUgUFZIX0dEVF9FTlRSWV9DQU5BUlkgICAgNAo+Pj4gKyNkZWZpbmUgUFZIX0NBTkFSWV9TRUwg
ICAgICAgICAgKFBWSF9HRFRfRU5UUllfQ0FOQVJZICogOCkKPj4gSSBjYW4gb25seSBhZHZpc2Ug
YWdhaW5zdCBkb2luZyBpdCB0aGlzIHdheTogVGhlcmUncyBubyBzYWZlZ3VhcmQgYWdhaW5zdAo+
PiBzb21lb25lIGNoYW5naW5nIGFzbS9zZWdtZW50Lmggd2l0aG91dCBjaGFuZ2luZyB0aGlzIHZh
bHVlIChpbiBmYWN0Cj4+IHRoaXMgYXBwbGllcyB0byBhbGwgb2YgdGhlIEdEVCBzZWxlY3RvcnMg
cG9wdWxhdGVkIGluIHRoaXMgZmlsZSkuIEF0IHRoZSAKPiB2ZXJ5Cj4+IGxlYXN0IHRpZSB0aGlz
IHRvIEdEVF9FTlRSWV9CT09UX1RTUyAvIF9fQk9PVF9UU1M/Cj4+Cj4+PiBAQCAtNjQsNiArNjcs
OSBAQCBFTlRSWShwdmhfc3RhcnRfeGVuKQo+Pj4gIAltb3YgJWVheCwlZXMKPj4+ICAJbW92ICVl
YXgsJXNzCj4+PiAgCj4+PiArCW1vdiAkKFBWSF9DQU5BUllfU0VMKSwlZWF4Cj4+PiArCW1vdiAl
ZWF4LCVncwo+Pj4gKwo+Pj4gIAkvKiBTdGFzaCBodm1fc3RhcnRfaW5mby4gKi8KPj4+ICAJbW92
ICRfcGEocHZoX3N0YXJ0X2luZm8pLCAlZWRpCj4+PiAgCW1vdiAlZWJ4LCAlZXNpCj4+PiBAQCAt
MTUwLDYgKzE1Niw3IEBAIGdkdF9zdGFydDoKPj4+ICAJLnF1YWQgMHgwMGNmOWEwMDAwMDBmZmZm
ICAgICAgICAgICAgLyogX19CT09UX0NTICovCj4+PiAgI2VuZGlmCj4+PiAgCS5xdWFkIDB4MDBj
ZjkyMDAwMDAwZmZmZiAgICAgICAgICAgIC8qIF9fQk9PVF9EUyAqLwo+Pj4gKwkucXVhZCAweDAw
NDA5MDAwMDAwMDAwMTggICAgICAgICAgICAvKiBQVkhfQ0FOQVJZX1NFTCAqLwo+PiBXaXRob3V0
IGFueSBmdXJ0aGVyIGNvZGUgYmVmb3JlIGxvYWRpbmcgdGhlIHNlbGVjdG9yLCB0aGlzIHBvaW50
cyBhdAo+PiBwaHlzaWNhbCBhZGRyZXNzIDAuIERvbid0IHlvdSBuZWVkIHRvIGFkZCBpbiB0aGUg
YmFzZSBhZGRyZXNzIG9mCj4+IHRoZSBwZXItQ1BVIHN0YWNrX2NhbmFyeT8KPiAKPiBUaGlzIEdE
VCBpcyBnb25lIHNvb24gYWZ0ZXIgd2UganVtcCBpbnRvIGdlbmVyaWMgeDg2IHN0YXJ0dXAgY29k
ZS5UaGF0Cj4gY29kZSB3aWxsIGxvYWQgaXRzIG93biBHRFQgKGFuZCB0aGVuIHNldCB1cCBwZXIt
Y3B1IHNlZ21lbnRzIGFuZCBhbGwgdGhhdCkuCgpBbGwgdW5kZXJzdG9vZCwgYnV0IHdoeSB3b3Vs
ZCB5b3Ugc2V0IHVwIHRoZSBwZXItQ1BVIHNlZ21lbnQgaGVyZSBpZgp3aGF0IHlvdSBsb2FkIGlu
dG8gdGhlIHNlZ21lbnQgcmVnaXN0ZXIgaXMgbm90IHVzYWJsZSBmb3IgdGhlIGludGVuZGVkCnB1
cnBvc2UgKHVudGlsIHRoYXQgb3RoZXIgY29kZSBzZXRzIHVwIHRoaW5ncyBhbmQgcmVsb2FkcyB0
aGUgc2VnbWVudApyZWdpc3RlcnMpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
