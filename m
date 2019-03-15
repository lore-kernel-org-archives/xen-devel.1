From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Fri, 15 Mar 2019 08:24:16 -0600
Message-ID: <5C8BB590020000780021F577@prv1-mh.provo.novell.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com>
 <5C8BAF5A020000780021F53D@suse.com>
 <2074de60-afa4-5776-64b9-bddc2e73a41c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4nkv-0004mt-Mo
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:24:17 +0000
In-Reply-To: <2074de60-afa4-5776-64b9-bddc2e73a41c@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE1OjAxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
NS8wMy8yMDE5IDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTQuMDMuMTkgYXQg
MTI6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQWRkIGEgc3lzY3RsIGludGVyZmFj
ZSBmb3Igb2J0YWluaW5nIHRoZSAuY29uZmlnIGZpbGUgdXNlZCB0byBidWlsZAo+Pj4gdGhlIGh5
cGVydmlzb3IuIFRoZSBtZWNoYW5pc20gaXMgaW5zcGlyZWQgYnkgdGhlIExpbnV4IGtlcm5lbCdz
IG9uZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAoYXBh
cnQgZnJvbSBYU00gY2hhbmdlcykKPj4+IC0tLQo+Pj4gVjI6Cj4+PiAtIGJ1bXAgc3lzY3RsIGlu
dGVyZmFjZSB2ZXJzaW9uCj4+IAo+PiBKdWRnaW5nIGZyb20gdGhlIHN0eWxlIHlvdSB1c2UgZm9y
IG90aGVyIGVudHJpZXMgaGVyZSB0aGlzIHdhc24ndAo+PiBhIHJlc3VsdCBvZiByZXZpZXcgZmVl
ZGJhY2suIFdoeSBkaWQgeW91IGRvIHRoaXM/IFRoZSBjaGFuZ2UgaXMKPiAKPiBWMSB3YXMgcG9z
dGVkIGJlZm9yZSA0LjEyIHdhcyBicmFuY2hlZCBhd2F5LCBzbyBidW1waW5nIHdvdWxkIGhhdmUK
PiBjbGVhcmx5IGJlIHdyb25nIGF0IHRoYXQgdGltZS4KPiAKPj4gYSBwbGFpbiBhZGRpdGlvbiB0
byB0aGUgaW50ZXJmYWNlLCB3aGljaCBkb2Vzbid0IHJlcXVpcmUgY2FsbGVyCj4+IGF3YXJlbmVz
cy4gTXkgUi1iIGRvZXMgbm90IGhvbGQgd2l0aCB0aGlzIGluIHBsYWNlLgo+IAo+IEFoLCBJIHdh
c24ndCBhd2FyZSBvZiB0aGlzIHJ1bGUuIEknbGwgcmVtb3ZlIHRoZSBidW1waW5nIGluIGNhc2Ug
dGhpcwo+IGNhbid0IGJlIGRvbmUgd2hlbiBjb21taXR0aW5nLgoKSXQncyBwcmV0dHkgc3RyYWln
aHRmb3J3YXJkIHRvIGRyb3AgdGhpcyB3aGlsZSBjb21taXR0aW5nLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
