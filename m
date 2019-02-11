From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] x86: respect memory size limiting
 via mem= parameter
Date: Mon, 11 Feb 2019 13:14:59 +0100
Message-ID: <bd5863a2-291a-43e5-7633-c84c1026a31b__27693.7257660151$1549887362$gmane$org@suse.com>
References: <20190130082233.23840-1-jgross@suse.com>
 <20190130082233.23840-2-jgross@suse.com> <20190211120650.GA74879@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3PTQ=QS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gtAUL-0008V4-HV
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 12:15:05 +0000
In-Reply-To: <20190211120650.GA74879@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDIvMjAxOSAxMzowNiwgSW5nbyBNb2xuYXIgd3JvdGU6Cj4gCj4gKiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+IAo+PiBXaGVuIGxpbWl0aW5nIG1lbW9yeSBz
aXplIHZpYSBrZXJuZWwgcGFyYW1ldGVyICJtZW09IiB0aGlzIHNob3VsZCBiZQo+PiByZXNwZWN0
ZWQgZXZlbiBpbiBjYXNlIG9mIG1lbW9yeSBtYWRlIGFjY2Vzc2libGUgdmlhIGEgUENJIGNhcmQu
Cj4+Cj4+IFRvZGF5IHRoaXMga2luZCBvZiBtZW1vcnkgd29uJ3QgYmUgbWFkZSB1c2FibGUgaW4g
aW5pdGlhbCBtZW1vcnkKPj4gc2V0dXAgYXMgdGhlIG1lbW9yeSB3b24ndCBiZSB2aXNpYmxlIGlu
IEU4MjAgbWFwLCBidXQgaXQgbWlnaHQgYmUKPj4gYWRkZWQgd2hlbiBhZGRpbmcgUENJIGRldmlj
ZXMgZHVlIHRvIGNvcnJlc3BvbmRpbmcgQUNQSSB0YWJsZSBlbnRyaWVzLgo+Pgo+PiBOb3QgcmVz
cGVjdGluZyAibWVtPSIgY2FuIGJlIGNvcnJlY3RlZCBieSBhZGRpbmcgYSBnbG9iYWwgbWF4X21l
bV9zaXplCj4+IHZhcmlhYmxlIHNldCBieSBwYXJzZV9tZW1vcHQoKSB3aGljaCB3aWxsIHJlc3Vs
dCBpbiByZWplY3RpbmcgYWRkaW5nCj4+IG1lbW9yeSBhcmVhcyByZXN1bHRpbmcgaW4gYSBtZW1v
cnkgc2l6ZSBhYm92ZSB0aGUgYWxsb3dlZCBsaW1pdC4KPiAKPiBTbyBoaXN0b3JpY2FsbHkgJ21l
bT14eHhNJyB3YXMgYSB3YXkgdG8gcXVpY2tseSBsaW1pdCBSQU0uCgpSaWdodC4KCj4gSWYgUENJ
IGRldmljZXMgaGFkIHBoeXNpY2FsIG1taW8gbWVtb3J5IGFyZWFzIGFib3ZlIHRoaXMgcmFuZ2Us
IHdlJ2QgCj4gc3RpbGwgZXhwZWN0IHRoZW0gdG8gd29yayAtIHRoZSBvcHRpb24gd2FzIHJlYWxs
eSBvbmx5IG1lYW50IHRvIGxpbWl0IAo+IFJBTS4KCk5vLCBpbiB0aGlzIGNhc2UgaXQgc2VlbXMg
dG8gYmUgcmVhbCBSQU0gYWRkZWQgdmlhIFBDSS4gVGhlIFJBTSBpcwppbml0aWFsbHkgcHJlc2Vu
dCBpbiB0aGUgRTgyMCBtYXAsIGJ1dCB0aGUgIm1lbT0iIHdpbGwgcmVtb3ZlIGl0IGZyb20KdGhl
cmUgYWdhaW4uIER1cmluZyBBQ1BJIHNjYW4gaXQgaXMgZm91bmQgKGFnYWluKSBhbmQgd2lsbCBi
ZSBhZGRlZAp2aWEgaG90cGx1ZyBtZWNoYW5pc20sIHNvICJtZW09IiBoYXMgbm8gZWZmZWN0IGZv
ciB0aGF0IG1lbW9yeS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
