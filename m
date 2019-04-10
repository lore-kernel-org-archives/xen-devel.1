From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Wed, 10 Apr 2019 06:17:52 -0600
Message-ID: <5CADDEF0020000780022635A@prv1-mh.provo.novell.com>
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
 <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
 <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hECCq-0002h6-KH
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:19:56 +0000
In-Reply-To: <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE5IGF0IDEzOjIwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzEwLzE5IDEyOjEzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxMC8w
NC8yMDE5IDExOjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBl
eGVjdXRlIGFueSBpbnN0cnVjdGlvbnMgZm9yIGRvaW5nIHNvLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gSSB3b25kZXIg
d2hldGhlciBtZW1fc2hhcmluZ19pbml0KCkgc2hvdWxkbid0IGdvIGF3YXkgYWx0b2dldGhlciB0
aGVuLgo+PiAKPj4gSSB2b3RlIGZvciByZW1vdmluZyBpdCBjb21wbGV0ZWx5LiAgVGhlIHByaW50
ayBpcyBhIG91dC1vZi1jaGFyYWN0ZXIKPj4gY29tcGFyZWQgdG8gb3RoZXIgc3Vic3lzdGVtcyBp
biBYZW4uCj4gCj4gKzEKCkluIGFueSBldmVudCBJJ2xsIHdhaXQgZm9yIFRhbWFzJ2VzIG9waW5p
b24uIFRoZXJlIG1pZ2h0IGJlIHBsYW5zIHRvIHB1dApmdXJ0aGVyIG1lYXQgaW50byB0aGUgZnVu
Y3Rpb24sIGFmdGVyIGFsbC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
