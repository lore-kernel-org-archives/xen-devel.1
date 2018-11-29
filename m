From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Thu, 29 Nov 2018 14:35:17 +0100
Message-ID: <bc770271-65a8-8bf4-10f9-6ce169e94130__20439.2746127725$1543498498$gmane$org@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
 <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jnsg=oi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSMUO-0003dj-TH
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 13:36:20 +0000
In-Reply-To: <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMTEvMjAxOCAxNDoyNiwgS2lyaWxsIEEuIFNodXRlbW92IHdyb3RlOgo+IE9uIFRodSwg
Tm92IDI5LCAyMDE4IGF0IDA5OjQxOjI1QU0gKzAwMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
IE9uIDI5LzExLzIwMTggMDI6MjIsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4+PiBIaSwK
Pj4+Cj4+PiBBcyBhbHNvIHNlZW4gYXQ6Cj4+PiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2kt
YmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTkxNDk1MQo+Pj4KPj4+IEF0dGFjaGVkIHRoZXJlIGFyZSB0
d28gc2VyaWFsIGNvbnNvbGUgb3V0cHV0IGxvZ3MuIE9uZSBpcyBzdGFydGluZyB3aXRoCj4+PiBY
ZW4gNC4xMSAoZnJvbSBkZWJpYW4gdW5zdGFibGUpIGFzIGRvbTAsIGFuZCB0aGUgb3RoZXIgb25l
IHdpdGhvdXQgWGVuLgo+Pj4KPj4+IFsgICAgMi4wODU1NDNdIEJVRzogdW5hYmxlIHRvIGhhbmRs
ZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQKPj4+IGZmZmY4ODhkOWZmZmMwMDAKPj4+IFsgICAg
Mi4wODU2MTBdIFBHRCAyMDBjMDY3IFA0RCAyMDBjMDY3IFBVRCAwCj4+PiBbICAgIDIuMDg1Njc0
XSBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJCj4+PiBbICAgIDIuMDg1NzM2XSBDUFU6IDEgUElE
OiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZAo+Pj4gNC4xOS4wLXRydW5rLWFtZDY0ICMx
IERlYmlhbiA0LjE5LjUtMX5leHAxK3B2aDEKPj4+IFsgICAgMi4wODU4MjNdIEhhcmR3YXJlIG5h
bWU6IEhQIFByb0xpYW50IERMMzYwIEc3LCBCSU9TIFA2OCAwNS8yMS8yMDE4Cj4+PiBbICAgIDIu
MDg1ODk1XSBSSVA6IGUwMzA6cHRkdW1wX3dhbGtfcGdkX2xldmVsX2NvcmUrMHgxZmQvMHg0OTAK
Pj4+IFsuLi5dCj4+Cj4+IFRoZSBvZmZlbmRpbmcgc3RhYmxlIGNvbW1pdCBpcyA0MDc0Y2E3ZDhh
MTgzMjkyMWM4NjVkMjUwYmJkMDhmMzQ0MWIzNjU3Cj4+ICgieDg2L21tOiBNb3ZlIExEVCByZW1h
cCBvdXQgb2YgS0FTTFIgcmVnaW9uIG9uIDUtbGV2ZWwgcGFnaW5nIiksIHRoaXMKPj4gaXMgY29t
bWl0IGQ1Mjg4OGFhMjc1M2UzMDYzYTlkM2EwYzlmNzJmOTRhYTk4MDljMTUgdXBzdHJlYW0uCj4+
Cj4+IEN1cnJlbnQgdXBzdHJlYW0ga2VybmVsIGlzIGJvb3RpbmcgZmluZSB1bmRlciBYZW4sIHNv
IGluIGdlbmVyYWwgdGhlCj4+IHBhdGNoIHNob3VsZCBiZSBmaW5lLiBVc2luZyBhbiB1cHN0cmVh
bSBrZXJuZWwgYnVpbHQgZnJvbSBhYm92ZSBjb21taXQKPj4gKHdpdGggdGhlIHRoZW4gbmVlZGVk
IFhlbiBmaXh1cCBwYXRjaCAxNDU3ZDhjZjc2NjRmMzRjNGJhNTM0KSBpcyBmaW5lLAo+PiB0b28u
Cj4+Cj4+IEtpcmlsbCwgYXJlIHlvdSBhd2FyZSBvZiBhbnkgcHJlcmVxdWlzaXRlIHBhdGNoIGZy
b20gNC4yMCB3aGljaCBjb3VsZCBiZQo+PiBtaXNzaW5nIGluIDQuMTkuNT8KPiAKPiBJJ20gbm90
Lgo+IAo+IExldCBtZSBsb29rIGludG8gdGhpcy4KPiAKCldoYXQgaXMgbWFraW5nIG1lIHN1c3Bp
Y2lvdXMgaXMgdGhlIGZhaWx1cmUgaGFwcGVuaW5nIGp1c3QgYWZ0ZXIKcmVsZWFzaW5nIHRoZSBp
bml0IG1lbW9yeS4gTWF5YmUgdGhlcmUgaXMgYW4gYWNjZXNzIHRvIC5pbml0LmRhdGEKc2VnbWVu
dCBvciBzaW1pbGFyPyBUaGUgbmF0aXZlIGtlcm5lbCBib290aW5nIGNvdWxkIGJlIHJlbGF0ZWQg
dG8gdGhlCnVzYWdlIG9mIDJNIG1hcHBpbmdzIG5vdCBiZWluZyBhdmFpbGFibGUgaW4gYSBQVi1k
b21haW4uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
