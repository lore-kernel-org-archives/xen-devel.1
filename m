From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 11 Jan 2019 08:52:25 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901110851560.27759@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
 <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
 <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
 <be644db0-de3b-a895-33ff-ab09116460c6@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gi02m-0000ql-DQ
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 16:52:28 +0000
In-Reply-To: <be644db0-de3b-a895-33ff-ab09116460c6@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, julien.grall@gmail.com, Julien Grall <julien.grall@arm.com>, JBeulich@suse.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBKYW4gMjAxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS8wMS8yMDE5
IDAzOjE0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBIaSBKdWVyZ2VuLCBKYW4sCj4g
PiAKPiA+IEkgc3Bva2Ugd2l0aCBKdWxpZW46IHdlIGFyZSBib3RoIGNvbnZpbmNlZCB0aGF0IHRo
ZSB1bnNpZ25lZCBsb25nCj4gPiBzb2x1dGlvbiBpcyBiZXN0LiBCdXQgSnVsaWVuIGFsc28gZGlk
IHNvbWUgcmVzZWFyY2ggYW5kIGhlIHRoaW5rcyB0aGF0Cj4gPiBKYW4ncyB2ZXJzaW9uIChyZXR1
cm5pbmcgcG9pbnRlciB0eXBlKSBub3Qgb25seSBkb2VzIG5vdCBoZWxwIHdpdGgKPiA+IE1JU1JB
LUMsIGJ1dCBhbHNvIGRvZXNuJ3Qgc29sdmUgdGhlIHBvdGVudGlhbCBHQ0MgcHJvYmxlbSBlaXRo
ZXIuIEEKPiA+IGRlc2NyaXB0aW9uIG9mIHRoZSBHQ0MgaXNzdWUgaXMgYXZhaWxhYmxlIGhlcmU6
Cj4gPiAKPiA+IGh0dHBzOi8va3Jpc3RlcncuYmxvZ3Nwb3QuY29tLzIwMTYvMTIvcG9pbnRlci1j
b21wYXJpc29uLWludmFsaWQtb3B0aW1pemF0aW9uLmh0bWw/bT0xCj4gPiAKPiA+IChBbHNvIGtl
ZXAgaW4gbWluZCB0aGF0IExpbnV4IHVzZXMgdGhlIHVuc2lnbmVkIGxvbmcgc29sdXRpb24gdG8g
c29sdmUKPiA+IHRoZSBHQ0MgaXNzdWUsIGRldmlhdGluZyBmcm9tIGl0IGRvZXNuJ3Qgc2VlbSB3
aXNlLikKPiA+IAo+ID4gSSB3b3VsZCBsaWtlIHRvIGFzayBmb3IgYSBmcmVlemUgZXhjZXB0aW9u
IHVudGlsIE1vbmRheS9UdWVzZGF5IG5leHQKPiA+IHdlZWsgd2hlbiBKdWxpZW4gd2lsbCBiZSBi
YWNrLCBhbmQgaGUgYW5kIGhpcyB0ZWFtIHdpbGwgYmUgYWJsZSB0bwo+ID4gcHJvdmlkZSBtb3Jl
IGV2aWRlbmNlIHRoYXQgdGhlIHVuc2lnbmVkIGxvbmcgc29sdXRpb24gaXMgY29ycmVjdCwgd2hp
bGUKPiA+IHRoZSBvdGhlciBzb2x1dGlvbiBpcyBub3QgY29ycmVjdC4KPiAKPiBJJ20gZmluZSB3
aXRoIHRoZSBmcmVlemUgZXhjZXB0aW9uIGluIHRoaXMgY2FzZS4KPiAKPiBSZWFzb25pbmc6Cj4g
Cj4gVGhlIGZ1bmN0aW9uYWwgY29ycmVjdG5lc3Mgb2YgdGhlIHBhdGNoZXMgaXMgcmF0aGVyIGVh
c3kgdG8gdmVyaWZ5LiBUaGUKPiBtYWluIHJpc2tzIGFyZToKPiAKPiAtIHN5bnRhY3RpY2FsL3Nl
bWFudGljYWwgY29ycmVjdG5lc3MgLSBoYW5kbGVkIGJ5IHRoZSBjb21waWxlcgo+IC0gTUlTUkEt
QyBjb3JyZWN0bmVzcyAtIHNob3VsZG4ndCBiZSB3b3JzZSB0aGFuIHdpdGhvdXQgdGhlIHBhdGNo
ZXMKPiAKPiBTbyB0aGUgcmlzayBmb3IgdGhlIHJlbGVhc2Ugc2VlbXMgdG8gYmUgcmF0aGVyIGxv
dy4KClllcywgaXQgaXMgZXhhY3RseSBhcyB5b3Ugc2F5LgoKVGhhbmsgeW91IQoKLSBTdGVmYW5v
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
