From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 10:24:16 +0100
Message-ID: <91a59884-bb7b-1042-4632-335a8c3480d2@citrix.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tpi7=lz=citrix.com=prvs=785918234=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fzeuE-0005fb-HN
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:24:22 +0000
In-Reply-To: <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>, andrii.anisov@gmail.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTEvMjAxOCAwOTo1MCBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKYW4s
Cj4gCj4gCj4gT24gMTEuMDkuMTggMTE6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBOQUssIGZv
ciB0d28gcmVhc29uczogSSdtIG5vdCBvZiB0aGUgb3BpbmlvbiB0aGF0IHJlYWRpbmcgYSAxNSBv
ciBtb3JlCj4+IGRpZ2l0IGRlY2ltYWwgbnVtYmVyIHdpdGhvdXQgYW55IHNlcGFyYXRvcnMgaXMg
YW55IGVhc2llciB0aGFuIHRoZQo+PiBjdXJyZW50IGZvcm1hdC4KPiBJdCdzIHF1aXRlIHN1Ympl
Y3RpdmUuIElNSE8gdGltZXN0YW1wcyBtZWFzdXJlZCBpbiBucyBlYXNpZXIgdG8KPiB1bmRlcnN0
YW5kIGluIGRlY2ltYWxzIHJhdGhlciB0aGFuIGluIHNlcGFyYXRlZCAzMi1iaXQgaGV4LWVzLiBO
byBtYXR0ZXIKPiBob3cgbWFueSBkaWdpdGFsIG51bWJlciB0aGV5IGhhdmUuCj4gRXZlbiBwb3N0
IHByb2Nlc3Npbmcgb2YgcGVyZmMgb3V0cHV0IGlzIGVhc2llciBpbiBjYXNlIG9mIGRlY2ltYWwK
PiB0aW1lc3RhbXBzLiBZb3Ugc2hvdWxkIG5vdCBwYXJzZSBoZXhlcyBhbmQgb2RkIHNlcGFyYXRv
cnMgdG8gY2FsY3VsYXRlCj4gdGhlIHRpbWUgZWxhcHNlZCBiZXR3ZWVuIHR3byBzYW1wbGVzLgoK
SSBhZ3JlZSB3aXRoIHRoaXMuICBQcmludGluZyBpbiBoZXhhZGVjaW1hbCBpcyB1c2VmdWwgaWYg
eW91IG5lZWQgdG8gc2VlCnRoZSBiaXR3aXNlIHN0cnVjdHVyZSBvZiB0aGUgY29udGVudDsgdGhh
dCdzIG9mIHplcm8gdXNlIHdoZW4gaXQgY29tZXMKdG8gdGltZXN0YW1wcy4gIE9uIHRoZSBjb250
cmFyeSwgeW91IGFsbW9zdCBhbHdheXMgd2FudCB0byBiZSBhYmxlIHRvIGRvCmEgc3VidHJhY3Rp
b24gaW4geW91ciBoZWFkIGFuZCBnZXQgYXQgbGVhc3QgYW4gb3JkZXItb2YtbWFnbml0dWRlCmRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgdGltZXMsIHNvbWV0aGluZyB3aGljaCBpcyBmYXIgdG9vIGRp
ZmZpY3VsdCBpbiBoZXguCgpUaGUgZmFjdCB0aGF0IHdlIGV2ZW4gaGF2ZSBQUklfc3RpbWUgaXMg
ZXZpZGVuY2UgdGhhdCB0aGUgZGV2ZWxvcGVyCmNvbW11bml0eSBhcyBhIHdob2xlIGFncmVlcy4K
Cj4+IMKgIEFuZCB0aGVuIGlmIHlvdS93ZSB3ZXJlIHRvIGNoYW5nZSB0aGlzLCB0aGVuIHBsZWFz
ZQo+PiB1bmlmb3JtbHkgZXZlcnl3aGVyZSAtIHRoZXJlJ3MgZXZlbiBhIHNlY29uZCBpbnN0YW5j
ZSByaWdodCBpbiB0aGlzCj4+IHNhbWUgZmlsZSB5b3UgY2hhbmdlLCBub3QgdG8gc3BlYWsgb2Yg
c2ltaWxhciBvbmVzIGVsc2V3aGVyZQoKUHJlc3VtYWJseSB0aGUgZmFjdCB0aGF0IHdlIGhhdmUg
UFJJX3N0aW1lIGRlZmluZWQgbWVhbnMgdGhhdCAqbW9zdCoKcGxhY2VzIGFscmVhZHkgdXNlIHRo
aXMgZm9ybWF0LCBhbmQgdGhlIHBsYWNlcyB3aXRoIGA6YCBpbiB0aGUgbWlkZGxlCmFyZSBvdXRs
aWVycy4gIEl0J3MgcGVyZmVjdGx5IGFjY2VwdGFibGUgdG8gY2hhbmdlIHRoZW0gb25lIGJ5IG9u
ZTsKY2hhbmdpbmcgdGhlbSBhbGwgc2hvdWxkIG9ubHkgYmUgYSBzdWdnZXN0aW9uLgoKIC1HZW9y
Z2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
