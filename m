From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 3 Oct 2018 14:14:05 +0100
Message-ID: <20181003131405.w6bwl76xqmqawj4y@zion.uk.xensource.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7gyg-0006DD-Ae
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:14:10 +0000
Content-Disposition: inline
In-Reply-To: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Adrian Pop <apop@bitdefender.com>, tim@xen.org, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTA6NTg6NTRBTSArMDMwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IEN1cnJlbnRseSB0aGVyZSBpcyBhIHN1Ym9wIGZvciBzZXR0aW5nIHRoZSBtZW1h
Y2Nlc3Mgb2YgYSBwYWdlLCBidXQgbm90Cj4gZm9yIGNvbnN1bHRpbmcgaXQuICBUaGUgbmV3IEhW
TU9QX2FsdHAybV9nZXRfbWVtX2FjY2VzcyBhZGRzIHRoaXMKPiBmdW5jdGlvbmFsaXR5Lgo+IAo+
IEJvdGggYWx0cDJtIGdldC9zZXQgbWVtIGFjY2VzcyBmdW5jdGlvbnMgdXNlIHRoZSBzdHJ1Y3QK
PiB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzIHdoaWNoIGhhcyBub3cgZHJvcHBlZCB0aGUgYHNl
dCcgcGFydCBhbmQgaGFzCj4gYmVlbiByZW5hbWVkIGZyb20geGVuX2h2bV9hbHRwMm1fc2V0X21l
bV9hY2Nlc3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8YXBvcEBiaXRkZWZlbmRl
ci5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPgo+IAo+IC0tLQo+IENoYW5nZXMgc2luY2UgVjU6Cj4gIC0gRml4ZWQgdGhlIGJ1
aWxkIGJ5IGNvbmRpdGlvbmFsbHktY29tcGlsaW5nIHRoZSBhbHRwMm0gY29kZQo+ICAgIGdhdGVk
IG9uIENPTkZJR19IVk0gYmVpbmcgI2RlZmluZWQuCj4gLS0tCj4gIHRvb2xzL2xpYnhjL2luY2x1
ZGUveGVuY3RybC5oICAgfCAgMyArKysKPiAgdG9vbHMvbGlieGMveGNfYWx0cDJtLmMgICAgICAg
ICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQoKQWNrZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
