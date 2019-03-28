From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/7] x86/ACPI: also parse AMD IOMMU tables
 early
Date: Thu, 28 Mar 2019 16:43:06 +0000
Message-ID: <782ef70b-2569-9814-da88-34ad8c98d9c8@citrix.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CDF140200007800222844@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9APk=R7=citrix.com=prvs=98327f9ff=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9YF7-0004r0-50
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 16:51:05 +0000
In-Reply-To: <5C9CDF140200007800222844@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAxNDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gb3JkZXIgdG8gYmUg
YWJsZSB0byBpbml0aWFsaXplIHgyQVBJQyBtb2RlIHdlIG5lZWQgdG8gcGFyc2UKPiByZXNwZWN0
aXZlIEFDUEkgdGFibGVzIGVhcmx5LiBTcGxpdCBhbWRfaW92X2RldGVjdCgpIGludG8gdHdvIHBh
cnRzIGZvcgo+IHRoaXMgcHVycG9zZSwgYW5kIGNhbGwgdGhlIGluaXRpYWwgcGFydCBlYXJsaWVy
IG9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvYWNwaS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hY3BpLmgKPiBAQCAtMjYsNiArMjYsNyBAQAo+ICAjaW5jbHVkZSA8YWNwaS9wZGNfaW50
ZWwuaD4KPiAgI2luY2x1ZGUgPGFjcGkvYWNjb25maWcuaD4KPiAgI2luY2x1ZGUgPGFjcGkvYWN0
YmwuaD4KPiArI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+ICAKPiAgI2RlZmluZSBDT01QSUxFUl9E
RVBFTkRFTlRfSU5UNjQgICBsb25nIGxvbmcKPiAgI2RlZmluZSBDT01QSUxFUl9ERVBFTkRFTlRf
VUlOVDY0ICB1bnNpZ25lZCBsb25nIGxvbmcKPiBAQCAtMTQ1LDYgKzE0NiwxNSBAQCBleHRlcm4g
dTMyIHBtdG1yX2lvcG9ydDsKPiAgZXh0ZXJuIHVuc2lnbmVkIGludCBwbXRtcl93aWR0aDsKPiAg
Cj4gIGludCBhY3BpX2RtYXJfaW5pdCh2b2lkKTsKPiAraW50IGFjcGlfaXZyc19pbml0KHZvaWQp
Owo+ICsKPiArc3RhdGljIGlubGluZSBpbnQgYWNwaV9pb21tdV9pbml0KHZvaWQpCj4gK3sKPiAr
ICAgIGludCByZXQgPSBhY3BpX2RtYXJfaW5pdCgpOwo+ICsKPiArICAgIHJldHVybiByZXQgPT0g
LUVOT0RFViA/IGFjcGlfaXZyc19pbml0KCkgOiByZXQ7Cj4gK30KPiArCgpJIHN1cHBvc2Ugd2Ug
cmVhbGx5IGRvbid0IGhhdmUgYW55IGJldHRlciBvcHRpb24gaGVyZSB0aGFuIHRvIHRyeSBmb3IK
YWxsIEFQQ0kgdGFibGVzIHdlIG1heSBiZSBpbnRlcmVzdGVkIGluLsKgIEkgY2VydGFpbmx5IGNh
bid0IHRoaW5rIG9mIGFueQppZGVudGlmeWluZyBpbmZvcm1hdGlvbiB3ZSBjb3VsZCB1c2VmdWxs
eSBzd2l0Y2goKSBvbiBpbnN0ZWFkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
