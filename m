From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/6] x86: bring up all CPUs even if not
 all are supposed to be used
Date: Wed, 18 Jul 2018 14:10:40 +0100
Message-ID: <595414fe-7943-3fdb-c8c2-b64a8183e9f2@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dg1m=kc=citrix.com=prvs=730a7d111=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ffmET-00066M-2X
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 13:11:05 +0000
In-Reply-To: <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDcvMTggMDk6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFJlcG9ydGVkbHkgSW50ZWwg
Q1BVcyB3aGljaCBjYW4ndCBicm9hZGNhc3QgI01DIHRvIGFsbCB0YXJnZXRlZAo+IGNvcmVzL3Ro
cmVhZHMgYmVjYXVzZSBzb21lIGhhdmUgQ1I0Lk1DRSBjbGVhciB3aWxsIHNodXQgZG93bi4gVGhl
cmVmb3JlCj4gd2Ugd2FudCB0byBrZWVwIENSNC5NQ0UgZW5hYmxlZCB3aGVuIG9mZmxpbmluZyBh
IENQVSwgYW5kIHdlIG5lZWQgdG8KPiBicmluZyB1cCBhbGwgQ1BVcyBpbiBvcmRlciB0byBiZSBh
YmxlIHRvIHNldCBDUjQuTUNFIGluIHRoZSBmaXJzdCBwbGFjZS4KPgo+IFRoZSB1c2Ugb2YgY2xl
YXJfaW5fY3I0KCkgaW4gY3B1X21jaGVja19kaXNhYmxlKCkgd2FzIGlsbCBhZHZpc2VkCj4gYW55
d2F5LCBhbmQgdG8gYXZvaWQgZnV0dXJlIHNpbWlsYXIgbWlzdGFrZXMgSSdtIHJlbW92aW5nIGNs
ZWFyX2luX2NyNCgpCj4gYWx0b2dldGhlciByaWdodCBoZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
