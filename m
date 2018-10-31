From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tools/misc/xenpm: fix getting info when
 some CPUs are offline
Date: Wed, 31 Oct 2018 05:11:11 -0600
Message-ID: <5BD98DCF02000078001F6B2F@prv1-mh.provo.novell.com>
References: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
 <5BD9770602000078001F6A4F@prv1-mh.provo.novell.com>
 <20181031105316.GC32486@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nwhd=nl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHoP5-0006GS-Jk
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 11:11:15 +0000
In-Reply-To: <20181031105316.GC32486@mail-itl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDExOjUzLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDM6MzM6NThBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+IEknbSBhbHNvIGFmcmFpZCB0aGVyZSBhcmUgZnVydGhlciBxdWly
a3MgaGVyZSwgd2l0aCB2YXJpb3VzIGNvbnN0cnVjdHMKPj4gYWxvbmcgdGhlIGxpbmVzIG9mIChh
cyBib2RpZXMgb2YgYWZvcmVtZW50aW9uZWQgZm9yKCkpCj4+IAo+PiAgICAgICAgIGlmICggc2hv
d19jeHN0YXRfYnlfY3B1aWQoeGNfaGFuZGxlLCBpKSA9PSAtRU5PREVWICkKPj4gICAgICAgICAg
ICAgYnJlYWs7Cj4+IAo+PiB3aGljaCBJIHN1c3BlY3Qgd291bGQgdGVybWluYXRlIHByb2Nlc3Np
bmcgZWFybHkgd2hlbiBoaXR0aW5nIGEgdHJ1ZQo+PiBnYXAgKGkuZS4gbm90IG9uZSByZXN1bHRp
bmcgZnJvbSBhIHBhcmtlZCBDUFUpLiAKPiAKPiBIb3cgdGhhdCB3b3VsZCBoYXBwZW4/IEhvdHBs
dWc/Cgp4ZW4taHB0b29sIG9uIEFNRCBtaWdodCB0cmlnZ2VyIHRoaXMsIGFmYWljdC4KCj4gQWxz
byBJJ3ZlIHRyaWVkIHRvIGxvb2sgYXQgZXJyb3IgY29kZXMgdG8gZGlzdGluZ3Vpc2ggb2ZmbGlu
ZSBjcHUgYW5kCj4gYXZvaWQgcHJpbnRpbmcgdGhhdCBlcnJvciwgYnV0IGxvb2tzIEVJTlZBTCBp
cyB1c2VkIGZvciBhIGxvdCBvZiBjYXNlcy4KClllYWgsIHRoZSBjb21tb24gcHJvYmxlbSB3aXRo
IEVJTlZBTC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
