From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/7] amd-iommu: add lookup_page method to
 iommu_ops
Date: Thu, 20 Sep 2018 09:03:40 -0600
Message-ID: <5BA3B6CC02000078001EA54F@prv1-mh.provo.novell.com>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-8-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gjef=mc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g30UZ-0001mU-0Y
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 15:03:43 +0000
In-Reply-To: <20180920141149.1643-8-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA5LjE4IGF0IDE2OjExLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBtZXRob2QgdG8gdGhlIEFNRCBJT01NVSBpbXBsZW1l
bnRhdGlvbiB0byBmaW5kIHRoZQo+IE1GTiBjdXJyZW50bHkgbWFwcGVkIGJ5IHRoZSBzcGVjaWZp
ZWQgREZOLiBUaGlzIGlzIGFuYWxvZ291cyB0byB0aGUKPiBtZXRob2QgYWRkZWQgZm9yIFZULWQg
SU9NTVUgYnkgY29tbWl0IDQzZDE2MjJiLgoKUGxlYXNlIGRvbid0IHByb3ZpZGUgY29tbWl0IElE
cyBmcm9tIChwcmVzdW1hYmx5KSB5b3VyIHByaXZhdGUgcmVwbywKdGhlIG1vcmUgd2l0aG91dCBh
IHRpdGxlIHF1b3RlZCBuZXh0IHRvIGl0LiBBdCBsZWFzdCBwYXRjaGVzIDEgYW5kIDYKaGF2ZSB0
aGUgc2FtZSBpc3N1ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
