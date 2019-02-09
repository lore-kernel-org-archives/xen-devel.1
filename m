From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Linux 5.0 regression: BUG: unable to handle kernel
 paging request at ffff888023e26778 RIP: e030:move_page_tables+0x7c1/0xae0
Date: Sat, 9 Feb 2019 19:51:18 +0100
Message-ID: <3be0ee8f-79d4-2a2f-59a5-71f3514d9dbd@eikelenboom.it>
References: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
 <da8badb7-9743-020e-6891-dac944b61ee9@eikelenboom.it>
 <094e923b-4e64-57d8-42c4-6e8890473035@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FOkS=QQ=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gsXhA-0007hX-Mh
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 18:49:44 +0000
In-Reply-To: <094e923b-4e64-57d8-42c4-6e8890473035@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDIvMjAxOSAxOTo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS8wMi8yMDE5
IDE5OjQ1LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IE9uIDA5LzAyLzIwMTkgMDk6MjYs
IFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IEwuUy4sCj4+Pgo+Pj4KPj4+IFdoaWxlIHRl
c3RpbmcgYSBMaW51eCA1LjAtcmM1LWlzaCBrZXJuZWwgKHB1bGwgb2YgeWVzdGVyZGF5KSB3aXRo
IHNvbWUgYWRkaXRpb25hbCBwYXRjaGVzIGZvcgo+Pj4gYWxyZWFkeSByZXBvcnRlZCBvdGhlciBp
c3N1ZXMgaSBjYW1lIGFjcm9zcyB0aGUgaXNzdWUgYmVsb3cgd2hpY2ggaSBoYXZlbid0IHNlZW4g
d2l0aCA0LjIwLngKPj4+Cj4+PiBJIGhhdmVuJ3QgZ290IGEgcmVwcm9kdWNlciBzbyBpIG1pZ2h0
IGJlIGhhcmQgdG8gaGl0IGl0IGFnYWluLCAKPj4+IHN5c3RlbSBpcyBBTUQgYW5kIHRoaXMgaXMg
ZnJvbSB0aGUgaG9zdCBrZXJuZWwgcnVubmluZyB1bmRlcgo+Pj4gdGhlIFhlbiBoeXBlcnZpc29y
IG1pZ2h0IGl0IG1hdHRlci4KPj4KPj4+IC0tCj4+Pgo+Pj4gU2FuZGVyCj4+Cj4+IEhpIEJvcmlz
IC8gSnVlcmdlbiwKPj4KPj4gVGhlIGNvbW1pdCBjYXVzaW5nIHRoaXMgaXM6Cj4+IDJjOTFiZDRh
NGUyZTUzMDU4MmQ2ZmQ2NDNlYTdiODZiMjc5MDcxNTEgbW06IHNwZWVkIHVwIG1yZW1hcCBieSAy
MHggb24gbGFyZ2UgcmVnaW9ucwo+Pgo+PiBTaW5jZSBpdCBzZWVtcyB0aGVyZSBoYXZlbid0IGJl
ZW4gYW55IG90aGVyIHJlcG9ydHMgYWJvdXQgdGhpcyAuLiAKPj4gY291bGQgaXQgYmUgdGhpcyBk
b2Vzbid0IHNwZWNpZmljYWxseSB3b3JrIHdlbGwgd2l0aCBhIFhlbiBQVkggZG9tMCA/Cj4gCj4g
UFZIPyBOb3QgUFY/CgpBaCBzb3JyeSwgaW5kZWVkIFBWICEKCj4gCj4gSnVlcmdlbgo+IAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
