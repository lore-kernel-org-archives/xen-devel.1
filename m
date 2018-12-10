From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul: refine VME/PVI early #GP check
Date: Mon, 10 Dec 2018 07:05:03 -0700
Message-ID: <5C0E728F0200007800204B06@prv1-mh.provo.novell.com>
References: <5C0E4EBF02000078002049C8@prv1-mh.provo.novell.com>
 <bbd02b9c-cc46-6bca-9397-a5dcb7bacc35@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWMBI-0005va-SI
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:05:08 +0000
In-Reply-To: <bbd02b9c-cc46-6bca-9397-a5dcb7bacc35@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDE0OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMTIvMjAxOCAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEluIGNvbW1p
dCBlZmU5Y2JhNjZjICgieDg2ZW11bDogVk1FIGFuZCBQVkkgbW9kZXMgcmVxdWlyZSBhICNHUCgw
KSBjaGVjawo+PiBmaXJzdCB0aGluZyIpIEkgbmVnbGVjdGVkIHRoZSBmYWN0IHRoYXQgdGhlIHJl
dGlyZSBmbGFncyBnZXQgemFwcGVkIG9ubHkKPj4gaW4geDg2X2RlY29kZSgpLCB3aGljaCBoYXNu
J3QgYmVlbiBpbnZva2VkIHlldCBhdCB0aGUgcG9pbnQgb2YgdGhlICNHUCgwKQo+PiBjaGVjayBh
ZGRlZC4KPj4KPj4gQWhlYWQgb2YgdGhlIG90aGVyIGV4cGxpY2l0IHJldHVybiAocmF0aGVyIHRo
YW4gImdvdG8iKSBwYXRoIHVzZSBhbgo+PiBleHBsaWNpdCByZXR1cm4gaGVyZSB0b28sIHRvIG1h
a2UgdGhlIGZsb3cgbW9yZSBvYnZpb3VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSG93IGRpZCB5b3UgZGlzY292ZXIgdGhpcyBpc3N1
ZT8KCkFGTCBkaXNjb3ZlcmVkIGl0IGZvciBtZS4KCj4gIEkgYXNrIGJlY2F1c2UgZ2l2ZW4gdGhl
IGNvbW1lbnQsIGl0cwo+IHF1aXRlIGxpa2VseSB0aGF0IHlvdSdsbCBoaXQgdGhlIGFzc2VydCBp
biB4ODZfZW11bF9od19leGNlcHRpb24oKQoKSG1tLCBnb29kIHBvaW50OiBJJ2xsIG5lZWQgdG8g
Y2FsbCB4ODZfZW11bF9yZXNldF9ldmVudCgpCmFzIHdlbGwuCgo+IFdoeSBpcyB0aGUgemVyb2lu
ZyBjb2RlIGluIGRlY29kZSByYXRoZXIgdGhhbiBlbXVsYXRlPwoKQmVjYXVzZSB4ODZfZGVjb2Rl
KCkgaGFzIGFub3RoZXIgY2FsbGVyLiBCZXN0IEkgY2FuIHN1Z2dlc3QKaXMgdGhhdCB3ZSBtYWtl
IHg4Nl9lbXVsYXRlKCkgYW5kIHg4Nl9kZWNvZGVfaW5zbigpIGNhbGwgYQpzaGFyZWQgaGVscGVy
IGZ1bmN0aW9uIGRvaW5nIHRoZSBzZXR1cC4KCj4gIEknbSB0ZW1wdGVkIHRvCj4gc3VnZ2VzdCB0
aGF0IHdlIGZpeCB0aGlzIGJ5IHJlcXVpcmluZyB0aGF0IGNhbGxlcnMgcGFzcyBpbiBhIHN1aXRh
Ymx5Cj4gaW5pdGlhbGlzZWQgY3R4dC4KCldlJ3ZlIGRpc2N1c3NlZCByZXF1aXJpbmcgY2FsbGVy
cyB0byBzZXQgc3RhdGUsIGJ1dCBJIGNvbnRpbnVlIHRvCnRoaW5rIHRoYXQgaXQgbWFrZXMgbm8g
c2Vuc2UgdG8gcmVxdWlyZSB0aGlzIGZvciBvdXRwdXQtb25seSBzdGF0ZS4KRnVydGhlcm1vcmUg
d2hhdCB3b3VsZCBjYWxsZXJzIHNldCBpdCB0bz8gWmVyb2luZyBldmVyeXRoaW5nCndvdWxkIGFs
cmVhZHkgaW1wbHkga25vd2xlZGdlIG9mIHRoZSBpbnRlcm5hbCB3b3JraW5ncy4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
