From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 7/7] xen/x86: use PCID feature
Date: Mon, 26 Mar 2018 04:43:21 -0600
Message-ID: <5AB8EAE902000078001B6034@prv1-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-8-jgross@suse.com>
 <5AB4EA4902000078001B577B@suse.com>
 <c07a3b60-7bcb-c9dc-e63e-2ae41157d3ea@suse.com>
 <5AB5136302000078001B58D9@suse.com>
 <67a5bfca-7cce-4f10-1e24-30888d3d8ccb@suse.com>
 <5AB5324C02000078001B59E7@suse.com>
 <473492c7-1e5b-a3ad-1496-f5b29ca4fc44@suse.com>
 <5AB8CB3902000078001B5F3A@suse.com>
 <a0e2efe6-c456-2cbb-d42f-03dd8a721482@suse.com>
 <5AB8E3DC02000078001B5FEB@suse.com>
 <053a7a73-5470-89b7-872e-92d7527e41f7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zopv=gq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0Pb3-0002gd-Ll
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 10:43:25 +0000
In-Reply-To: <053a7a73-5470-89b7-872e-92d7527e41f7@suse.com>
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
Cc: andrew.cooper3@citrix.com, Kevin Tian <kevin.tian@intel.com>, Dario Faggioli <dfaggioli@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDEyOjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ni8wMy8xOCAxMjoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI2LjAzLjE4IGF0IDEw
OjU1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEkgY2FuIGNoYW5nZSB0aGUgc2NoZW1l
IHRvIHVzZSBkaWZmZXJlbnQgdmFsdWVzIGZvciBndWVzdCBQQ0lEcwo+Pj4gd2l0aCBYUFRJIG9u
LCBvZiBjb3Vyc2UuIEFyZSB5b3UgZmluZSB3aXRoOgo+Pj4KPj4+IC0gWFBUSSBvZmY6IFBDSUQg
MCA9IGtlcm5lbCwgUENJRCAxID0gdXNlcgo+Pj4gLSBYUFRJIG9uOiAgUENJRCAwID0ga2VybmVs
L1hlbiwgUENJRCAxID0gdXNlci9YZW4sCj4+PiAgICAgICAgICAgICBQQ0lEIDIgPSBrZXJuZWwv
Z3Vlc3QsIFBDSUQgMyA9IHVzZXIvZ3Vlc3QKPj4gCj4+IFllcywgdGhhdCB3b3VsZCBmaXQgdGhl
IGZpcnN0IHZhcmlhbnQgSSd2ZSBkZXNjcmliZWQuIEkgdGFrZSBpdCB5b3UKPj4gcHJlZmVyIG5v
dCB0byBhdm9pZCBQQ0lEIDAgYWx0b2dldGhlciB3aGVuIFBDSURzIGFyZSBlbmFibGVkIC0KPj4g
aXMgdGhlcmUgYSBwYXJ0aWN1bGFyIHJlYXNvbj8KPiAKPiBZZXMuIEFzIHdyaXR0ZW4gaW4gdGhl
IGNvbW1lbnQgaW4gZmx1c2hfYXJlYV9sb2NhbCgpIEkgY2FuJ3QgYmUgc3VyZQo+IHdoZXRoZXIg
dGhlIGN1cnJlbnQgYWRkcmVzcyBzcGFjZSBpcyB0aGF0IG9mIGEgZG9tYWluIHdpdGggWFBUSQo+
IGVuYWJsZWQgKHRoZSBpZGxlIGRvbWFpbiBjb3VsZCBiZSAiY3VycmVudCIpLiBTbyBJIG5lZWQg
dG8gYWx3YXlzCj4gZmx1c2ggd2l0aCBQQ0lEIDAgYW5kIHdpdGggdGhlIHBvc3NpYmxlIFBDSUQg
dmFsdWVzIGZvciBhIFhQVEkgZG9tYWluLgo+IFdoZW4gdXNpbmcgUENJRCAwIGZvciBYUFRJIGFz
IHdlbGwgSSdsbCBuZWVkIDQgSU5WUENJRHMsIHdoaWxlIHdoZW4KPiBhdm9pZGluZyBpdCBJJ2Qg
bmVlZCA1IChhdCBsZWFzdCB3aGVuIGN1cnJlbnQgPT0gaWRsZSkuCgpJIHNlZS4gV2hpY2ggbWFr
ZXMgbWUgd29uZGVyIHdoZXRoZXIgYSBzdWl0YWJsZSBjb21iaW5hdGlvbgpvZiBJTlZMUEcgKHRv
IGdldCByaWQgb2YgZ2xvYmFsIGVudHJpZXMpIGFuZCBJTlZQQ0lEIGNvdWxkbid0IGJlCnVzZWQg
aW5zdGVhZC4gRm9yIGV4YW1wbGUsIHlvdSBtYXkgYmUgYWJsZSB0byByZXBsYWNlIHRoZQpJTlZQ
Q0lEIGZvciB0aGUgYWN0aXZlIFBDSUQgYnkgSU5WTFBHICh3aXRob3V0IG5lZWRpbmcgdG8Ka25v
dyB3aG8gImN1cnJlbnQiIGlzKS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
