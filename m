From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] mm/page_alloc: always scrub pages given to
 the allocator
Date: Mon, 1 Oct 2018 14:27:22 +0100
Message-ID: <f4bcde14-857d-a7cf-26cb-a887feaddb08@citrix.com>
References: <20181001095818.22782-1-sergey.dyasli@citrix.com>
 <5BB2014B02000078001ED2B6@prv1-mh.provo.novell.com>
 <43064b50-6f49-a073-9219-5a0a031be93b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <43064b50-6f49-a073-9219-5a0a031be93b@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDEvMjAxOCAwMjoxMiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMC8x
OCAxMjoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAxLjEwLjE4IGF0IDExOjU4LCA8
c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90ZToKPj4+IEhhdmluZyB0aGUgYWxsb2NhdG9y
IHJldHVybiB1bnNjcnViYmVkIHBhZ2VzIGlzIGEgcG90ZW50aWFsIHNlY3VyaXR5Cj4+PiBjb25j
ZXJuOiBzb21lIGRvbWFpbiBjYW4gYmUgZ2l2ZW4gcGFnZXMgd2l0aCBtZW1vcnkgY29udGVudHMg
b2YgYW5vdGhlcgo+Pj4gZG9tYWluLiBUaGlzIG1heSBoYXBwZW4sIGZvciBleGFtcGxlLCBpZiBh
IGRvbWFpbiB2b2x1bnRhcmlseSByZWxlYXNlcwo+Pj4gaXRzIG93biBtZW1vcnkgKGJhbGxvb25p
bmcgYmVpbmcgdGhlIGVhc2llc3Qgd2F5IGZvciBkb2luZyB0aGlzKS4KPj4gQW5kIHdlJ3ZlIGFs
d2F5cyBzYWlkIHRoYXQgaW4gdGhpcyBjYXNlIGl0J3MgdGhlIGRvbWFpbidzIHJlc3BvbnNpYmls
aXR5Cj4+IHRvIHNjcnViIHRoZSBtZW1vcnkgb2Ygc2VjcmV0cyBpdCBjYXJlcyBhYm91dC4gVGhl
cmVmb3JlIEknbSBhdCB0aGUKPj4gdmVyeSBsZWFzdCBtaXNzaW5nIHNvbWUgYmFja2dyb3VuZCBv
biB0aGlzIGNoYW5nZSBvZiBleHBlY3RhdGlvbnMuCj4gCj4gWW91IHdlcmUgb24gdGhlIGNhbGwg
d2hlbiB0aGlzIHdhcyBkaXNjdXNzZWQsIGFsb25nIHdpdGggdGhlIHN5bmNocm9ub3VzCj4gc2Ny
dWJiaW5nIGluIGRlc3Ryb3lkb21haW4uCj4gCj4gUHV0IHNpbXBseSwgdGhlIGN1cnJlbnQgYmVo
YXZpb3VyIGlzIG5vdCBnb29kIGVub3VnaCBmb3IgYSBudW1iZXIgb2YKPiBzZWN1cml0eSBzZW5z
aXRpdmUgdXNlY2FzZXMuCj4gCj4gVGhlIG1haW4gcmVhc29uIGhvd2V2ZXIgZm9yIGRvaW5nIHRo
aXMgaXMgdGhlIG9wdGltaXNhdGlvbnMgaXQgZW5hYmxlcywKPiBhbmQgaW4gcGFydGljdWxhciwg
bm90IGRvdWJsZSBzY3J1YmJpbmcgbW9zdCBvZiBvdXIgcGFnZXMuCgpBbGwgb2YgdGhhdCBzaG91
bGQgaGF2ZSBiZWVuIGluIHRoZSBjaGFuZ2Vsb2csIGF0IGxlYXN0IGluIHN1bW1hcnkgZm9ybSwK
cmVnYXJkbGVzcyBvZiB3aGVyZSBlbHNlIGl0IG1heSBoYXZlIGJlZW4gZGlzY3Vzc2VkLgoKIC1H
ZW9yZ2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
