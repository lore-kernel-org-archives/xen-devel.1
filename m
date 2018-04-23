From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC v2 8/9] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Mon, 23 Apr 2018 17:56:14 +0100
Message-ID: <23262.4142.975460.333571@mariner.uk.xensource.com>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
 <20180416173227.22671-9-anthony.perard@citrix.com>
 <23258.13149.123196.867924@mariner.uk.xensource.com>
 <20180423165453.GH1980@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n26l=hm=citrix.com=prvs=644ea31d5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAelH-00021A-II
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 16:56:19 +0000
In-Reply-To: <20180423165453.GH1980@perard>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtSRkMgdjIgOC85XSBIQUNLIGxpYnhsX2V4ZWM6
IENoZWNrIFFFTVUgc3RhdHVzIHZpYSBRTVAgaW5zdGVhZCBvZiB4ZW5zdG9yZSIpOgo+IEJ1dCwg
d2l0aCB0aGUgdG8gYmUgcmVsZWFzZSBRRU1VIDIuMTIsIHRoZXJlIGlzIGEgbmV3IGludGVyZmFj
ZSB0aGF0Cj4gYWxsb3cgdG8gcHJlLW9wZW4gYSBzb2NrZXQ6Cj4gICAtY2hhcmRldiBzb2NrZXQs
ZmQ9Pwo+IFNlZSBodHRwczovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWNvbW1pdDtoPTA5
MzU3MDBmODU0NDAzM2ViYmQ0MWUxZjEzY2Q1MjhmOGE1OGQyNGQKPiAKPiBXaXRoIHRoYXQsIHdl
IGNvdWxkIG9wZW4gb3VyIHVzdWFsICIvdmFyL3J1bi94ZW4vcW1wLWxpYnhsLSRkb21pZCIKPiBz
b2NrZXQgZm9yIFFFTVUuIFRoYXQgd291bGQgd29yayB3aGVuIHRoZSByZXRyaWN0ZWQgZm9uY3Rp
b25uYWxpdHkgaXMKPiBhbHNvIGF2YWlsYWJsZS4gQnV0IHRoYXQgY2Fubid0IGJlIHVzZSB1bmNv
bmRpdGlvbm5hbHkuCgpSaWdodC4KCkl0J3MgYSBiaXQgdWdseSBoYXZpbmcgdHdvIG1ldGhvZHMg
YnV0IHRoYXQncyB0aGUgcHJpY2Ugb2YKY29tcGF0aWJpbGl0eS4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
