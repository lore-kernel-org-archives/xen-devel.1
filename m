From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 17/44] x86emul/test: introduce eq()
Date: Fri, 26 Oct 2018 12:31:44 +0100
Message-ID: <cf3adb41-489b-bf9d-54a7-3ef979ccf4f9@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA39D602000078001EBA54@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8h9=ng=citrix.com=prvs=8302ac893=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gG0LD-0003mx-Ga
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 11:31:47 +0000
In-Reply-To: <5BAA39D602000078001EBA54@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMTggMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIHByZXBhcmF0aW9uIGZv
ciBzZW5zaWJsZSB0by1ib29sZWFuIGNvbnZlcnNpb24gb24gQVZYNTEyLCB3cmFwCj4gYW5vdGhl
ciBhYnN0cmFjdGlvbiBmdW5jdGlvbiBhcm91bmQgdGhlIHByZXNlbnQgdG9fYm9vbCg8eD4gPT0g
PHk+KSwgdG8KPiBnZXQgcmlkIG9mIHRoZSBvcGVuLWNvZGVkID09ICh3aGljaCB3aWxsIGdldCBp
biB0aGUgd2F5IG9mIHVzaW5nCj4gYnVpbHQtaW4gZnVuY3Rpb25zIGluc3RlYWQpLiBGb3IgdGhl
IGZ1dHVyZSBBVlg1MTIgdXNlIHNjYWxhciBvcGVyYW5kcwo+IGNhbid0IGJlIHVzZWQgdGhlbiBh
bnltb3JlOiBVc2UgKHZlY190KXt9IHdoZW4gdGhlIG9wZXJhbmQgaXMgemVybywKPiBhbmQgYnJv
YWRjYXN0IChpZiBhdmFpbGFibGUpIG90aGVyd2lzZSAoYXNzdW1lIHByZS1BVlg1MTIgd2hlbiBi
cm9hZGNhc3QKPiBpcyBub3QgYXZhaWxhYmxlLCBpbiB3aGljaCBjYXNlIGEgcGxhaW4gc2NhbGFy
IGlzIHN0aWxsIGZpbmUpLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
