From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] page-alloc: accompany BUG() with printk()
Date: Wed, 15 May 2019 11:12:15 +0100
Message-ID: <0b69ef20-6ae1-d161-574d-dc16be569422@citrix.com>
References: <5CDBD157020000780022F1EA@prv1-mh.provo.novell.com>
 <20190515094435.fgcqzbmj7gbqfgmj@Air-de-Roger>
 <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
 <20190515100901.4psea2vmmugrkigl@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQquN-00051j-Me
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:13:11 +0000
In-Reply-To: <20190515100901.4psea2vmmugrkigl@Air-de-Roger>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDUvMjAxOSAxMTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIE1h
eSAxNSwgMjAxOSBhdCAxMDo1OToyMEFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxNS8wNS8yMDE5IDEwOjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gV2VkLCBN
YXkgMTUsIDIwMTkgYXQgMDI6NDQ6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
TG9nIGluZm9ybWF0aW9uIGxpa2VseSByZWxldmFudCBmb3IgdW5kZXJzdGFuZGluZyB3aHkgdGhl
IEJVRygpcyB3ZXJlCj4+PiBXaHkgbm90IHVzZSBwYW5pYyBpbnN0ZWFkIG9mIHByaW50ayArIEJV
Rz8KPj4gQmVjYXVzZSB0aGUgYmFja3RyYWNlIGlzIHVzZWZ1bCBhIGxvdCBvZiB0aGUgdGltZS4K
PiBPaCwgcGFuaWMgaGFzIG5vIGJhY2t0cmFjZSwgdGhhdCdzIG5vdCB2ZXJ5IHVzZWZ1bC4gTWF5
YmUgd2UgY291bGQgYWRkCj4gYSBwYW5pY190cmFjZSB2ZXJzaW9uIHRvIGF2b2lkIGhhdmluZyB0
byBkbyBhIHByaW50ayArIEJVRy4gSW4gYW55Cj4gY2FzZToKClRCSCwgSXQgd291bGQgYmUgYmV0
dGVyIGZvciBCVUcoKSB0byB0YWtlIGEgcHJpbnRrLWxpa2UgLCBidXQgYXJyYW5naW5nCnRoaXMg
dG8gd29yayBpcyBkZWNpZGVkbHkgbm9uLXRyaXZpYWwsIGJlY2F1c2UgaXQgd291bGQgaGF2ZSB0
byBiZQphcnJhbmdlZCBmcm9tICNVRCBjb250ZXh0IHdpdGggc29tZSB3YXkgb2YgcGFzc2luZyB2
YV9hcmdzKCkgYmVoaW5kIHRoZQpzY2VuZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
