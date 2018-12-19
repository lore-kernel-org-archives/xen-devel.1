From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 15/18] xen: add a mechanism to
 automatically create XenDevice-s...
Date: Wed, 19 Dec 2018 12:40:49 +0000
Message-ID: <20181219124049.GB1288__47210.2408101366$1545223172$gmane$org@perard.uk.xensource.com>
References: <20181217133011.31433-1-paul.durrant@citrix.com>
 <20181217133011.31433-16-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9bs/=O4=citrix.com=prvs=884673768=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gZb9h-0006oh-BL
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 12:40:53 +0000
Content-Disposition: inline
In-Reply-To: <20181217133011.31433-16-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, qemu-block@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTcsIDIwMTggYXQgMDE6MzA6MDhQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLnRoYXQgbWFpbnRhaW5zIGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGluZyBYZW4g
dG9vbHN0YWNrcy4KPiAKPiBYZW4gdG9vbHN0YWNrcyBpbnN0YW50aWF0ZSBQViBiYWNrZW5kcyBi
eSBzaW1wbHkgd3JpdGluZyBpbmZvcm1hdGlvbiBpbnRvCj4geGVuc3RvcmUgYW5kIGV4cGVjdGlu
ZyBhIGJhY2tlbmQgaW1wbGVtZW50YXRpb24gdG8gYmUgd2F0Y2hpbmcgZm9yIHRoaXMuCj4gCj4g
VGhpcyBwYXRjaCBhZGRzIGEgbmV3ICd4ZW4tYmFja2VuZCcgbW9kdWxlIHRvIGFsbG93IGluZGl2
aWR1YWwgWGVuRGV2aWNlCj4gaW1wbGVtZW50YXRpb25zIHRvIHJlZ2lzdGVyIGNyZWF0ZSBhbmQg
ZGVzdHJveSBmdW5jdGlvbnMuIFRoZSBjcmVhdG9yCj4gd2lsbCBiZSBjYWxsZWQgd2hlbiBhIHRv
b2wtc3RhY2sgaW5zdGFudGlhdGVzIGEgbmV3IGJhY2tlbmQgaW4gdGhpcyB3YXksCj4gYW5kIHRo
ZSBkZXN0cnVjdG9yIHdpbGwgdGhlbiBiZSBjYWxsZWQgYWZ0ZXIgdGhlIHJlc3VsdGluZyBYZW5E
ZXZpY2UKPiBvYmplY3QgaXMgdW5yZWFsaXplZC4KPiAKPiBUbyBzdXBwb3J0IHRoaXMgaXQgaXMg
YWxzbyBuZWNlc3NhcnkgdG8gYWRkIG5ldyB3YXRjaGVycyBpbnRvIHRoZSBYZW5CdXMKPiBpbXBs
ZW1lbnRhdGlvbiB0byBoYW5kbGUgZW51bWVyYXRpb24gb2YgbmV3IGJhY2tlbmRzIGFuZCBhbHNv
IGRlc3RydWN0aW9uCj4gb2YgWGVuRGV2aWNlLXMgd2hlbiB0aGUgdG9vbHN0YWNrIHNldHMgdGhl
IGJhY2tlbmQgJ29ubGluZScga2V5IHRvIDAuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBvbmx5IGFk
ZHMgdGhlIGZyYW1ld29yay4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgYWRkIGEKPiAgICAgICBj
cmVhdG9yIGZ1bmN0aW9uIGZvciB4ZW4tYmxvY2sgZGV2aWNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVS
QVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
