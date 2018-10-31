From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH V6] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 31 Oct 2018 16:39:11 +0000
Message-ID: <20181031163911.7pbw7rclfalmuu6m@zion.uk.xensource.com>
References: <1538035134-10967-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHtWW-0003hE-85
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 16:39:16 +0000
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
ZW5kZXIuY29tPgoKSSdtIG5vdCBzdXJlIGlmIHRoaXMgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZC4g
SWYgbm90IEkgd2lsbCBkbyBpdCBkdXJpbmcKbXkgbmV4dCBzd2VlcC4KCldlaS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
