From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 11:39:38 +0200
Message-ID: <4dcdf98b-aed4-8b5a-ced8-9c982b5ee7dd@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
 <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
 <a53d1bd000d3c6af44ed02997d0484405875aab2.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX0zX-0006jY-VG
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:39:43 +0000
Received: by mail-lj1-x242.google.com with SMTP id e5-v6so15678013lja.4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 01:39:42 -0800 (PST)
In-Reply-To: <a53d1bd000d3c6af44ed02997d0484405875aab2.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Julien Grall <julien.grall@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gRGFyaW8sCgpPbiAxMS4xMi4xOCAxODo1NiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
QWxzbywgd2hhdCBhYm91dCBYZW4gbnVtYmVycywgc2NoZWQ9bnVsbC4KRGlkbid0IGNoZWNrLCB3
aWxsIHB1dCBvbiB0aGUgbGlzdC4KCj4gSSBkb24ndCBleHBlY3QgbXVjaCBpbXByb3ZlbWVudCwg
Y29uc2lkZXJpbmcgcGlubmluZyBpcyBpbi1wbGFjZQo+IGFscmVhZHkuCkFjdHVhbGx5LCBJIGZh
Y2VkIGEgc3RyYW5nZSBpc3N1ZSB3aXRoIGV4cGxpY2l0IHBpbm5pbmcgb2YgRG9tMC4gRGlkbid0
IHNvcnQgb3V0IHRoZSBjYXVzZSB5ZXQuIEFuZCBKdWxpZW4gc2F5cyBpdCBpcyBub3QgcmVwcm9k
dWNpYmxlIG9uIGhpcyBkZXNrLgpCdXQgeWVzLCB3aXRoIFZDUFUgbnVtYmVyIGxlc3MgdGhhbiBQ
Q1BVcyAtIHRoZXJlIGlzIG5vIG1pZ3JhdGlvbiBvZiBEb20wIFZDUFVzLgoKWzFdIGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMi9tc2cw
MDQzNS5odG1sCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
