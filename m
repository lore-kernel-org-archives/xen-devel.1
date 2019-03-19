From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH V2 02/10] block: avoid to break XEN by
 multi-page bvec
Date: Tue, 19 Mar 2019 10:18:41 +0100
Message-ID: <f3270085-6e46-ce37-b0fd-585a7d9c372a@suse.com>
References: <20190317100112.8106-1-ming.lei@redhat.com>
 <20190317100112.8106-3-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h6AtS-000538-4j
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 09:18:46 +0000
In-Reply-To: <20190317100112.8106-3-ming.lei@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Omar Sandoval <osandov@fb.com>, Christoph Hellwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDMvMjAxOSAxMTowMSwgTWluZyBMZWkgd3JvdGU6Cj4gWEVOIGhhcyBzcGVjaWFsIHBh
Z2UgbWVyZ2UgcmVxdWlyZW1lbnQsIHNlZSB4ZW5fYmlvdmVjX3BoeXNfbWVyZ2VhYmxlKCkuCj4g
V2UgY2FuJ3QgbWVyZ2UgcGFnZXMgaW50byBvbmUgYnZlYyBzaW1wbHkgZm9yIFhFTi4KPiAKPiBT
byBtb3ZlIFhFTidzIHNwZWNpZmljIGNoZWNrIG9uIHBhZ2UgbWVyZ2UgaW50byBfX2Jpb190cnlf
bWVyZ2VfcGFnZSgpLAo+IHRoZW4gYWJ2b2lkIHRvIGJyZWFrIFhFTiBieSBtdWx0aS1wYWdlIGJ2
ZWMuCj4gCj4gQ2M6IHJpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+
IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBPbWFyIFNhbmRvdmFsIDxvc2FuZG92QGZiLmNvbT4KPiBD
YzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gU2lnbmVkLW9mZi1ieTogTWluZyBM
ZWkgPG1pbmcubGVpQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
