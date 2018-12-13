From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 13 Dec 2018 09:48:06 +0200
Message-ID: <0cf198d3-7f47-38a6-a4dd-00189306e9da@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <4dcdf98b-aed4-8b5a-ced8-9c982b5ee7dd@gmail.com>
 <a2365222cf2beec45fc64a0da90f4249b58cc6fe.camel@suse.com>
 <0131d16f-2ffd-b363-eb25-3289fed1e3ec@gmail.com>
 <ecf2c1ac2bff1292836ad6fc9675316e20b60525.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D7xZ=OW=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gXLj9-0006zt-MR
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 07:48:11 +0000
Received: by mail-lf1-x143.google.com with SMTP id y11so805484lfj.4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 23:48:10 -0800 (PST)
In-Reply-To: <ecf2c1ac2bff1292836ad6fc9675316e20b60525.camel@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDEyLjEyLjE4IDE5OjU5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBZZWFoLCBhbmQgYWx0
aG91Z2ggZGlmZmljdWx0IHRvIGFkbWl0L3NlZSB0aGUgcmVhc29uIHdoeSwgSSB0aGluayB0aGlz
Cj4gbG9va3MgbGlrZSBpdCBpcyBjb21pbmcgZnJvbSBzb21ldGhpbmcgd2UgZG8gaW4gWGVuLiBB
bmQgc2luY2UgeW91IHNheQo+IHlvdSBoYXZlIGFuIG9sZCBYZW4gdmVyc2lvbiB0aGF0IHdvcmtz
LCBJIHJlYWxseSBzZWUgYmlzZWN0aW9uIGFzIHRoZQo+IHdheSB0byBnby4uLgoKPiBOb3Qgc3Vy
ZSBJJ20gZ2V0dGluZy4gQXJlIHlvdSBzYXlpbmcgdGhhdCB5b3Ugc29tZWhvdyB2ZXJpZmllZCB0
aGF0IG9uCj4gNC4xMCB2Y3B1cyBkb24ndCBtb3ZlPyBCdXQgb24gNC4xMCB5b3UgaGF2ZSBwaW5u
aW5nIHRoYXQgd29ya3MsIGRvbid0Cj4geW91PwpZZXMsIHRoZSBwaW5uaW5nIHdvcmtzIChhbmQg
aXMgcmVhc29uYWJseSB1c2VkKSBpbiBvdXIgc2V0dXAgd2UgYXJlIHByb3ZpZGluZyB0byBhIGN1
c3RvbWVyLiBUaGF0IHNldHVwIGlzIGJhc2VkIG9uIDQuMTAgcmVsZWFzZS4KRm9yIG15IElSUSBs
YXRlbmN5IHdvcmssIEkgdXNlZCBhIHNpbXBsaWZpZWQgc2V0dXAgd2l0aCB0aGUgb25seSBEb20w
IGFuZCB0aGUgc2FtZSBYRU4gYXMgaW4gdGhlIGN1c3RvbWVyJ3Mgc2V0dXAuCkkgd2FzIHRvbyBs
YXp5IHRvIHNldCB1cCBwaW5uaW5nIGZvciBteSBleHBlcmltZW50YWwgc2V0dXAgZnJvbSB0aGUg
YmVnaW5uaW5nIGFuZCBsYXRlciBJIGZvdW5kIG91dCB0aGF0IFZDUFVzIHdlcmUgbm90IG1pZ3Jh
dGluZy4KCj4gT3IgYXJlIHlvdSBzYXlpbmcgeW91J3ZlIHZlcmlmaWVkIHRoYXQgdmNwdXMgZG9u
J3QgbW92ZSwgb24gNC4xMCwgZXZlbgo+IHdpdGhvdXQgZG9pbmcgdGhlIHBpbm5pbmc/IElmIHll
cywgY2FuIEkgYXNrIGhvdz8KWWVoLCBpdCB0b29rIG1lIHNvbWUgdGltZSB0byByZWNhbGwgdGhh
dCBmcm9tIG15IG1lbW9yeTopCldoZW4gSSB0cmllZCB1c2luZyB4ZW50cmFjZSB0byBwcm9maWxl
IGludGVycnVwdCBwYXRoLCBJIG5vdGljZWQgdGhhdCBgY3VycmVudGAgbm9uLWlkbGUgVkNQVSBp
cyBub3QgY2hhbmdlZCBmb3IgYSBwYXJ0aWN1bGFyIFBDUFUuCgotLSAKU2luY2VyZWx5LApBbmRy
aWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
