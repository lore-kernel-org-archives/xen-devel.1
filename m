From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 12/17] xenconsoled: make
 console_type->use_gnttab less confusing
Date: Thu, 1 Nov 2018 17:25:25 +0000
Message-ID: <23515.14085.8004.551577@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <fef487b804bb082bb3234cbd20ccccfb8b320c31.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIGip-0001fK-7a
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:25:31 +0000
In-Reply-To: <fef487b804bb082bb3234cbd20ccccfb8b320c31.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltSRkMgUEFUQ0ggdjIgMTIvMTdd
IHhlbmNvbnNvbGVkOiBtYWtlIGNvbnNvbGVfdHlwZS0+dXNlX2dudHRhYiBsZXNzIGNvbmZ1c2lu
ZyIpOgo+IEJlZm9yZSB0aGlzIGNvbW1pdCAndXNlX2dudHRhYicgbWVhbnMgeGVuY29uc29sZWQg
c2hvdWxkIGZpcnN0IHRyeQo+IHNwZWNpYWwgR05UVEFCX1JFU0VSVkVEX0NPTlNPTEUgZW50cnks
IGFuZCBvbmx5IHRoZW4gZmFsbGJhY2sgdG8KPiByaW5nLXJlZiB4ZW5zdG9yZSBlbnRyeSAoYmVp
bmcgZ2ZuIG9mIGFjdHVhbCByaW5nKS4KPiBJbiBjYXNlIG9mIHNlY29uZGFyeSBjb25zb2xlcywg
cmluZy1yZWYgZW50cnkgY29udGFpbnMgZ3JhbnQgdGFibGUKPiByZWZlcmVuY2UgKG5vdCBnZm4g
b2YgaXQpLCB3aGljaCBtYWtlcyB0aGUgb2xkIG1lYW5pbmcgb2YgdXNlX2dudHRhYgo+IHJlYWxs
eSBjb25mdXNpbmcgKHNob3VsZCBiZSBmYWxzZSBmb3Igc3VjaCBjb25zb2xlcykuCj4gVG8gc29s
dmUgdGhpcywgYWRkIG5ldyBlbnRyeSBpbiBjb25zb2xlX3R5cGUgKGFuZCBjb25zb2xlKSBzdHJ1
Y3R1cmVzCj4gbmFtZWQgJ3VzZV9yZXNlcnZlcmRfZ250dGFiJyB3aXRoIHRoZSBvbGQgbWVhbmlu
ZyBvZiAndXNlX2dudHRhYicsIHRoZW4KPiB1c2UgJ3Vlc19nbnR0YWInIGZvciBjb25zb2xlcyB3
aGVyZSByaW5nLXJlZiBob2xkcyBncmFudCB0YWJsZQo+IHJlZmVyZW5jZS4KCkknbSBhZnJhaWQg
SSBkb24ndCBoYXZlIHRoZSBtZW50YWwgYmFuZHdpZHRoIHRvIGRlYWwgd2l0aCB0aGlzIHBhdGNo
CnByb3Blcmx5IHJpZ2h0IG5vdyBidXQgaWYgeW91IGNoYW5nZSB0aGUgbWVhbmluZyBvZiBgdXNl
X2dudHRhYicgeW91CnNob3VsZCBjZXJ0YWlubHkgcmVuYW1lIGl0LiAgT3RoZXJ3aXNlIHlvdSBy
aXNrIGZhaWxpbmcgdG8gdXBkYXRlIHNvbWUKcGFydCBvZiB0aGUgY29kZSBmb3IgdGhlIG5ldyBz
ZW1hbnRpY3MuCgpBbHNvLCBJIGZlZWwgSSdtIGJlaW5nIGRpbSwgYnV0IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0IGNvbWJpbmF0aW9ucwpvZiB5b3VyIChuZXcpIHVzZV9nbnR0YWIgYW5kIHVzZV9y
ZXNlcnZlZF9nbnR0YWIgYXJlIGxlZ2l0aW1hdGUgYW5kCndoYXQgdGhlaXIgbWVhbmluZ3MgYXJl
LiAgTWF5YmUgdGhpcyB3YW50cyB0byBiZSBvbmUgZW51bSBpbnN0ZWFkIG9mCnR3byBib29sZWFu
cy4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
