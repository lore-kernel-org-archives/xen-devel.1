From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: un-hide "full" auditing code
Date: Tue, 20 Nov 2018 16:30:56 +0000
Message-ID: <66758b33-cd7e-8588-ed20-19a5a8cfd103@citrix.com>
References: <5BF42F4702000078001FE208@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pwha=n7=citrix.com=prvs=8552da0fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gP97j-0003IW-EM
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:43:39 +0000
In-Reply-To: <5BF42F4702000078001FE208@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTEvMjAxOCAxNTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gcGFydGljdWxhciBz
aF9vb3NfYXVkaXQoKSBoYXMgYmVjb21lIHN0YWxlIGR1ZSB0byBjaGFuZ2VzIGVsc2V3aGVyZSwK
PiBhbmQgdGhlIG5lZWQgZm9yIGFkanVzdG1lbnQgd2FzIG5vdCBub3RpY2VkIGJlY2F1c2UgYm90
aCAiZnVsbCBhdWRpdCIKPiBmbGFncyBhcmUgb2ZmIGluIGJvdGggcmVsZWFzZSBhbmQgZGVidWcg
YnVpbGRzLiBTd2l0Y2ggYXdheSBmcm9tIHByZS0KPiBwcm9jZXNzc29yIGNvbmRpdGlvbmFscywg
dGh1cyBleHBvc2luZyB0aGUgY29kZSB0byB0aGUgY29tcGlsZXIgYXQgYWxsCj4gdGltZXMuIFRo
aXMgb2J2aW91c2x5IHJlcXVpcmVzIGNvcnJlY3RpbmcgdGhlIGFjY3VtdWxhdGVkIGlzc3VlcyB3
aXRoCj4gdGhlIHNvIGZhciBoaWRkZW4gY29kZS4KPgo+IE5vdGUgdGhhdCBzaGFkb3dfYXVkaXRf
dGFibGVzKCkgbm93IGFsc28gZ2FpbnMgYW4gZWZmZWN0IHdpdGggImZ1bGwKPiBlbnRyeSBhdWRp
dCIgbW9kZSBkaXNhYmxlZDsgdGhlIHByaW9yIGNvZGUgc3RydWN0dXJlIHN1Z2dlc3RzIHRoYXQg
dGhpcwo+IHdhcyBvcmlnaW5hbGx5IGludGVuZGVkIGFueXdheS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhpcyBoYXMgYmVlbiBhIGxvdyBpdGVtIG9u
IG15IHRvZG8gbGlzdCBmb3IgeWVhcnMgbm93LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
