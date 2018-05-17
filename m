From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 7/8] xen_disk: use a single entry iovec
Date: Thu, 17 May 2018 11:59:05 +0100
Message-ID: <20180517105905.GL2057__47158.3536280834$1526554687$gmane$org@perard.uk.xensource.com>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-8-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kmnw=ie=citrix.com=prvs=6682a862c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJGcs-0008Sl-QB
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 10:59:14 +0000
Content-Disposition: inline
In-Reply-To: <1525461967-32174-8-git-send-email-paul.durrant@citrix.com>
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

T24gRnJpLCBNYXkgMDQsIDIwMTggYXQgMDg6MjY6MDZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFNpbmNlIHhlbl9kaXNrIG5vdyBhbHdheXMgY29waWVzIGRhdGEgdG8gYW5kIGZyb20g
YSBndWVzdCB0aGVyZSBpcyBubyBuZWVkCj4gdG8gbWFpbnRhaW4gYSB2ZWN0b3IgZW50cnkgY29y
cmVzcG9uZGluZyB0byBldmVyeSBwYWdlIG9mIGEgcmVxdWVzdC4KPiBUaGlzIG1lYW5zIHRoZXJl
IGlzIGxlc3MgcGVyLXJlcXVlc3Qgc3RhdGUgdG8gbWFpbnRhaW4gc28gdGhlIGlvcmVxCj4gc3Ry
dWN0dXJlIGNhbiBzaHJpbmsgc2lnbmlmaWNhbnRseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
