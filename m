From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/svm: Fix handling of ICEBP
 intercepts
Date: Mon, 04 Feb 2019 02:16:39 -0700
Message-ID: <5C5802F702000078002138E4@prv1-mh.provo.novell.com>
References: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
 <5C546CA1020000780021335F@prv1-mh.provo.novell.com>
 <da8c1a3c-353c-93ad-8637-17d1031ccec9@citrix.com>
 <5C547A1B02000078002133E6@prv1-mh.provo.novell.com>
 <9a9b66c9-5fc4-6ed3-585d-7aa5f6d26adb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9a9b66c9-5fc4-6ed3-585d-7aa5f6d26adb@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE5IGF0IDE4OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDIvMjAxOSAxNjo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAx
LjAyLjE5IGF0IDE3OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBJ
ZiBpdCB3ZXJlIGp1c3QgZ2V0dGluZyBpbnNuX2xlbiBpbmNvcnJlY3RseSBhcyAwLCB0aGVuIHRo
ZSBndWVzdCB3b3VsZAo+Pj4gbGl2ZWxvY2sgYXMgd2Ugd291bGRuJ3QgaW5qZWN0IHRoZSAjREIg
d2l0aCB0cmFwIHNlbWFudGljcyBpdCByZXF1aXJlcywKPj4gSSdtIGNvbmZ1c2VkIGFnYWluOiBX
aHkgdHJhcCBzZW1hbnRpY3M/IFRoZSBJQ0VCUCBoYXMgZmF1bHQKPj4gc2VtYW50aWNzIGFzIHlv
dSBjb25maXJtZWQgYWJvdmUuCj4gCj4gVGhlIElDRUJQIGludGVyY2VwdCBoYXMgZmF1bHQgc2Vt
YW50aWNzLiAgQW4gSUNFQlAgaW5zdHJ1Y3Rpb24gZXhlY3V0aW5nCj4gaW4gdGhlIGd1ZXN0IGhh
cyB0cmFwIHNlbWFudGljcy4KCk9oLCBva2F5IC0gSSB3YXMgbWlzLXJlbWVtYmVyaW5nIHRoaXMg
YXNwZWN0LgoKPj4+IGJ1dCBhcyB0aGUgI0dQIGlzIGFscmVhZHkgcmFpc2VkLCB0aGlzIHdpbGwg
Y29tYmluZSB0byAjREYuCj4+IEhvdyB0aGF0PyAjREIgaXMgYSBiZW5pZ24gZXhjZXB0aW9uLCBz
byBhY2NvcmRpbmcgdG8gdGhlIHRhYmxlIG9uIHRoZQo+PiAjREYgcGFnZSBpbiB0aGUgU0RNLCB3
aXRoICNHUCBpdCBzaG91bGRuJ3QgY29tYmluZSB0byAjREYuCj4gCj4gI0dQIGlzIHJhaXNlZCBm
aXJzdC4gIEl0IGlzIGNvbnRyaWJ1dG9yeS4KPiAKPiBBIHN1YnNlcXVlbnQgI0RCIGdldHRpbmcg
cmFpc2VkIGNhdXNlcyAjR1AgdG8gdHVybiBpbnRvICNERi4KClRoYXQncyBiYXNlZCBvbiB3aGF0
PyBUaGUgdGFibGUgb24gdGhlICNERiBwYWdlIGNsZWFybHkgc2F5cwpvdGhlcndpc2UsIGF0IGxl
YXN0IGFjY29yZGluZyB0byBteSByZWFkaW5nLgoKQnV0IGluIHRoZSBlbmQgdGhlcmUgc2hvdWxk
bid0IGJlIGFueSBhdHRlbXB0IHRvIGluamVjdCAjREIgYW55d2F5CndoZW4gI0dQIGlzIGFscmVh
ZHkgcGVuZGluZywgaXJyZXNwZWN0aXZlIG9mIHRoZSBmYWN0IHRoYXQgdGhpcyAjR1AKaXMgbm9u
LWFyY2hpdGVjdHVyYWwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
