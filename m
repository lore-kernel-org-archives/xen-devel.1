From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 1/7] dom0/pvh: align allocation
 and mapping order to start address
Date: Wed, 13 Feb 2019 08:32:00 -0700
Message-ID: <5C64387002000078002165E7@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtwW3-0007tv-J4
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 15:32:03 +0000
In-Reply-To: <20190211174642.38046-2-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBwMm0gYW5kIGlvbW11IG1hcHBpbmcgY29kZSBhbHdheXMgaGFkIHRoZSByZXF1aXJlbWVu
dCB0aGF0Cj4gYWRkcmVzc2VzIGFuZCBvcmRlcnMgbXVzdCBiZSBhbGlnbmVkIHdoZW4gcG9wdWxh
dGluZyB0aGUgcDJtIG9yIHRoZQo+IGlvbW11IHBhZ2UgdGFibGVzLgo+IAo+IFBWSCBkb20wIGJ1
aWxkZXIgZGlkbid0IHRha2UgdGhpcyByZXF1aXJlbWVudCBpbnRvIGFjY291bnQsIGFuZCBjYW4K
PiBjYWxsIGludG8gdGhlIHAybS9pb21tdSBtYXBwaW5nIGhlbHBlcnMgd2l0aCBhZGRyZXNzZXMg
YW5kIG9yZGVycyB0aGF0Cj4gYXJlIG5vdCBhbGlnbmVkLgo+IAo+IEZpeCB0aGlzIGJ5IG1ha2lu
ZyBzdXJlIHRoZSBvcmRlcnMgcGFzc2VkIHRvIHRoZSBwaHlzbWFwIHBvcHVsYXRpb24KPiBoZWxw
ZXJzIGFyZSBhbHdheXMgYWxpZ25lZCB0byB0aGUgZ3Vlc3QgYWRkcmVzcyB0byBiZSBwb3B1bGF0
ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
