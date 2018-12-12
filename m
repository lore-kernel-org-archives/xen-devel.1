From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: improve paging memory
 usage calculations
Date: Wed, 12 Dec 2018 03:57:41 -0700
Message-ID: <5C10E9A5020000780020569D@prv1-mh.provo.novell.com>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-3-roger.pau@citrix.com>
 <5C0FD5860200007800205220@prv1-mh.provo.novell.com>
 <20181211153651.kgltzqwy5cbj5rpq@mac>
 <5C0FE4090200007800205338@prv1-mh.provo.novell.com>
 <20181212093718.cyyfhdo73slsbpt3@mac>
 <5C10DC0E020000780020561B@prv1-mh.provo.novell.com>
 <20181212101648.fqww462x7jiwsjpp@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gX2D4-0007Do-FF
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 10:57:46 +0000
In-Reply-To: <20181212101648.fqww462x7jiwsjpp@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjEyLjE4IGF0IDExOjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZXJlIGFyZSBhbHNvIGZ1cnRoZXIgaXNzdWVzIHRoYXQgSSB3YW50ZWQgdG8gZGlzY3VzcyBp
biBhIHNlcGFyYXRlCj4gdGhyZWFkLCB3aGF0IGFib3V0IGZvcmVpZ24gbWFwcGluZ3M/IERvbTAg
d2lsbCBsaWtlbHkgbWFwIGEgbm9uCj4gdHJpdmlhbCBhbW91bnQgb2YgZ3JhbnRzIGFuZCBmb3Jl
aWduIG1hcHBpbmdzLCB3aGljaCB3aWxsIGFsc28gcmVxdWlyZQo+IHAybS9JT01NVSBwYWdlIHRh
YmxlIGVudHJpZXMuCgpIbW0sIGdvb2QgcG9pbnQuIFRoZW4gYWdhaW4gdGhpcyBpcyBhIHJ1bnRp
bWUgcmVxdWlyZW1lbnQsCndoZXJlYXMgaGVyZSB3ZSB3YW50IHRvIGdldCB0aGUgYm9vdCB0aW1l
IGVzdGltYXRlIHJpZ2h0LiBBdApydW50aW1lIGxhY2sgb2YgbWVtb3J5IGZvciBQMk0gdGFibGVz
IHdpbGwgc2ltcGx5IHJlc3VsdCBpbgotRU5PTUVNLgoKPiBTaG91bGQgd2UgbWF5YmUgc2l6ZSBE
b20wIHAybS9pb21tdSBpbnRlcm5hbCBwYWdpbmcgc3RydWN0dXJlcyB0byBiZQo+IGFibGUgdG8g
bWFwIHVwIHRvIG1heF9wYWdlIGF0IGxlYXN0PwoKV2VsbCwgbWF4X3BhZ2UgaXMgYSBncm9zcyBv
dmVyLWVzdGltYXRlIG9mIFJBTSAoZXNwZWNpYWxseSB3aXRoCmRvbTBfbWVtPSBpbiBlZmZlY3Qp
IGFuZCBkb2Vzbid0IGhlbHAgYXQgYWxsIHdpdGggTU1JTyBvciB0aGUKZm9yZWlnbi9ncmFudCBt
YXBzIHlvdSBtZW50aW9uLgoKSSB3b25kZXIgd2hldGhlciBmb3IgRG9tMCB3ZSBkb24ndCBuZWVk
IHRvIGNoYW5nZSB0aGUgZW50aXJlCmFwcHJvYWNoIG9mIGhvdyB3ZSBzZXQgaXQgdXAgaW4gUFZI
IG1vZGU6IEluc3RlYWQgb2YgYSBzaW5nbGUKcGFnaW5nX3NldF9hbGxvY2F0aW9uKCksIHdoeSBk
b24ndCB3ZSBjYWxsIHRoZSBmdW5jdGlvbgpyZXBlYXRlZGx5IHdoZW5ldmVyIHdlIHJ1biBvdXQg
b2Ygc3BhY2UsIHNocmlua2luZyB3aGF0IHdlCmFjdHVhbGx5IGdpdmUgdG8gRG9tMCBhY2NvcmRp
bmdseSAoYW5kIGluY3JlbWVudGFsbHkpLiBGb3IgdGhlClBDSSBCQVIgbWFwcGluZ3MgdGhpcyB3
b3VsZCByZXF1aXJlIGRvaW5nIHNvIHdoZW4gdGhlIERvbTAKa2VybmVsIGlzIGFscmVhZHkgcnVu
bmluZywgYnV0IEkgdGhpbmsgdGhhdCdzIGFjY2VwdGFibGUuIFBDSQpkZXZpY2UgYWRkIHdvdWxk
IGZhaWwgd2l0aCAtRU5PTUVNIHdoZW4gdGhlIGFsbG9jYXRpb24gcG9vbHMKY2FuJ3QgYmUgc3Vp
dGFibHkgZ3Jvd24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
