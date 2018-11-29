From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Thu, 29 Nov 2018 11:39:54 +0000
Message-ID: <20181129113954.vkum7wtisffd75ak@zion.uk.xensource.com>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
 <20181129113141.GE14786@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wph9=oi=citrix.com=prvs=8644391f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gSKfm-0008PW-Ku
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:39:58 +0000
Content-Disposition: inline
In-Reply-To: <20181129113141.GE14786@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMTE6MzE6NDFBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDU6NDM6MzNQTSArMDAwMCwgV2VpIExp
dSB3cm90ZToKPiA+IE9WTUYgaGFzIGJlY29tZSBkZXBlbmRlbnQgb24gT3BlblNTTCwgd2hpY2gg
aXQgaXMgaW5jbHVkZWQgYXMgYSBzdWJtb2R1bGUuCj4gPiBJbml0aWFsaXNlIHN1Ym1vZHVsZXMg
YmVmb3JlIGJ1aWxkaW5nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBUaGlzIHNob3VsZCBmaXggdGhlIGJ1aWxkIGJyZWFr
YWdlIGZvciBPVk1GIGJyYW5jaCBpbiBPU1NURVNULgo+ID4gCj4gPiBDYzogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiBDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9maXJtd2FyZS9vdm1mLW1h
a2VmaWxlIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlIGIvdG9vbHMvZmlybXdh
cmUvb3ZtZi1tYWtlZmlsZQo+ID4gaW5kZXggMjgzODc0NDQ2MS4uM2RlMmZjMDMwMCAxMDA2NDQK
PiA+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL2Zp
cm13YXJlL292bWYtbWFrZWZpbGUKPiA+IEBAIC0xNiw2ICsxNiw3IEBAIGFsbDogYnVpbGQKPiA+
ICAKPiA+ICAuUEhPTlk6IGJ1aWxkCj4gPiAgYnVpbGQ6Cj4gPiArCSQoR0lUKSBzdWJtb2R1bGUg
dXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZQo+ID4gIAlPdm1mUGtnL2J1aWxkLnNoIC1hIFg2NCAt
YiAkKFRBUkdFVCkgLW4gNAo+ID4gIAljcCBCdWlsZC9Pdm1mWDY0LyQoVEFSR0VUKV9HQ0MqL0ZW
L09WTUYuZmQgb3ZtZi5iaW4KPiA+ICAKPiAKPiBXaGF0IGFib3V0IHRoZSByZWxlYXNlIHRhcmJh
bGw/IERvIHdlIGluY2x1ZGVzIE9WTUYgaW4gaXQ/CgpZZXMgd2UgZG8uIEJ1dCB0aGlzIHNob3Vs
ZCB3b3JrIGJlY2F1c2UgdGhlIE1ha2VmaWxlIGlzIGFsc28gc2hpcHBlZC4KV2hhdCBkb2VzIHFl
bXUteGVuIGRvIHJlZ2FyZGluZyBpdHMgc3VibW9kdWxlcz8gT1ZNRiBzaG91bGQganVzdCBmb2xs
b3cKc3VpdGUuCgo+IAo+IEFsc28sIGRvZXNuJ3Qgb3NzdGVzdCBuZWVkcyBzb21lIHVwZGF0ZXM/
IEkgZm9yZ290IGlmIHRoZXJlIGlzIHNvbWV0aGluZwo+IHRvIGRvIHdoZW4gcHJvamVjdHMgaGF2
ZSBzdWJtb2R1bGVzLgoKWWVzIHRoZXJlIGlzIHNvbWUgc3BlY2lhbCBhcnJhbmdlbWVudCBmb3Ig
bGlidmlydC4gTm90IHN1cmUgd2hhdCBuZWVkcwp0byBiZSBkb25lIGZvciBPVk1GIHNpbmNlIGl0
IGlzIHBhcnQgb2YgeGVuLmdpdC4KCklhbj8KCldlaS4KCj4gCj4gLS0gCj4gQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
