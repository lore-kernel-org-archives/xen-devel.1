From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH L1TF v8 8/9] x86/hvm: add nospec to hvmop
 param
Date: Tue, 26 Feb 2019 23:28:25 +0100
Message-ID: <43b536e2-5efe-71fc-780b-df2838bb0bea@amazon.de>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-9-git-send-email-nmanthey@amazon.de>
 <5C7410D40200007800219FD6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lEk3=RB=amazon.de=prvs=953b90e62=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gylDW-0007Cm-6L
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 22:28:50 +0000
In-Reply-To: <5C7410D40200007800219FD6@prv1-mh.provo.novell.com>
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

T24gMi8yNS8xOSAxNjo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDIuMTkgYXQg
MTQ6MzQsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4gQEAgLTQxMDksNiAr
NDEwOSwxMSBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPj4gICAgICBpZiAoIGEuaW5k
ZXggPj0gSFZNX05SX1BBUkFNUyApCj4+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAgCj4+
ICsgICAgLyoKPj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGFib3ZlIGJvdW5kIGNoZWNrIGlzIG5v
dCBieXBhc3NlZCBkdXJpbmcgc3BlY3VsYXRpb24uCj4+ICsgICAgICovCj4+ICsgICAgYmxvY2tf
c3BlY3VsYXRpb24oKTsKPj4gKwo+PiAgICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lk
KGEuZG9taWQpOwo+PiAgICAgIGlmICggZCA9PSBOVUxMICkKPj4gICAgICAgICAgcmV0dXJuIC1F
U1JDSDsKPj4gQEAgLTQzNzUsNiArNDM4MCwxMSBAQCBzdGF0aWMgaW50IGh2bW9wX2dldF9wYXJh
bSgKPj4gICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4+ICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+PiAgCj4+ICsgICAgLyoKPj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGFi
b3ZlIGJvdW5kIGNoZWNrIGlzIG5vdCBieXBhc3NlZCBkdXJpbmcgc3BlY3VsYXRpb24uCj4+ICsg
ICAgICovCj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPiBDb21tZW50IHN0eWxlIChzaW5n
bGUgbGluZSkgaW4gYm90aCBjYXNlcy4gVGhpcyBjb3VsZCBiZSBkb25lIHdoaWxlCj4gY29tbWl0
dGluZywgYW5kIHdpdGggaXQgdGFrZW4gY2FyZSBvZgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpJJ2xsIHR1cm4gdGhlIGNvbW1lbnRzIGludG8gc2luZ2xlIGxp
bmUgY29tbWVudHMuCgpCZXN0LApOb3JiZXJ0CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
ZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3
IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTcz
IEIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
