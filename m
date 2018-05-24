From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] block drivers/block: Use octal not symbolic
 permissions
Date: Thu, 24 May 2018 06:01:02 -0700
Message-ID: <e64c2846b1b9102a52eba7b242f746e7bfff1464.camel__48674.444264225$1527166808$gmane$org@perches.com>
References: <5e97a292c1ba38a6b5a0caa271d85dc3de1b2aa7.1527105857.git.joe@perches.com>
 <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
 <56ee8810463b6c537ca0c10c9f82e6d922acd1f1.camel@perches.com>
 <539cc400-28d7-66df-eb24-77fe95d617a2@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5i6d=il=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1fLprk-0004H8-7M
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 13:01:12 +0000
In-Reply-To: <539cc400-28d7-66df-eb24-77fe95d617a2@kernel.dk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>, "Ed L. Cashin" <ed.cashin@acm.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Jiri Kosina <jikos@kernel.org>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Sage Weil <sage@redhat.com>, Alex Elder <elder@kernel.org>, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, drbd-dev@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTA1LTI0IGF0IDA2OjQ3IC0wNjAwLCBKZW5zIEF4Ym9lIHdyb3RlOgo+IE9u
IDUvMjMvMTggNDozNSBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIDIwMTgtMDUt
MjMgYXQgMTU6MjcgLTA2MDAsIEplbnMgQXhib2Ugd3JvdGU6Cj4gPiA+IE9uIDUvMjMvMTggMjow
NSBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiA+ID4gQ29udmVydCB0aGUgU188Rk9PPiBzeW1i
b2xpYyBwZXJtaXNzaW9ucyB0byB0aGVpciBvY3RhbCBlcXVpdmFsZW50cyBhcwo+ID4gPiA+IHVz
aW5nIG9jdGFsIGFuZCBub3Qgc3ltYm9saWMgcGVybWlzc2lvbnMgaXMgcHJlZmVycmVkIGJ5IG1h
bnkgYXMgbW9yZQo+ID4gPiA+IHJlYWRhYmxlLgo+ID4gPiA+IAo+ID4gPiA+IHNlZTogaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTYvOC8yLzE5NDUKPiA+ID4gPiAKPiA+ID4gPiBEb25lIHdpdGgg
YXV0b21hdGVkIGNvbnZlcnNpb24gdmlhOgo+ID4gPiA+ICQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLWYgLS10eXBlcz1TWU1CT0xJQ19QRVJNUyAtLWZpeC1pbnBsYWNlIDxmaWxlcy4uLj4KPiA+
ID4gPiAKPiA+ID4gPiBNaXNjZWxsYW5lYToKPiA+ID4gPiAKPiA+ID4gPiBvIFdyYXBwZWQgbW9k
aWZpZWQgbXVsdGktbGluZSBjYWxscyB0byBhIHNpbmdsZSBsaW5lIHdoZXJlIGFwcHJvcHJpYXRl
Cj4gPiA+ID4gbyBSZWFsaWduIG1vZGlmaWVkIG11bHRpLWxpbmUgY2FsbHMgdG8gb3BlbiBwYXJl
bnRoZXNpcwo+ID4gPiAKPiA+ID4gSG9uZXN0bHksIEkgc2VlIHRoaXMgYXMgcHJldHR5IG5lZWRs
ZXNzIGNodXJuLgo+ID4gCj4gPiBidHc6Cj4gPiAKPiA+IFRoZXJlIGlzIGN1cnJlbnRseSBhIG1p
eHR1cmUgb2Ygc3ltYm9saWMgYW5kIG9jdGFsCj4gPiBwZXJtaXNzaW9ucyB1c2VzIGluIGJsb2Nr
IGFuZCBkcml2ZXJzL2Jsb2NrCj4gPiAKPiA+IGllOiA5NCBvY3RhbCBhbmQgMTQ2IHN5bWJvbGlj
IHVzZXMuCj4gPiAKPiA+IElmIHRoaXMgaXMgYXBwbGllZCwgYWxsIHdvdWxkIGJlY29tZSBvY3Rh
bC4KPiAKPiBUaGF0IGRvZXMgaGVscCBqdXN0aWZ5IHRoZSBjaGFuZ2UuIE15IG1haW4gd29ycnkg
aGVyZSBpcyBjcmVhdGluZwo+IHVubmVjZXNzYXJ5IGNvbmZsaWN0cywgd2hpY2ggaXMgYWx3YXlz
IGFubm95aW5nLiBCdXQgaXQncyBldmVuIG1vcmUKPiBhbm5veWluZyB3aGVuIHRoZSBjaGFuZ2Ug
Y3JlYXRpbmcgdGhlIGNvbmZsaWN0IGlzbid0IHJlYWxseSB0aGF0Cj4gaW1wb3J0YW50IGF0IGFs
bC4gQ2FzZSBpbiBwb2ludCwgdGhlIHBhdGNoIGRvZXNuJ3QgYXBwbHkgdG8gdGhlCj4gZm9yLTQu
MTgvYmxvY2sgYnJhbmNoIHRoYXQgaXQgc2hvdWxkIGdvIGludG8uLi4KCkRvbmUgYWdhaW5zdCBt
b3N0IHJlY2VudCAtbmV4dCBhcyBpdCdzIGJhc2ljYWxseSBpbXBvc3NpYmxlCnRvIGRvIGFueXRo
aW5nIGFnYWluc3QgbXVsdGlwbGUgcHJpdmF0ZSB0cmVlcy4KCkFsc28sIHRoZSBzY3JpcHQgdGhh
dCBnZW5lcmF0ZWQgdGhlIHBhdGNoIGlzIGluIHRoZSBjaGFuZ2Vsb2cKc28gaXQncyBzaW1wbGUg
dG8gcmVydW4uCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
