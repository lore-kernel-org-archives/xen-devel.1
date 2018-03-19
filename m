From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] xen: fix null sched build with debug=n
Date: Mon, 19 Mar 2018 08:51:27 -0500
Message-ID: <7a8a0c89-1fbe-6c19-7c0b-54d6eb83f587@cardoe.com>
References: <20180319022038.30100-1-cardoe@cardoe.com>
 <5AAF938402000078001B34E9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AAF938402000078001B34E9@prv-mh.provo.novell.com>
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOS8xOCA0OjQwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxOS4wMy4xOCBh
dCAwMzoyMCwgPGNhcmRvZUBjYXJkb2UuY29tPiB3cm90ZToKPj4gVGhlIG51bGxfZG9tKCkgc3Rh
dGljIGlubGluZSBpcyBqdXN0IHVzZWQgd2hlbiBkZWJ1Zz15IHNvIGl0IHJlc3VsdHMgaW4KPj4g
YSBlcnJvciB3aXRoIHRoZSBkZWZhdWx0IENGTEFHUyBhbmQgZGVidWc9bi4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+PiAtLS0KPj4gc2No
ZWRfbnVsbC5jOjEyMzozMjogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnbnVsbF9kb20nIAo+PiBb
LVdlcnJvciwtV3VudXNlZC1mdW5jdGlvbl0KPiAKPiBTaW5jZSBnZW5lcmFsbHkgb25seSBub24t
aW5saW5lIGZ1bmN0aW9ucyBnZXQgd2FybmVkIGFib3V0IGJ5IGdjYwo+IChhZmFpayksIEknbSB3
b25kZXJpbmc6IElzIHRoaXMgd2l0aCBjbGFuZz8gT3Igd2l0aCBzb21lIHNwZWNpZmljLAo+IG5v
bi1zdGFuZGFyZCB2ZXJzaW9uIG9mIGdjYz8gQWRkaW5nIHN1Y2ggc3BlY2lmaWNzIHRvIHRoZSBj
b21taXQKPiBtZXNzYWdlIHdvdWxkIGdlbmVyYWxseSBiZSBhZHZpc2FibGUgKGFuZCBpbmRlZWQg
SSdtIG5vdCByZWFsbHkKPiBoYXBweSB0byBzZWUgc3VjaCBhbiAjaWZkZWYgYWRkZWQsIGJ1dCB0
aGVuIGFnYWluIEknbSBub3QgdGhlCj4gbWFpbnRhaW5lciBvZiB0aGF0IGNvZGUpLgo+IAo+IEph
bgo+IAoKVGhlIGZ1bGwgbG9nIGlzIGhlcmU6IGh0dHBzOi8vZ2l0bGFiLmNvbS9jYXJkb2UveGVu
Ly0vam9icy81ODAxMTUyNwoKSXQncyBhIERlYmlhbiBTdHJldGNoIGluc3RhbmNlIHVzaW5nIGNs
YW5nIGFuZCBkZWJ1Zz1uLiBTaG91bGQgaGF2ZQppbmNsdWRlZCBhbGwgdGhhdCwgc29ycnkuCgot
LSAKRG91ZyBHb2xkc3RlaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
