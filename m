From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 05/18] xen: add xenstore watcher
 infrastructure
Date: Tue, 11 Dec 2018 15:21:29 +0000
Message-ID: <20181211152129.GS18875@perard.uk.xensource.com>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-6-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWjrL-0001KP-DF
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:22:07 +0000
Content-Disposition: inline
In-Reply-To: <1544525238-3527-6-git-send-email-paul.durrant@citrix.com>
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

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6NDc6MDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEEgWGVuIFBWIGZyb250ZW5kIGNvbW11bmljYXRlcyBpdHMgc3RhdGUgdG8gdGhlIFBW
IGJhY2tlbmQgYnkgd3JpdGluZyB0bwo+IHRoZSAnc3RhdGUnIGtleSBpbiB0aGUgZnJvbnRlbmQg
YXJlYSBpbiB4ZW5zdG9yZS4gSXQgaXMgdGhlcmVmb3JlCj4gbmVjZXNzYXJ5IGZvciBhIFhlbkRl
dmljZSBpbXBsZW1lbnRhdGlvbiB0byBiZSBub3RpZmllZCB3aGVuZXZlciB0aGUKPiB2YWx1ZSBv
ZiB0aGlzIGtleSBjaGFuZ2VzLgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBjb2RlIHRvIGRvIHRoaXMg
YXMgZm9sbG93czoKPiAKPiAtIGFuICdmZCBoYW5kbGVyJyBpcyByZWdpc3RlcmVkIG9uIHRoZSBs
aWJ4ZW5zdG9yZSBoYW5kbGUgd2hpY2ggd2lsbCBiZQo+ICAgdHJpZ2dlcmVkIHdoZW5ldmVyIGEg
J3dhdGNoJyBldmVudCBvY2N1cnMKPiAtIHByaW1pdGl2ZXMgYXJlIGFkZGVkIHRvIHhlbi1idXMt
aGVscGVyIHRvIGFkZCBvciByZW1vdmUgd2F0Y2ggZXZlbnRzCj4gLSBhIGxpc3Qgb2YgTm90aWZp
ZXIgb2JqZWN0cyBpcyBhZGRlZCB0byBYZW5CdXMgdG8gcHJvdmlkZSBhIG1lY2hhbmlzbQo+ICAg
dG8gY2FsbCB0aGUgYXBwcm9wcmlhdGUgJ3dhdGNoIGhhbmRsZXInIHdoZW4gaXRzIGFzc29jaWF0
ZWQgZXZlbnQKPiAgIG9jY3Vycwo+IAo+IFRoZSB4ZW4tYmxvY2sgaW1wbGVtZW50YXRpb24gaXMg
ZXh0ZW5kZWQgd2l0aCBhICdmcm9udGVuZF9jaGFuZ2VkJyBtZXRob2QsCj4gd2hpY2ggY2FsbHMg
YXMteWV0IHN0dWIgJ2Nvbm5lY3QnIGFuZCAnZGlzY29ubmVjdCcgZnVuY3Rpb25zIHdoZW4gdGhl
Cj4gcmVsZXZhbnQgZnJvbnRlbmQgc3RhdGUgdHJhbnNpdGlvbnMgb2NjdXIuIEEgc3Vic2VxdWVu
dCBwYXRjaCB3aWxsIHN1cHBseQo+IGEgZnVsbCBpbXBsZW1lbnRhdGlvbiBmb3IgdGhlc2UgZnVu
Y3Rpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNp
dHJpeC5jb20+CgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
