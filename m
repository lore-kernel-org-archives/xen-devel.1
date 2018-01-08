From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 06/23] console: do not print banner if
 below info log threshold
Date: Mon, 8 Jan 2018 12:09:45 +0000
Message-ID: <20180108120945.l7albw7ucfppi37f@citrix.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-7-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYWFg-0002Ru-BP
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 12:10:04 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-7-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjJQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBPbmx5IHByaW50IHRoZSBiYW5uZXIgaWYgdGhlIGxvZyB0aHJlc2hvbGQgaXMgYXQgbGVhc3Qg
aW5mby4KPiAKPiBGb3IgVml4ZW4gZ3Vlc3RzLCB3ZSB3YW50IHRoZSBjb25zb2xlIG91dHB1dCB0
byBiZSBleGFjdGx5IHdoYXQgdGhlCj4gUFYgZ3Vlc3Qgd291bGQgc2hvdyBvbiBpdCdzIG93bi4g
IFRoYXQgbWVhbnMgdGhlIGlubmVyIFhlbiBiYW5uZXIKPiBjYW4gcG90ZW50aWFsbHkgYnJlYWsg
YXV0b21hdGlvbiB0aGF0IGFzc3VtZXMgYSBzcGVjaWZpYyB0eXBlIG9mCj4gY29uc29sZSBvdXRw
dXQuCgo6LSkKCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBh
bWF6b24uY29tPgoKPiAtLS0KPiAgeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCA5ICsrKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jCj4gaW5kZXggMGY4NTcwNy4uM2ViMTMwZCAxMDA2NDQKPiAtLS0gYS94
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCj4gQEAgLTgxMiw5ICs4MTIsMTIgQEAgdm9pZCBfX2luaXQgY29uc29sZV9pbml0X3ByZWly
cSh2b2lkKQo+ICAgICAgc2VyaWFsX3NldF9yeF9oYW5kbGVyKHNlcmNvbl9oYW5kbGUsIHNlcmlh
bF9yeCk7Cj4gIAo+ICAgICAgLyogSEVMTE8gV09STEQgLS0tIHN0YXJ0LW9mLWRheSBiYW5uZXIg
dGV4dC4gKi8KPiAtICAgIHNwaW5fbG9jaygmY29uc29sZV9sb2NrKTsKPiAtICAgIF9fcHV0c3Ry
KHhlbl9iYW5uZXIoKSk7Cj4gLSAgICBzcGluX3VubG9jaygmY29uc29sZV9sb2NrKTsKPiArICAg
IGlmICggMiA8IHhlbmxvZ19sb3dlcl90aHJlc2ggKSB7CgpUaGlzIHNob3VsZCBiZWNvbWUgYSB0
dW5hYmxlIChjb21tYW5kIGxpbmUgb3B0aW9uPykgaW5zdGVhZCBvZiBiZWluZwpoYXJkY29kZWQu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
