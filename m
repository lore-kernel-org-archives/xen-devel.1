From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Wed, 16 Jan 2019 07:01:23 +0100
Message-ID: <3053a23a-b502-05f4-248d-289c35cf8586@suse.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
 <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
 <5C387472020000780020C9A7@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901110911310.27759@sstabellini-ThinkPad-X260>
 <a3743bd4b2d54188890945322e92fc1b@dornerworks.com>
 <CAF3u54AAmx0rBVPscfvqcx5f0ezYNCkrsagJgZb3v2GqfB9TEw@mail.gmail.com>
 <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
 <alpine.DEB.2.10.1901111331490.27759@sstabellini-ThinkPad-X260>
 <3cc0862e5f0442d49c33c08f21b423ab@dornerworks.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901141030300.27759@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <a0500e7bb7244b5aa6dc1282a2375ad0@dornerworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JTqL=PY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjeGW-0008N9-18
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 06:01:28 +0000
In-Reply-To: <a0500e7bb7244b5aa6dc1282a2375ad0@dornerworks.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAyMTowMywgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IE9uIFR1ZXNk
YXksIEphbnVhcnkgMTUsIDIwMTkgMzoyMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZpcnN0
IG9mIGFsbCB3ZSBzaG91bGQgZXhwbG9yZSB3aGV0aGVyIHRoZSB2YXJpYWJsZXMgY291bGQgYWxz
byBiZQo+PiBsaW5rZXIgZ2VuZXJhdGVkLCBpbiBwYXJ0aWN1bGFyIHRvIGF2b2lkIHRoZSBjdXJy
ZW50IHN5bWJvbHMgdG8gYmUKPj4gZ2xvYmFsICh0aHVzIG1ha2luZyBpdCBpbXBvc3NpYmxlIHRv
IGFjY2VzcyB0aGVtIGZyb20gQyBmaWxlcyBpbiB0aGUKPj4gZmlyc3QgcGxhY2UpLgo+IAo+IElu
dGVyZXN0aW5nIGlkZWEuIFRoYXQgY2VydGFpbmx5IHdvdWxkIGJlIGlkZWFsIGlmIHRoZSBsaW5r
ZXIgd2lsbCBhbGxvdwo+IGl0LgoKRm9yIGVhY2ggdmFyaWFibGUgbmVlZGVkIGhhdmUgYSBzbWFs
bCBhc3NlbWJsZXIgc291cmNlIHdpdGg6CgouZ2xvYmwgdmFyCnZhcjogLmxvbmcgLgoKYW5kIHRo
ZW4gcHV0IGl0IGF0IHRoZSBjb3JyZWN0IHBsYWNlcyBpbiB0aGUgbGlua2VyIHNjcmlwdC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
