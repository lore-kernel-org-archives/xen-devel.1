From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 2/3] xen: remove tmem from hypervisor
Date: Wed, 10 Apr 2019 13:14:51 +0100
Message-ID: <20190410121451.GZ30543@zion.uk.xensource.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
 <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
 <20190410115757.GY30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEC86-0002Qh-0S
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 12:15:02 +0000
Content-Disposition: inline
In-Reply-To: <20190410115757.GY30543@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMTI6NTc6NTdQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEFwciAxMCwgMjAxOSBhdCAwNDo1NTo1MEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+ID4+PiBPbiAwOS4wNC4xOSBhdCAxODo1MiwgPHdlaS5saXUyQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+
ID4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+ID4gPiBAQCAt
NTgsOCArNTgsOCBAQCBERUNMQVJFX0hZUEVSQ0FMTChodm1fb3ApCj4gPiA+ICBERUNMQVJFX0hZ
UEVSQ0FMTChzeXNjdGwpCj4gPiA+ICBERUNMQVJFX0hZUEVSQ0FMTChkb21jdGwpCj4gPiA+ICBE
RUNMQVJFX0hZUEVSQ0FMTChrZXhlY19vcCkKPiA+ID4gLURFQ0xBUkVfSFlQRVJDQUxMKHRtZW1f
b3ApCj4gPiA+ICBERUNMQVJFX0hZUEVSQ0FMTChhcmdvX29wKQo+ID4gPiArREVDTEFSRV9IWVBF
UkNBTEwoeGNfcmVzZXJ2ZWRfb3ApCj4gPiAKPiA+IElzIHRoaXMgYWRkZWQgbGluZSBhIHJlLWJh
c2luZyBtaXN0YWtlIG92ZXIgdGhlIEFyZ28gc2VyaWVzPwo+ID4gCj4gPiAKPiA+ID4gLS0tIGEv
eGVuL2NvbW1vbi9NYWtlZmlsZQo+ID4gPiArKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCj4gPiAK
PiA+IFRoZXJlJ3MgYXJlIGh1bmtzIG1pc3NpbmcgaGVyZSB0byByZW1vdmUKPiA+IAo+ID4gb2Jq
LSQoQ09ORklHX1RNRU0pICs9IGx6by5vCj4gPiAKPiA+IGFuZCB0byByZXBsYWNlCj4gPiAKPiA+
IGx6by15IDo9IGx6bwo+ID4gbHpvLSQoQ09ORklHX1RNRU0pIDo9Cj4gPiAKPiA+IChhbmQgaXRz
IHVzZSkuCj4gCj4gSSBndWVzcyB3ZSBjYW4gZHJvcCBsem8gaW4gaXRzIGVudGlyZXR5IG5vdz8K
CkhtbS4uLiBJIHdpbGwganVzdCByZXdyaXRlIHRoYXQgcGFydCBhcyBpZiB0bWVtIGlzIG9mZi4K
CkkgZG9uJ3QgdGhpbmsgbHpvLmMgY2FuIGJlIGRyb3BwZWQuIEl0IGlzIHN0aWxsIG5lZWRlZCBh
dCBzdGFydCBvZiBkYXkuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
