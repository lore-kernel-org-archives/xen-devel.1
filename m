From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/4] x86/hvm: stop passing explicit domid
 to hvm_create_ioreq_server()
Date: Tue, 20 Mar 2018 10:26:08 -0600
Message-ID: <5AB1443002000078001B413C@prv-mh.provo.novell.com>
References: <20180316165857.7112-1-paul.durrant@citrix.com>
 <20180316165857.7112-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyK5U-0000IS-9P
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:26:12 +0000
In-Reply-To: <20180316165857.7112-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE3OjU4LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE9ubHkgaW4gdGhlIGxlZ2FjeSAnZGVmYXVsdCBzZXJ2ZXInIGNhc2UgZG8gd2UgcGFzcyBh
bnl0aGluZyBvdGhlciB0aGFuCj4gY3VycmVudC0+ZG9tYWluLT5kb21haW5faWQsIGFuZCBpbiB0
aGF0IGNhc2Ugd2UgcGFzcyB0aGUgdmFsdWUgb2YKPiBIVk1fUEFSQU1fRE1fRE9NQUlOLgo+IAo+
IFRoZSBvbmx5IGtub3duIHVzZXIgb2YgSFZNX1BBUkFNX0RNX0RPTUFJTiBpcyBxZW11LXRyYWQs
IHdoaWNoIGFsd2F5cyBzZXRzCj4gaXQgdG8gRE9NSURfU0VMRiAoaWdub3JpbmcgdGhlIHJldHVy
biB2YWx1ZSBvZiB4Y19zZXRfaHZtX3BhcmFtKSBbMV0gYW5kCj4gbmV2ZXIgcmVhZHMgaXQuCj4g
Cj4gVGhpcyBwYXRjaDoKPiAKPiAtIERpc2FsbG93cyBzZXR0aW5nIEhWTV9QQVJBTV9ETV9ET01B
SU4gdG8gYW55dGhpbmcgb3RoZXIgdGhhbiBET01JRF9TRUxGCj4gICBhbmQgcmVtb3ZlcyB0aGUg
Y2FsbCB0byBodm1fc2V0X2RtX2RvbWFpbigpLgo+IC0gU3RvcHMgcGFzc2luZyBhIGRvbWlkIHRv
IGh2bV9jcmVhdGVfaW9yZXFfc2VydmVyKCkKPiAtIENoYW5nZXMgaHZtX2NyZWF0ZV9pb3JlcV9z
ZXJ2ZXIoKSB0byBhbHdheXMgc2V0Cj4gICBjdXJyZW50LT5kb21haW4tPmRvbWFpbl9pZCBhcyB0
aGUgZG9taWQgb2YgdGhlIGVtdWxhdGluZyBkb21haW4KPiAtIFJlbW92ZXMgdGhlIGh2bV9zZXRf
ZG1fZG9tYWluKCkgaW1wbGVtZW50YXRpb24gc2luY2UgaXQgaXMgbm8gbG9uZ2VyCj4gICBuZWVk
ZWQuCj4gCj4gWzFdIAo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXFlbXUteGVu
LXRyYWRpdGlvbmFsLmdpdDthPWJsb2I7Zj1ody94ZW5fbSAKPiBhY2hpbmVfZnYuYzsjbDI5OQo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
