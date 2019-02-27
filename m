From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 2/6] xen: introduce DEFINE_SYMBOL
Date: Wed, 27 Feb 2019 02:46:27 -0700
Message-ID: <5C765C73020000780021A9C0@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-2-git-send-email-sstabellini@kernel.org>
 <23669.27990.559784.995763@mariner.uk.xensource.com>
 <5C7573BA020000780021A6D7@prv1-mh.provo.novell.com>
 <23669.30767.727170.597533@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1902261042180.20689@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyvnL-00088V-Hg
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 09:46:31 +0000
In-Reply-To: <alpine.DEB.2.10.1902261042180.20689@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE5OjQzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCAyNiBGZWIgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4+IEphbiBCZXVsaWNo
IHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjEwIDIvNl0geGVuOiBpbnRyb2R1Y2UgREVGSU5FX1NZTUJP
TCIpOgo+PiA+IE9uIDI2LjAyLjE5IGF0IDE3OjQ2LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gPiBJIGFtIG5vdCBhd2FyZSBvZiBhIHN0YW5kYXJkIEMgdHlwZSB3aGljaCBj
b3VsZCBiZSB1c2VkIGluc3RlYWQgb2YKPj4gPiA+IHRoaXMgc3RydWN0LiAgQnV0IEkgdGhpbmsg
eW91IGNhbiB1c2UgdGhlIGBwYWNrZWQnIGF0dHJpYnV0ZSB0byBnZXQKPj4gPiA+IHRoZSByaWdo
dCBiZWhhdmlvdXIuICBUaGUgR0NDIG1hbnVhbCBzYXlzOgo+PiA+ID4gCj4+ID4gPiAgfCBBbGln
bm1lbnQgY2FuIGJlIGRlY3JlYXNlZCBieSBzcGVjaWZ5aW5nIHRoZSAncGFja2VkJyBhdHRyaWJ1
dGUuCj4+ID4gPiAgfCBTZWUgYmVsb3cuCj4+IC4uLgo+PiA+IFVudGlsIEkndmUgbG9va2VkIGF0
IHRoaXMgKGFnYWluKSBub3csIEkgd2Fzbid0IGV2ZW4gYXdhcmUgdGhhdAo+PiA+IG9uZSBjYW4g
Y29tYmluZSBwYWNrZWQgYW5kIGFsaWduZWQgYXR0cmlidXRlcyBpbiBhIHNlbnNpYmxlCj4+ID4g
d2F5LiBNYXkgSSBzdWdnZXN0IHRoYXQsIGJlY2F1c2Ugb2YgdGhpcyBiZWluZyBhIHRoZW9yZXRp
Y2FsCj4+ID4gaXNzdWUgb25seSBhdCB0aGlzIHBvaW50LCB3ZSBsaW1pdCBvdXJzZWx2ZXMgdG8g
dGhlIGJ1aWxkIHRpbWUKPj4gPiBhc3NlcnRpb24geW91IHN1Z2dlc3Q/Cj4+IAo+PiBJIGFtIG5v
dCBzdWdnZXN0aW5nIGNvbWJpbmluZyBgcGFja2VkJyBhbmQgYGFsaWduZWQnLiAgSSBhbSBzdWdn
ZXN0aW5nCj4+IG9ubHkgYHBhY2tlZCcgKGJ1dCBiYXNlZCBvbiB0ZXh0IHdoaWNoIGlzIGluIHRo
ZSBtYW51YWwgc2VjdGlvbiBmb3IKPj4gYGFsaWduZWQnKS4gIEJ1dCBJIGFtIGhhcHB5IHdpdGgg
YSBidWlsZC10aW1lIGFzc2VydGlvbiBpZiB5b3UgZG9uJ3QKPj4gd2FudCB0byBhZGQgYHBhY2tl
ZCcuICBUaGF0IGlzIGp1c3QgYXMgc2FmZS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUg
YSByb3VnaCBleGFtcGxlIG9mIHRoZSBidWlsZC10aW1lIGFzc2VydGlvbiB5b3UKPiBhcmUgdGhp
bmtpbmcgYWJvdXQ/IEkgYW0gaGFwcHkgdG8gYWRkIGl0LgoKQlVJTERfQlVHX09OKGFsaWdub2Yo
KnMxKSAhPSBhbGlnbm9mKCpzMikpOwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
