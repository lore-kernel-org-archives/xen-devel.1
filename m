From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 19:47:25 +0200
Message-ID: <a95a362e-94a2-60f6-7ecb-c46f8682bfa3@gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <170fd802-8c8c-afb8-fc5a-5445f7cc135e@gmail.com>
 <alpine.DEB.2.10.1812120936060.12259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX8ba-0002sT-09
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:47:30 +0000
Received: by mail-lf1-x143.google.com with SMTP id a16so14215104lfg.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 09:47:29 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1812120936060.12259@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: nd@arm.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywKCk9uIDEyLjEyLjE4IDE5OjM5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6Cj4gVGhhbmtzIGZvciB0aGUgZ29vZCB3b3JrLCBBbmRyaWkhCj4gCj4gVGhlIFdBUk1fTUFY
IGltcHJvdmVtZW50cyBmb3IgdndmaT1uYXRpdmUgd2l0aCB5b3VyIG9wdGltaXphdGlvbnMgYXJl
IGltcHJlc3NpdmUuCgpJIHJlYWxseSBob3BlIHlvdSBhcmUgbm90IHNwZWFraW5nIGFib3V0IHRo
ZXNlIG51bWJlcnM6Cgo+PiBtYXg9ODQwIHdhcm1fbWF4PTEyMCBtaW49MTIwIGF2Zz0xMjcKClRo
b3NlIGFyZSBUQk0gYmFyZW1ldGFsIG51bWJlcnMgaW4gaHlwIG1vZGUuCgpEaWQgeW91IHRyeSBt
eSBSRkMgb24geW91ciBIVz8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
