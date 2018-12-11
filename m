From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 14/18] xen: add implementations of
 xen-block connect and disconnect functions...
Date: Tue, 11 Dec 2018 16:17:10 +0000
Message-ID: <20181211161710.GU18875@perard.uk.xensource.com>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-15-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWkiw-00025P-LQ
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:17:30 +0000
Content-Disposition: inline
In-Reply-To: <1544525238-3527-15-git-send-email-paul.durrant@citrix.com>
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

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6NDc6MTRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
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
