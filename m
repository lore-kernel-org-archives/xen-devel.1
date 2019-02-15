From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v3 3/8] amd/npt/shadow: replace
 assert that prevents creating 2M/1G MMIO entries
Date: Fri, 15 Feb 2019 07:29:18 -0700
Message-ID: <5C66CCBE0200007800217100@prv1-mh.provo.novell.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gueUW-0002pY-IK
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 14:29:24 +0000
In-Reply-To: <20190215141837.1420-4-roger.pau@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE5IGF0IDE1OjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBhc3NlcnQgd2FzIG9yaWdpbmFsbHkgYWRkZWQgdG8gbWFrZSBzdXJlIHRoYXQgaGlnaGVy
IG9yZGVyCj4gcmVnaW9ucyAoPiBQQUdFX09SREVSXzRLKSBjb3VsZCBub3QgYmUgdXNlZCB0byBi
eXBhc3MgdGhlCj4gbW1pb19yb19yYW5nZXMgY2hlY2sgcGVyZm9ybWVkIGJ5IHAybV90eXBlX3Rv
X2ZsYWdzLgo+IAo+IFRoaXMgaG93ZXZlciBpcyBhbHJlYWR5IGNoZWNrZWQgaW4gc2V0X21taW9f
cDJtX2VudHJ5LCB3aGljaCBtYWtlcwo+IHN1cmUgdGhhdCBoaWdoZXIgb3JkZXIgbWFwcGluZ3Mg
ZG9uJ3Qgb3ZlcmxhcCB3aXRoIG1taW9fcm9fcmFuZ2VzLAo+IHRodXMgYWxsb3dpbmcgdGhlIGNy
ZWF0aW9uIG9mIGhpZ2ggb3JkZXIgTU1JTyBtYXBwaW5ncyBzYWZlbHkuCj4gCj4gUmVwbGFjZSB0
aGUgYXNzZXJ0IHRvIGFsbG93IDJNLzFHIGVudHJpZXMgdG8gYmUgY3JlYXRlZCBmb3IgTU1JTwo+
IHJlZ2lvbnMgYW5kIGFkZCBzb21lIGV4dHJhIGFzc2VydHMgYXMgYSByZXBsYWNlbWVudCB0byBt
YWtlIHN1cmUKPiB0aGVyZSdzIG5vIG92ZXJsYXBwaW5nIHdpdGggTU1JTyByZWFkLW9ubHkgcmFu
Z2VzLgo+IAo+IE5vdGUgdGhhdCAxRyBNTUlPIGVudHJpZXMgd2lsbCBub3QgYmUgY3JlYXRlZCB1
bmxlc3MgbW1pb19vcmRlciBpcwo+IGNoYW5nZWQgdG8gYWxsb3cgaXQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
