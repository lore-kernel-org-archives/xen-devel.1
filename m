From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 07/31] libxl_qmp: Learned to send FD
 through QMP to QEMU
Date: Thu, 28 Jun 2018 10:56:04 +0100
Message-ID: <23348.45236.407788.211828@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-8-anthony.perard@citrix.com>
 <23347.40619.710495.118665@mariner.uk.xensource.com>
 <20180627165014.GC2052@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3gz1=jo=citrix.com=prvs=710363d4d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYTeq-0003hh-A9
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 09:56:08 +0000
In-Reply-To: <20180627165014.GC2052@perard.uk.xensource.com>
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2MyAwNy8zMV0gbGlieGxfcW1wOiBM
ZWFybmVkIHRvIHNlbmQgRkQgdGhyb3VnaCBRTVAgdG8gUUVNVSIpOgo+IFllcywgYW55d2hlcmUg
YmVmb3JlIHRoZSBsYXN0IGJ5dGUgb2YgdGhlIGNvbW1hbmQgdGhhdCBpcyBnb2luZyB0byB1c2UK
PiB0aGUgZmQuIFFFTVUgaXMgZ29pbmcgdG8gc3RvcmUgYW55IGZkIHJlY2VpdmVkIHVudGlsIGEg
Y29tbWFuZCBpcyB1c2luZwo+IGl0LgoKR3JlYXQuICBDYW4geW91IG1heWJlIGFkZCBhIGNvbW1l
bnQgYWJvdXQgdGhhdCA/Cgo+IFdlIHNob3VsZCBiZSBhYmxlIHRvIHRoZSB0aGUgZmQsIHRoZW4g
c2VudCBzZXZlcmFsIHFtcCBjb21tYW5kLCB0aGVuIHRoZQo+IGFkZC1mZCBjb21tYW5kLCBhbmQg
SSB0aGluayB0aGF0IHdpbGwgd29yayBmaW5lLgoKTGV0J3Mgbm90LCB0aG91Z2ggOi0pLgoKPiBJ
IGRvbid0IHRoaW5rIFFFTVUgZGlzY2FyZHMgZmRzIHVudGlsIGEgY29tbWFuZCBpcyB1c2luZyBp
dCwgb3IgbWF5YmUKPiB1bnRpbCBhIG5ldyBmZCBjb21lcyBpbiAoSSBkaWQgbm90IGNoZWNrIHRo
aXMgc2Vjb25kIHRob3VnaHQpLgoKSWYgeW91IGNhbGwgcmVhZCgpIChvciByZWN2bXNnKCkgd2l0
aG91dCBzdWl0YWJsZSBhbmNpbGxhcnkgZGF0YQpwYXJhbWV0ZXJzKSwgdGhlIGtlcm5lbCB3aWxs
IGRpc2NhcmQgYW55IGZkcyB0aGF0IG1pZ2h0IGhhdmUKYWNjb21wYW5pZWQgdGhlIGRhdGEgeW91
IHJlYWQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
