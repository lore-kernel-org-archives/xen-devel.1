From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Wed, 30 May 2018 13:30:36 -0600
Message-ID: <006db3b8-0bc0-3ec2-6de2-4b6d42eee0db@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <5B06705802000078001C56C9@prv1-mh.provo.novell.com>
 <487269f9-7af5-ad9d-e89c-0c9b8d5bd67c@linaro.org>
 <5B07B6ED02000078001C5D51@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=97iu=ir=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fO6nx-0006b4-Q0
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 19:30:41 +0000
Received: by mail-pl0-x243.google.com with SMTP id u6-v6so11685943pls.9
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 12:30:39 -0700 (PDT)
In-Reply-To: <5B07B6ED02000078001C5D51@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Manish Jaggi <mjaggi@caviumnetworks.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA1LzI1LzIwMTggMToxMCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjQuMDUu
MTggYXQgMjI6MjYsIDxzYW1lZXIuZ29lbEBsaW5hcm8ub3JnPiB3cm90ZToKPj4gT24gMDUvMjQv
MjAxOCAwMTo1NyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyNC4wNS4xOCBhdCAw
Mjo0NiwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4+IC0tLSAvZGV2L251bGwK
Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGludXhfY29tcGF0LmgKPj4+IEkgY29udGludWUg
dG8gZGlzbGlrZSB0aGUgaWRlYSBvZiBoYXZpbmcgYSBoZWFkZXIgd2l0aCB0aGVzZSBjb250ZW50
cyBpbiAKPj4gdGhpcyBsb2NhdGlvbi4KPj4gQXMgZXhwbGFpbmVkIHByZXZpb3VzbHkgdGhpcyBo
ZWFkZXIgY2FuIGJlIHVzZWQgZm9yIHRoZSBhbnkgZHJpdmVyIHRoYXQgCj4+IHdlIHdhbnQgdG8g
cG9ydCBmcm9tIExpbnV4LiBUaGlzIGlzIG5vdCBhcm0gc3BlY2lmaWMuIFRoaXMgc2VlbWVkIGxp
a2UgCj4+IHRoZSBiZXN0IGxvY2F0aW9uIGZvciB0aGUgZmlsZS4KVGhpcyBjb2RlIHdhcyBhZGRl
ZCB0byBldmVyeSBzb3VyY2UgZmlsZSB0aGF0IHdhcyBiZWluZyBwb3J0ZWQuIEkgZm91bmQgdGhp
cyBleHBsaWNpdGx5IGluIHNtbXUtdjIuYy4gRXZlbnR1YWxseSB0aGlzIG1pZ2h0IGJlIG5lZWRl
ZCBmb3IgdGhlIGlvcnQgY29kZSB0aGF0IE1hbmlzaCBtaWdodCBwdWxsIGluLgoKVGhlIGZ1bmN0
aW9uIHNpZ25hdHVyZXMgaW4gdGhlIGhlYWRlciBmaWxlIGFyZSBjb25zaXN0ZW50IGFuZCBzaG91
bGQgbm90IGNoYW5nZS4KClNvLCBpZiB3ZSBwbGFuIG9uIHBvcnRpbmcgYSBsb3Qgb2YgTGludXgg
Y29kZSwgSSB3b3VsZCBhcmd1ZSB0aGF0IHRoaXMgZmlsZSBpcyBhIG5lY2Vzc2l0eSBzbyB0aGF0
IHdlIGRvIG5vdCBkZWZpbmUgdGhlc2UgZnVuY3Rpb25zIGluIGV2ZXJ5IHBvcnRlZCBzb3VyY2Ug
ZmlsZS7CoCAoSWYgd2Ugd2FudCB0byBwb3J0IExpbnV4IGNvZGUgd2l0aCBtaW5pbWFsIGNoYW5n
ZXMuKSBUaGUgb25seSBleGFtcGxlIEkgZm91bmQgaW4gdGhlIGNvZGUgYmFzZSBpcyBhcm0gc21t
dSBkcml2ZXIgYW5kIHRoZSBpb3J0IGNvZGUgdGhhdCBpcyBiZWluZyBwdWxsZWQgaW4uIFNvLCB3
ZSBjYW4gbW92ZSBpdCB0byBhbiBhcm0gc3BlY2lmaWMgbG9jYXRpb24gaWYgbmVlZGVkLCBidXQg
dGhpcyBoZWFkZXIgaXMgbmVlZGVkLgoKVGhhbmtzLApTYW1lZXIKPiBQbGVhc2UgdGFrZSBpbnRv
IGNvbnNpZGVyYXRpb24gdGhhdCB3aXRoIGxvdHMgb2YgY29kZSBvcmlnaW5hbGx5IGhhdmluZyBj
b21lCj4gZnJvbSBMaW51eCwgaW4gYWxsIHRoZSB5ZWFycyB3ZSd2ZSBuZXZlciBoYWQgYSBuZWVk
IHRvIGhhdmUgc3VjaCBhIGhlYWRlci4KPiBXaXRoIHRoYXQgaGlzdG9yeSwgaXQgbmVlZHMgZ29v
ZCByZWFzb25pbmcgdG8gaW50cm9kdWNlIG9uZSBub3cgaW4gc3VjaCBhCj4gZ2xvYmFsIGZhc2hp
b24uCj4KPj4gV2hpY2ggb3RoZXIgY29tbW9uIGxvY2F0aW9uIHNob3VsZCBJIHBpY2s/Cj4gTm9u
ZSAtIHRoYXQncyB0aGUgd2hvbGUgcG9pbnQgb2YgbXkgY29tbWVudDogSSBkb24ndCBzZWUgdGhp
cyBhcyBzb21ldGhpbmcKPiB0aGF0IHNob3VsZCBnbyBpbiBhIGNvbW1vbiBsb2NhdGlvbi4KPgo+
IEphbgo+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
