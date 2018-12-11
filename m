From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Tue, 11 Dec 2018 19:05:34 +0000
Message-ID: <b0fe0367-5378-83aa-39e1-79badb37922b@arm.com>
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
 <alpine.DEB.2.10.1812111038130.12259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqn2=OU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gWnLf-0002ZM-Bv
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 19:05:39 +0000
In-Reply-To: <alpine.DEB.2.10.1812111038130.12259@sstabellini-ThinkPad-X260>
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
Cc: Andrii Anisov <andrii.anisov@gmail.com>, nd@arm.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@gmail.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xMi8yMDE4IDE4OjM5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVHVl
LCAxMSBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMC8xMi8yMDE4IDEyOjIz
LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gSGVsbG8gSnVsaWVuLAo+Pj4KPj4+IE9uIDEwLjEy
LjE4IDEzOjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gV2hhdCBhcmUgdGhlIG51bWJlcnMg
d2l0aG91dCBYZW4/Cj4+PiBHb29kIHF1ZXN0aW9uLiBEaWRuJ3QgdHJ5LiBBdCBsZWFzdCBwdXRj
aGFyIHNob3VsZCBiZSBpbXBsZW1lbnRlZCBmb3IgdGhhdC4KPj4KPj4gSSB0aGluayB3ZSBuZWVk
IHRoZSBiYXJlbWV0YWwgbnVtYmVycyB0byBiZSBhYmxlIHRvIGNvbXBhcmUgcHJvcGVybHkgdGhl
IG9sZAo+PiBhbmQgbmV3IHZHSUMuCj4gCj4gVGhhdCBtaWdodCBwcm92ZSB2ZXJ5IGhhcmQgZm9y
IEFuZHJpaSB0byBkbyBiZWNhdXNlIFRCTSBpcyBtYWRlIHRvIHJ1bgo+IG9uIFhpbGlueCBoYXJk
d2FyZSBhbmQgWGVuIFZNcyBvbmx5LiBJdCBpcyBwcm9iYWJseSBsYWNraW5nIG5lY2Vzc2FyeQo+
IGRyaXZlcnMgdG8gcnVuIG9uIG90aGVyIGJvYXJkcyBuYXRpdmVseS4KClJlYWxseT8gV2hhdCBz
b3J0IG9mIHBsYXRmb3JtIHNwZWNpZmljIGRyaXZlciBkbyB5b3UgbmVlZD8gU2hvdWxkbid0IHRo
ZSBVQVJUIGJlIApzdWZmaWNpZW50PwoKV2hlbiB5b3Ugc3BlYWsgYWJvdXQgaW50ZXJydXB0IGxh
dGVuY3ksIHlvdSBuZWVkIHRvIGNvbXBhcmUgdG8gYmFyZW1ldGFsLgpPdGhlcndpc2UgaXQgaGFz
IG5vIG1lYW5pbmcgYXQgYWxsLiBTbyB3aGF0IGlzIHlvdXIgc29sdXRpb24/CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
