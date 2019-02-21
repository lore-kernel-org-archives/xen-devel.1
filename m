From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next v2] xen: make grant table
 configurable
Date: Thu, 21 Feb 2019 12:02:13 +0000
Message-ID: <bc7f880f-7e4b-5608-a01d-bbec7144a157@arm.com>
References: <20190118124357.19255-1-wei.liu2@citrix.com>
 <20190221120108.m5dage7ahccwjmvy@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/sLC=Q4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gwn3T-0005iH-AW
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 12:02:19 +0000
In-Reply-To: <20190221120108.m5dage7ahccwjmvy@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS8wMi8yMDE5IDEyOjAxLCBXZWkgTGl1IHdyb3RlOgo+IE9uIEZyaSwgSmFuIDE4LCAy
MDE5IGF0IDEyOjQzOjU3UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4+IEludHJvZHVjZSBDT05G
SUdfR1JBTlRfVEFCTEUuIFByb3ZpZGUgc3R1YnMgYW5kIG1ha2Ugc3VyZSB4ODYgYW5kIGFybQo+
PiBoeXBlcnZpc29ycyBidWlsZCB3aXRoIGdyYW50IHRhYmxlIGRpc2FibGVkLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IEkga25vdyB0aGlz
IHBhdGNoIGNhbiBvbmx5IGJlIGFwcGxpZWQgYWZ0ZXIgdGhlIHRyZWUgaXMgcmVvcGVuIGJ1dCAu
Li4KPiAKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPj4gaW5kZXggMjIxYzc2MmFkYS4uMGYxYzFiNjQzMSAxMDA2NDQKPj4gLS0t
IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPj4g
QEAgLTEzOTIsNyArMTM5Miw5IEBAIHN0YXRpYyBhcm1faHlwZXJjYWxsX3QgYXJtX2h5cGVyY2Fs
bF90YWJsZVtdID0gewo+PiAgICAgICBIWVBFUkNBTExfREVQUkVDQVRFRChwaHlzZGV2X29wX2Nv
bXBhdCwgMSksCj4+ICAgICAgIEhZUEVSQ0FMTChzeXNjdGwsIDIpLAo+PiAgICAgICBIWVBFUkNB
TEwoaHZtX29wLCAyKSwKPj4gKyNpZmRlZiBDT05GSUdfR1JBTlRfVEFCTEUKPj4gICAgICAgSFlQ
RVJDQUxMKGdyYW50X3RhYmxlX29wLCAzKSwKPj4gKyNlbmRpZgo+PiAgICAgICBIWVBFUkNBTEwo
bXVsdGljYWxsLCAyKSwKPj4gICAgICAgSFlQRVJDQUxMKHBsYXRmb3JtX29wLCAxKSwKPj4gICAg
ICAgSFlQRVJDQUxMX0FSTSh2Y3B1X29wLCAzKSwKPiAKPiBjYW4gSSBnZXQgYW4gYWNrIGZyb20g
b25lIG9mIHRoZSBBcm0gbWFpbnRhaW5lcnMgc28gdGhhdCBJIGNhbiBxdWV1ZSBpdAo+IHVwPwoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
