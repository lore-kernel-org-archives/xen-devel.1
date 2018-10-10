From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 01/15] libxl: Design of an async API to
 issue QMP commands to QEMU
Date: Wed, 10 Oct 2018 16:18:52 +0100
Message-ID: <23486.6236.759607.459674@mariner.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-2-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ysci=mw=citrix.com=prvs=814707a66=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAGGG-0003Zr-O3
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 15:18:56 +0000
In-Reply-To: <20180907151104.32306-2-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY1IDAxLzE1XSBsaWJ4bDogRGVzaWduIG9m
IGFuIGFzeW5jIEFQSSB0byBpc3N1ZSBRTVAgY29tbWFuZHMgdG8gUUVNVSIpOgo+IEFsbCB0aGUg
ZnVuY3Rpb25zIHdpbGwgYmUgaW1wbGVtZW50ZWQgaW4gbGF0ZXIgcGF0Y2hlcy4KClRoaXMgcGF0
Y2ggbG9va3MgZ29vZCB0byBtZS4gIEFsdGhvdWdoIGl0J3MgYSBiaXQgb2RkIHRvIG1peCBzb21l
CnR5cGVkZWYgbmFtZSBzaHVmZmxpbmcgaW4gdGhlIHNhbWUgcGF0Y2gsIEkgdGhpbmsgaXQncyBP
SyBoZXJlIGdpdmVuCnRoYXQgdGhlIHJlc3QgaXMgQVBJIGNvbW1lbnRhcnkuCgo+ICsvKgo+ICsg
KiBRTVAgYXN5bmNocm9ub3VzIGNhbGxzCj4gKyAqCj4gKyAqIFRoaXMgZmFjaWxpdHkgYWxsb3dz
IGEgY29tbWFuZCB0byBiZSBzZW50IHRvIFFFTVUsIGFuZCB0aGUgcmVzcG9uc2UgdG8gYmUKPiAr
ICogaGFuZGVkIHRvIGEgY2FsbGJhY2sgZnVuY3Rpb24uCj4gKyAqCj4gKyAqIENvbW1hbmRzIGNh
biBiZSBjaGFpbmVkLCB3aXRoIGEgc2FtZSBjb25uZWN0aW9uLiAoZS5nLiAiYWRkLWZkIiB3aWxs
IG5lZWQgdG8KPiArICogYmUgY2hhaW5lZCB0byB0aGUgbmV4dCBjb21tYW5kKS4gQSBsaWJ4bF9f
ZXZfcW1wIGNhbiBiZSByZXVzZWQgd2hlbiB0aGUKPiArICogY2FsbGJhY2sgaXMgYmVlbiBjYWxs
ZWQgaW4gb3JkZXIgdG8gdXNlIHRoZSBzYW1lIGNvbm5lY3Rpb24uCgpJIHRoaW5rIHRoZSB3b3Jk
IGBjaGFpbmVkJyBoZXJlIGNvdWxkIGRvIHdpdGggZGVmaW5pdGlvbi4gIEkgdGhpbmsgeW91Cmp1
c3QgbWVhbiB0aGF0IHRoZXkgYXJlIG9uIHRoZSBzYW1lIGNvbm5lY3Rpb24gd2hpY2ggcmVtYWlu
cwpBY3RpdmUvQ29ubmVjdGVkIHRocm91Z2hvdXQgPwoKQWxzbywgY2FuIHlvdSBwbGVhc2Ugd3Jh
cCB0aGUgY29tbWVudGFyeSBsaW5lcyB0byA3MCBvciA3NSBjb2x1bW5zID8KWW91ciBjdXJyZW50
IDc5LWNoYXJhY3RlciBsaW5lcyBnZXQgd3JhcCBkYW1hZ2Ugd2hlbiBkaXNwbGF5ZWQgaW4gODAK
Y29sdW1ucyB3aXRoIHRoZSBhZGRlZCBgKycgYW5kIGFyZSB3b3JzZSB3aGVuIGA+ICcgaXMgYWRk
ZWQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
