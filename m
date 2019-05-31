From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] AMD/IOMMU: initialize IRQ tasklet only once
Date: Fri, 31 May 2019 09:09:07 -0700
Message-ID: <2ae1cd50-3fb3-366d-85bc-a9cc6bf750f0@citrix.com>
References: <5CF14DA40200007800234108@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWk5j-0007GC-2p
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 16:09:15 +0000
In-Reply-To: <5CF14DA40200007800234108@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRG9uJ3QgZG8gdGhpcyBv
bmNlIHBlciBJT01NVSwgbm9yIGFmdGVyIHNldHRpbmcgdXAgdGhlIElPTU1VIGludGVycnVwdAo+
ICh3aGljaCB3aWxsIHdhbnQgdG8gc2NoZWR1bGUgdGhpcyB0YXNrbGV0KS4gSW4gZmFjdCBpdCBj
YW4gYmUKPiBpbml0aWFsaXplZCBhdCBidWlsZCB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
