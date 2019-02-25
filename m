From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v7 1/9] xen/evtchn: block
 speculative out-of-bound accesses
Date: Mon, 25 Feb 2019 13:45:41 +0100
Message-ID: <56919043-c3b3-deb4-a7ae-3c7a2802e5d7@amazon.de>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-2-git-send-email-nmanthey@amazon.de>
 <5C6FF27E020000780021927D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9cCv=RA=amazon.de=prvs=952b5b9ed=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gyFev-0001yy-IE
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 12:47:01 +0000
In-Reply-To: <5C6FF27E020000780021927D@prv1-mh.provo.novell.com>
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

T24gMi8yMi8xOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDIuMTkgYXQg
MDk6MTYsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBAQCAtODEzLDYgKzgxNyw3IEBA
IGludCBzZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCB2
aXJxKQo+PiAgCj4+ICAgICAgaWYgKHZpcnEgPj0gTlJfVklSUVMpCj4+ICAgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+PiArCj4+ICAgICAgaWYgKCF2aXJxX2lzX2dsb2JhbCh2aXJxKSkKPj4gICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICAKPiBTdHJheSAoYnV0IGJlbmlnbikgY2hhbmdlLiBF
YXN5IGVub3VnaCB0byB0YWtlIG91dCB3aGlsZSBjb21taXR0aW5nLgo+IFdpdGhvdXQgdGhpczoK
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gQnR3LCBp
dCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB5b3UgaGFkIGFsc28gZHJvcHBlZCB0aGUgc29tZXdo
YXQKPiBtaXNsZWFkaW5nIFNwZWN0cmVWMSBmcm9tIHRoZSBzdWJqZWN0IGxpbmUgdGFncyBvZiB0
aGUgc2VyaWVzLgoKSSdsbCBkbyB0aGF0IGZvciB0aGUgbmV4dCByb3VuZC4KCkJlc3QsCk5vcmJl
cnQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIu
IDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
UmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
