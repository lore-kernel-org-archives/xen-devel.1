From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 14/18] xen: add implementations of
 xen-block connect and disconnect functions...
Date: Tue, 11 Dec 2018 16:50:19 +0000
Message-ID: <20181211165019.GV18875@perard.uk.xensource.com>
References: <1544543862-9997-1-git-send-email-paul.durrant@citrix.com>
 <1544543862-9997-15-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWlEr-0006Kj-08
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:50:29 +0000
Content-Disposition: inline
In-Reply-To: <1544543862-9997-15-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDM6NTc6MzhQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFuZCB3aXJlIGluIHRoZSBkYXRhcGxhbmUuCj4gCj4gVGhpcyBwYXRjaCBhZGRz
IHRoZSByZW1haW5pbmcgY29kZSB0byBtYWtlIHRoZSB4ZW4tYmxvY2sgWGVuRGV2aWNlCj4gZnVu
Y3Rpb25hbC4gVGhlIHBhcmFtZXRlcnMgdGhhdCBhIGJsb2NrIGZyb250ZW5kIGV4cGVjdHMgdG8g
ZmluZCBhcmUKPiBwb3B1bGF0ZWQgaW4gdGhlIGJhY2tlbmQgeGVuc3RvcmUgYXJlYSwgYW5kIHRo
ZSAncmluZy1yZWYnIGFuZAo+ICdldmVudC1jaGFubmVsJyB2YWx1ZXMgc3BlY2lmaWVkIGluIHRo
ZSBmcm9udGVuZCB4ZW5zdG9yZSBhcmVhIGFyZQo+IG1hcHBlZC9ib3VuZCBhbmQgdXNlZCB0byBz
ZXQgdXAgdGhlIGRhdGFwbGFuZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
