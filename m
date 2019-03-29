From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU
 enumeration
Date: Fri, 29 Mar 2019 11:46:49 -0400
Message-ID: <67fe1063-128a-7dfd-3d8d-8915a80b807d__13848.4269775049$1553874472$gmane$org@oracle.com>
References: <5C9B92EA020000780022227B@prv1-mh.provo.novell.com>
 <2f027b4b-dce2-3e90-dc1b-c824bc8eb355@oracle.com>
 <5C9C8DDC0200007800222606@prv1-mh.provo.novell.com>
 <eda3938f-02a5-e5a2-4718-d75bc488f296@oracle.com>
 <5C9DDD530200007800222B22@prv1-mh.provo.novell.com>
 <24df98be-21e7-617e-7651-ae34e2a2e512@oracle.com>
 <5C9E35EF0200007800222E0B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=40d3=SA=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h9tig-0004uD-1h
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:47:02 +0000
In-Reply-To: <5C9E35EF0200007800222E0B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8yOS8xOSAxMToxMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDMuMTkg
YXQgMTQ6NDIsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE9uIDMvMjkv
MTkgNDo1NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOC4wMy4xOSBhdCAxNzo1
MCwgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToKPj4+PiBHaXZlbiBlc3BlY2lh
bGx5IHhlbl9wdl9zbXBfcHJlcGFyZV9jcHVzKCksIEkgdGhpbmsgcmUtd29ya2luZyBwcm9wZXIK
Pj4+PiBzZXR0aW5nIG9mIHByZXNlbnQvcG9zc2libGUgbWFza3MgaXMgd2VsbCBiZXlvbmQgdGhl
IHNjb3BlIG9mIHlvdXIKPj4+PiBvcmlnaW5hbCBwYXRjaC4KPj4+IFdlbGwsIHRoZW4gdGhlIHF1
ZXN0aW9uIGlzLCB3aGF0IChpZiBhbnkpIGNoYW5nZXMgYXJlIHlvdQo+Pj4gZXhwZWN0aW5nIG1l
IHRvIG1ha2UgZm9yIHRoaXMgY2hhbmdlIHRvIGJlIGFjY2VwdGFibGU/IE9yIGRvCj4+PiB5b3Ug
cGVyaGFwcyB3YW50IG1lIHRvIGFkZCBhIDJuZCBwYXRjaCBvbiB0b3AgYWRkcmVzc2luZwo+Pj4g
dGhlIG90aGVyIG91dGxpbmVkIGFub21hbGllcz8KPj4gSWYgeW91ciBnb2FsIGlzIGp1c3QgdG8g
Zml4IHRoZSBkb20wX21heF92Y3B1cyBpc3N1ZSB0aGVuIHRoaXMgcGF0Y2ggaXMKPj4gc3VmZmlj
aWVudCAoYnV0IHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgc2F5IHRoYXQgdGhpcyBpcyB3aGF0
IHRoZQo+PiBwYXRjaCBpcyBmb3IpLgo+Pgo+PiBCdXQgaWYgeW91IGFyZSB0cnlpbmcgdG8gbWFr
ZSBjcHUgbWFza3MgbWFuYWdlbWVudCBkb25lIHByb3Blcmx5IHRoZW4gSQo+PiB0aGluayB0aGlz
IHBhdGNoIGFsb25lIGRvZXMgbm90IGFkZHJlc3MgdGhpcyBmdWxseS4KPiBJLmUuIGZvbGRpbmcg
dGhlIGZ1cnRoZXIgaXRlbXMgZGlzY3Vzc2VkIGludG8gdGhpcyBwYXRjaCB3b3VsZCBiZQo+IGZp
bmUgYnkgeW91PyAoSSdtIGp1c3QgdHJ5aW5nIHRvIGF2b2lkIGhhdmluZyB0byBnbyB0aHJvdWdo
Cj4gc2V2ZXJhbCBtb3JlIHJvdW5kcyBvZiBwYXRjaCBzdWJtaXNzaW9ucy4pCgpJZiB5b3UgZGVj
aWRlIHRvIHB1cnN1ZSB0aGlzIChtYXNrIG1hbmFnZW1lbnQpIHRoZW4gaXQncyB1cCB0byB5b3Ug
LS0tCmlmIHlvdSBmZWVsIHlvdSBjYW4vc2hvdWxkIGRvIGl0IGFsbCBpbiBhIHNpbmdsZSBwYXRj
aCB0aGVuIEkgZG9uJ3Qgc2VlCndoeSBub3QuCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
