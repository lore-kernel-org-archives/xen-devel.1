From: 'Christoph Moench-Tegeder' <cmt@burggraben.net>
Subject: Re: [BUG] kernel bug encountered at
 drivers/net/xen-netback/netback.c:430!
Date: Sun, 7 Jan 2018 23:19:05 +0100
Message-ID: <20180107221904.GA78680@elch.exwg.net>
References: <5a3ca8ee.4426620a.b956d.1799@mx.google.com>
 <352b0317-cfc5-1ef4-fbd0-2b2879f9712e@suse.com>
 <5a3d6c93.886f620a.2522d.c2fb@mx.google.com>
 <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
 <20180103203337.GA79570@elch.exwg.net>
 <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3dtw=ec=burggraben.net=cmt@srs-us1.protection.inumbo.net>)
 id 1eYJHl-0006ES-3X
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 22:19:21 +0000
Content-Disposition: inline
In-Reply-To: <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, 'Alex Braunegg' <alex.braunegg@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

IyMgUGF1bCBEdXJyYW50IChQYXVsLkR1cnJhbnRAY2l0cml4LmNvbSk6Cgo+ID4gSSBjb3VsZCB0
cnkgYSBuZXcga2VybmVsIChLUFRJLCB5YXkhKSB3aXRoIHRoYXQgIm1pbGRseSBzdXNwaWNpb3Vz
IiBjb21taXQKPiA+IGNjODczN2E1ZmU5MDUxYjdmYTA1MmIwOGM1N2RkYjlmNTM5YzM4OWEgcmV2
ZXJ0ZWQgb24gdGhlIHdlZWtlbmQgYW5kCj4gPiByZXBvcnQgYmFjayAoanVzdCB0byBydWxlIHRo
YXQgb3V0IC0gbGlrZSB5b3UsIEkgZG9uJ3QgcmVhbGx5IGJlbGlldmUKPiA+IHRoYXQgdGhpcyBp
cyB0aGUgY2F1c2UpLgo+ID4gRm9yIHRoZSByZWNvcmQsIEknbSBzdGlsbCBydW5uaW5nIDQuMTMu
MTYgb24gdGhlIERvbTAgKHRoYXQncyB0aGUgbGFzdAo+ID4gd29ya2luZyBEb20wIGtlcm5lbCku
Cj4gCj4gVGhhbmtzLiBXZWxsLCB0aGF0J3MgdGhlIG9ubHkgbmV0YmFjayBjb21taXQgdGhhdCdz
IGluIG1hc3RlciBidXQgbm90IGluCj4gNC4xMy4xNiBzbyBpdCB3b3VsZCBiZSB1c2VmdWwgdG8g
Y29uY2x1c2l2ZWx5IHJ1bGUgdGhhdCBvdXQgYXMgYSBjYXVzZS4KCkZ1bm55IHRoaW5nOiB3aXRo
IHRoYXQgY29tbWl0IHJldmVydGVkLCBJJ20gcnVubmluZyA0LjE0LjEyIG9uIG15IERvbTAuClRo
YXQncyBob2xkaW5nIG11Y2ggbG9uZ2VyIHRoYW4gYW55IDQuNCBrZXJuZWwgb24gdGhhdCBob3N0
IGJlZm9yZS4KVGhhdCdzIGludGVyZXNpbmcsIGFzIHRoZSBjcmFzaGluZyBjb2RlIGxvb2tzIG1v
cmUgY29ycmVjdCAoYXQgbGVhc3QKZm9yIG1lIGFuZCBzb21lIGNvbXBpbGVyLi4uKSwgYW5kIHRo
ZSBjaGFuZ2UgaXMgcmF0aGVyIHNtYWxsLgoKUmVnYXJkcywKQ2hyaXN0b3BoCgotLSAKU3BhcmUg
U3BhY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
