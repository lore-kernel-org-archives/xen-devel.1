From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Tue, 11 Sep 2018 01:58:50 -0600
Message-ID: <5B9775BA02000078001E703D@prv1-mh.provo.novell.com>
References: <20180831082921.11208-1-olaf@aepfle.de>
 <5B88FFBB02000078001E3CA8@prv1-mh.provo.novell.com>
 <5B966FC202000078001E6C53@prv1-mh.provo.novell.com>
 <5B9671D002000078001E6C86@prv1-mh.provo.novell.com>
 <75533283-9553-f227-0e25-05ecff0ece92@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzdZX-0003Fy-Uf
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 07:58:55 +0000
In-Reply-To: <75533283-9553-f227-0e25-05ecff0ece92@citrix.com>
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE5OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMDkvMTggMTQ6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4w
OS4xOCBhdCAxNToyMSwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+IE9uIDMxLjA4
LjE4IGF0IDEwOjQzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+Pj4+IE9uIDMxLjA4
LjE4IGF0IDEwOjI5LCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1Zwo+Pj4+PiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4+PiBAQCAtMTEsNiAr
MTEsMTMgQEAgY29uZmlnIERFQlVHCj4+Pj4+ICAKPj4+Pj4gIAkgIFlvdSBwcm9iYWJseSB3YW50
IHRvIHNheSAnTicgaGVyZS4KPj4+Pj4gIAo+Pj4+PiArY29uZmlnIERFQlVHX0lORk8KPj4+Pj4g
Kwlib29sICJDb21waWxlIFhlbiB3aXRoIGRlYnVnIGluZm8iCj4+Pj4+ICsJZGVmYXVsdCB5Cj4+
Pj4+ICsJLS0taGVscC0tLQo+Pj4+PiArCSAgSWYgeW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGlu
ZyBYZW4gd2lsbCBpbmNsdWRlIGRlYnVnZ2luZyBpbmZvCj4+Pj4+ICsJICByZXN1bHRpbmcgaW4g
YSBsYXJnZXIgYmluYXJ5IGltYWdlLgo+Pj4+PiArCj4+Pj4+ICBpZiBERUJVRyB8fCBFWFBFUlQg
PSAieSIKPj4+PiBQZXJoYXBzIGJldHRlciBtb3ZlIHlvdXIgYWRkaXRpb24gaW50byB0aGlzIGNv
bmRpdGlvbmFsIHNlY3Rpb24/Cj4+PiBTbyB0aGlzIHdhcyBhIGJhZCBzdWdnZXN0aW9uIGFmdGVy
IGFsbCAtIHdpdGggREVCVUc9biBERUJVR19JTkZPIGlzCj4+PiBub3cgaW1wbGljaXRseSBuIGFz
IHdlbGwuIFRoZSBzZWN0aW9uIG5lZWRzIHRvIGJlIG1vdmVkIGJhY2sgdG8gd2hlcmUKPj4+IHlv
dSBoYWQgaXQgYXMgcGVyIGFib3ZlLCB3aXRoIHRoZSBfcHJvbXB0XyBkZXBlbmRpbmcgb24KPj4+
IERFQlVHIHx8IEVYUEVSVD0ieSIuCj4+IEZ1cnRoZXJtb3JlIC0gaXMgQ09WRVJBR0Ugd2l0aG91
dCBERUJVR19JTkZPIG9mIGFueSB1c2U/Cj4gCj4gWWVzIC0gdmVyeSBtdWNoIHNvLgo+IAo+IEZy
b20gYSAiaG93IG11Y2ggb2YgbXkgYmluYXJ5IGRvZXMgZG8gbXkgdGVzdHMgY292ZXIiIHBvaW50
IG9mIHZpZXcsIHlvdQo+IHdhbnQgdGhlIHJlbGVhc2UgYmluYXJ5IHJhdGhlciB0aGFuIHRoZSBk
ZWJ1ZyBiaW5hcnkuCgpEaWQgeW91IGNvbmZ1c2UgREVCVUcgYW5kIERFQlVHX0lORk8/IE15IHF1
ZXN0aW9uIHdhcyBiZWNhdXNlCkkgc3VzcGVjdCB0aGUgYW5hbHl6ZXIgdG8gd2FudC9uZWVkIHRv
IGhhdmUgZGVidWcgaW5mb3JtYXRpb24gYXZhaWxhYmxlLgoKPj4gQXJlIHRoZXJlCj4+IHBlcmhh
cHMgYW55IG90aGVyIGRlcGVuZGVuY2llcyAoSSB0aGluay9ob3BlIGxpdmUgcGF0Y2hpbmcgbG9n
aWMgZG9lc24ndAo+PiBkZXBlbmQgb24gZGVidWcgaW5mbyk/Cj4gCj4gVGhlIGxpdmVwYXRjaCBi
dWlsZCBkZXBlbmRzIG9uIHhlbi1zeW1zIGNvbnRhaW5pbmcgYWxsIHRoZSBkZWJ1Zwo+IGluZm9y
bWF0aW9uLCBidXQgdGhlIHJ1bnRpbWUgbG9naWMgZG9lc24ndCwgSSBiZWxpZXZlLgoKQnV0IGlm
IHRoZSBsaXZlcGF0Y2ggYnVpbGQgcmVxdWlyZXMgZGVidWcgaW5mb3JtYXRpb24gKHJhdGhlciB0
aGFuIGp1c3QKdGhlIEVMRiBzeW1ib2wgdGFibGUpLCB0aGVuIGl0IF9pc18gZGVwZW5kaW5nIG9u
IERFQlVHX0lORk8uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
