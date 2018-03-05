From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 06/16] xen/x86: Remove unused override of
 page_to_mfn/mfn_to_page
Date: Mon, 5 Mar 2018 13:29:49 +0000
Message-ID: <e974386a-e61f-1cdf-09f0-5be2f405ca0c@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-7-julien.grall@arm.com>
 <5A9970F602000078001ADD71@prv-mh.provo.novell.com>
 <f1b55999-e105-e504-eb24-95946ef5e680@arm.com>
 <5A9977AA02000078001ADE13@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9977AA02000078001ADE13@prv-mh.provo.novell.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDIvMDMvMTggMTU6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAy
LjAzLjE4IGF0IDE1OjQ0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAwMi8w
My8xOCAxNDo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMS4wMi4xOCBhdCAxNTow
MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBBIGZldyBmaWxlcyBvdmVycmlk
ZSBwYWdlX3RvX21mbi9tZm5fdG9fcGFnZSBidXQgYWN0dWFsbHkgbmV2ZXIgdXNlCj4+Pj4gdGhv
c2UgbWFjcm9zLiBTbyBkcm9wIHRoZW0uCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4KPj4+IEl0IGRvZXNuJ3QgbG9vayBsaWtl
IHRoZXJlIGFyZSBhbnkgcmlza3kgdXNlcyBvZiB0aGUgcmVtb3ZlZAo+Pj4gc3ltYm9scyBpbiB0
aGUgaGVhZGVycywgc28KPj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4+PiBhc3N1bWluZyB0aGlzIGhhcyBiZWVuIGJ1aWxkLXRlc3RlZCBpbiByZWxldmFudCBj
b25maWd1cmF0aW9ucy4KPj4KPj4gQWxsIHBhdGNoZXMgaGF2ZSBiZWVuIGJ1aWxkLXRlc3RlZCBv
bmUgYnkgb25lLgo+IAo+IEkndmUgdGFrZW4gdGhhdCBmb3IgZ2l2ZW4uIEkgZGlkIHNheSAiaW4g
cmVsZXZhbnQgY29uZmlndXJhdGlvbnMiCj4gYmVjYXVzZSB0aGluZ3MgbGlrZSBCSUdNRU09eSBv
ciBTSEFET1dfUEFHSU5HPW4gbWF5Cj4gY2F1c2UgaXNzdWVzIGRlc3BpdGUgYSAibm9ybWFsIiBi
dWlsZCBoYXZpbmcgZ29uZSBmaW5lLgoKSSBoYXZlIG5vdyBidWlsdCB0ZXN0IHRoaXMgcGF0Y2gg
d2l0aCBCSUdNRU09eSwgU0hBRE9XX1BBR0lORz1uIGFuZCBzYXcgCm5vdCBjb21waWxhdGlvbiBl
cnJvcnMuCgpDaGVlcnMsCgo+IAo+IEphbgo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
