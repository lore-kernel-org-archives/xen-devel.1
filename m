From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] viridian: fix the
 HvFlushVirtualAddress/List hypercall implementation
Date: Thu, 14 Feb 2019 06:12:11 -0700
Message-ID: <5C65692B0200007800216B37@prv1-mh.provo.novell.com>
References: <20190214121004.2193-1-paul.durrant@citrix.com>
 <5c1ad5ef-0150-87b2-1bc4-2e3e7bb0c353@suse.com>
 <c799e58a8fb3451b8157cb4d8c008ea8@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guGoJ-0003ik-7Q
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 13:12:15 +0000
In-Reply-To: <c799e58a8fb3451b8157cb4d8c008ea8@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDEzOjM4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIFttYWlsdG86amdyb3NzQHN1c2UuY29tXQo+PiBTZW50
OiAxNCBGZWJydWFyeSAyMDE5IDEyOjM1Cj4+IAo+PiBPbiAxNC8wMi8yMDE5IDEzOjEwLCBQYXVs
IER1cnJhbnQgd3JvdGU6Cj4+ID4gdjI6Cj4+ID4gIC0gVXNlIGNwdW1hc2tfc2NyYXRjaAo+PiAK
Pj4gVGhhdCdzIG5vdCBhIGdvb2QgaWRlYS4gY3B1bWFza19zY3JhdGNoIG1heSBiZSB1c2VkIGZy
b20gb3RoZXIgY3B1cyBhcwo+PiBsb25nIGFzIHRoZSByZXNwZWN0aWNlIHNjaGVkdWxlciBsb2Nr
IGlzIGJlaW5nIGhlbGQuIFNlZSB0aGUgY29tbWVudCBpbgo+PiBpbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oOgo+PiAKPj4gLyoKPj4gICogU2NyYXRjaCBzcGFjZSwgZm9yIGF2b2lkaW5nIGhhdmluZyB0
b28gbWFueSBjcHVtYXNrX3Qgb24gdGhlIHN0YWNrLgo+PiAgKiBXaXRoaW4gZWFjaCBzY2hlZHVs
ZXIsIHdoZW4gdXNpbmcgdGhlIHNjcmF0Y2ggbWFzayBvZiBvbmUgcENQVToKPj4gICogLSB0aGUg
cENQVSBtdXN0IGJlbG9uZyB0byB0aGUgc2NoZWR1bGVyLAo+PiAgKiAtIHRoZSBjYWxsZXIgbXVz
dCBvd24gdGhlIHBlci1wQ1BVIHNjaGVkdWxlciBsb2NrIChhLmsuYS4gcnVucXVldWUKPj4gICog
ICBsb2NrKS4KPj4gICovCj4+IAo+PiBTbyBwbGVhc2UgZG9uJ3QgdXNlIGNwdW1hc2tfc2NyYXRj
aCBvdXRzaWRlIHRoZSBzY2hlZHVsZXIhCj4gCj4gQWgsIHllcywgaXQncyBiZWNhdXNlIG9mIGNw
dW1hc2tfc2NyYXRjaF9jcHUoKS4uLiBJJ2QgaW5kZWVkIG1pc3NlZCB0aGF0LiBJbiAKPiB3aGlj
aCBjYXNlIGEgZGVkaWNhdGVkIGZsdXNoX2NwdW1hc2sgaXMgc3RpbGwgcmVxdWlyZWQuCgpBbmQg
SSBkaWRuJ3QgcmVjYWxsIHRoaXMgYXNwZWN0IGVpdGhlciAtIEknbSBzb3JyeSBmb3IgbWlzZ3Vp
ZGluZyB5b3UuClNvIErDvHJnZW4gLSB0aGFua3MgZm9yIHNwb3R0aW5nIQoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
