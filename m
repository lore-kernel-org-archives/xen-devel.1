From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxc/x86: don't hand through CPUID leaf
 0x80000008 as is
Date: Thu, 17 May 2018 14:47:56 +0100
Message-ID: <134f1870-31f6-35ba-4d69-2e18ab8003f6@citrix.com>
References: <5AFD818C02000078001C39E7@prv1-mh.provo.novell.com>
 <0b9549fd-d943-d98f-0c08-e07ad8167e6d@citrix.com>
 <5AFD85CA02000078001C3A3B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ai8g=ie=citrix.com=prvs=668b0e4c2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fJJGF-0007Ws-C3
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 13:48:03 +0000
In-Reply-To: <5AFD85CA02000078001C3A3B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDUvMTggMTQ6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE3LjA1LjE4IGF0
IDE1OjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE3LzA1LzE4
IDE0OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEp1c3QgbGlrZSBmb3IgSFZNIHRoZSBmZWF0
dXJlIHNldCBzaG91bGQgYmUgdXNlZCBmb3IgRUJYIG91dHB1dCwgd2hpbGUKPj4+IEVBWCBzaG91
bGQgYmUgcmVzdHJpY3RlZCB0byB0aGUgbG93IDE2IGJpdHMgYW5kIEVDWC9FRFggc2hvdWxkIGJl
IHplcm8uCj4+Pgo+Pj4gU2hvcnQgb2YgdGhlcmUgYmVpbmcgd2hpdGUgbGlzdGluZyBpbiBwbGFj
ZSBqdXN0IGxpa2Ugb24gdGhlIEhWTSBzaWRlLAo+Pj4gYWxzbyB6YXAgbGVhdmVzIDYsIDksIGFu
ZCAweDgwMDAwMDA3IGFzIHdlbGwgYXMgdW5rbm93biAvIHJlc2VydmVkIG9uZXMuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBEbyB5b3Ug
d2FudCB0aGlzIGZvciBiYWNrcG9ydGluZz8KPiBOb3QgcmVhbGx5LCBhdCBsZWFzdCB0aGF0IHdh
c24ndCBhIHByaW1hcnkgZ29hbC4KPgo+PiBUaGUgY2hhbmdlcyBiZWxvdyBhcmUgZW5mb3JjZWQg
YnkgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KCkgKGFuZCBpbgo+PiBwYXJ0aWN1bGFyLCByZWNh
bHVjbGF0ZV9taXNjKCkpIGluIHRoZSBoeXBlcnZpc29yIGZvciB0aGUgcGFzdCBmZXcKPj4gcmVs
ZWFzZXMsIGFuZCBTZXJnZXkgaXMgY3VycmVudGx5IGluIHRoZSBwcm9jZXNzIG9mIG1ha2luZyBh
bGwgb2YgdGhpcwo+PiBsaWJ4YyBsb2dpYyBkaXNhcHBlYXIuCj4gV2VsbCwgbWF5YmUgSSdtIHNp
bXBseSBjb25mdXNlZDogQ29tbWl0IGQyOTdiNTY2ODIgKCJ4ODYvY3B1aWQ6IEhhbmRsaW5nCj4g
b2YgSUJSUy9JQlBCLCBTVElCUCBhbmQgSUJSUyBmb3IgZ3Vlc3RzIikgaW50cm9kdWNlZCBzaW1p
bGFyIGNvZGUgaW50bwo+IHhjX2NwdWlkX2h2bV9wb2xpY3koKSB3aXRob3V0IGRvaW5nIHRoZSBz
YW1lIGZvciB4Y19jcHVpZF9wdl9wb2xpY3koKS4KPiBUaGF0J3MgcHJldHR5IHJlY2VudCBhIGNv
bW1pdCwgYW5kIG9uZSB0aGF0IGhhcyBiZWVuIGJhY2twb3J0ZWQgYWxsIHRoZQo+IHdheSB0aHJv
dWdoIHRvIDQuNi4gQXJlIHlvdSBzYXlpbmcgdGhhdCB3YXMgYSBwb2ludGxlc3MgY2hhbmdlIHRo
ZW4/CgpObyBzb3JyeSAtIHlvdSdyZSBjb21wbGV0ZWx5IGNvcnJlY3QuCgpXaXRob3V0IHRoZSBQ
ViBzaWRlLCBhIGd1ZXN0IHdpbGwgYnkgZGVmYXVsdCBnZXQgdGhlIHNhbWUgc2V0dGluZ3MgYXMK
ZG9tMC7CoCBUaGUgcmVhc29uIHdoeSBteSBYVEYgdGVzdHMgZG9lc24ndCBub3RpY2UgdGhpcyBp
cyBiZWNhdXNlIGxpYnhsCnVzZXMgYSBzZXBhcmF0ZSBwYXRoLCBhbmQgWGVuU2VydmVyIHVzZXMg
YSB5ZXQtZGlmZmVyZW50IHBhdGguCgpUaGUgUFYgc2lkZSB3YW50cyB0byBnYWluIGEgbWF0Y2hp
bmcgY2x6ZXJvIGh1bmsuCgpNeSBjb21tZW50IGFib3V0IHJlY2FsY3VsYXRlX2NwdWlkX3BvbGlj
eSgpIGFwcGxpZXMgdG8gdGhlIGNsYW1waW5nIHBhcnQKb2YgdGhlIGNoYW5nZS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
