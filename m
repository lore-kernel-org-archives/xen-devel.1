From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 15/31] libxl_qmp_ev: Implement fd
 callback and read data
Date: Thu, 28 Jun 2018 12:37:41 +0100
Message-ID: <23348.51333.267414.611949@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-16-anthony.perard@citrix.com>
 <23347.43226.684654.141150@mariner.uk.xensource.com>
 <20180628113314.GH2052@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3gz1=jo=citrix.com=prvs=710363d4d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYVFA-000482-KM
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 11:37:44 +0000
In-Reply-To: <20180628113314.GH2052@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2MyAxNS8zMV0gbGlieGxfcW1wX2V2
OiBJbXBsZW1lbnQgZmQgY2FsbGJhY2sgYW5kIHJlYWQgZGF0YSIpOgo+IE9uIFdlZCwgSnVuIDI3
LCAyMDE4IGF0IDA0OjEwOjE4UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSG93IGJp
ZyBpcyB0aGlzIGRhdGEgPyAgSXMgYWxsIHRoaXMgYnVzaW5lc3Mgd2l0aCBhIGxpbmtlZCBsaXN0
IG9mCj4gPiBidWZmZXJzIHJlYWxseSBuZWNlc3NhcnkgPwo+IAo+IFRoZSBhbHRlcm5hdGl2ZSBp
cyByZWFsbG9jLiBJIGRvbid0IGtub3cgaG93IGJpZyB0aGUgZGF0YSBpcyBnb2luZyB0bwo+IGJl
LiBJIGRvbid0IHdhbnQgdG8gc3BlY3VsYXRlLgoKWWVzLCBidXQgdGhlcmUgaXMgbm90IGFueXRo
aW5nIHZlcnkgd3Jvbmcgd2l0aCByZWFsbG9jLgoKPiBCdXQgcmlnaHQgbm93LCBRTVBfUkVDRUlW
RV9CVUZGRVJfU0laRSBpcyBzZXQgdG8gNGssIEkgZG9uJ3QgdGhpbmsgd2UKPiB3b3VsZCBuZWVk
IG1vcmUgdGhhbiB0aGF0LCBidXQgSSB0aGluayB0aGUgY29kZSBuZWVkIHRvIGJlIHByZXBhcmVk
IHRvCj4gcmVjZWl2ZSBtb3JlLgoKQWxsIG9mIHRoaXMgYnVmZmVyIHF1ZXVlIGNvbXBsaWNhdGlv
biBpcyBhIHBlcmZvcm1hbmNlIG9wdGltaXNhdGlvbiB0bwphdm9pZCBoeXBvdGhldGljYWwgcmVh
bGxvY3MsIHRoZW4gOi0pID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
