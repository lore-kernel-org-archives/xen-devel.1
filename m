From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 09/31] libxl_qmp: Move struct sockaddr_un
 variable to qmp_open()
Date: Wed, 27 Jun 2018 17:54:52 +0100
Message-ID: <20180627165452.GD2052@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-10-anthony.perard@citrix.com>
 <23347.40889.162742.609028@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1vjj=jn=citrix.com=prvs=709756840=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fYDia-0003CJ-2o
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 16:54:56 +0000
Content-Disposition: inline
In-Reply-To: <23347.40889.162742.609028@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDM6MzE6MjFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA5LzMxXSBsaWJ4bF9xbXA6
IE1vdmUgc3RydWN0IHNvY2thZGRyX3VuIHZhcmlhYmxlIHRvIHFtcF9vcGVuKCkiKToKPiAuLi4K
PiA+IEFuZCBhbGxvdyBzdHJuY3B5IHRvIHVzZSBhbGwgdGhlIHNwYWNlIGluIHN1bl9wYXRoLgo+
IAo+IEkgd2Fzbid0IGFibGUgdG8gc2VlIGluIHRoZSBkaWZmIHdoYXQgdGhpcyBlbnRyeSBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UKPiByZWZlcnMgdG8uCgpJIHByb2JhYmx5IGZvcmdvdCB0byByZW1v
dmUgdGhlIC0xIGluIHRoZSBzdHJuY3B5IGNhbGwgb3Igd2FzIHRoaW5raW5nCmFib3V0IGFub3Ro
ZXIgcGF0Y2guCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
