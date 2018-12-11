From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Tue, 11 Dec 2018 12:27:49 +0000
Message-ID: <1ca5735f-638a-6949-6a15-2fe4aa665114@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqn2=OU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gWh8k-0008Tg-9F
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 12:27:54 +0000
In-Reply-To: <b5315a79-26a9-7542-2c73-740883280275@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Julien Grall <julien.grall@gmail.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8xMi8yMDE4IDEyOjIzLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAxMC4xMi4xOCAxMzo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBXaGF0IGFy
ZSB0aGUgbnVtYmVycyB3aXRob3V0IFhlbj8KPiBHb29kIHF1ZXN0aW9uLiBEaWRuJ3QgdHJ5LiBB
dCBsZWFzdCBwdXRjaGFyIHNob3VsZCBiZSBpbXBsZW1lbnRlZCBmb3IgdGhhdC4KCkkgdGhpbmsg
d2UgbmVlZCB0aGUgYmFyZW1ldGFsIG51bWJlcnMgdG8gYmUgYWJsZSB0byBjb21wYXJlIHByb3Bl
cmx5IHRoZSBvbGQgYW5kIApuZXcgdkdJQy4KCj4gCj4+IFdoaWNoIHZlcnNpb24gb2YgWGVuIGFy
ZSB5b3UgdXNpbmc/Cj4gVGhpcyBtb3JuaW5nJ3Mgc3RhZ2luZywgY29tbWl0LWlkIDU4ZWI5MGE5
NjUwYThlYTczNTMzYmMyYjg3YzEzYjhjYTdiYmUzNWEuCj4gCj4+IFRoaXMgYWxzbyB0ZWxscyB5
b3UgdGhhdCBpbiB0aGUgdHJhcCBjYXNlIHRoZSB2R0lDIGlzIG5vdCB0aGUgYmlnZ2VyIG92ZXJo
ZWFkLgo+IEluZGVlZCwgbm90IHRoZSBiaWdnZXIuIEJ1dCBzaWduaWZpY2FudCBldmVuIGluIHRo
aXMgdHJpdmlhbCBjYXNlIChyZWNlaXZpbmcgYW4gCj4gaW50ZXJydXB0IHR3aWNlIGEgc2Vjb25k
KS4KClRvIGNvbmZpcm0sIGluIHlvdXIgdXNlLWNhc2UgeW91IGhhdmUgdGhlIGludGVycnVwdCBm
aXJpbmcgZXZlcnkgNTAwbXMsIHJpZ2h0PwoKQnV0IEkgYW0gbm90IHN1cmUgd2hhdCB5b3UgYXJl
IHRyeWluZyB0byBhcmd1ZSBoZXJlLi4uIEkgbmV2ZXIgc2FpZCBpdCB3YXMgCmluc2lnbmlmaWNh
bnQsIEkgb25seSBwb2ludGVkIG91dCB0aGF0IHRoZSBjb250ZXh0IHN3aXRjaC90cmFwIGhhcyBh
IHN0cm9uZyAKaW1wYWN0LiBUaGlzIG1lYW5zIHRoYXQgZm9jdXNpbmcgb24gb3B0aW1pemluZyBj
b250ZXh0L3N3aXRjaCBpcyBwcm9iYWJseSBtb3JlIAp3b3J0aCBpdCBhdCB0aGUgbW9tZW50IHRo
YW4gdHJ5aW5nIHRvIG1pY3JvLW9wdGltaXppbmcgdGhlIHZHSUMuCgpXaGF0IG1hdHRlcnMgYXQg
dGhlIGVuZCBpcyB0aGUgb3ZlcmhlYWQgb2YgdmlydHVhbGl6YXRpb24gKGkuZSBYZW4pLiBXaXRo
b3V0IAp0aG9zZSBiYXJlbWV0YWwgbnVtYmVycywgaXQgaXMgcXVpdGUgZGlmZmljdWx0IHRvIG1h
a2UgYW4gaWRlYSB3aGV0aGVyIHRoaXMgaXMgCnNpZ25pZmljYW50LgoKPiAKPj4gVGhpcyBpcyB3
aXRoIGFsbCB5b3VyIHNlcmllcyBhcHBsaWVkIGJ1dCBbNF0sIGNvcnJlY3Q/Cj4gUmlnaHQuCj4g
Cj4+IERpZCB5b3UgdHJ5IHRvIHNlZSB0aGUgcGVyZm9tYW5jZSBpbXByb3ZlbWVudCBwYXRjaCBi
eSBwYXRjaD8KPiBOby4gTm90IHlldC4KCkkgd291bGQgbGlrZSB0byBoYXZlIHBlcmZvcm1hbmNl
IHBlciBwYXRjaCBzbyB3ZSBjYW4gbWFrZSB0aGUgZGVjaXNpb25zIHdoZXRoZXIgCnRoZSBpbXBs
ZW1lbnRhdGlvbiBjb3N0IGlzIHdvcnRoIGl0IGZvciB1cHN0cmVhbS4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
