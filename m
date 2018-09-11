From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 10:20:49 +0100
Message-ID: <c175f9c8-3b6b-46b5-abbd-8fe6b6e83a9c@citrix.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <5B97868502000078001E712B@prv1-mh.provo.novell.com>
 <f150cba5-9458-fe1a-a974-4373e4636e7c@citrix.com>
 <5B97886002000078001E7151@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l7he=lz=citrix.com=prvs=785855fd2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fzeqr-0005JK-5p
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:20:53 +0000
In-Reply-To: <5B97886002000078001E7151@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDkvMTggMTA6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDExLjA5LjE4IGF0
IDExOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDExLzA5LzE4
IDEwOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDExLjA5LjE4IGF0IDEwOjUwLCA8
YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTEuMDkuMTggMTE6MjcsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBOQUssIGZvciB0d28gcmVhc29uczogSSdtIG5vdCBvZiB0
aGUgb3BpbmlvbiB0aGF0IHJlYWRpbmcgYSAxNSBvciBtb3JlCj4+Pj4+IGRpZ2l0IGRlY2ltYWwg
bnVtYmVyIHdpdGhvdXQgYW55IHNlcGFyYXRvcnMgaXMgYW55IGVhc2llciB0aGFuIHRoZQo+Pj4+
PiBjdXJyZW50IGZvcm1hdC4KPj4+PiBJdCdzIHF1aXRlIHN1YmplY3RpdmUuIElNSE8gdGltZXN0
YW1wcyBtZWFzdXJlZCBpbiBucyBlYXNpZXIgdG8gCj4+Pj4gdW5kZXJzdGFuZCBpbiBkZWNpbWFs
cyByYXRoZXIgdGhhbiBpbiBzZXBhcmF0ZWQgMzItYml0IGhleC1lcy4gTm8gbWF0dGVyIAo+Pj4+
IGhvdyBtYW55IGRpZ2l0YWwgbnVtYmVyIHRoZXkgaGF2ZS4KPj4+IEl0IGlzIHN1YmplY3RpdmUs
IHllcywgYnV0IGluIHN1Y2ggYSBjYXNlIHlvdSBldmVuIG1vcmUgc28gbmVlZCB0bwo+Pj4gZGVt
b25zdHJhdGUgYSBjaGFuZ2UgaXMgYW4gb3ZlcmFsbCBpbXByb3ZlbWVudC4KPj4+Cj4+Pj4gRXZl
biBwb3N0IHByb2Nlc3Npbmcgb2YgcGVyZmMgb3V0cHV0IGlzIGVhc2llciBpbiBjYXNlIG9mIGRl
Y2ltYWwgCj4+Pj4gdGltZXN0YW1wcy4gWW91IHNob3VsZCBub3QgcGFyc2UgaGV4ZXMgYW5kIG9k
ZCBzZXBhcmF0b3JzIHRvIGNhbGN1bGF0ZSAKPj4+PiB0aGUgdGltZSBlbGFwc2VkIGJldHdlZW4g
dHdvIHNhbXBsZXMuCj4+PiBQb3N0IHByb2Nlc3NpbmcgdXN1YWxseSB1c2VzIHNjcmlwcyBmb3Ig
cGFyc2luZyAtIEkgZG9uJ3QgdGhpbmsgaXQncwo+Pj4gb3Zlcmx5IGNvbXBsaWNhdGVkIHRvIGhh
dmUgYSBzY3JpcHQgY29udmVydCB0aGUgbnVtYmVyIGludG8KPj4+IGJhc2ljYWxseSBhbnkgZm9y
bWF0IHlvdSB3YW50Lgo+PiBSaWdodCwgYnV0IHRoaXMgcGFydGljdWxhciBtaXMtcGF0dGVybiB3
YW50cyBmaXhpbmcuICBJdCBpcyBzaW1wbHkKPj4gY29uZnVzaW5nIHRvIGhhdmUgYSBzaW5nbGUg
bnVtYmVyIGZvcm1hdHRlZCB3aXRoIGEgY29sb24gaW5iZXR3ZWVuLgo+IFdoYXQgb3RoZXIgc2Vw
YXJhdG9yIGRvIHlvdSBzdWdnZXN0PyBJIGNvbnNpZGVyIGl0IHF1aXRlIGhlbHBmdWwKPiB0byBo
YXZlIG9uZSB3aGVuIHRoZXJlIGFyZSBtb3JlIHRoYW4gYWJvdXQgMTAgZGlnaXRzLiAoSSdkIGFs
c28KPiBiZSBmaW5lLCBidHcsIHRvIGhhdmUgdGhlIHRpbWUgcHJpbnRlZCBpbiBkZWNpbWFsLCBi
dXQgdGhlbgo+IHBlcmhhcHMgd2l0aCBtcyBncmFudWxhcml0eSBhbmQgNiBkaWdpdHMgZm9yIHRo
ZSBmcmFjdGlvbmFsIHBhcnQuKQoKSXQgaXMgY3VycmVudGx5IG1vcmUgY29tbW9uIGFjcm9zcyB0
aGUgYmFzZSB0byB1c2UgdGhlIGZvcm1hdCBwcm9wb3NlZApieSBBbmRyaWkuCgpGb3IgY29uc2lz
dGVudGx5IGFsb25lLCB0aGF0IGZvcm1hdCBzaG91bGQgYmUgZm9sbG93ZWQsIG9yICpldmVyeXRo
aW5nKgpzaG91bGQgYmUgY2hhbmdlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
