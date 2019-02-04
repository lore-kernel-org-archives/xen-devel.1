From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Mon, 4 Feb 2019 18:11:08 +0100
Message-ID: <20190204171108.dud4pm5wynb6cpmj@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
 <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gWI9=QL=citrix.com=prvs=9315a7b1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gqhmS-0006jg-VU
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 17:11:36 +0000
Content-Disposition: inline
In-Reply-To: <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMDQsIDIwMTkgYXQgMDk6NDE6MzRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjAxLjE5IGF0IDExOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gRHVlIHRvIHRoZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgaW9tbXUgbWFwcGluZyBs
b2dpYywgdGhlIHN0YXJ0Cj4gPiBhZGRyZXNzZXMgcHJvdmlkZWQgbmVlZCB0byBiZSBhbGlnbmVk
IHRvIHRoZSBvcmRlciBpbnRlbmRlZCB0byBiZQo+ID4gbWFwcGVkLgo+IAo+IElycmVzcGVjdGl2
ZSBvZiB5b3VyIHJlcGx5IHRvIFdlaSdzIHNpbWlsYXIgcmVxdWVzdCAod2hlcmUgeW91J3ZlCj4g
cHJvdmlkZWQgbGlua3MgdG8gbWFpbHMgc2hvd2luZyBjcmFzaGVzKSBJJ2QgbGlrZSB5b3UgdG8g
ZXhwbGFpbgo+IHRoaXMgYmV0dGVyLiBUaGlzIGlzIGluIHBhcnRpY3VsYXIgYmVjYXVzZSBJIGRv
bid0IHJlYWxseSBzZWUgd2hhdAo+ICJyZWNlbnQgY2hhbmdlcyBpbiB0aGUgaW9tbXUgbWFwcGlu
ZyBsb2dpYyIgeW91IHRhbGsgYWJvdXQuCgpDb21taXQgNzI1YmYwMGE4N2YgKCJpb21tdSAvIHAy
bTogYWRkIGEgcGFnZV9vcmRlciBwYXJhbWV0ZXIgdG8KaW9tbXVfbWFwL3VubWFwX3BhZ2UoKS4u
LiIpIGFkZGVkIHRoZSBmb2xsb3dpbmcgdHdvIGFzc2VydHMgdG8KaW9tbXVfbWFwOgoKQVNTRVJU
KElTX0FMSUdORUQoZGZuX3goZGZuKSwgKDF1bCA8PCBwYWdlX29yZGVyKSkpOwpBU1NFUlQoSVNf
QUxJR05FRChtZm5feChtZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKSk7CgpQcmV2aW91c2x5IGlv
bW11X21hcCB3b3VsZCBhZGQgdW5hbGlnbmVkIGVudHJpZXMgd2l0aG91dCBjb21wbGFpbmluZywK
YnV0IG5vdyBpbiBkZWJ1ZyBidWlsZHMgdGhlIGFzc2VydCB3aWxsIHRyaWdnZXIuCgpNYXliZSBh
ZGRpbmcgYSAnRml4ZXMnIHRhZyB3b3VsZCBoZWxwIGlkZW50aWZ5aW5nIHdoYXQgdGhpcyBjb21t
aXQgaXMKdHJ5aW5nIHRvIGFkZHJlc3M/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
