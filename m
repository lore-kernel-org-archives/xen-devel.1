From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-next RFC 0/4] tools: Python 3
 compatibility
Date: Wed, 6 Mar 2019 14:17:31 +0000
Message-ID: <20190306141731.GC2300@perard.uk.xensource.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <350c989b-dcec-906f-9364-20b0a8e409e0@citrix.com>
 <bbe5c5b7-f82b-e011-cb30-3d66fb13093c@citrix.com>
 <20190306135755.pmvr456e3di6s377@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EjjD=RJ=citrix.com=prvs=9614ae01b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h1XMd-0008V7-A9
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 14:17:43 +0000
Content-Disposition: inline
In-Reply-To: <20190306135755.pmvr456e3di6s377@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMDE6NTc6NTVQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIE1hciAwNiwgMjAxOSBhdCAwMTo1MzowMVBNICswMDAwLCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+ID4gT24gMy82LzE5IDE6NDkgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPiA+
IE9uIDMvNS8xOSA0OjQyIFBNLCBXZWkgTGl1IHdyb3RlOgo+ID4gPj4gVGhpcyBzZXJpZXMgbWFr
ZXMgdG9vbHMgYnVpbGQgd2l0aCBQeXRob24gMy4KPiA+ID4+Cj4gPiA+PiBDb21waWxlIHRlc3Qg
b25seSB3aXRoIDIuNyBhbmQgMy41IHRodXMgZmFyLCBoZW5jZSB0aGUgUkZDLiBUaGlzIHNob3Vs
ZCBiZSBhYmxlCj4gPiA+PiB0byBnaXZlIHBlb3BsZSBzb21lIGlkZWEgd2hhdCBzb3J0IG9mIHdv
cmsgaXMgaW52b2x2ZWQuCj4gPiA+Pgo+ID4gPj4gWW91IHdpbGwgYWxzbyBuZWVkIEFuZHJldydz
ICJ0b29scy94ZW4tZm9yZWlnbjogVXBkYXRlIHB5dGhvbiBzY3JpcHRzIHRvIGJlCj4gPiA+PiBQ
eTMgY29tcGF0aWJsZSIuCj4gPiA+IAo+ID4gPiBUb3NzaW5nIHRoaXMgb3V0IHRoZXJlOiBHaXZl
biB0aGF0IHB5dGhvbjIgaXMgKHRoZW9yZXRpY2FsbHkpIEVPTCBpbgo+ID4gPiBsZXNzIHRoYW4g
YSB5ZWFyLCBpcyBpdCB3b3J0aCBtYWludGFpbmluZyBjb21wYXRpYmlsaXR5IHdpdGggcHl0aG9u
Miwgb3IKPiA+ID4gd291bGQgaXQgYmUgYmV0dGVyIHRvIGp1c3QgZ28gd2hvbGUtaG9nIGludG8g
cHl0aG9uMz8KPiA+IAo+ID4gSSBtZWFuIC0tIGxvb2tpbmcgYXQgc29tZSBvZiB0aGUgZGlzY3Vz
c2lvbnMgYWJvdXQgaG93IGRpZmZlcmVudGx5Cj4gPiBjZXJ0YWluIGtpbmRzIG9mIHRoaW5ncyBh
cmUgaW50ZXJwcmV0ZWQgYmV0d2VlbiBweXRob24yIGFuZCBweXRob24zLCBpdAo+ID4gc2VlbXMg
YSBiaXQgbWFkIHRvIHRyeSB0byB3cml0ZSBjb2RlIHRoYXQgd29ya3MgaW4gYm90aDogd2UncmUg
anVzdAo+ID4gYXNraW5nIGZvciB0cm91YmxlLgo+IAo+IEkgdGhpbmsgUHl0aG9uIGlzIG5vdCB2
ZXJ5IGNvbnNpc3RlbnQgZXZlbiB3aXRoaW4gYSBtYWpvciB2ZXJzaW9uLiBOZXcKPiBzeW50YXgg
YW5kIGNvbnN0cnVjdHMgZ2V0IGFkZGVkIHRvIHBvaW50IHJlbGVhc2VzLiBTb21lIG9mIHRoZQo+
IGRpc2N1c3Npb25zIHJlIGNvZGUgaXNuJ3QgYWJvdXQgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4g
MiBhbmQgMy4gIFRoZXJlCj4gaXMgYXQgbGVhc3Qgb25lIGFib3V0IDIuNCB2cyAyLjcuCgpJIHRo
aW5rIGl0J3MgYmVjYXVzZSB0aGV5IGJhY2twb3J0IHN5bnRheCBjaGFuZ2VzIGZyb20gMy5YIHRv
IDIuNiBhbmQKMi43LiBBbHNvIGFsbCB0aGUgX2Z1dHVyZV9YIGltcG9ydHMuIEFsbCBvZiB0aGF0
IG1ha2VzIGl0IGVhc2llciB0byBoYXZlCnNjcmlwdHMgY29tcGF0aWJsZSB3aXRoIGJvdGggMi43
IGFuZCAzLlguCgo+IEkgYW0gYWxsIGZvciBtb3ZpbmcgYXdheSBmcm9tIDIuNC4KCk1vdmluZyB0
byBhIG1pbiBvZiAyLjYgd291bGQgYmUgbmljZS4gQ2VudE9TIDYgY29tZXMgaXQuCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
