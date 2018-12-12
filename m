From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 12:41:27 +0200
Message-ID: <170fd802-8c8c-afb8-fc5a-5445f7cc135e@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <b5b458f6-9771-1269-7aa7-f9b7677277f7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX1xM-0005sx-OB
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 10:41:32 +0000
Received: by mail-lf1-x142.google.com with SMTP id z13so13121426lfe.11
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 02:41:31 -0800 (PST)
In-Reply-To: <b5b458f6-9771-1269-7aa7-f9b7677277f7@gmail.com>
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

Ck9uIDEyLjEyLjE4IDExOjQ2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IERpZ2dpbmcgaW50byB0
aGF0IG5vdy4KSSBnb3QgaXQuIE15IHUtYm9vdCBzdGFydHMgVEJNIGluIGh5cCBtb2RlLiBCdXQg
dGhlbSBib3RoIG1pc3Mgc2V0dGluZyBIQ1JfRUwyLklNTywgc28gbm8gaW50ZXJydXB0IGV4Y2Vw
dGlvbiB3YXMgdGFrZW4gaW4gaHlwLgpPSywgZm9yIG15IGJhcmVtZXRhbCBUQk0gaW4gaHlwLCBu
dW1iZXJzIGFyZToKCm1heD04NDAgd2FybV9tYXg9MTIwIG1pbj0xMjAgYXZnPTEyNwoKSSBndWVz
cywgd2FybV9tYXggYW5kIG1pbiBhcmUgb25lIHRpY2sgb2YgdGhlIHN5c3RlbSB0aW1lci4gQW5k
IGl0IHNlZW1zIHRvIG1lIHRoYXQgb25lIHRpY2sgb2YgdGhlIHN5c3RlbSB0aW1lciBpcyB0aGUg
bG93ZXIgbGltaXQgb2YgdGhlIGlycSBsYXRlbmN5IGJ5IEhXIGRlc2lnbi4KCi0tIApTaW5jZXJl
bHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
