From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v3 3/8] amd/npt/shadow: replace
 assert that prevents creating 2M/1G MMIO entries
Date: Fri, 15 Feb 2019 16:31:07 +0100
Message-ID: <f4906a44-dc71-7169-d50f-122990b73565@suse.com>
References: <20190215141837.1420-1-roger.pau@citrix.com>
 <20190215141837.1420-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gufSJ-0000rR-0K
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 15:31:11 +0000
In-Reply-To: <20190215141837.1420-4-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxNToxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBhc3NlcnQg
d2FzIG9yaWdpbmFsbHkgYWRkZWQgdG8gbWFrZSBzdXJlIHRoYXQgaGlnaGVyIG9yZGVyCj4gcmVn
aW9ucyAoPiBQQUdFX09SREVSXzRLKSBjb3VsZCBub3QgYmUgdXNlZCB0byBieXBhc3MgdGhlCj4g
bW1pb19yb19yYW5nZXMgY2hlY2sgcGVyZm9ybWVkIGJ5IHAybV90eXBlX3RvX2ZsYWdzLgo+IAo+
IFRoaXMgaG93ZXZlciBpcyBhbHJlYWR5IGNoZWNrZWQgaW4gc2V0X21taW9fcDJtX2VudHJ5LCB3
aGljaCBtYWtlcwo+IHN1cmUgdGhhdCBoaWdoZXIgb3JkZXIgbWFwcGluZ3MgZG9uJ3Qgb3Zlcmxh
cCB3aXRoIG1taW9fcm9fcmFuZ2VzLAo+IHRodXMgYWxsb3dpbmcgdGhlIGNyZWF0aW9uIG9mIGhp
Z2ggb3JkZXIgTU1JTyBtYXBwaW5ncyBzYWZlbHkuCj4gCj4gUmVwbGFjZSB0aGUgYXNzZXJ0IHRv
IGFsbG93IDJNLzFHIGVudHJpZXMgdG8gYmUgY3JlYXRlZCBmb3IgTU1JTwo+IHJlZ2lvbnMgYW5k
IGFkZCBzb21lIGV4dHJhIGFzc2VydHMgYXMgYSByZXBsYWNlbWVudCB0byBtYWtlIHN1cmUKPiB0
aGVyZSdzIG5vIG92ZXJsYXBwaW5nIHdpdGggTU1JTyByZWFkLW9ubHkgcmFuZ2VzLgo+IAo+IE5v
dGUgdGhhdCAxRyBNTUlPIGVudHJpZXMgd2lsbCBub3QgYmUgY3JlYXRlZCB1bmxlc3MgbW1pb19v
cmRlciBpcwo+IGNoYW5nZWQgdG8gYWxsb3cgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
