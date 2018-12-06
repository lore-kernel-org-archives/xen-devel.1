From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 8/9] x86/amd: Virtualise MSR_VIRT_SPEC_CTRL
 for guests
Date: Thu, 06 Dec 2018 01:59:13 -0700
Message-ID: <5C08E4E102000078002036F5@prv1-mh.provo.novell.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-9-git-send-email-andrew.cooper3@citrix.com>
 <20181204213522.GG13738@amd.com>
 <5C078F3A0200007800203067@prv1-mh.provo.novell.com>
 <0ecae778-e337-bf46-0e5b-d9de20364c69@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0ecae778-e337-bf46-0e5b-d9de20364c69@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDIwOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTIvMjAxOCAwODo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA0
LjEyLjE4IGF0IDIyOjM1LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4+PiBUaGUgb3Ro
ZXIgdGhpbmcgSSBkb24ndCBnZXQgaXMgd2h5IGFkdmVydGlzZSB2aXJ0dWFsaXplZCBTU0JEIHdo
ZW4gdGhlCj4+PiBndWVzdCBzZXR0aW5nIGl0IGRvZXMgbm90aGluZz8gIElmIHNzYmRfb3B0PXRy
dWUgaXMgc2V0LCBhcyB0aGUgY29kZSBpcwo+Pj4gbm93LCB3aHkgZXZlbiBhZHZlcnRpc2UgaXQg
dG8gdGhlIGd1ZXN0PyAgSSdkIHN1Z2dlc3QgZWl0aGVyIGFsbG93aW5nCj4+PiB0aGUgZ3Vlc3Qg
dG8gdHVybiBpdCBvZmYgb3Igbm90IGFkdmVydGlzZSBpdCBhdCBhbGwgKHdoZW4gc3NiZF9vcHQg
PQo+Pj4gdHJ1ZSkuCj4+IEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gYWR2ZXJ0aXNlIHRoZSBmZWF0
dXJlIG5ldmVydGhlbGVzczogT3RoZXJ3aXNlCj4+IHRoZSBndWVzdCBtaWdodCBlaXRoZXIgdHJ5
IHNvbWUgb3RoZXIgd2F5IG9mIG1pdGlnYXRpbmcgdGhlCj4+IChiZWxpZXZlZCkgdnVsbmVyYWJp
bGl0eSwgb3IgaXQgbWF5IHJlcG9ydCBpbiBpdHMgbG9ncyB0aGF0IGl0J3MgdnVsbmVyYWJsZQo+
PiAod2l0aG91dCBtaXRpZ2F0aW9uKSB3aGVuIGl0IHJlYWxseSBpc24ndC4KPiAKPiBvcHRfc3Ni
ZD10cnVlIGlzIHRoZXJlIGZvciB0aGUgdHJ1bHkgcGFyYW5vaWQsIGFuZCBub29uZSB1c2VzIGl0
IGluCj4gcHJhY3RpY2UuCgpCZSBjYXJlZnVsIHdpdGggc3VjaCBjbGFpbXMuIEZyb20gbG9ncyBJ
J3ZlIHNlZW4gSSBrbm93IGRpZmZlcmVudC4gKEknbQpub3QgZ29pbmcgdG8gY2xhaW0gdGhvdWdo
IHRoYXQgSSdtIHN1cmUgdGhleSByZWFsbHkga25vdyB3aHkgdGhleSBkbwpzbywgYnV0IHlvdSBu
ZWVkIHRvIGFjY2VwdCByZWFzb25zIGxpa2UgImp1c3QgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSIu
KQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
