From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2] x86/xen/efi: Initialize UEFI secure boot
 state during dom0 boot
Date: Wed, 11 Apr 2018 10:56:20 +0200
Message-ID: <20180411085620.GI26100__8786.71813193268$1523436931$gmane$org@olila.local.net-space.pl>
References: <1522766345-4169-1-git-send-email-daniel.kiper@oracle.com>
 <1522770281.4522.14.camel@HansenPartnership.com>
 <20180403160712.GL26100@olila.local.net-space.pl>
 <1522774852.4522.25.camel@HansenPartnership.com>
 <20180404103824.GM26100@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8uav=ha=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1f6BYa-0006f6-D1
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 08:56:44 +0000
Content-Disposition: inline
In-Reply-To: <20180404103824.GM26100@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: james.bottomley@hansenpartnership.com, ard.biesheuvel@linaro.org
Cc: jgross@suse.com, eric.snowberg@oracle.com, linux-efi@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMTI6Mzg6MjRQTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFR1ZSwgQXByIDAzLCAyMDE4IGF0IDEwOjAwOjUyQU0gLTA3MDAsIEphbWVzIEJv
dHRvbWxleSB3cm90ZToKPiA+IE9uIFR1ZSwgMjAxOC0wNC0wMyBhdCAxODowNyArMDIwMCwgRGFu
aWVsIEtpcGVyIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFwciAwMywgMjAxOCBhdCAwODo0NDo0MUFN
IC0wNzAwLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4KPiBbLi4uXQo+Cj4gPiA+ID4gVGhpcyBs
b29rcyBsaWtlIGEgYmFkIGlkZWE6IHlvdSdyZSBkdXBsaWNhdGluZyB0aGUgc2VjdXJlIGJvb3QK
PiA+ID4gPiBjaGVjayBpbgo+ID4gPiA+Cj4gPiA+ID4gZHJpdmVycy9maXJtd2FyZS9lZmkvbGli
c3R1Yi9zZWN1cmVib290LmMKPiA+ID4gPgo+ID4gPiA+IFdoaWNoIGlzIGFuIGltcGxlbWVudGF0
aW9uIG9mIHBvbGljeS4gwqBJZiB3ZSBoYXZlIHRvIGhhdmUgcG9saWN5IGluCj4gPiA+ID4gdGhl
IGtlcm5lbCwgaXQgc2hvdWxkIHJlYWxseSBvbmx5IGJlIGluIG9uZSBwbGFjZSB0byBwcmV2ZW50
IGRyaWZ0Owo+ID4gPiA+IHdoeSBjYW4ndCB5b3Ugc2ltcGx5IHVzZSB0aGUgbGlic3R1YiBlZmlf
Z2V0X3NlY3VyZWJvb3QoKSBzbyB3ZSdyZQo+ID4gPiA+IG5vdCBkdXBsaWNhdGluZyB0aGUgaW1w
bGVtZW50YXRpb24gb2YgcG9saWN5Pwo+ID4gPgo+ID4gPiBXZWxsLCBoZXJlIGlzIHRoZSBmaXJz
dCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2g6Cj4gPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4
LzEvOS80OTYgQXJkIGRpZCBub3QgbGlrZSBpdC4gSSB3YXMgbm90Cj4gPiA+IGhhcHB5IHRvby4g
SW4gZ2VuZXJhbCBib3RoIGFwcHJvYWNoZXMgYXJlIG5vdCBwZXJmZWN0LiBNb3JlIHlvdSBjYW4K
PiA+ID4gZmluZCBpbiB0aGUgZGlzY3Vzc2lvbiBhcm91bmQgdGhpcyBwYXRjaHNldC4gSWYgeW91
IGhhdmUgYmV0dGVyIGlkZWEKPiA+ID4gaG93IHRvIGRvIHRoYXQgSSBhbSBoYXBweSB0byBpbXBs
ZW1lbnQgaXQuCj4gPgo+ID4gT25lIHdheSBtaWdodCBiZSBzaW1wbHkgdG8gaGF2ZSB0aGUgcHJl
IGV4aXQtYm9vdC1zZXJ2aWNlcyBjb2RlIGxheQo+ID4gZG93biBhIHZhcmlhYmxlIGNvbnRhaW5p
bmcgdGhlIHN0YXRlIHdoaWNoIHlvdSBwaWNrIHVwLCByYXRoZXIgdGhhbiB5b3UKPgo+IERvIHlv
dSBtZWFuIHZhcmlhYmxlIGluIGtlcm5lbCBwcm9wZXIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdD8g
SWYgeWVzIHRoaXMKPiBpcyBub3QgcG9zc2libGUuIEVGSSBMaW51eCBzdHViIGlzIG5vdCBleGVj
dXRlZCBpbiBYZW4gZG9tMC4gQWxsIFVFRkkKPiBpbmZyYXN0cnVjdHVyZSBpcyBvd25lZCBhbmQg
b3BlcmF0ZWQgYnkgWGVuLiBEb20wIGtlcm5lbCBjYW4gYWNjZXNzIHNvbWUKPiBzdHVmZiBpbiBV
RUZJLCBpbmNsdWRpbmcgdmFyaWFibGVzLCB2aWEgaHlwZXJjYWxsLiBIb3dldmVyLCB3aGVuIGRv
bTAKPiBydW5zIG9ubHkgVUVGSSBydW50aW1lIHNlcnZpY2VzIGFyZSBhdmFpbGFibGUuCj4KPiA+
IGNhbGxpbmcgZWZpIGNvZGUgc2VwYXJhdGVseSBhbmQgdHJ5aW5nIHRvIHVzZSB0aGUgaW5zZWN1
cmUgUlQKPgo+IEkgYW0gbm90IHN1cmUgd2h5IHRoZXkgYXJlIGluc2VjdXJlLgo+Cj4gPiB2YXJp
YWJsZXMuIMKgVGhhdCB3YXkgdGhlcmUncyBhIHVuaWZvcm0gdmlldyBvZiB0aGUgaW50ZXJuYWwg
a2VybmVsCj4gPiBzZWN1cmUgYm9vdCBzdGF0ZSB0aGF0IGV2ZXJ5b25lIGNhbiB1c2UuCj4KPiBU
aGF0IHdvdWxkIGJlIHBlcmZlY3QgYnV0IEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBpbiBmb3JtIHBy
b3Bvc2VkIGFib3ZlCj4gaXQgaXMgbm90IHBvc3NpYmxlLgoKUGluZz8KCkRhbmllbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
