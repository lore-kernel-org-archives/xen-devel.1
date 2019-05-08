From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 11/12] x86/IRQ: drop redundant
 cpumask_empty() from move_masked_irq()
Date: Wed, 08 May 2019 07:13:44 -0600
Message-ID: <5CD2D608020000780022CD85@prv1-mh.provo.novell.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOMOI-0007tC-V2
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:13:46 +0000
In-Reply-To: <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHN1YnNlcXVlbnQgY3B1bWFza19pbnRlcnNlY3RzKCkgY292ZXJzIHRoZSAiZW1wdHkiIGNh
c2UgcXVpdGUgZmluZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAt
NjUwLDkgKzY1MCw2IEBAIHZvaWQgbW92ZV9tYXNrZWRfaXJxKHN0cnVjdCBpcnFfZGVzYyAqZGUK
ICAgICAKICAgICBkZXNjLT5zdGF0dXMgJj0gfklSUV9NT1ZFX1BFTkRJTkc7CiAKLSAgICBpZiAo
dW5saWtlbHkoY3B1bWFza19lbXB0eShwZW5kaW5nX21hc2spKSkKLSAgICAgICAgcmV0dXJuOwot
CiAgICAgaWYgKCFkZXNjLT5oYW5kbGVyLT5zZXRfYWZmaW5pdHkpCiAgICAgICAgIHJldHVybjsK
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
