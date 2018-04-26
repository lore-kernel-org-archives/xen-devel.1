From: Petr Tesarik <ptesarik@suse.cz>
Subject: Re: Should PV frontend drivers trust the backends?
Date: Thu, 26 Apr 2018 10:46:15 +0200
Message-ID: <20180426104615.104ec756@ezekiel.suse.cz>
References: <9ab3e669-787b-ef4d-b672-9bbf5dcb5f14@suse.com>
 <eebeb6d29e8e4b8d84c842439ffd7b8f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8/s=hp=suse.cz=ptesarik@srs-us1.protection.inumbo.net>)
 id 1fBcXl-00054Y-HT
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 08:46:21 +0000
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5D0DAC79
 for <xen-devel@lists.xenproject.org>; Thu, 26 Apr 2018 08:46:17 +0000 (UTC)
In-Reply-To: <eebeb6d29e8e4b8d84c842439ffd7b8f@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNSBBcHIgMjAxOCAxMzo0NzowOSArMDAwMApQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPiB3cm90ZToKCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4gRnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJv
amVjdC5vcmddIE9uCj4gPiBCZWhhbGYgT2YgSnVlcmdlbiBHcm9zcwo+ID4gU2VudDogMjUgQXBy
aWwgMjAxOCAxMzo0Mwo+ID4gVG86IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnPgo+ID4gU3ViamVjdDogW1hlbi1kZXZlbF0gU2hvdWxkIFBWIGZyb250ZW5kIGRyaXZl
cnMgdHJ1c3QgdGhlIGJhY2tlbmRzPwo+ID4gCj4gPiBUaGlzIGlzIGEgZm9sbG93dXAgb2YgYSBk
aXNjdXNzaW9uIG9uIElSQzoKPiA+IAo+ID4gVGhlIG1haW4gcXVlc3Rpb24gb2YgdGhlIGRpc2N1
c3Npb24gd2FzOiAiU2hvdWxkIGZyb250ZW5kIGRyaXZlcnMKPiA+IHRydXN0IHRoZWlyIGJhY2tl
bmRzIG5vdCBkb2luZyBtYWxpY2lvdXMgYWN0aW9ucz8iCj4gPiAKPlsuLi5dCj4gSSBzZWUgdGhl
IGdlbmVyYWwgcXVlc3Rpb24gYXMgYmVpbmcgYW5hbG9nb3VzIHRvICdzaG91bGQgYSBMaW51eAo+
IGRldmljZSBkcml2ZXIgdHJ1c3QgaXRzIGhhcmR3YXJlJyBhbmQgSSB0aGluayB0aGUgYW5zd2Vy
IGZvciBhCj4gZ2VuZXJhbCBwdXJwb3NlIE9TIGxpa2UgbGludXggaXMgJ3llcycuCgpJIGNhbiBz
ZWUgaG93IHRoaXMgaXMgYW5hbG9nb3VzLCBidXQgaXQncyBub3QgaWRlbnRpY2FsLiBUcmFkaXRp
b25hbGx5LApoYXJkd2FyZSBoYXMgZnVsbCBjb250cm9sIG9mIHRoZSBzeXN0ZW0gYW55d2F5LCBz
byBpdCBtYWtlcyBsaXR0bGUKc2Vuc2UgdG8gZGlzdHJ1c3QgaXQuIEl0IGRvZXMgbWFrZSBzZW5z
ZSB0byB2YWxpZGF0ZSB0aGUgZGF0YSBhbmQgcmV0cnkKYW4gaW52YWxpZCBvcGVyYXRpb24gKGlm
IHBvc3NpYmxlKSBvciBjcmFzaCB0aGUgc3lzdGVtIChpZiB0ZWNobmljYWxseQppbXBvc3NpYmxl
KS4KCkhvd2V2ZXIsIGEgYmFja2VuZCBkcml2ZXIgcnVucyBpbiBhIGRvbWFpbiB0aGF0IGlzIG5v
dCBtdWNoIGRpZmZlcmVudApmcm9tIHRoZSBkb21haW4gcnVubmluZyB0aGUgZnJvbnRlbmQgZHJp
dmVyLCBzbyBpdCBpcyB0aGVvcmV0aWNhbGx5CnBvc3NpYmxlIHRvIGltcGxlbWVudCBzb21lIHN1
cHBvcnQgaW4gWGVuIGl0c2VsZi4gTm93LCBpZiB5b3UncmUgYXNraW5nCndoZXRoZXIgWGVuIF9z
aG91bGRfIGFkZCBjb21wbGV4IGhhbmRsaW5nIG9mIHJlc2lsaWVudCBkb21haW4tdG8tZG9tYWlu
CmNvbW11bmljYXRpb24sIHRoYXQncyBwdXJlbHkgYSBtYXR0ZXIgb2YgdGFzdGUuCgpGV0lXIG15
IHZvdGUgaXM6IERvIG5vdGhpbmcuIEtlZXAgWGVuIGFyY2hpdGVjdHVyZSBzaW1wbGUuCgpQZXRy
IFQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
