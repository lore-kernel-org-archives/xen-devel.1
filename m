From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/8] viridian: separately allocate domain
 and vcpu structures
Date: Thu, 3 Jan 2019 09:22:05 +0000
Message-ID: <271de8208bc44aa2a2508509335a5049@AMSPEX02CL03.citrite.net>
References: <20181220163345.10708-1-paul.durrant@citrix.com>
 <20181220163345.10708-3-paul.durrant@citrix.com>
 <20190102155500.5ge3tqfkggalco36@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ojv4=PL=citrix.com=prvs=89931c2f2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gezCa-0002Eg-2Z
 for xen-devel@lists.xenproject.org; Thu, 03 Jan 2019 09:22:08 +0000
In-Reply-To: <20190102155500.5ge3tqfkggalco36@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgW21haWx0bzp3ZWku
bGl1MkBjaXRyaXguY29tXQo+IFNlbnQ6IDAyIEphbnVhcnkgMjAxOSAxNTo1NQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47Cj4gQW5kcmV3
IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Owo+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzhdIHZpcmlkaWFuOiBzZXBhcmF0ZWx5IGFsbG9jYXRlIGRvbWFp
biBhbmQgdmNwdQo+IHN0cnVjdHVyZXMKPiAKPiBPbiBUaHUsIERlYyAyMCwgMjAxOCBhdCAwNDoz
MzozOVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPgo+ID4gIHZvaWQgdmlyaWRpYW5f
dmNwdV9kZWluaXQoc3RydWN0IHZjcHUgKnYpCj4gPiAgewo+ID4gLSAgICB2aXJpZGlhbl9zeW5p
Y193cm1zcih2LCBIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCAwKTsKPiA+ICsgICAgaWYgKCAh
di0+YXJjaC5odm0udmlyaWRpYW4gKQo+ID4gKyAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAg
ICBpZiAoIGlzX3ZpcmlkaWFuX3ZjcHUodikgKQo+ID4gKyAgICAgICAgdmlyaWRpYW5fc3luaWNf
d3Jtc3IodiwgSFZfWDY0X01TUl9WUF9BU1NJU1RfUEFHRSwgMCk7Cj4gPiArCj4gPiArICAgIHhm
cmVlKHYtPmFyY2guaHZtLnZpcmlkaWFuKTsKPiA+ICsgICAgdi0+YXJjaC5odm0udmlyaWRpYW4g
PSBOVUxMOwo+IAo+IFBsZWFzZSB1c2UgWEZSRUUoKSBoZXJlIGFuZCBiZWxvdy4KCk9vaCwgSSBk
aWRuJ3Qga25vdyBhYm91dCB0aGF0IGJpdCBvZiBtYWNybyBtYWdpYy4KCj4gCj4gV2l0aCBpdCBm
aXhlZDoKPiAKPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRo
YW5rcywKCiAgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
