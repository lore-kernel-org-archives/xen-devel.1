From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
Date: Thu, 23 May 2019 02:27:41 -0600
Message-ID: <5CE6597D0200007800231998@prv1-mh.provo.novell.com>
References: <20190422164106.20331-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
 <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTj50-0002R3-RJ
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:28:02 +0000
In-Reply-To: <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA0LjE5IGF0IDEyOjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI0LzA0LzIwMTkgMDE6MjAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gTW9u
LCAyMiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gVGhpcyBjb2RlIGlzIHByZXR0
eSBuYXN0eSwgYnV0IEkgaGF2ZW4ndCBmb3VuZCBhIGJldHRlciB3YXkgZm9yIGF2b2lkaW5nCj4+
PiB0byBjaGVjayBpZiBDT05GSUdfREVCVUcgaXMgZW5hYmxlZCB3aGVuIHRoZSB0YXJnZXQgY2xl
YW4gaXMgY2FsbGVkLgo+Pj4KPj4+IElkZWFsbHkgd2Ugd2lsbCB3YW50IHRvIG1vdmUgQ09ORklH
X0VBUkxZX1BSSU5USyBpbiBLY29uZmlnLiBJIGhhdmVuJ3QKPj4+IGhhZCB0aW1lIHlldCB0byBs
b29rIGF0IGl0IHByb3Blcmx5IHNvIGZhci4KClRoaXMsIHRvIG1lLCB3b3VsZCBzZWVtIHRvIGJl
IHRoZSBtdWNoIGJldHRlciBhcHByb2FjaCwgYXMgaXQgd291bGQKYXZvaWQgcmVwbGFjaW5nIG9u
ZSBuYXN0eSBjb25zdHJ1Y3QgYnkgYW5vdGhlci4gQXJlIHRoZXJlIGFueQpjb21wbGljYXRpb25z
PwoKPj4gQ2FuIHdlIGluY2x1ZGUgLmNvbmZpZyBpbiB0aGUgY2xlYW4gdGFyZ2V0Pwo+IEkgZGlk
IG9ubHkgbWVudGlvbiB0aGUgY2xlYW4gdGFyZ2V0IGluIHRoZSBjb21taXQgbWVzc2FnZSBidXQg
dGhlIGlzc3VlIGlzIHRoZSAKPiBzYW1lIGZvciBhbnkgdGFyZ2V0IG5vdCBpbmNsdWRlIC5jb25m
aWcuIEZvciBpbnN0YW5jZSwgYSBkaXN0Y2xlYW4gcmVzdWx0cyB0byAKPiB0aGUgc2FtZSBlcnJv
ci4KPiAKPiBJdCBhbHNvIGZlZWxzIHF1aXRlIHdyb25nIHRvIGV4cGVjdCB0aGUgLmNvbmZpZyB0
byBiZSBpbiBwbGFjZSBmb3IgYW55IHRhcmdldCAKPiBvdGhlciB0aGFuIGJ1aWxkLgoKSSBhZ3Jl
ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
