From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] mm: make opt_bootscrub non-init
Date: Mon, 26 Nov 2018 06:01:36 -0700
Message-ID: <5BFBEEB002000078001FFF8B@prv1-mh.provo.novell.com>
References: <20181123143002.79743-1-roger.pau@citrix.com>
 <5BFBC59802000078001FFD36@prv1-mh.provo.novell.com>
 <20181126120439.lsmf5u37evvkqwgm@mac>
 <5BFBE48C02000078001FFF19@prv1-mh.provo.novell.com>
 <20181126124940.vjh7tm5ledpplkhq@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRGWF-00043i-Hr
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 13:01:43 +0000
In-Reply-To: <20181126124940.vjh7tm5ledpplkhq@mac>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDEzOjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTm92IDI2LCAyMDE4IGF0IDA1OjE4OjIwQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBGdXJ0aGVybW9yZSBJIGRvdWJ0IHdyaXRpbmcgdGhpcyBkb3duIHdvdWxkIGhlbHAs
IGJlY2F1c2UgZm9yCj4+IHN1Y2ggYXBwYXJlbnRseSBzaW1wbGUgdGhpbmdzIG5vLW9uZSBnb2Vz
IGh1bnQgZm9yIHJlbGF0ZWQKPj4gZG9jdW1lbnRhdGlvbi4gSSB0aGluayB0aGUgb25seSBmdXR1
cmUgcHJvb2YgY291cnNlIG9mIGFjdGlvbgo+PiB3b3VsZCBiZSB0byBwb3J0IExpbnV4J2VzIHNl
Y3Rpb24gbWlzbWF0Y2ggaGFuZGxpbmcgYW5kIHN0b3AKPj4gYWxsb3dpbmcgcHJvYmxlbWF0aWMg
Y3Jvc3MgcmVmZXJlbmNlcy4gVGhhdCBhcHByb2FjaCBoYXMKPj4gZG93bnNpZGVzIHRob3VnaCwg
d2hpY2ggaXMgd2h5IEknbSBub3QgZ29pbmcgdG8gYWR2b2NhdGUgaXQuCj4gCj4gSXMgU3BhcnNl
IHRoZSBvbmx5IG9wdGlvbiBpbiB0aGlzIHJlZ2FyZD8KCkknbSBzcGVjaWZpY2FsbHkgbm90IHRh
bGtpbmcgYWJvdXQgc3BhcnNlLCBidXQgYWJvdXQgTGludXgnZXMKbG9naWMgaW4gc2NyaXB0cy9t
b2QvbW9kcG9zdC5jLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
