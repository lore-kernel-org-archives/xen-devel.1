From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: don't use privcmd_call() from
 xen_mc_flush()
Date: Wed, 13 Jun 2018 06:55:21 -0600
Message-ID: <5B21143902000078001CADD0@prv1-mh.provo.novell.com>
References: <20180613095806.2978-1-jgross@suse.com>
 <5B20EC6C02000078001CACBA@prv1-mh.provo.novell.com>
 <5B20EFE102000078001CACD4@suse.com>
 <d1ed4fec-d02f-0f0a-f4c3-ecfb04249613@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bhoq=i7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fT5J7-0003bf-9E
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 12:55:25 +0000
In-Reply-To: <d1ed4fec-d02f-0f0a-f4c3-ecfb04249613@suse.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA2LjE4IGF0IDEzOjEyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
My8wNi8xOCAxMjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEzLjA2LjE4IGF0IDEy
OjA1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4gT24gMTMuMDYuMTggYXQgMTE6
NTgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4+IFVzaW5nIHByaXZjbWRfY2FsbCgpIGZv
ciBhIHNpbmdsZXRvbiBtdWx0aWNhbGwgc2VlbXMgdG8gYmUgd3JvbmcsIGFzCj4+Pj4gcHJpdmNt
ZF9jYWxsKCkgaXMgdXNpbmcgc3RhYygpL2NsYWMoKSB0byBlbmFibGUgaHlwZXJ2aXNvciBhY2Nl
c3MgdG8KPj4+PiBMaW51eCB1c2VyIHNwYWNlLgo+Pj4+Cj4+Pj4gQWRkIGEgbmV3IHhlbl9zaW5n
bGVfY2FsbCgpIGZ1bmN0aW9uIHRvIGJlIHVzZSBmb3IgdGhhdCBwdXJwb3NlLgo+Pj4+Cj4+Pj4g
UmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IEFjdHVhbGx5IEkndmUg
b25seSBub3cgcmVhbGl6ZWQgdGhhdCB0aGlzIGlzbid0IGEgcmVhbCBwcm9ibGVtIHJpZ2h0IG5v
dzoKPj4gUFYgY2FuJ3QgdXNlIFNNQVAgKHdlIGRvbid0IHByb3ZpZGUgYSB2aXJ0dWFsaXplZCB2
ZXJzaW9uIG9mIGl0KSwgYW5kCj4+IEhWTS9QVkggY2FuJ3QgdXNlIG11bHRpY2FsbHMgKHdoaWNo
IG1heSBoYXZlIHRvIGNoYW5nZSBmb3IgUFZIIERvbTAsCj4+IHNvIGhhdmluZyB0aGUgY2hhbmdl
IGluIHBsYWNlIGlzIGhlbHBmdWwgYW55d2F5KSwgc28gdGhlIHdob2xlCj4+IGluLWtlcm5lbCBs
b2dpYyB0byBjb2xsZWN0IGFuZCBpc3N1ZSBiYXRjaGVzIHNob3VsZCBiZSB1bnJlYWNoYWJsZSB0
aGVyZS4KPj4gCj4+IEJ1dCBwZXJoYXBzIHRoZSBjb21taXQgbWVzc2FnZSB3b3VsZCBiZW5lZml0
IGZyb20gYSBsaXR0bGUgYml0IG9mCj4+IHJlLXdvcmRpbmcuCj4gCj4gSG1tLCByaWdodC4KPiAK
PiBXaGF0IGFib3V0Ogo+IAo+ICJVc2luZyBwcml2Y21kX2NhbGwoKSBmb3IgYSBzaW5nbGV0b24g
bXVsdGljYWxsIHNlZW1zIHRvIGJlIHdyb25nLCBhcwo+ICBwcml2Y21kX2NhbGwoKSBpcyB1c2lu
ZyBzdGFjKCkvY2xhYygpIHRvIGVuYWJsZSBoeXBlcnZpc29yIGFjY2VzcyB0bwo+ICBMaW51eCB1
c2VyIHNwYWNlLgo+IAo+ICBFdmVuIGlmIGN1cnJlbnRseSBub3QgYSBwcm9ibGVtIChwdiBkb21h
aW5zIGNhbid0IHVzZSBTTUFQIHdoaWxlIEhWTQo+ICBhbmQgUFZIIGRvbWFpbnMgY2FuJ3QgdXNl
IG11bHRpY2FsbHMpIHRoaW5ncyBtaWdodCBjaGFuZ2Ugd2hlbgo+ICBQVkggZG9tMCBzdXBwb3J0
IGlzIGFkZGVkIHRvIHRoZSBrZXJuZWwuIgoKU0dUTQoKSmFuCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
