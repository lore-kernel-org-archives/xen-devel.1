From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: Xen optimization
Date: Wed, 12 Dec 2018 19:32:08 +0200
Message-ID: <0131d16f-2ffd-b363-eb25-3289fed1e3ec@gmail.com>
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
 <a53d1bd000d3c6af44ed02997d0484405875aab2.camel@suse.com>
 <4dcdf98b-aed4-8b5a-ced8-9c982b5ee7dd@gmail.com>
 <a2365222cf2beec45fc64a0da90f4249b58cc6fe.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX8Mo-0001Z0-Gn
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:32:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id l10so14150417lfh.9
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 09:32:12 -0800 (PST)
In-Reply-To: <a2365222cf2beec45fc64a0da90f4249b58cc6fe.camel@suse.com>
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

SGVsbG8gRGFyaW8sCgpPbiAxMi4xMi4xOCAxOToxMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4g
QWgsIHllcy4uLiBJJ3ZlIHNlZW4gdGhlIHRocmVhZC4gSSBoYXZlbid0IGNvbW1lbnRlZCwgYXMg
aXQgaXMgcmVhbGx5LAo+IHJlYWxseSB3ZWlyZCwgYW5kIEkgZG9uJ3Qga25vdyB3aGF0IHRvIHRo
aW5rL3NheS4KPiAKPiBJIHRoaW5rIG9ubHkgYmlzZWN0aW9uIGNvdWxkIHNoZWQgc29tZSBsaWdo
dCBvbiB0aGlzLiBBbmQgaXQgd291bGQgYmUKPiB3b25kZXJmdWwgaWYgeW91IGNvdWxkIGRvIHRo
YXQsIGJ1dCBJIHVuZGVyc3RhbmQgdGhhdCBpdCB0YWtlcyB0aW1lLiA6LQo+IC8KV2VsbCwgYmlz
ZWN0IG1pZ2h0IGhlbHAuIEJ1dCBJJ20gcmVhbGx5IGNvbmZ1c2VkIHdoeSBNZW1Ub3RhbCBtYXkg
YmUgcmVkdWNlZC4KCj4gQXJlIHlvdSBhYnNvbHV0ZWx5IHN1cmUgYWJvdXQgdGhhdD8gVGhhdCBp
cywgYXJlIHlvdSAianVzdCIgYXNzdW1pbmcKPiB0aGUgc2NoZWR1bGVyIHdvbid0IG1vdmUgc3R1
ZmYsIG9yIGhhdmUgeW91IHB1dCBzb21lIGRlYnVnZ2luZyBvcgo+IHByaW50aW5nIGluIHBsYWNl
IHRvIHZlcmlmeSB0aGF0IHRvIGJlIHRoZSBjYXNlP0JlaW5nIGhvbmVzdCwgSSBkaWQgbm90IGNo
ZWNrIGZvciBleGFjdGx5IHRoaXMgc2V0dXAuIEkgdmVyaWZpZWQgaXQgZm9yIDQuMTAuCgo+IEkn
bSBhc2tpbmcgYmVjYXVzZSwgeWV0LCBpbiB0aGVvcnkgdGhhdCBpcyB3aGF0IG9uZSB3b3VsZCBl
eHBlY3QuIEJ1dCwKPiBhcyBJIHRoaW5rIHlvdSBrbm93IHZlcnkgd2VsbCwgYWx0aG91Z2ggaW4g
dGhlb3J5IHRoZXJlIGlzIG5vCj4gZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZW9yeSBhbmQgcHJhY3Rp
Y2UsIGluIHByYWN0aWNlLCB0aGVyZSBpcy4gOi0pCkkga25vdyBpdCB2ZXJ5IHdlbGwgOikKCi0t
IApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
