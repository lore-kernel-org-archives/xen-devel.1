From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 11:46:05 +0200
Message-ID: <b5b458f6-9771-1269-7aa7-f9b7677277f7@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <alpine.DEB.2.10.1812111038130.12259@sstabellini-ThinkPad-X260>
 <b0fe0367-5378-83aa-39e1-79badb37922b@arm.com>
 <alpine.DEB.2.10.1812111122540.12259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX15m-0007Ut-V3
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 09:46:11 +0000
Received: by mail-lf1-x142.google.com with SMTP id l10so13011771lfh.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 01:46:09 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1812111122540.12259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: nd@arm.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDExLjEyLjE4IDIxOjI5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gWWVzLCBJIHRo
aW5rIHRoZSB1YXJ0IGRyaXZlciBjb3VsZCBiZSBzdWZmaWNpZW50LCBidXQgaXQgaGFzIG9ubHkg
dGhlCj4gWGlsaW54IHVhcnQsIHRoZSBwbDAxMSBhbmQgdGhlIFhlbiBlbWVyZ2VuY3kgY29uc29s
ZS4gSWYgSSByZWNhbGwKPiBjb3JyZWN0bHksIFJlbmVzYXMgbmVlZHMgYSBkaWZmZXJlbnQgZHJp
dmVyLiBBbnkgcGxhdGZvcm0gc3BlY2lmaWMKPiBpbml0aWFsaXphdGlvbiB3b3VsZCBhbHNvIG5l
ZWQgdG8gYmUgYWRkZWQgdG8gaXQuCkFjdHVhbGx5IHRoZSBjb25zb2xlIGRyaXZlciAocHV0Y2hh
cikgaXMgcmVhbGx5IHRyaXZpYWwgaW4gVEJNLCBhbmQgZm9yIHBsYXRmb3JtIGluaXRpYWxpemF0
aW9uIEkgcmVseSBvbiB1LWJvb3QncyByZW1haW5pbmdzLgpCdXQgSSBmYWNlZCBhIHN0cmFuZ2Ug
aXNzdWUgd2l0aCBhIHRpbWVyIGludGVycnVwdC4gRGVzcGl0ZSB0aGUgZmFjdCB0aGUgVEJNIHNl
dHMgTU1VLCBleGNlcHRpb24gaGFuZGxlcnMgdGFibGUgYW5kIFZCQVIsIHRoZSBpbnRlcnJ1cHQg
ZG9lcyBub3QgY2F1c2UgVEJNcyBjb2RlIGJlaW5nIGNhbGxlZC4gQnV0IEkgc2VlIHRoZSBpbnRl
cnJ1cHQgZmlyZWQgYW5kIGJlY29tZSBhY3RpdmUgaW4gR0lDIHJlZ2lzdGVycy4KRGlnZ2luZyBp
bnRvIHRoYXQgbm93LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
