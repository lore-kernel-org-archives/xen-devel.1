From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] p2m: move p2m-common.h inclusion point
Date: Fri, 5 Oct 2018 11:27:37 +0100
Message-ID: <cdc99a4b-e7c2-777b-8aed-65a941edf04e@arm.com>
References: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=je8t=mr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g8NKh-0000Wu-98
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 10:27:43 +0000
In-Reply-To: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNS8yMDE4IDExOjE0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGUgaGVh
ZGVyIGlzIChoZW5jZSBpdHMgbmFtZSkgc3VwcG9zZWQgdG8gYmUgYSBoZWxwZXIgZm9yIHRoZSBw
ZXItYXJjaAo+IHAybS5oIGZpbGVzLiBJdCB3YXMgbmV2ZXIgc3VwcG9zZWQgdG8gYmUgaW5jbHVk
ZWQgZGlyZWN0bHksIGFuZCBmb3IgdGhlCj4gcHVycG9zZSBvZiBwdXR0aW5nIGNvbW1vbiBmdW5j
dGlvbiBkZWNsYXJhdGlvbnMgaW50byB0aGUgY29tbW9uIGhlYWRlcgo+IGl0IGlzIG1vcmUgaGVs
cGZ1bCBpZiB0aGluZ3MgbGlrZSBwMm1fdCBhcmUgYWxyZWFkeSBhdmFpbGFibGUgYXQgdGhlCj4g
aW5jbHVzaW9uIHBvaW50Lgo+IAo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGRpdGNo
IGEgZHVwbGljYXRlIHB1YmxpYy9tZW1vcnkuaCBmcm9tIHRoZQo+IEFSTSBoZWFkZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
