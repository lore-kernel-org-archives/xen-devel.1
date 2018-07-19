From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/4] x86: possibly bring up all CPUs even
 if not all are supposed to be used
Date: Thu, 19 Jul 2018 05:45:30 -0600
Message-ID: <5B5079DA02000078001D5DDA@prv1-mh.provo.novell.com>
References: <5B50673002000078001D5CD3@prv1-mh.provo.novell.com>
 <5B5068A602000078001D5CEC@prv1-mh.provo.novell.com>
 <4d714fe0-9ea2-efb4-cb35-c4e73b04a7ff@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg7NG-0004rw-J4
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 11:45:34 +0000
In-Reply-To: <4d714fe0-9ea2-efb4-cb35-c4e73b04a7ff@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDEzOjE2LCA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTkvMjAxOCAxMTozMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE5vdGU6
IE9uIG9uZSBvZiBteSB0ZXN0IHN5c3RlbXMgdGhlIHBhcmtlZCBDUFVzIGdldCBfUFNEIGRhdGEg
cmVwb3J0ZWQKPj4gICAgICAgYnkgRG9tMCB0aGF0IGlzIGRpZmZlcmVudCBmcm9tIHRoZSBub24t
cGFya2VkIG9uZXMgKGNvb3JkX3R5cGUgaXMKPj4gICAgICAgMHhGQyBpbnN0ZWFkIG9mIDB4RkUp
LiBHaXZpbmcgRG9tMCBlbm91Z2ggdkNQVS1zIGVsaW1pbmF0ZXMgdGhpcwo+PiAgICAgICBwcm9i
bGVtLCBzbyB0aGVyZSBpcyBhcHBhcmVudGx5IHNvbWV0aGluZyBhbWlzcyBpbiB0aGUgcHJvY2Vz
c29yCj4+ICAgICAgIGRyaXZlci4gSSd2ZSB0cmllZCB0byBmaWd1cmUgb3V0IHdoYXQsIGJ1dCBJ
IGNvdWxkbid0LCBkZXNwaXRlIHRoZQo+PiAgICAgICBBTUwgc3VnZ2VzdGluZyB0aGF0IHRoaXMg
bWlnaHQgYmUgc29tZSBfT1NDIGludm9jYXRpb24gKGJ1dCBpZiBpdAo+PiAgICAgICBpcywgSSBj
YW4ndCBmaW5kIGl0IC0gYWNwaV9ydW5fb3NjKCkgY2xlYXJseSBkb2VzIG5vdCBhbnl3aGVyZSBn
ZXQKPj4gICAgICAgaW52b2tlZCBpbiBhIHBlci1DUFUgZmFzaGlvbikuCj4+IAo+IAo+IFJlZ2Fy
ZGluZyB5b3VyIHNlY29uZCBub3RlLCBjb3VsZCB0aGUgY29tbWl0IGJlbG93IChpbiB0aGUgbGlu
dXggYWNwaSAKPiBwcm9jZXNzb3IKPiBkcml2ZXIpIGhlbHAvZml4ZXMgaXQ/Cj4gCj4gNGQwZjFj
ZTY5NTU5IHhlbi9hY3BpOiB1cGxvYWQgX1BTRCBpbmZvIGZvciBub24gRG9tMCBDUFVzIHRvbwoK
Tm8sIHRoYXQgaXMgaW4gcGxhY2UgYWxyZWFkeS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
