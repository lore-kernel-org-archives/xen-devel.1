From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/firmware: update OVMF Makefile
Date: Thu, 29 Nov 2018 11:31:41 +0000
Message-ID: <20181129113141.GE14786@perard.uk.xensource.com>
References: <20181128174333.15672-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egv0=oi=citrix.com=prvs=86438351b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gSKXt-0007mj-AD
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 11:31:49 +0000
Content-Disposition: inline
In-Reply-To: <20181128174333.15672-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDU6NDM6MzNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPVk1GIGhhcyBiZWNvbWUgZGVwZW5kZW50IG9uIE9wZW5TU0wsIHdoaWNoIGl0IGlzIGluY2x1
ZGVkIGFzIGEgc3VibW9kdWxlLgo+IEluaXRpYWxpc2Ugc3VibW9kdWxlcyBiZWZvcmUgYnVpbGRp
bmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAt
LS0KPiBUaGlzIHNob3VsZCBmaXggdGhlIGJ1aWxkIGJyZWFrYWdlIGZvciBPVk1GIGJyYW5jaCBp
biBPU1NURVNULgo+IAo+IENjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gLS0t
Cj4gIHRvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFr
ZWZpbGUgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4gaW5kZXggMjgzODc0NDQ2MS4u
M2RlMmZjMDMwMCAxMDA2NDQKPiAtLS0gYS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4g
KysrIGIvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQo+IEBAIC0xNiw2ICsxNiw3IEBAIGFs
bDogYnVpbGQKPiAgCj4gIC5QSE9OWTogYnVpbGQKPiAgYnVpbGQ6Cj4gKwkkKEdJVCkgc3VibW9k
dWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1cnNpdmUKPiAgCU92bWZQa2cvYnVpbGQuc2ggLWEgWDY0
IC1iICQoVEFSR0VUKSAtbiA0Cj4gIAljcCBCdWlsZC9Pdm1mWDY0LyQoVEFSR0VUKV9HQ0MqL0ZW
L09WTUYuZmQgb3ZtZi5iaW4KPiAgCgpXaGF0IGFib3V0IHRoZSByZWxlYXNlIHRhcmJhbGw/IERv
IHdlIGluY2x1ZGVzIE9WTUYgaW4gaXQ/CgpBbHNvLCBkb2Vzbid0IG9zc3Rlc3QgbmVlZHMgc29t
ZSB1cGRhdGVzPyBJIGZvcmdvdCBpZiB0aGVyZSBpcyBzb21ldGhpbmcKdG8gZG8gd2hlbiBwcm9q
ZWN0cyBoYXZlIHN1Ym1vZHVsZXMuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
