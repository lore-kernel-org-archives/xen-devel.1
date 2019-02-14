From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v6 5/9] nospec: introduce
 evaluate_nospec
Date: Thu, 14 Feb 2019 14:37:07 +0100
Message-ID: <715125e5-dfe3-0d02-6839-12e3cc31bb92@amazon.de>
References: <1c2b8322-1b66-ccc6-9ba9-e86eafb0227a@amazon.de>
 <1549633489-12724-1-git-send-email-nmanthey@amazon.de>
 <1549633489-12724-6-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0101E7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C532AC00200007800212EA2@prv1-mh.provo.novell.com>
 <A18FF6C80200006BB1E090C7@prv1-mh.provo.novell.com>
 <01CCAAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <01CFEAAF02000039B1E090C7@prv1-mh.provo.novell.com>
 <5C62CF2C0200007800215F03@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tSEH=QV=amazon.de=prvs=9419de174=nmanthey@srs-us1.protection.inumbo.net>)
 id 1guHCh-00060S-L8
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:37:27 +0000
In-Reply-To: <5C62CF2C0200007800215F03@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAxNDo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDIuMTkgYXQg
MTQ6NDQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gL2Rldi9udWxsCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmgKPj4gQEAgLTAsMCArMSwzOSBAQAo+PiAr
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKy8qIENvcHlyaWdodCAy
MDE4IEFtYXpvbi5jb20sIEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuIAo+PiAqLwo+PiArCj4+ICsjaWZuZGVmIF9BU01fWDg2X05PU1BFQ19ICj4+ICsjZGVmaW5l
IF9BU01fWDg2X05PU1BFQ19ICj4+ICsKPj4gKyNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4K
Pj4gKyNpbmNsdWRlIDxhc20vc3lzdGVtLmg+Cj4+ICsKPj4gKy8qIEFsbG93IHRvIGluc2VydCBh
IHJlYWQgbWVtb3J5IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMgKi8KPj4gK3N0YXRpYyBhbHdh
eXNfaW5saW5lIGJvb2wgYXJjaF9iYXJyaWVyX25vc3BlY190cnVlKHZvaWQpCj4gTm93IHRoYXQg
dGhpcyBpcyB4ODYtc3BlY2lmaWMgKGFuZCBub3QgdXNlZCBieSBjb21tb24gY29kZSksCj4gSSBk
b24ndCB0aGluayB0aGUgYXJjaF8gcHJlZml4IGlzIHdhcnJhbnRlZCBhbnltb3JlLgpJIHdpbGwg
ZHJvcCB0aGUgcHJlZml4Lgo+PiArewo+PiArI2lmIGRlZmluZWQoQ09ORklHX0hWTSkKPiBIZXJl
IGFuZCBiZWxvdyBJJ2QgcHJlZmVyIGlmIHlvdSB1c2VkIHRoZSBzaG9ydGVyICNpZmRlZi4KSSB3
aWxsIHVzZSB0aGUgc2hvcnQgdmVyc2lvbi4KPgo+PiArICAgIGFsdGVybmF0aXZlKCIiLCAibGZl
bmNlIiwgWDg2X0ZFQVRVUkVfU0NfTDFURl9WVUxOKTsKPj4gKyNlbmRpZgo+PiArICAgIHJldHVy
biB0cnVlOwo+PiArfQo+PiArCj4+ICsvKiBBbGxvdyB0byBwcm90ZWN0IGV2YWx1YXRpb24gb2Yg
Y29uZGl0aW9uYWFzbCB3aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24gCj4+ICovCj4+ICsjaWYg
ZGVmaW5lZChDT05GSUdfSFZNKQo+PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9u
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICgoY29u
ZGl0aW9uKSA/IGFyY2hfYmFycmllcl9ub3NwZWNfdHJ1ZSgpIDogIWFyY2hfYmFycmllcl9ub3Nw
ZWNfdHJ1ZSgpKQo+PiArI2Vsc2UKPj4gKyNkZWZpbmUgZXZhbHVhdGVfbm9zcGVjKGNvbmRpdGlv
bikgKGNvbmRpdGlvbikKPj4gKyNlbmRpZgo+PiArCj4+ICsvKiBBbGxvdyB0byBibG9jayBzcGVj
dWxhdGl2ZSBleGVjdXRpb24gaW4gZ2VuZXJpYyBjb2RlICovCj4+ICsjZGVmaW5lIGJsb2NrX3Nw
ZWN1bGF0aW9uKCkgKHZvaWQpYXJjaF9iYXJyaWVyX25vc3BlY190cnVlKCkKPiBJJ20gcHJldHR5
IHN1cmUgdGhhdCBJIGRpZCBwb2ludCBvdXQgYmVmb3JlIHRoYXQgdGhpcyBsYWNrcyBhbgo+IG91
dGVyIHBhaXIgb2YgcGFyZW50aGVzZXMuCgpZb3UgZGlkLiBJIHdpbGwgYWRkIHRoZW0uCgpCZXN0
LApOb3JiZXJ0Cgo+Cj4gSmFuCj4KPgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1h
bnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENo
cmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpF
aW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
