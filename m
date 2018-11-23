From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] common: make sure symbols-dummy.o gets
 rebuilt when needed
Date: Fri, 23 Nov 2018 12:27:09 +0000
Message-ID: <20181123122709.k4sy6ryqrruv6av2@zion.uk.xensource.com>
References: <5BF7E64C02000078001FF5D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k4Pk=OC=citrix.com=prvs=858f4146b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gQAYE-0002Eb-18
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 12:27:14 +0000
Content-Disposition: inline
In-Reply-To: <5BF7E64C02000078001FF5D2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDQ6MzY6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHBlci1hcmNoIHRvcCBsZXZlbCBtYWtlIGZpbGVzIGRvbid0IHJlY29yZCBhbnkg
ZGVwZW5kZW5jaWVzIGZvciB0aGUKPiBmaWxlLCBzbyBpdHMgbWVyZSBleGlzdGVuY2UgaXMgZW5v
dWdoIGZvciBtYWtlIHRvIGNvbnNpZGVyIGl0IHVwLXRvLQo+IGRhdGUuIEFzIG9mIGFiM2U1ZjVm
ZjkgKCJ4c3BsaWNlLCBzeW1ib2xzOiBJbXBsZW1lbnQgZmFzdCBzeW1ib2wgbmFtZXMKPiAtPiB2
aXJ0dWFsIGFkZHJlc3NlcyBsb29rdXAiKSB0aGUgZmlsZSwgaG93ZXZlciwgZGVwZW5kcyBvbiB0
aGUKPiBGQVNUX1NZTUJPTF9MT09LVVAgY29uZmlnIG9wdGlvbiwgd2hpY2ggbWF5IGNoYW5nZSBi
ZXR3ZWVuIGluY3JlbWVudGFsCj4gcmUtYnVpbGRzLgo+IAo+IFVzZSB0aGUgJChleHRyYS15KSBt
YWNoaW5lcnkgdG8gZ2V0IHRoZSBmaWxlIGJ1aWx0IHdpdGhvdXQgYW4gZXh0cmEKPiByZWN1cnNp
b24gc3RlcCBpbnRvIGNvbW1vbi8sIGJ1dCBpbnN0ZWFkIHJpZ2h0IHdoZW4gdGhlIG90aGVyIHRo
aW5ncyBpbgo+IHRoYXQgZGlyZWN0b3J5IGdldCBidWlsdC4gU29tZSBtYWtlZmlsZSBhZGp1c3Rt
ZW50cyBhcmUgbmVjZXNzYXJ5IHRvCj4gYWN0dWFsbHkgbWFrZSB0aGlzIG1hY2hpbmVyeSB3b3Jr
IGJleW9uZCB0aGUgcmVzdHJpY3RlZCBzZXQgb2YgcGxhY2UgaXQKPiB3YXMgdXNlZCBpbiBiZWZv
cmUuIE5vdGUgaG93ZXZlciB0aGF0IGFuIGltcG9ydGFudCByZXN0cmljdGlvbiByZW1haW5zOgo+
ICQoZXh0cmEteSkgbWF5IG5vdCBvdmVybGFwICQob2JqLXkpIG9yICQob2JqLWJpbi15KS4KPiAK
PiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBtYWtlIHRoZSBnZW5kZXAgaW52b2NhdGlv
biBjb3ZlciBib3RoCj4gJChvYmotYmluLXkpIGFuZCAkKGV4dHJhLXkpLCBldmVuIGlmIHRoaXMg
aXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgaGVyZS4KPiBJIHNob3VsZCBoYXZlIGluY2x1ZGVkIHRo
ZW0gcmlnaHQgYXdheSBpbiA4YjZlZjljMTUyICgiY29tcGF0OiBlbmZvcmNlCj4gZGlzdGluZ3Vp
c2hhYmxlIGZpbGUgbmFtZXMgaW4gc3ltYm9sIHRhYmxlIikuCj4gCj4gUmVwb3J0ZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
