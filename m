From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/6] x86emul: fix FMA scalar operand sizes
Date: Tue, 04 Sep 2018 01:52:08 -0600
Message-ID: <5B8E39A802000078001E4F79@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86AC5602000078001E31ED@prv1-mh.provo.novell.com>
 <4e2e1950-e2ee-3a6c-b227-8072d227d699@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx68F-00020L-CL
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 07:52:15 +0000
In-Reply-To: <4e2e1950-e2ee-3a6c-b227-8072d227d699@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE4OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDgvMTggMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBGTUEgaW5zbnMs
IG90aGVyIHRoYW4gdGhlIGVhcmxpZXIgQVZYIGFkZGl0aW9ucywgZG9uJ3QgdXNlIHRoZSBsb3cK
Pj4gb3Bjb2RlIGJpdCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHNpbmdsZSBhbmQgZG91YmxlIHZl
Y3RvciBlbGVtZW50cy4KPiAKPiBJIHRoaW5rIEkndmUgd29ya2VkIG91dCB3aHkgIm90aGVyIHRo
YW4gdGhlIiBpcyBzbyB3ZWlyZCB0byByZWFkIGFzIGEKPiBuYXRpdmUgc3BlYWtlciBoZXJlLiAg
SSB0aGluayB5b3UgbWVhbiAidW5saWtlIHRoZSIgaW4gdGhpcyBjb250ZXh0LgoKQ2hhbmdlZDsg
SSdsbCB0cnkgdG8gcmVtZW1iZXIgdGhpcy4KCj4+IFdoaWxlIHRoZSBkaWZmZXJlbmNlIGlzIGJl
bmlnbiBmb3IgcGFja2VkIGZsYXZvcnMsIHRoZSBzY2FsYXIgb25lcwo+PiBuZWVkIHRvIHVzZSBW
RVguVyBoZXJlLiBPZGRseSBlbm91Z2ggdGhlIHRhYmxlIGVudHJpZXMgZGlkbid0IGV2ZW4gdXNl
Cj4+IHNpbWRfc2NhbGFyX2ZwLCBidXQgdW5pZm9ybWx5IHVzZWQgc2ltZF9wYWNrZWRfZnAgKGlt
cGx5aW5nIHRoZQo+PiBkaXN0aW5jdGlvbiB3YXMgYnkgW1ZFWC1lbmNvZGVkXSBvcGNvZGUgcHJl
Zml4KS4KPiAKPiBXYXMgdGhpcyBhIGJ1ZyBpbiB0aGUgRk1BIHBhdGNoIHRoZW4/CgpZZXMuCgo+
PiBTcGxpdCBzaW1kX3NjYWxhcl9mcCBpbnRvIHNpbWRfc2NhbGFyX29wYyBhbmQgc2ltZF9zY2Fs
YXJfdmV4dywgYW5kCj4+IGNvcnJlY3QgCj4gCj4gTWlzc2luZyB0aGUgcmVzdCBvZiB0aGUgc2Vu
dGVuY2U/ICAodjEgd2FzIHNpbWlsYXIpCgpPb3BzOiAiLi4uYW5kIGNvcnJlY3QgRk1BIHNjYWxh
ciB0YWJsZSBlbnRyaWVzIHRvIHVzZSB0aGUgbGF0dGVyLiIKCj4+IEFsc28gY29ycmVjdCB0aGUg
c2NhbGFyIGluc24gY29tbWVudHMgKHRoZXkgb25seSBldmVyIHVzZSBYTU0gcmVnaXN0ZXJzCj4+
IGFzIG9wZXJhbmRzKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IEFzIGZvciB0aGUgY29kZSBjb250ZW50LCBSZXZpZXdlZC1ieTogQW5k
cmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
