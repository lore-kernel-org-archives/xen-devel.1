From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: Re: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 15:20:59 +0300
Message-ID: <CAOcoXZYrgKthNokf61ZWNQDeav_LpTQjz-XA-uzXSDowPQL8=w@mail.gmail.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
 <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
 <20190516113958.GA2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BGuO=TQ=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRFNn-0008Pd-PM
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:21:11 +0000
Received: by mail-it1-x142.google.com with SMTP id e184so5865855ite.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 05:21:10 -0700 (PDT)
In-Reply-To: <20190516113958.GA2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Julien Grall <Julien.Grall@arm.com>, nd <nd@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKVGhhbmsgeW91IGZvciByZXBsaWVzLiBXaWxsIGRvIGFsbCB0aGUgbWVudGlvbmVk
IHVwZGF0ZXMgYW5kIHdpbGwgc2VuZApwYXRjaCB2MiBhZnRlciByZXRlc3RpbmcgaXQgb24gdGFy
Z2V0IGJvYXJkICh3aXRoIGxpYmVsZiBNYWtlZmlsZQp1cGRhdGUpLgoKVGhhbmtzCgpPbiBUaHUs
IE1heSAxNiwgMjAxOSBhdCAyOjQwIFBNIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+Cj4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6Mzc6MzNBTSArMDAwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAxNi8wNS8yMDE5IDEyOjI2LCBXZWkgTGl1IHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAwMjoxMzo1NFBNICswMzAwLCBWaWt0
b3IgTWl0aW4gd3JvdGU6Cj4gPiA+PiBUaGUgcGF0Y2ggcmVzb2x2ZXMgJ3hlbmNvdicgY3Jhc2hl
cyBpbiBjYXNlIG9mIEFhcmNoNjQuCj4gPiA+Pgo+ID4gPj4gQWxsIHRoZSAuaW5pdC4qIHNlY3Rp
b25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LAo+ID4gPj4gaXQgbWVhbnMgdGhhdCBhbnl0aGlu
ZyBpbiAuaW5pdC5kYXRhIGNhbm5vdCBiZSBhY2Nlc3NlZCBhbnltb3JlLgo+ID4gPj4gVGhlIGJ1
aWxkIHN5c3RlbSBleHBsaWNpdGx5IGNvbXBpbGVzIGFueSAuaW5pdCBiaW5hcnkgd2l0aG91dCBn
Y292IG9wdGlvbi4KPiA+ID4+IFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4KPiA+
ID4+IFRoZSBlbnRpcmUgbGlicmFyeSBpcyBtb3ZlZCB0byAuaW5pdCB1c2luZzoKPiA+ID4+ICQo
T0JKQ09QWSkgJChmb3JlYWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0u
aW5pdC4kKHMpKSAkPCAkQAo+ID4gPj4gU28gd2UgbmVlZCB0byB0ZWxsIHRoZSB0b3AgTWFrZWZp
bGUgdG8gZmlsdGVyIG91dCBsaWJmZHQuCj4gPiA+Pgo+ID4gPj4gUmVwb3J0ZWQtYnk6IFZpa3Rv
ciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiA+PiBUZXN0ZWQtYnk6IFZp
a3RvciBNaXRpbiA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KPiA+ID4KPiA+ID4gUmV2aWV3
ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiA+Cj4gPiA+IEFsdGhvdWdo
IEkgd291bGQgbGlrZSB0byBhc2sgeW91IHRvIGFkanVzdCB0aGUgc3ViamVjdCB0byBiZSBtb3Jl
Cj4gPiA+IHNwZWNpZmljOgo+ID4gPgo+ID4gPiAgICBjb3ZlcmFnZTogZmlsdGVyIG91dCBsaWJm
ZHQubwo+ID4gPgo+ID4gPiBpZiB5b3UgYWdyZWUsIHRoaXMgY2FuIGJlIGRvbmUgd2hpbGUgY29t
bWl0dGluZy4KPiA+Cj4gPiBUaGVyZSBhcmUgbW9yZSB0aGFuIHRoYXQgdGhlIHRpdGxlIHRvIGZp
eCBvbiBjb21taXQuIFRoZSBTaWduZWQtb2ZmLWJ5Cj4gPiBhbmQgZG9lcyBub3QgbWF0Y2ggdGhl
IEZyb20gZm9yIGluc3RhbmNlLgo+ID4KPiA+IEkgaW5pdGlhbGx5IHN1Z2dlc3RlZCB0aGUgY2hh
bmdlLCBzbyBTdWdnZXN0ZWQtYnkgd291bGQgYmUgbW9yZQo+ID4gc3VpdGFibGUuIEFuZCB0aGVu
IFZpa3RvciBuZWVkcyB0byBhZGQgaGlzIHNpZ25lZC1vZmYtYnkuCj4gPgo+ID4gQWxzbywgY291
bGQgd2UgYWxzbyBmaXggbGliZWxmIGF0IHRoZSBzYW1lIHRpbWU/Cj4KPiArMS4gVmlrdG9yPwo+
Cj4gV2VpLgo+Cj4gPgo+ID4gQ2hlZXJzLAo+ID4KPiA+IC0tCj4gPiBKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
