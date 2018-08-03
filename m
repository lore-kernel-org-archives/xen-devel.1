From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] drop {,acpi_}reserve_bootmem()
Date: Fri, 3 Aug 2018 16:25:41 +0100
Message-ID: <efcdf30c-7f5d-7e24-54b2-cdd428c24fb9@citrix.com>
References: <5B64735A02000078001DAAD4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=shfp=ks=citrix.com=prvs=746ef734c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1flbxY-0005NO-0J
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 15:25:44 +0000
In-Reply-To: <5B64735A02000078001DAAD4@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDgvMTggMTY6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEJvdGggYXJlIGVudGlyZWx5
IHVudXNlZCAodG8gYmUgZmFpciwgcmVzZXJ2ZV9ib290bWVtKCkgaGFzIGEgdXNlIGluc2lkZQo+
IGFuICIjaWYgMCIgc2VjdGlvbiBpbiB4ODYncyBtcHBhcnNlLmMsIGJ1dCBpZiB3ZSB3ZXJlIHRv
IHJlLWVuYWJsZSB0aGF0Cj4gY29kZSwgaXQgd291bGQgbmVlZCBkb2luZyBkaWZmZXJlbnRseSBh
bnl3YXkpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpD
YW4gd2Ugc2VlIGFib3V0IGRyb3BwaW5nICNpZiAwJ2QgY29kZT/CoCBJdCBoYXMgcHJvYmFibHkg
Yml0cm90dGVkLCBhbmQKY2xlYXJseSBpc24ndCB3YW50ZWQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
