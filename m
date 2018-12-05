From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 1/4] amd-iommu: add flush iommu_ops
Date: Wed, 5 Dec 2018 12:56:45 +0000
Message-ID: <06f4edfeb8824993bc0cc59e56eebc12@AMSPEX02CL03.citrite.net>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-2-paul.durrant@citrix.com>
 <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f1m+=OO=citrix.com=prvs=870045bc7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUWjR-00036w-14
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 12:56:49 +0000
In-Reply-To: <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDUgRGVjZW1iZXIgMjAxOCAxMTo0Ngo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdAo+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IEFuZHJldyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0
cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkKPiBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEvNF0gYW1kLWlvbW11OiBhZGQg
Zmx1c2ggaW9tbXVfb3BzCj4gCj4gPj4+IE9uIDA1LjEyLjE4IGF0IDEyOjI5LCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X21hcC5jCj4gPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfbWFwLmMKPiA+IEBAIC02MzQsNiArNjM0LDU2IEBAIGludCBhbWRfaW9tbXVfdW5tYXBfcGFn
ZShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdAo+IGRmbikKPiA+ICAgICAgc3Bpbl91bmxvY2soJmhk
LT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4gPgo+ID4gICAgICBhbWRfaW9tbXVfZmx1c2hfcGFnZXMo
ZCwgZGZuX3goZGZuKSwgMCk7Cj4gPiArICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtz
dGF0aWMgdW5zaWduZWQgbG9uZyBmbHVzaF9jb3VudCh1bnNpZ25lZCBsb25nIGRmbiwgdW5zaWdu
ZWQgaW50Cj4gcGFnZV9jb3VudCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiArewo+ID4gKyAgICB1bnNpZ25lZCBsb25nIHN0YXJ0
ID0gZGZuID4+IG9yZGVyOwo+ID4gKyAgICB1bnNpZ25lZCBsb25nIGVuZCA9IChkZm4gKyBwYWdl
X2NvdW50IC0gMSkgPj4gMTsKPiAKPiBHcmFudGVkIGluIG15IGVhcmxpZXIgcmVwbHkgSSBoYWQg
YSBtaXNzaW5nIG9wZW5pbmcgcGFyZW50aGVzaXMsCj4gYnV0IHRoZSBhYm92ZSBpcyBwcmV0dHkg
Y2xlYXJseSB0aGUgd3Jvbmcgd2F5IG9mIGFkZHJlc3NpbmcKPiB0aGUgcmVzdWx0aW5nIGJ1aWxk
IGVycm9yLgoKU29ycnksIHRoYXQncyB3YXkgdG9vIGNyeXB0aWMuIFdoYXQgYnVpbGQgZXJyb3I/
CgogIFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
