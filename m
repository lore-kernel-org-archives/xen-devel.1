From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 10:01:28 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812121001010.12259@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <a95a362e-94a2-60f6-7ecb-c46f8682bfa3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gX8p9-0005Up-Nv
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:01:31 +0000
In-Reply-To: <a95a362e-94a2-60f6-7ecb-c46f8682bfa3@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxMiBEZWMgMjAxOCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBTdGVmYW5v
LAo+IAo+IE9uIDEyLjEyLjE4IDE5OjM5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBU
aGFua3MgZm9yIHRoZSBnb29kIHdvcmssIEFuZHJpaSEKPiA+IAo+ID4gVGhlIFdBUk1fTUFYIGlt
cHJvdmVtZW50cyBmb3IgdndmaT1uYXRpdmUgd2l0aCB5b3VyIG9wdGltaXphdGlvbnMgYXJlCj4g
PiBpbXByZXNzaXZlLgo+IAo+IEkgcmVhbGx5IGhvcGUgeW91IGFyZSBub3Qgc3BlYWtpbmcgYWJv
dXQgdGhlc2UgbnVtYmVyczoKPiAKPiA+ID4gbWF4PTg0MCB3YXJtX21heD0xMjAgbWluPTEyMCBh
dmc9MTI3Cj4gCj4gVGhvc2UgYXJlIFRCTSBiYXJlbWV0YWwgbnVtYmVycyBpbiBoeXAgbW9kZS4K
Ckkga25vdywgSSB3YXMgcmVmZXJyaW5nIHRvIHlvdXIgb2xkZXIgcmVzdWx0cywgc29ycnkgZm9y
IHRoZSBjb25mdXNpb24uCgoKPiBEaWQgeW91IHRyeSBteSBSRkMgb24geW91ciBIVz8KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
