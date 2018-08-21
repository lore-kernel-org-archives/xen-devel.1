From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v4 22/32] libxl_qmp: Handle messages from
 QEMU
Date: Tue, 21 Aug 2018 15:56:38 +0100
Message-ID: <23420.10278.530385.902920@mariner.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-23-anthony.perard@citrix.com>
 <20180802111737.bxzbk6cododv2dmj@mac>
 <20180803172500.GL1327@perard.uk.xensource.com>
 <20180821085857.s7cl7x6vwtzqxcsw@citrix.com>
 <20180821125031.GD1256@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqmj=le=citrix.com=prvs=764db257d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fs85k-0001Nv-AP
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 14:57:08 +0000
In-Reply-To: <20180821125031.GD1256@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCAyMi8zMl0g
bGlieGxfcW1wOiBIYW5kbGUgbWVzc2FnZXMgZnJvbSBRRU1VIik6Cj4gSSd2ZSBhbHJlYWR5IHRy
aWVkIHRvIGhhdmUgcW1wIHNwZWNpZmljIGVycm9yIG51bWJlciwgSSd2ZSBiZWVuIGFza2VkIHRv
Cj4gaW52ZW50IGxpYnhsIGVycm9yIG51bWJlciBpbnN0ZWFkOgo+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wNy9tc2cwMTE1MS5odG1s
CgpJIHN0YW5kIGJ5IHRoYXQgcmVxdWVzdCBhbmQgSSBkaXNhZ3JlZSB3aXRoIFdlaSdzIHN1Z2dl
c3Rpb24gdG8gbWFrZSBhCm5ldyBzZXBhcmF0ZSBraW5kIG9mIGludGVybmFsIGVycm9yIGNvZGUu
ICBXZSBhbHJlYWR5IGhhdmUgdG9vIG1hbnkKZGlmZmVyZW50IGtpbmRzIG9mIGVycm9yIG51bWJl
ci4gIFRoZSBsYXN0IHRoaW5nIHdlIG5lZWQgaXMgdG8gYWRkCmFub3RoZXIuICBJcyB0aGVyZSBz
b21lIGRpZmZpY3VsdHkgd2l0aCBhc3NpZ25pbmcgYSBoYW5kZnVsIG9mCmludGVnZXJzID8gIFdp
bGwgd2UgcnVuIG91dCA/CgpJTU8geW91ciAoQW50aG9ueSdzKSByZXBseSBleHBsYWlucyB3aHkg
dGhpcyBpcyBuZWVkZWQgYW5kIEkgaGF2ZQpub3RoaW5nIGVsc2UgdG8gYWRkIHRvIGl0Li4uCgpU
aGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
