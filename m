From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 22/25] x86/HVM: do actual CMPXCHG in
 hvmemul_cmpxchg()
Date: Mon, 05 Feb 2018 10:05:39 -0700
Message-ID: <5A789CF302000078001A5677@prv-mh.provo.novell.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295B67020000780019598E@prv-mh.provo.novell.com>
 <86b26aaf-4f2d-2759-547e-397e3b7db753@citrix.com>
 <5A7824B202000078001A5137@prv-mh.provo.novell.com>
 <83da3e62-3156-0759-21ea-f6a5351f05b5@citrix.com>
 <5A78992002000078001A563E@prv-mh.provo.novell.com>
 <e5d332cd-da63-e2c3-392b-0152799c4b29@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=do0y=e7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eikDA-0004ka-CF
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 17:05:44 +0000
In-Reply-To: <e5d332cd-da63-e2c3-392b-0152799c4b29@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDE3OjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMDIvMTggMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4w
Mi4xOCBhdCAxNzowOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDUvMDIvMTggMDg6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDAyLjAyLjE4IGF0
IDE3OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L3N5c3RlbS5oCj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L3N5c3RlbS5oCj4+Pj4+PiBAQCAtMTEwLDYgKzExMCwzOCBAQCBzdGF0aWMgYWx3YXlzX2lu
bGluZSB1bnNpZ25lZCBsb25nIF9fY21wCj4+Pj4+PiAgICAgIHJldHVybiBvbGQ7Cj4+Pj4+PiAg
fQo+Pj4+Pj4gIAo+Pj4+Pj4gK3N0YXRpYyBhbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgY21w
eGNoZ19sb2NhbF8oCj4+Pj4+IHVubG9ja2VkX2NtcHhjaGcoKSA/Cj4+Pj4gTm90IGluIGxpbmUg
d2l0aCBvdXIgY3VycmVudCBuYW1pbmcgc2NoZW1lLgo+Pj4gSXRzIHJhdGhlciBtb3JlIGluIGxp
bmUgdGhhbiBpbnRyb2R1Y2luZyBhIGxvY2FsXyBzdWZmaXguICBUcmFpbGluZwo+Pj4gdW5kZXJz
Y29yZXMgYXJlIGFsbW9zdCBub24tZXhpc3RhbnQsIGFuZCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwg
dXNlZAo+Pj4gZXhjbHVzaXZlbHkgaW4gdGhlIGludGVybmFscyBvZiB0aGUgY29tcGF0IGNvZGUu
Cj4+IFdlbGwsIHRoZSBuYW1lIGNob2ljZSBzdGFydGVkIGZyb20gTGludXgnZXMgY21weGNoZ19s
b2NhbCgpLCBvZgo+PiB3aGljaCB0aGUgZnVuY3Rpb24gaW50cm9kdWNlZCBoZXJlIHdvdWxkIGJl
IGEgaGVscGVyLiBJJ2QgbGlrZSB0bwo+PiBzdGljayB0byB0aGUgTGludXggaW5oZXJpdGVkIG5h
bWluZyBzY2hlbWUgKHJlYWQ6IEkgd2FudCB0byBrZWVwCj4+IHRoZSAiY21weGNoZ19sb2NhbCIg
cGFydCksIGJ1dCBJIGRvbid0IGluc2lzdCBvbiB0aGUgdHJhaWxpbmcKPj4gdW5kZXJzY29yZSAo
d2hpY2ggSSBvbmx5IHVzZSBoZXJlIFthbmQgZWxzZXdoZXJlXSBpbiBwcmVmZXJlbmNlCj4+IG9m
IG5hbWUgc3BhY2UgdmlvbGF0aW5nIGxlYWRpbmcgb25lcykuIEknZCBqdXN0IG5lZWQgYSBzdWdn
ZXN0aW9uCj4+IHRvd2FyZHMgYW4gYWx0ZXJuYXRpdmUgeW91IGNvdWxkIGxpdmUgd2l0aCwgYW5k
IGZpdHRpbmcgdGhlIG91dGxpbmVkCj4+IGNyaXRlcmlhLgo+IAo+IGNtcHhjaGdfbG9jYWwoKSB3
b3VsZCBiZSBiZXR0ZXIgdGhhbiB3aXRoIGEgdHJhaWxpbmcgdW5kZXJzY29yZS4KPiAKPiBTZWVp
bmcgYXMgaXQgbWF0Y2hlcyB0aGUgTGludXggbmFtaW5nIHNjaGVtZSwgdXNpbmcgZXhhY3RseQo+
IGNtcHhjaGdfbG9jYWwoKSB3b3VsZCBiZSB0aGUgbG9naWNhbCBtb3ZlLgoKTm90ZSBob3cgSSd2
ZSBzYWlkICJvZiB3aGljaCB0aGUgZnVuY3Rpb24gaW50cm9kdWNlZCBoZXJlIHdvdWxkIGJlCmEg
aGVscGVyIjogY21weGNoZ19sb2NhbCgpIHNob3VsZCBoYXZlIG5vIHNpemUgcGFyYW1ldGVyLgoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
