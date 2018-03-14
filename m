From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] xenbaked.c: Avoid divide by zero issue on
 dump_stats()
Date: Wed, 14 Mar 2018 10:04:55 -0400
Message-ID: <20180314140455.GB20607@char.us.oracle.com>
References: <560fcc42-d01f-f60d-0c9f-4373d4e8e8f4@oracle.com>
 <20180314022426.GQ3543@char.us.oracle.com>
 <CAFLBxZYME-PKN3HfUa8-Go0teLnWd9ep1fMAGTkYMwT6SxqnNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hg23=ge=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1ew71e-00023I-3k
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 14:05:06 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZYME-PKN3HfUa8-Go0teLnWd9ep1fMAGTkYMwT6SxqnNw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Philip Lee <philip.lee@oracle.com>, Joe Jin <joe.jin@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Campbell <ian.campbell@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6NTQ6NDJBTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIE1hciAxNCwgMjAxOCBhdCAyOjI0IEFNLCBLb25yYWQgUnplc3p1dGVr
IFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAx
MywgMjAxOCBhdCAwNjozODoyNFBNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4+IHJ1bl90aW1l
IG9uIGR1bXBfc3RhdHMoKSBtYXliZSB6ZXJvIGlmIGJyZWFrIHhlbm1vbi5weSBpbW1lZGlhdGVs
eSBhZnRlciBpdAo+ID4KPiA+IHMvbWF5YmUvY2FuIGJlLwo+ID4+IHN0YXJ0ZWQsIHRoZW4geGVu
YmFrZWQgaGl0IGRpdmlkZSBieSB6ZXJvIGZhdWx0Lgo+ID4KPiA+IEFuZDoKPiA+Cj4gPiAiTm90
ZSB0aGF0IHJ1bl90aW1lIGlzIGNvbXB1dGVkIHVzaW5nIHR3byB2YWx1ZXMgd2hpY2ggYXJlIHJl
dHJpZXZlZCB1c2luZyAndGltZScKPiA+IHN5c3RlbSBjYWxsIHdoaWNoIGdpdmVzIHVzIHJlc29s
dXRpb24gaW4gc2Vjb25kcy4iCj4gCj4gSXMgYW55b25lIHN0aWxsIHVzaW5nIHRoaXM/ICBEb2Vz
IGl0IGV2ZW4gd29yaz8gIEkgdGhvdWdodCB3ZSBoYWQKClllcyBhcyB3ZSBmb3VuZCBvdXQgYXMg
Zm9sa3Mgc3RhcnQgY29taW5nIG91dCBvZiB0aGUgd29vZHMgd2l0aCB0aGUgbmVlZAp0byB1cGRh
dGUgdGhlaXIgT1MgdGhhbmtzIHRvIHNwZWN0cmUuCgpUaGV5IHVzZSBpdCB3aXRoICd4ZW5tb24u
cHknIGNvbWJpbmF0aW9uLgoKPiB0YWxrZWQgYWJvdXQgcmVtb3ZpbmcgaXQgYXQgc29tZSBwb2lu
dC4KPiAKPiAgLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
