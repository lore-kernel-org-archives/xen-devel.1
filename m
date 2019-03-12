From: Jinch <jinchen1227@qq.com>
Subject: Re: Xen ARM smmu questions
Date: Tue, 12 Mar 2019 21:47:48 +0800
Message-ID: <59DDCDD7-B6EF-4F90-82F1-256D5AE10B14@qq.com>
References: <tencent_4E03A65ACF45B3490239A3A479F5E64FA506@qq.com>
 <996e86f5-7059-9fb1-1aa1-734ab760f70a@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GeiQ=RP=qq.com=jinchen1227@srs-us1.protection.inumbo.net>)
 id 1h3hlz-0003Ui-04
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 13:48:51 +0000
In-Reply-To: <996e86f5-7059-9fb1-1aa1-734ab760f70a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LApJ4oCZbSBqdXN0IHJlc2VhcmNoaW5nIHRoZSBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGUgU01NVSBkcml2ZXIgaW4gWGVuIGFuZCBkb20wIGtlcm5lbC4KSWYg
bXkgYm9hcmQgaGFzIFNNTVUgb2YgYXJtLG1tdS01MDAsIGRvIHlvdSBtZWFuIHRoYXQgdGhlIFhl
biB1c2UgdGhlIHN0YWdlIDIgb2YgaXQgYW5kIHRoZSBkb20wIGtlcm5lbCB1c2Ugc3RhZ2UxPwpB
bmQgaWYgSSB3YW50IHRvIHBhc3N0aHJvdWdoIHNvbWUgZGV2aWNlIHRoYXQgdXNlIFNNTVUgdG8g
ZG9tdSwgaG93IHRoZSBTTU1VIHdvcmtpbmcgaW4gWGVuIGFuZCB0aGUgZG9tdSBrZXJuZWw/Cgo+
IOWcqCAyMDE55bm0M+aciDEy5pel77yM5LiL5Y2INzo0Mu+8jEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+IOWGmemBk++8mgo+IAo+IAo+IE9uIDMvMTIvMTkgODo1OCBBTSwgamlu
Y2hlbiB3cm90ZToKPj4gSGVsbG8geGVuLWRldmVsLAo+IAo+IEhlbGxvLAo+IAo+PiBJJ20gcmVh
ZGluZyB0aGUgY29kZSBvZiB4ZW4gYXJtIHNtbXUgaW4gZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0s
IGFuZCBJIGhhdmUgc29tZSBxdWVzdGlvbnMgdGhhdCBjb25mdXNlZCBtZS4KPj4gSSB0aGluayBp
ZiB0aGUgYm9hcmQgdXNlIFNNTVUsIHhlbiB3aWxsIHRha2UgY2hhcmdlIG9mIGl0IGJlZm9yZSBk
b20wIGJvb3QsIGFuZCB3aWxsIG5vdCBwYXNzIHRoZSBub2RlIG9mIFNNTVUgdG8gZG9tMCBpbiBk
ZXZpY2UgdHJlZSwKPj4gc28gbXkgcXVlc3Rpb24gaXMgaG93IGRvbTAgdXNlIFNNTVU/IG9yIGNh
biBkb20wIHVzZSBTTU1VPyBXaGF0IGRvbTAgdXNlIGlmIGl0IHdhbnRzIHRvIHVzZSBJT01NVT8K
Pj4gV2hhdCBhYm91dCBkb21VPyBUaGUgU01NVSBjb3VsZCBiZSBwYXNzZWQgdG8gZG9tVT8KPiAK
PiBTb21lIFNNTVUgYXJlIGFibGUgdG8gcHJvdmlkZSBTdGFnZSAxIChHdWVzdCBWQSB0byBHdWVz
dCBQQSkgYW5kIFN0YWdlIDIgKEd1ZXN0IFBBIHRvIEhvc3QgUEEpIHN1cHBvcnQuIEluIHRoZSBj
dXJyZW50IGNvbmZpZ3VyYXRpb24sIFhlbiB3aWxsIHVzZSB0aGUgU3RhZ2UgMiBwYXJ0IHRvIGlz
b2xhdGUgZGV2aWNlIHBhc3N0aHJvdWdoLiBTdGFnZSAxIGlzIG5vdCBzdXBwb3J0ZWQuCj4gCj4g
SWYgeW91IHdhbnRlZCBhIGd1ZXN0IHRvIHVzZSB0aGUgU01NVSwgeW91IHdvdWxkIGVpdGhlciBu
ZWVkIHRvIHByb3ZpZGUgU3RhZ2UgMSBzdXBwb3J0IChyZXF1aXJlcyBIVyBzdXBwb3J0KSBvciBh
IFBWIElPTU1VLgo+IAo+IEFsdGVybmF0aXZlbHksIHlvdSBtaWdodCBiZSBhYmxlIHRvIGdpdmUg
dGhlIFNNTVUgdG8gRG9tMC4gSSBoYXZlbid0IGV4cGxvcmVkIGl0IHNvIGZhci4gRG8geW91IGhh
dmUgYSB1c2UgY2FzZSBmb3IgdXNpbmcgdGhlIElPTU1VIGluIGd1ZXN0Pwo+IAo+IENoZWVycywK
PiAKPiAtLSAKPiBKdWxpZW4gR3JhbGwKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
