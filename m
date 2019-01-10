From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH RFC v1] x86/emulate: Send vm_event form
 emulate
Date: Thu, 10 Jan 2019 17:52:45 +0100
Message-ID: <CAPLaKK7-OaY2S5Oq4jezMSErHpau80=Fcu8MWEFEbGo9CxbyFw@mail.gmail.com>
References: <20190107130952.27449-1-aisaila@bitdefender.com>
 <CAPLaKK6+iD1kU5cFc=gEYVR0YeFhf12L89CSGC1BHRLha-r5Dg@mail.gmail.com>
 <3c65f142-63e0-5d9d-eba3-63c4da4df048@bitdefender.com>
 <CAPLaKK6tnwUVZaMvnBeu5F2PP9YgkcEOuYFFgYgmRYOeZGVW+A@mail.gmail.com>
 <7819fabe-5394-73d8-9542-869200ab47af@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5H7G=PS=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghdZj-0001Rv-52
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 16:52:59 +0000
Received: by mail-oi1-f195.google.com with SMTP id x23so9821533oix.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 08:52:57 -0800 (PST)
In-Reply-To: <7819fabe-5394-73d8-9542-869200ab47af@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgNTo0MCBQTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4KPiA+Pj4KPiA+Pj4gTmV3bGluZS4K
PiA+Pj4KPiA+Pj4+ICsgICAgZGVmYXVsdDoKPiA+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsK
PiA+Pj4+ICsgICAgfQo+ID4+Pgo+ID4+PiBJJ20gbm90IHN1cmUgdGhlIHN3aXRjaCBpcyBuZWVk
ZWQsIHlvdSBjYW4ndCBoYXZlIGEgUEZFQ193cml0ZV9hY2Nlc3MKPiA+Pj4gZm9yIGV4YW1wbGUg
aWYgdGhlIHAybSB0eXBlIGlzIHAybV9hY2Nlc3NfdyBvciBwMm1fYWNjZXNzX3J3LCBoZW5jZSBp
dAo+ID4+PiBzZWVtcyBsaWtlIGl0IGNvdWxkIGJlIHNpbXBsaWZpZWQgdG8gb25seSB0YWtlIHRo
ZSBwZmVjIGludG8gYWNjb3VudD8KPiA+Pgo+ID4+IEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgUEZF
Q193cml0ZV9hY2Nlc3MgYW5kIHAybV9hY2Nlc3NfdyBidXQgdGhlbiB0aGVyZQo+ID4+IGlzIG5v
IHZpb2xhdGlvbiBhbmQgdGhlIGV2ZW50IHdpbGwgbm90IGJlIHNlbnQuCj4gPgo+ID4gSSdtIG5v
dCBzdXJlIEkgZm9sbG93LiBQRkVDIGlzIGEgd2F5IHRvIHNpZ25hbCBhIHBhZ2UgZmF1bHQsIGhl
bmNlIGl0Cj4gPiB3b3VsZCBtYWtlIG5vIHNlbnNlIHRvIGZvciBleGFtcGxlIGdldCBQRkVDX3dy
aXRlX2FjY2VzcyBpZiB0aGUgYWNjZXNzCj4gPiBpcyBwMm1fYWNjZXNzX3c/Cj4gPgo+IFllcywg
bm9ybWFsbHkgcGZlYyAocGFnZSBmYXVsdCBlcnJvciBjb2RlKSBkb2VzIHdoYXQgdGhlIG5hbWUg
aW1wbGllcwo+IGJ1dCBpbiB0aGlzIGNhc2UgdGhlIHBmZWMgdmFyIGlzIGNvbnN0cnVjdGVkIGlu
IHRoZSBjYWxsZXIgZnVuY3Rpb24uCj4KPiBMZXQncyB0YWtlIGZvciBleGFtcGxlIGh2bWVtdWxf
d3JpdGUoKSBwZmVjIGhlcmUgaGFzIGFsd2F5cwo+IFBGRUNfd3JpdGVfYWNjZXNzIHNvIGV2ZXJ5
IGVtdWxhdGVkIHdyaXRlIHdpbGwgaGF2ZSB0aGlzIG5vIG1hdHRlciBpZiBpcwo+IGEgZmF1bHQg
b3Igbm90IGFuZCB0aGF0IGlzIHdoYXQgSSBhbSBjaGVja2luZy4gSWYgaW4gZmFjdCB0aGVyZSBp
cyBhCj4gZmF1bHQgdGhlbiB0aGUgZXZlbnQgaXMgc2VudC4KCk9LLCB0aGlzIHNlZW1zIHdlaXJk
IGJ1dCB5b3UgYXJlIHJpZ2h0IHRoYXQgaHZtZW11bF93cml0ZSB3aWxsIGFsd2F5cwpwYXNzIFBG
RUNfd3JpdGVfYWNjZXNzIHRvIGh2bWVtdWxfbWFwX2xpbmVhcl9hZGRyLgoKUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
