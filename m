From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
Date: Tue, 14 May 2019 05:29:41 -0600
Message-ID: <5CDAA6A5020000780022E8AC@prv1-mh.provo.novell.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
 <1c8b7f5f-09d7-6e38-1e78-9528c1f0a756@arm.com>
 <5CDA8EF0020000780022E756@prv1-mh.provo.novell.com>
 <d270589f-4076-ee40-d316-2939f67d7c0b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQVcw-0001c8-6P
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:29:46 +0000
In-Reply-To: <d270589f-4076-ee40-d316-2939f67d7c0b@arm.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjIzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE0LzA1LzIwMTkgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNC4wNS4x
OSBhdCAxMTozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIGEgc2ltaWxh
ciB0b3BpYywgaG93IGRvZXMgS2V4ZWMgd29ya3Mgb24gWGVuPyBEbyB3ZSByZXNldCB0aGUKPj4+
IGRvbWFpbiBhcyB3ZWxsPwo+PiAKPj4gTm8sIGhvdyBjb3VsZCB3ZT8gV2hhdCBnZXRzIGludm9r
ZWQgaXNuJ3QgWGVuIGluIHRoZSBjb21tb24gY2FzZSwKPj4gYnV0IHNvbWUgb3RoZXIgKHR5cGlj
YWxseSBiYXJlIG1ldGFsKSBPUyBsaWtlIExpbnV4Lgo+IAo+IEl0IGlzIG5vdCB3aGF0IEkgYXNr
ZWQuIFdoYXQgSSBhc2tlZCBpcyB3aGV0aGVyIFhlbiBpcyBpbnZvbHZlZCB3aGVuIGEgZ3Vlc3Qg
Cj4ga2VybmVsIGlzIGtleGVjaW5nIHRvIGFub3RoZXIga2VybmVsLgoKSSBkb24ndCB0aGluayBJ
J3ZlIGV2ZXIgaGVhcmQgb2Ygc3VjaCBhIHRoaW5nIChvdXRzaWRlIG9mIHBlcmhhcHMKdXNpbmcg
ZG9tYWluIHJlc2V0KSwgc28gSSBkb24ndCB0aGluayBJIGNhbiBhbnN3ZXIgdGhlIChvcmlnaW5h
bGx5CmFtYmlndW91cykgcXVlc3Rpb24gdGhlbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
