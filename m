From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v9 00/16] xen: xen-domid-restrict improvements
Date: Thu, 26 Apr 2018 18:27:42 +0100
Message-ID: <CAFEAcA9cumr=t7mRZ-9KtLMWAK-9nVGmRsnXjJ+pc899ePxfVg@mail.gmail.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hssd=hp=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fBkge-0006o7-Hc
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 17:28:04 +0000
Received: by mail-ot0-x22b.google.com with SMTP id y10-v6so17324829otg.10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Apr 2018 10:28:03 -0700 (PDT)
In-Reply-To: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYgQXByaWwgMjAxOCBhdCAxNjo1NiwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNp
dHJpeC5jb20+IHdyb3RlOgo+IEZyb206IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRy
aXguY29tPgo+Cj4gLS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQo+IEhhc2g6IFNI
QTI1Ngo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBiODg0NmE0ZDYzNTJi
MmExZDIwMTJmOGIzYjkxMTU2NDA1MjRhZWRhOgo+Cj4gICB2bC5jOiBuZXcgZnVuY3Rpb24gc2Vy
aWFsX21heF9oZHMoKSAoMjAxOC0wNC0yNiAxMzo1ODoyOSArMDEwMCkKPgo+IGFyZSBhdmFpbGFi
bGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXQtaHR0cC9wZW9wbGUvaXdqL3FlbXUuZ2l0IGZvci11cHN0cmVhbS5kZXByaXYtMgoKSGkg
LS0gbXkgYXBwbHktcHVsbHJlcSBzY3JpcHQgdGhpbmtzIHRoaXMgaXNuJ3QgYSBzaWduZWQgdGFn
OgoKZXJyb3I6IHJlbW90ZXMvaXdqL2Zvci11cHN0cmVhbS5kZXByaXYtMjogY2Fubm90IHZlcmlm
eSBhIG5vbi10YWcgb2JqZWN0IG9mCnR5cGUgY29tbWl0LiBEb2VzIG5vdCBhcHBlYXIgdG8gYmUg
YSBzaWduZWQgdGFnCgpXZSBvbmx5IGFwcGx5IHNpZ25lZC10YWcgcHVsbCByZXF1ZXN0cyB0aGVz
ZSBkYXlzOyBjb3VsZCB5b3UKY3JlYXRlIGFuZCBzaWduIGEgdGFnIGFuZCByZXNlbmQgdGhlIHB1
bGxyZXEsIHBsZWFzZT8gKFlvdQpvbmx5IG5lZWQgdG8gcmVzZW5kIHRoZSBjb3ZlciBsZXR0ZXIs
IG5vdCB0aGUgd2hvbGUgc2V0IG9mCnBhdGNoZXMuKQoKKGh0dHBzOi8vd2lraS5xZW11Lm9yZy9D
b250cmlidXRlL1N1Ym1pdEFQdWxsUmVxdWVzdAppcyBvdXIgcHJvY2VzcyBkb2N1bWVudGF0aW9u
IG9uIHB1bGwgcmVxdWVzdHMsIGJ1dCBJIHRoaW5rCmV2ZXJ5dGhpbmcgZWxzZSB3aXRoIHRoaXMg
b25lIGlzIGZpbmUuKQoKdGhhbmtzCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
