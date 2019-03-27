From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 18:06:47 +0100
Message-ID: <6c3dfb46-f6e6-4ab2-549b-58e6ca883108@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9C0o-0001ca-Uk
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 17:06:50 +0000
References: =?UTF-8?B?PDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzE4MTMxMTU1LjI5NDUw77+9Mu+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5C9BA336020000780022235B=40suse=2ecom=3e_=3c0b849a5c-9af8?=
 =?UTF-8?Q?-2b47-ced3-376af22c6141=40suse=2ecom=3e_=3c5C9BABAF02000078002223?=
 =?UTF-8?B?RTNAc3VzZS5jb20+?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDMuMTkg
YXQgMTc6NDUsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNy8wMy8yMDE5IDE3OjIy
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEFsc28gd2hpbGUgaW5kZWVkIChhcyB0aGUgZGVzY3Jp
cHRpb24gc2F5cykgdGhlcmUncyBubyBuZWVkIHRvCj4+PiBydW4gdGhlIGZ1bmN0aW9uIG9uIHRo
ZSBDUFUgaXRzZWxmLCBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lIHRoYXQKPj4+IGl0J3Mgc2FmZSB0
byBydW4gaXQgb3V0c2lkZSBvZiBzdG9wX21hY2hpbmUoKSBjb250ZXh0LiBPciB0byBiZQo+Pj4g
bW9yZSBwcmVjaXNlLCBpdCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IGxlYXZpbmcgc3RvcF9tYWNo
aW5lKCkKPj4+IGNvbnRleHQgd2l0aCB0aGUgYWRqdXN0bWVudHMgbm90IGRvbmUgeWV0IGlzIG5v
dCBnb2luZyB0bwo+Pj4gbGVhZCB0byBwcm9ibGVtcyAoZHVlIHRvIHRoZSBnYXAgYmV0d2VlbiBs
ZWF2aW5nIHRoYXQgY29udGV4dAo+Pj4gYW5kIGFjcXVpcmluZyB0aGUgUkNVIGxvY2spLiBDb3Vs
ZCB5b3UgY2xhcmlmeSB0aGlzIGluIHRoZQo+Pj4gZGVzY3JpcHRpb24sIHBsZWFzZSAoaWYgaXQg
aW5kZWVkIGlzIGZpbmUgdGhpcyB3YXkpPwo+Pgo+PiBJdCBpcyBmaW5lLCBhcyB0aGUgY2hhbmNl
cyBhcmUgemVybyB0aGF0IGFueSBjb2RlIHdpbGwgcnVuIG9uIHRoZSBjcHUKPj4ganVzdCB0YWtl
biBkb3duIGFuZCB0aGF0IGNwdSBpcyBub3QgaG9sZGluZyBhbnkgbG9ja3Mgd2UgbWlnaHQgbmVl
ZC4KPiAKPiBXZWxsLCBvZiBjb3Vyc2Ugbm90aGluZydzIGdvaW5nIHRvIHJ1biBvbiB0aGF0IENQ
VSBhbnltb3JlLgo+IEJ1dCB2Q1BVLXMgbWF5IHN0aWxsIGhhdmUgYXNzb2NpYXRpb25zIHdpdGgg
aXQsIHNvIHdoYXQgSSdtCj4gd29ycmllZCBhYm91dCBpcyBlLmcuIHNvbWV0aGluZyBmaW5kaW5n
IHYtPnByb2Nlc3NvciBwb2ludGluZwo+IGF0IGFuIG9mZmxpbmUgQ1BVIGFuZCBnZXR0aW5nIGNv
bmZ1c2VkLiBBbm90aGVyLCBtb3JlIGV4b3RpYwoKdi0+cHJvY2Vzc29yIGlzIGFsbG93ZWQgdG8g
aGF2ZSBhIHN0YWxlIHZhbHVlIGFzIGxvbmcgYXMgdGhlIHZjcHUKaXNuJ3QgcnVubmluZy4KCj4g
KG9yIHNob3VsZCBJIHNheSBjb250cml2ZWQpIHNjZW5hcmlvIG1pZ2h0IGJlIGEgc29mdC1vbmxp
bmUKPiByZXF1ZXN0IGNvbWluZyB2ZXJ5IHF1aWNrbHkgYWZ0ZXIgYSBwcmlvciBzb2Z0LW9mZmxp
bmUgb25lLCB3aXRoCj4gdGhpcyBmdW5jdGlvbiBub3QgaGF2aW5nIGdvdCBhcm91bmQgdG8gcnVu
IHlldC4gT3IgYmFzaWNhbGx5Cj4gYW55dGhpbmcgZWxzZSB0aGF0IGFjY2Vzc2VzIHRoZSBzYW1l
IHN0YXRlIHRoZSBmdW5jdGlvbgo+IG1lYW5zIHRvIHVwZGF0ZSAob3IgdXNlKS4KClRoZSBDUFVf
REVBRCBub3RpZmllciBjaGFpbiBpcyBhY3RpdmF0ZWQgYmVmb3JlIGNhbGxpbmcKY3B1X2hvdHBs
dWdfZG9uZSgpLiBJIGRvbid0IHNlZSBob3cgYW4gb25saW5lIHJlcXVlc3QgY291bGQgbWFrZSBp
dAppbiBiZXR3ZWVuLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
