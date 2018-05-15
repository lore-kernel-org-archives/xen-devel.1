From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 1/3] xen-hvm: create separate function
 for ioreq server initialization
Date: Tue, 15 May 2018 15:40:24 +0100
Message-ID: <20180515144024.GC2057@perard.uk.xensource.com>
References: <20180510091518.28199-1-paul.durrant@citrix.com>
 <20180510091518.28199-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rxgm=ic=citrix.com=prvs=66614e27e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fIb7t-00070f-SG
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:40:29 +0000
Content-Disposition: inline
In-Reply-To: <20180510091518.28199-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMTA6MTU6MTZBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBjb2RlIGlzIHN1ZmZpY2llbnRseSBzdWJzdGFudGlhbCB0aGF0IGl0IGltcHJv
dmVzIGNvZGUgcmVhZGFiaWxpdHkKPiB0byBwdXQgaXQgaW4gYSBuZXcgZnVuY3Rpb24gY2FsbGVk
IGJ5IHhlbl9odm1faW5pdCgpIHJhdGhlciB0aGFuIGhhdmluZwo+IGl0IGlubGluZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2
aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
