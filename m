From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Date: Mon, 19 Feb 2018 17:49:37 +0000
Message-ID: <0f4e78eb-40b3-6b45-61fc-9eb76825e6ae@citrix.com>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <20180216195415.GK2084@mail-itl>
 <1f3c44fb-e557-9b5c-6e9f-2ac40a8e0562@suse.com>
 <20180219172949.GY2084@mail-itl>
 <00be020c-7fe9-0862-5ba5-b87eea8e3c1b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <00be020c-7fe9-0862-5ba5-b87eea8e3c1b@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMTggMTc6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTkvMDIvMTggMTg6
MjksIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPj4gT24gTW9uLCBGZWIgMTks
IDIwMTggYXQgMDY6MjM6NDBQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDE2
LzAyLzE4IDIwOjU0LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4+Pj4gSnVz
dCBiZWZvcmUgdGhlIEJVRygpLCB0aGVyZSBpcyBhIGNhbGwgdG8geGVuX3Jhd19jb25zb2xlX3dy
aXRlKCkuIEJ1dAo+Pj4+IGFwcGFyZW50bHkgaXQgd2FzIHRvbyBlYXJseS4uLgo+Pj4gRGVwZW5k
cy4KPj4+Cj4+PiBXaXRoIGEgZGVidWcgZW5hYmxlZCBoeXBlcnZpc29yIGFuZCBhcHByb3ByaWF0
ZSBsb2cgbGV2ZWxzIHNldAo+Pj4gKGd1ZXN0X2xvZ2x2bD1hbGwpIHlvdSBzaG91bGQgc2VlIHRo
ZSBtZXNzYWdlIGluIHRoZSBoeXBlcnZpc29yIGxvZy4KPj4gSSd2ZSB0cmllZCB3aXRoIGd1ZXN0
X2xvZ2x2bD1hbGwsIGJ1dCB0aGVyZSB3YXMgbm90aGluZy4gV291bGRuJ3QgaXQKPj4gbWFrZSBz
ZW5zZSB0byBlbmFibGUgdGhpcyBmdW5jdGlvbmFsaXR5IGFsc28gaW4gbm9uLWRlYnVnIGJ1aWxk
cyAtIG9ubHkKPj4gZ3VhcmRlZCBieSBndWVzdF9sb2dsdmw9YWxsIG9wdGlvbj8KPiBIbW0sIEkg
dGhpbmsgdGhpcyBpcyBvbiBwdXJwb3NlIHRvIGF2b2lkIHRoZSBwb3NzaWJpbGl0eSBvZiBhIGd1
ZXN0Cj4gZmxvb2RpbmcgdGhlIGh5cGVydmlzb3IgbG9nLgo+Cj4gTWF5YmUgYWRkaW5nIGEgbmV3
IG9wdGlvbiAoZS5nLiBndWVzdF9tZXNzYWdlcz1vbi9vZmYpIHN3aXRjaGFibGUgYXQKPiBydW50
aW1lIG9ubHkgdmlhICJ4bCBzZXQtcGFyYW1ldGVycyIgd291bGQgYXZvaWQgdGhlIGdlbmVyYWwg
Zmxvb2RpbmcKPiBwcm9ibGVtIHdoaWxlIGVuYWJsaW5nIGRpYWdub3NpcyBvZiBzdWNoIHByb2Js
ZW1zPwoKWW91IHdhbnQgdG8gcmVjb21waWxlIHdpdGggQ09ORklHX1ZFUkJPU0UsIHdoaWNoIHlv
dSBuZWVkIEVYUEVSVCBtb2RlIHRvCmludHJvZHVjZSBpbnRvIGEgcmVsZWFzZSBidWlsZC4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
