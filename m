From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: strange behavior with Multiboot2 on EFI
Date: Thu, 14 Jun 2018 04:24:29 -0600
Message-ID: <5B22425D02000078001CB3CB@prv1-mh.provo.novell.com>
References: <CAJL+N=F2suXu7Uu0RWX2MBwVfFtdFrSv50ucqYr9jXRdB3Z--A@mail.gmail.com>
 <5B20C33A02000078001CAB6C@prv1-mh.provo.novell.com>
 <CAJL+N=GHBa5z9tYOMGzSGv9m+Fo4G+q06VA38Y8MeB6Q5ok4Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vplz=ja=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTPQf-0001ES-9X
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 10:24:33 +0000
In-Reply-To: <CAJL+N=GHBa5z9tYOMGzSGv9m+Fo4G+q06VA38Y8MeB6Q5ok4Dw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Kristaps=20=C4=8Civkulis?= <kristaps.civkulis@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA2LjE4IGF0IDEyOjExLCA8a3Jpc3RhcHMuY2l2a3VsaXNAZ21haWwuY29tPiB3
cm90ZToKPj4gIEFzIHlvdSBzaG91bGQgaGF2ZSBhIHhlbi5lZmkgYXZhaWxhYmxlIGZyb20gdGhh
dCBzYW1lIGJ1aWxkLCBjb3VsZAo+PiB5b3UgdHJ5IHJ1bm5pbmcgdGhhdCAoZnJvbSB0aGUgRUZJ
IHNoZWxsKSBpbnN0ZWFkPyBTYWRseSB0aGVyZSdzIG5vIHdheQo+PiB0byBieXBhc3MgdGhlIGNh
bGwgaW4gdGhlIG11bHRpYm9vdDIgY2FzZSwgd2hpbGUgd2l0aCB4ZW4uZWZpIHlvdSBjb3VsZAo+
PiBwYXNzICIvYmFzZXZpZGVvIiB0byBwcmV2ZW50IHRoZSBjYWxsIGZyb20gYmVpbmcgbWFkZS4K
PiAKPiBXaGVuIEkgbGF1bmNoZWQgUUVNVSBJIHByZXNzZWQgRVNDIHRvIGdldCBpbnRvIFVFRkkg
bWVudS4KPiBXaGlsZSBpbiBVRUZJIG1lbnUgSSBkaWQ6Cj4gQm9vdCBNYWludGFpbmFuY2UgTWFu
YWdlciAtPiBCb290IE9wdGlvbnMgLT4gQWRkIEJvb3QgT3B0aW9uIC0+IGNob3NlCj4geGVuLmVm
aSBmaWxlIGFuZCBpbiBJbnB1dCBPcHRpb25hbCBEYXRhIEkgYWRkZWQgL2Jhc2V2aWRlbyAuIFNh
dmVkCj4gY2hhbmdlcyBhbmQgdGhlbiBib290ZWQgdGhpcyBuZXcgZW50cnkuCj4gQWZ0ZXIgZmV3
IHNlY29uZHMgUUVNVSBjcmFzaGVkIHdpdGggZm9sbG93aW5nIG91dHB1dDoKPiAKPiBxZW11OiBm
YXRhbDogVHJ5aW5nIHRvIGV4ZWN1dGUgY29kZSBvdXRzaWRlIFJBTSBvciBST00gYXQgMHgwMDAw
MDAwMDAwMGIwMDAwCj4gUkFYPTAwMDAwMDAwMDAwMDAwMDAgUkJYPTAwMDAwMDAwN2U2MjI0MTgg
UkNYPTAwMDAwMDAwMDAwMDAwMDAKPiBSRFg9MDAwMDAwMDA3ZmYwOTMyMAo+IFJTST0wMDAwMDAw
MDdkODZlMzY4IFJEST0wMDAwMDAwMDdlNjIyNDE4IFJCUD0wMDAwMDAwMDdmZjA5MzcwCj4gUlNQ
PTAwMDAwMDAwN2ZmMDkyYzgKPiBSOCA9MDAwMDAwMDA3ZmYyNzZiZiBSOSA9MDAwMDAwMDA3ZTYy
MzI5OCBSMTA9MDAwMDAwMDAwMDAwMDAxMQo+IFIxMT0wMDAwMDAwMDAwMDAwMDAwCj4gUjEyPTAw
MDAwMDAwMDAwMDAwMDEgUjEzPTAwMDAwMDAwMDAzZGEzNjcgUjE0PTAwMDAwMDAwMDAwMDAwMDkK
PiBSMTU9MDAwMDAwMDAwMDAwMDAwMAo+IFJJUD0wMDAwMDAwMDAwMGFmZmI4IFJGTD0wMDAwMDI0
NiBbLS0tWi1QLV0gQ1BMPTAgSUk9MCBBMjA9MSBTTU09MCBITFQ9MAoKUklQIGlzIGNsZWFybHkg
ZmlzaHksIGJ1dCB3aXRob3V0IGFueSBkdW1wIG9mIHRoZSBzdGFjayBvbmUgY2FuJ3QgZXZlbiBn
dWVzcwpob3cgZXhlY3V0aW9uIG1hZGUgaXQgdGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
