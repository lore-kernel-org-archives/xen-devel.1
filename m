From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Wed, 25 Jul 2018 15:02:37 +0100
Message-ID: <20180725140237.pjjzeaibcdo2ov7j@citrix.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiKNV-0005mK-2r
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 14:02:57 +0000
Content-Disposition: inline
In-Reply-To: <3db42ec0-8542-1bea-ffee-0ac5dc4d7277@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, abelgun@amazon.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, David Woodhouse <dwmw2@infradead.org>, bercarug@amazon.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDM6NDE6MTFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyNS8wNy8xOCAxNTozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IAo+
ID4+Cj4gPj4gV2hhdCBjb3VsZCBiZSBjYXVzaW5nIHRoZSBhdmFpbGFibGUgbWVtb3J5IGxvc3Mg
cHJvYmxlbT8KPiA+IAo+ID4gVGhhdCBzZWVtcyB0byBiZSBMaW51eCBhZ2dyZXNzaXZlbHkgYmFs
bG9vbmluZyBvdXQgbWVtb3J5LCB5b3UgZ28gZnJvbQo+ID4gNzEyOU0gdG90YWwgbWVtb3J5IHRv
IDI0Nk0uIEFyZSB5b3UgY3JlYXRpbmcgYSBsb3Qgb2YgZG9tYWlucz8KPiAKPiBUaGlzIG1pZ2h0
IGJlIHJlbGF0ZWQgdG8gdGhlIHRvb2xzIHRoaW5raW5nIGRvbTAgaXMgYSBQViBkb21haW4uCgpH
b29kIHBvaW50LgoKSW4gdGhhdCBjYXNlLCB4ZW5zdG9yZS1scyAtZnAgd291bGQgYWxzbyBiZSB1
c2VmdWwuIFRoZSBvdXRwdXQgc2hvdWxkCnNob3cgdGhlIGJhbGxvb24gdGFyZ2V0IGZvciBEb20w
LgoKWW91IGNhbiBhbHNvIHRyeSB0byBzZXQgdGhlIGF1dG9iYWxsb29uIHRvIG9mZiBpbiAvZXRj
L3hlbi94bC5jZmcgdG8gc2VlCmlmIGl0IG1ha2VzIGFueSBkaWZmZXJlbmNlLgoKV2VpLgoKPiAK
PiAKPiBKdWVyZ2VuCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
