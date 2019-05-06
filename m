From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
Date: Mon, 6 May 2019 16:26:44 +0100
Message-ID: <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNfVz-0007S7-EJ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:26:51 +0000
In-Reply-To: <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gNS82LzE5IDEwOjA2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAw
My4wNS4xOSBhdCAyMjo1MCwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiBA
QCAtNDgxLDEwICs0ODEsMTUgQEAgc3RhdGljIHBhZGRyX3QgX19pbml0IG5leHRfbW9kdWxlKHBh
ZGRyX3QgcywgcGFkZHJfdCAqZW5kKQo+PiAgIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2
b2lkKQo+PiAgIHsKPj4gICAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUsIGJhbmtf
ZW5kOwo+PiAtCj4+IC0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5i
YW5rWzBdLnN0YXJ0KTsKPj4gKyAgICB1NjQgbWFzazsKPj4gICAgICAgaW50IGJhbms7Cj4+ICAg
Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBXZSBhbHdheXMgbWFwIHRoZSBmaXJzdCAxPDxNQVhfT1JE
RVIgb2YgUkFNLCBoZW5jZSwgdGhleSBhcmUgbGVmdAo+IAo+ICIuLi4gcGFnZXMgb2YgUkFNLiIg
Pwo+IAo+PiArICAgICAqIHVuY29tcHJlc3NlZC4KPj4gKyAgICAgKi8KPj4gKyAgICBtYXNrID0g
cGR4X2luaXRfbWFzaygxVUxMIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZUKSk7Cj4gCj4gUEFH
RV9TSVpFIDw8IE1BWF9PUkRFUj8KCkhtbW0sIEkgYW0gbm90IGVudGlyZWx5IGNvbnZpbmNlIHRo
aXMgd2lsbCBnaXZlIHRoZSBjb3JyZWN0IHZhbHVlIApiZWNhdXNlIFBBR0VfU0laRSBpcyBkZWZp
bmVkIGFzIChfQUMoMSwgTCkgPDwgUEFHRV9TSElGVC4KCj4gCj4gSSB3b25kZXIgd2hldGhlciBw
ZHhfaW5pdF9tYXNrKCkgaXRzZWxmIHdvdWxkbid0IGJldHRlciBhcHBseSB0aGlzCj4gKGxvd2Vy
KSBjYXAKCkRvIHlvdSBtZWFuIGFsd2F5cyByZXR1cm5pbmcgKFBBR0VfU0laRSA8PCBNQVhfT1JE
RVIpIG9yIGNhcHBpbmcgdGhlIAppbml0IG1hc2s/CgpOb3RlIHRoYXQgdGhlIGxhdGVyIHdpbGwg
bm90IHByb2R1Y2UgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhpcyBwYXRjaC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
