From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Mon, 10 Sep 2018 18:51:10 +0100
Message-ID: <75533283-9553-f227-0e25-05ecff0ece92@citrix.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <5B88FFBB02000078001E3CA8@prv1-mh.provo.novell.com>
 <5B966FC202000078001E6C53@prv1-mh.provo.novell.com>
 <5B9671D002000078001E6C86@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e6bw=ly=citrix.com=prvs=7840b2d26=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fzQLD-00029h-5R
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 17:51:15 +0000
In-Reply-To: <5B9671D002000078001E6C86@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDkvMTggMTQ6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEwLjA5LjE4IGF0
IDE1OjIxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAzMS4wOC4xOCBhdCAx
MDo0MywgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDMxLjA4LjE4IGF0IDEw
OjI5LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVn
Cj4+Pj4gKysrIGIveGVuL0tjb25maWcuZGVidWcKPj4+PiBAQCAtMTEsNiArMTEsMTMgQEAgY29u
ZmlnIERFQlVHCj4+Pj4gIAo+Pj4+ICAJICBZb3UgcHJvYmFibHkgd2FudCB0byBzYXkgJ04nIGhl
cmUuCj4+Pj4gIAo+Pj4+ICtjb25maWcgREVCVUdfSU5GTwo+Pj4+ICsJYm9vbCAiQ29tcGlsZSBY
ZW4gd2l0aCBkZWJ1ZyBpbmZvIgo+Pj4+ICsJZGVmYXVsdCB5Cj4+Pj4gKwktLS1oZWxwLS0tCj4+
Pj4gKwkgIElmIHlvdSBzYXkgWSBoZXJlIHRoZSByZXN1bHRpbmcgWGVuIHdpbGwgaW5jbHVkZSBk
ZWJ1Z2dpbmcgaW5mbwo+Pj4+ICsJICByZXN1bHRpbmcgaW4gYSBsYXJnZXIgYmluYXJ5IGltYWdl
Lgo+Pj4+ICsKPj4+PiAgaWYgREVCVUcgfHwgRVhQRVJUID0gInkiCj4+PiBQZXJoYXBzIGJldHRl
ciBtb3ZlIHlvdXIgYWRkaXRpb24gaW50byB0aGlzIGNvbmRpdGlvbmFsIHNlY3Rpb24/Cj4+IFNv
IHRoaXMgd2FzIGEgYmFkIHN1Z2dlc3Rpb24gYWZ0ZXIgYWxsIC0gd2l0aCBERUJVRz1uIERFQlVH
X0lORk8gaXMKPj4gbm93IGltcGxpY2l0bHkgbiBhcyB3ZWxsLiBUaGUgc2VjdGlvbiBuZWVkcyB0
byBiZSBtb3ZlZCBiYWNrIHRvIHdoZXJlCj4+IHlvdSBoYWQgaXQgYXMgcGVyIGFib3ZlLCB3aXRo
IHRoZSBfcHJvbXB0XyBkZXBlbmRpbmcgb24KPj4gREVCVUcgfHwgRVhQRVJUPSJ5Ii4KPiBGdXJ0
aGVybW9yZSAtIGlzIENPVkVSQUdFIHdpdGhvdXQgREVCVUdfSU5GTyBvZiBhbnkgdXNlPwoKWWVz
IC0gdmVyeSBtdWNoIHNvLgoKRnJvbSBhICJob3cgbXVjaCBvZiBteSBiaW5hcnkgZG9lcyBkbyBt
eSB0ZXN0cyBjb3ZlciIgcG9pbnQgb2YgdmlldywgeW91CndhbnQgdGhlIHJlbGVhc2UgYmluYXJ5
IHJhdGhlciB0aGFuIHRoZSBkZWJ1ZyBiaW5hcnkuCgpJbiBzb21lIGNvcGlvdXMgZnJlZSB0aW1l
LCBJJ2QgbGlrZSB0byBhdXRvbWF0ZSB0aGUgbWVhc3VyZW1lbnRzIG9mICJob3cKbXVjaCBvZiBY
ZW4gZG9lcyB0aGUgWFRGIHN1aXRlIGNvdmVyPyIKCj4gQXJlIHRoZXJlCj4gcGVyaGFwcyBhbnkg
b3RoZXIgZGVwZW5kZW5jaWVzIChJIHRoaW5rL2hvcGUgbGl2ZSBwYXRjaGluZyBsb2dpYyBkb2Vz
bid0Cj4gZGVwZW5kIG9uIGRlYnVnIGluZm8pPwoKVGhlIGxpdmVwYXRjaCBidWlsZCBkZXBlbmRz
IG9uIHhlbi1zeW1zIGNvbnRhaW5pbmcgYWxsIHRoZSBkZWJ1ZwppbmZvcm1hdGlvbiwgYnV0IHRo
ZSBydW50aW1lIGxvZ2ljIGRvZXNuJ3QsIEkgYmVsaWV2ZS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
