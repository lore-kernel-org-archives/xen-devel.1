From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen optimization
Date: Tue, 11 Dec 2018 10:39:01 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812111038130.12259@sstabellini-ThinkPad-X260>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2g57=OU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gWmw2-00082g-On
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 18:39:10 +0000
In-Reply-To: <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxMSBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEwLzEyLzIwMTgg
MTI6MjMsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiBIZWxsbyBKdWxpZW4sCj4gPiAKPiA+IE9u
IDEwLjEyLjE4IDEzOjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IFdoYXQgYXJlIHRoZSBu
dW1iZXJzIHdpdGhvdXQgWGVuPwo+ID4gR29vZCBxdWVzdGlvbi4gRGlkbid0IHRyeS4gQXQgbGVh
c3QgcHV0Y2hhciBzaG91bGQgYmUgaW1wbGVtZW50ZWQgZm9yIHRoYXQuCj4gCj4gSSB0aGluayB3
ZSBuZWVkIHRoZSBiYXJlbWV0YWwgbnVtYmVycyB0byBiZSBhYmxlIHRvIGNvbXBhcmUgcHJvcGVy
bHkgdGhlIG9sZAo+IGFuZCBuZXcgdkdJQy4KClRoYXQgbWlnaHQgcHJvdmUgdmVyeSBoYXJkIGZv
ciBBbmRyaWkgdG8gZG8gYmVjYXVzZSBUQk0gaXMgbWFkZSB0byBydW4Kb24gWGlsaW54IGhhcmR3
YXJlIGFuZCBYZW4gVk1zIG9ubHkuIEl0IGlzIHByb2JhYmx5IGxhY2tpbmcgbmVjZXNzYXJ5CmRy
aXZlcnMgdG8gcnVuIG9uIG90aGVyIGJvYXJkcyBuYXRpdmVseS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
