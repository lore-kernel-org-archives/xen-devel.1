From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/8] hvm/mtrr: use the hardware number of
 variable ranges for Dom0
Date: Tue, 29 May 2018 06:41:47 -0600
Message-ID: <5B0D4A8B02000078001C69CB@prv1-mh.provo.novell.com>
References: <20180522154040.20581-1-roger.pau@citrix.com>
 <20180522154040.20581-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyld=iq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fNdwm-00017l-7G
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 12:41:52 +0000
In-Reply-To: <20180522154040.20581-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDE3OjQwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC00NDgsNiArNDYwLDkgQEAgYm9vbF90IG10cnJfdmFyX3JhbmdlX21zcl9zZXQoCj4gICAg
ICB1aW50NjRfdCAqdmFyX3JhbmdlX2Jhc2UgPSAodWludDY0X3QqKW0tPnZhcl9yYW5nZXM7Cj4g
IAo+ICAgICAgaW5kZXggPSBtc3IgLSBNU1JfSUEzMl9NVFJSX1BIWVNCQVNFKDApOwo+ICsgICAg
aWYgKCAoaW5kZXggLyAyKSA+PSBNQVNLX0VYVFIobS0+bXRycl9jYXAsIE1UUlJjYXBfVkNOVCkg
KQo+ICsgICAgICAgIHJldHVybiAwOwoKSSB0aGluayB0aGlzIHdvdWxkIGJldHRlciBnbyBpbnRv
IGh2bV9tc3Jfd3JpdGVfaW50ZXJjZXB0KCksIHBhcmFsbGVsaW5nCnRoZSBodm1fbXNyX3JlYWRf
aW50ZXJjZXB0KCkgYWRqdXN0bWVudCB5b3UgbWFrZS4gVGhlcmUgbWlnaHQgYmUgYW4KQVNTRVJU
KCkgd2FycmFudGVkIGhlcmUgKHRoZSBvdGhlciBjYWxsZXIgaXMgaHZtX2xvYWRfbXRycl9tc3Io
KSwKd2hpY2ggYnkgbm93IGhhcyBzdWl0YWJsZSBjaGVja2luZyBpbiBwbGFjZSBhZmFpY3QpLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
