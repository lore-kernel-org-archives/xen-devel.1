From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: slightly reduce Meltdown band-aid
	overhead
Date: Mon, 29 Jan 2018 18:56:56 +0000
Message-ID: <459b0e97-2887-86b2-3e27-d19b208aa05a@citrix.com>
References: <5A60CDD7020000780019FF92@prv-mh.provo.novell.com>
 <0b49ed15-7dd7-c5dc-3c0b-6842e72e1fc6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ldhx=ey=citrix.com=prvs=560163be1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1egEbz-0001l4-O5
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 18:56:59 +0000
In-Reply-To: <0b49ed15-7dd7-c5dc-3c0b-6842e72e1fc6@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDEvMTggMTg6NTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMDEvMTggMTU6
MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBbG9uZyB0aG9zZSBsaW5lcyB0aGUgInN5bmMiIElQ
SSBhZnRlciBMNCBlbnRyeSB1cGRhdGVzIG5vdyBuZWVkcyB0byBiZWNvbWUgYQo+PiByZWFsIChh
bmQgZ2xvYmFsKSBmbHVzaCBJUEksIHNvIHRoYXQgaW5zaWRlIFhlbiB3ZSdsbCBhbHNvIHBpY2sg
dXAgc3VjaAo+PiBjaGFuZ2VzLgo+IFRoZSBlbnRyeSBwYXRocyBkb24ndCB0aWNrIHRoZSBUTEIg
Y2xvY2ssIHNvIHdlIGFyZSBpbiBubyB3b3JzZSBvZiBhCj4gcG9zaXRpb24gdGhhbiBiZWZvcmUu
wqAgSU9XLCBJIGRvbid0IHNlZSB3aHkgdGhpcyBuZWVkcyB0byBjaGFuZ2UgdG8KPiBiZWluZyBh
IEZMVVNIX0dMT0JBTC4KCkFjdHVhbGx5LCBJJ3ZlIGp1c3Qgd29ya2VkIG91dCB3aHkuwqAgR3Vl
c3QgdXNlciBtYXBwaW5ncyBhcmUgc3RpbGwKZ2xvYmFsLCBhbmQgd2UgZG8gbmVlZCB0byBmbHVz
aCB0aG9zZS7CoCBJIHRoaW5rIGl0IHdvdWxkIGJlIHdvcnRoCmlkZW50aWZ5aW5nIHRoaXMgaW4g
dGhlIGNvbW1lbnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
