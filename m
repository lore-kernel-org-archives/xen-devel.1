From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 01/15] libxl: Design of an async API to
 issue QMP commands to QEMU
Date: Thu, 11 Oct 2018 12:21:31 +0100
Message-ID: <23487.12859.852574.759749@mariner.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-2-anthony.perard@citrix.com>
 <23486.6236.759607.459674@mariner.uk.xensource.com>
 <20181011111747.GF1331@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l2wo=mx=citrix.com=prvs=8155d3d5a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAZ2D-0007wP-Bn
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 11:21:41 +0000
In-Reply-To: <20181011111747.GF1331@perard.uk.xensource.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAwMS8xNV0gbGlieGw6IERlc2ln
biBvZiBhbiBhc3luYyBBUEkgdG8gaXNzdWUgUU1QIGNvbW1hbmRzIHRvIFFFTVUiKToKPiBNYXli
ZSBJIGNvdWxkIGF2b2lkIHRoZSB3b3JkICJjaGFpbmVkIiBhbmQgcmVwbGFjZSB0aGF0IHBhcmFn
cmFwaCB3aXRoCj4gc29tZXRoaW5nIGxpa2U6Cj4gIkNvbW1hbmRzIGNhbiBiZSBzdWJtaXRlZCBv
bmUgYWZ0ZXIgYW4gb3RoZXIgd2l0aCB0aGUgc2FtZSBjb25uZWN0aW9uLgo+IChlLmcuIHRoZSBy
ZXN1bHQgZnJvbSB0aGUgImFkZC1mZCIgY29tbWFuZCBuZWVkIHRvIGJlIHVzZSBpbiBhIGZvbGxv
dy11cAo+IGNvbW1hbmQgYmVmb3JlIGRpc2Nvbm5lY3RpbmcgZnJvbSBRTVApLiBBIGxpYnhsX19l
dl9xbXAgY2FuIGJlIHJldXNlZAo+IHdoZW4gdGhlIGNhbGxiYWNrIGlzIGJlZW4gY2FsbGVkIGlu
IG9yZGVyIHRvIHVzZSB0aGUgc2FtZSBjb25uZWN0aW9uLiIKCkxHVE0uCgpJYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
