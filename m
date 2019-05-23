From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
Date: Thu, 23 May 2019 10:41:48 +0100
Message-ID: <20190523094148.GB2126@perard.uk.xensource.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
 <20190522195442.5bf116ff.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWVI=TX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hTkET-0000R4-MH
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:41:53 +0000
Content-Disposition: inline
In-Reply-To: <20190522195442.5bf116ff.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDc6NTQ6NDJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gV2VkLCAyMiBNYXkgMjAxOSAxNTo1MTo0MCArMDEwMAo+IHNjaHJpZWIgQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ogo+IAo+ID4gQ2FuIHlvdSBnaXZl
IGl0IGEgdHJ5IHdpdGggb25lIG9mIHRoZSBhZmZlY3RlZCBxZW11PyAocWVtdS14ZW4tNC4xMCBv
cgo+ID4gcWVtdS14ZW4tNC4xMSkKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gVW5mb3J0dW5h
dGVseSB0aGVyZSBpcyBubyBlYXN5IHdheSB0byB0cmlnZ2VyIHRoZSByYWNlLgo+IElzIHRoZSBj
aGFuZ2VkIGNvZGUgcGF0aCBhbHNvIGV4ZXJjaXNlZCBmb3IgUFYgZG9tVXM/CgpZZXMhIFRoZSBj
b2RlIHBhdGggaXMgZXhlY3V0ZWQgZXZlcnkgdGltZSBhIGRpc2sgaXMgYXR0YWNoZWQgdmlhIHRo
ZQpxZGlzayBiYWNrZW5kLiBTbyBhcyBsb25nIGFzIGd1ZXN0IGNhbiBhY2Nlc3MgdGhlIHB2IGRp
c2ssIHRoZW4gaXQncwpmaW5lIChmb3IgYm90aCBIVk0gYW5kIFBWIGRvbVVzLCBhbmQgUFZIKS4K
CkFub3RoZXIgd2F5IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBsb2NraW5nIGlzIGRpc2FibGUgaXMg
dG8gYXR0YWNoIGEgZGlzawp0byBhIHNlY29uZCBndWVzdCwgcWVtdSBzaG91bGQgbm90IGNvbXBs
YWluIGFueW1vcmUuIEkndmUgdGVzdGVkIGJvdGgKInJhdyIgZGlzayBhbmQgInFjb3cyIiBkaXNr
IGJ1dCBJJ20gbm90IHN1cmUgaWYgb3RoZXIga2luZCBvZiBkaXNrIG5lZWRzCnRvIGJlIHRlc3Rl
ZC4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
