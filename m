From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/6] xen/x86: support per-domain flag for
	xpti
Date: Thu, 8 Mar 2018 14:13:24 +0100
Message-ID: <b9178757-8e4a-4902-3b2e-0cb455e1a2ff@suse.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-4-jgross@suse.com> <5AA11BDE02000078001AFB92@suse.com>
 <a0e3b93a-0111-bfb0-fb9e-ff736769fe7e@suse.com>
 <5AA13F7D02000078001AFCB3@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=4t3w=f6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1etvMS-0006uD-QW
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 13:13:32 +0000
In-Reply-To: <5AA13F7D02000078001AFCB3@suse.com>
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
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMTggMTM6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjAzLjE4IGF0
IDEyOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMDgvMDMvMTggMTE6MTcsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDIuMDMuMTggYXQgMDk6MTQsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+ICtzdGF0aWMgaW50IHBhcnNlX3hwdGkoY29uc3QgY2hhciAqcykK
Pj4+PiArewo+Pj4+ICsgICAgaW50IHJjID0gMDsKPj4+PiArCj4+Pj4gKyAgICBzd2l0Y2ggKCBw
YXJzZV9ib29sKHMsIE5VTEwpICkKPj4+PiArICAgIHsKPj4+PiArICAgIGNhc2UgMDoKPj4+PiAr
ICAgICAgICBvcHRfeHB0aSA9IFhQVElfT0ZGOwo+Pj4+ICsgICAgICAgIGJyZWFrOwo+Pj4+ICsg
ICAgY2FzZSAxOgo+Pj4+ICsgICAgICAgIG9wdF94cHRpID0gWFBUSV9PTjsKPj4+PiArICAgICAg
ICBicmVhazsKPj4+PiArICAgIGRlZmF1bHQ6Cj4+Pj4gKyAgICAgICAgaWYgKCAhc3RyY21wKHMs
ICJkZWZhdWx0IikgKQo+Pj4KPj4+IFRoaXMgd2FudHMgdG8gYWxzbyBiZSBtZW50aW9uZWQgaW4g
dGhlIGNvbW1hbmQgbGluZSBkb2MuCj4+Cj4+IFV1aCwgdGhpcyB3YXMgYSBjb3B5LWFuZC1wYXN0
ZSByZXN1bHQgZnJvbSBteSBhbHRlcm5hdGl2ZSBYUFRJIGFwcHJvYWNoLgo+PiBJJ2xsIGp1c3Qg
ZHJvcCB0aGF0IHZhbHVlLgo+IAo+IEknbSBub3Qgc3VyZSB0aGF0J3MgdGhlIGJlc3Qgcm91dGUg
KGFuZCBJIGRpZCBpbnRlbnRpb25hbGx5IG5vdCBhc2sgZm9yCj4geW91IGRvaW5nIHNvKTogSW4g
Y2FzZXMgd2hlcmUgeW91IGNhbid0IGVkaXQgdGhlIHByZS1idWlsdCBjb21tYW5kCj4gbGluZSBv
cHRpb25zIChsaWtlIGUuZy4gdGhvc2UgcmVhZCBieSB4ZW4uZWZpIGZyb20gdGhlIGNvbmZpZyBm
aWxlKSwgaXQKPiBpcyBxdWl0ZSB1c2VmdWwgdG8gYmUgYWJsZSB0byBvdmVycmlkZSB3aGF0IG1h
eSBiZSB0aGVyZSBiYWNrIHRvIHRoZQo+IGRlZmF1bHQuCgpPa2F5LCB0aGVuIEknbGwgZG9jdW1l
bnQgaXQuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
