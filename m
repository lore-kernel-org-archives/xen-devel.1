From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Tue, 16 Oct 2018 17:26:14 +0100
Message-ID: <934c92cb-7b8e-d1b3-18e9-721ab6623dc2@citrix.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g0qr=m4=citrix.com=prvs=820502905=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gCSAm-0003y5-Eh
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:26:20 +0000
In-Reply-To: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjcvMjAxOCAwODo1OCBBTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IEN1cnJlbnRs
eSB0aGVyZSBpcyBhIHN1Ym9wIGZvciBzZXR0aW5nIHRoZSBtZW1hY2Nlc3Mgb2YgYSBwYWdlLCBi
dXQgbm90Cj4gZm9yIGNvbnN1bHRpbmcgaXQuICBUaGUgbmV3IEhWTU9QX2FsdHAybV9nZXRfbWVt
X2FjY2VzcyBhZGRzIHRoaXMKPiBmdW5jdGlvbmFsaXR5Lgo+IAo+IEJvdGggYWx0cDJtIGdldC9z
ZXQgbWVtIGFjY2VzcyBmdW5jdGlvbnMgdXNlIHRoZSBzdHJ1Y3QKPiB4ZW5faHZtX2FsdHAybV9t
ZW1fYWNjZXNzIHdoaWNoIGhhcyBub3cgZHJvcHBlZCB0aGUgYHNldCcgcGFydCBhbmQgaGFzCj4g
YmVlbiByZW5hbWVkIGZyb20geGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRlci5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKU29ycnkg
aXQgdG9vayBzbyBsb25nIHRvIGdldCB0byB0aGlzOgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
