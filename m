From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Mon, 10 Dec 2018 14:23:46 +0200
Message-ID: <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
 <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
 <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHsN=OT=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gWKbH-0003mW-GH
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 12:23:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id v15-v6so9379938ljh.13
 for <xen-devel@lists.xenproject.org>; Mon, 10 Dec 2018 04:23:49 -0800 (PST)
In-Reply-To: <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMTAuMTIuMTggMTM6NTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBX
aGF0IGFyZSB0aGUgbnVtYmVycyB3aXRob3V0IFhlbj8KR29vZCBxdWVzdGlvbi4gRGlkbid0IHRy
eS4gQXQgbGVhc3QgcHV0Y2hhciBzaG91bGQgYmUgaW1wbGVtZW50ZWQgZm9yIHRoYXQuCgo+IFdo
aWNoIHZlcnNpb24gb2YgWGVuIGFyZSB5b3UgdXNpbmc/ClRoaXMgbW9ybmluZydzIHN0YWdpbmcs
IGNvbW1pdC1pZCA1OGViOTBhOTY1MGE4ZWE3MzUzM2JjMmI4N2MxM2I4Y2E3YmJlMzVhLgoKPiBU
aGlzIGFsc28gdGVsbHMgeW91IHRoYXQgaW4gdGhlIHRyYXAgY2FzZSB0aGUgdkdJQyBpcyBub3Qg
dGhlIGJpZ2dlciBvdmVyaGVhZC4KSW5kZWVkLCBub3QgdGhlIGJpZ2dlci4gQnV0IHNpZ25pZmlj
YW50IGV2ZW4gaW4gdGhpcyB0cml2aWFsIGNhc2UgKHJlY2VpdmluZyBhbiBpbnRlcnJ1cHQgdHdp
Y2UgYSBzZWNvbmQpLgoKPiBUaGlzIGlzIHdpdGggYWxsIHlvdXIgc2VyaWVzIGFwcGxpZWQgYnV0
IFs0XSwgY29ycmVjdD8KUmlnaHQuCgo+IERpZCB5b3UgdHJ5IHRvIHNlZSB0aGUgcGVyZm9tYW5j
ZSBpbXByb3ZlbWVudCBwYXRjaCBieSBwYXRjaD8KTm8uIE5vdCB5ZXQuCgotLSAKU2luY2VyZWx5
LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
