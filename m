From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/4] x86: split opt_pv_l1tf
Date: Tue, 2 Oct 2018 17:43:45 +0100
Message-ID: <da96d011-e3ed-b2d4-63a2-505c0617555e@citrix.com>
References: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
 <5BB20E8D02000078001ED368@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=okrt=mo=citrix.com=prvs=806f63693=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7Nm1-0008L1-6y
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 16:43:49 +0000
In-Reply-To: <5BB20E8D02000078001ED368@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMTggMTM6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IFVzZSBzZXBhcmF0ZSB0cmFj
a2luZyB2YXJpYWJsZXMgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4gYW5kIERvbVUtcy4KPgo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLCBidXQgYWRqdXN0IHRoZSBjb21tZW50IGluCj4g
aW5pdF9zcGVjdWxhdGlvbl9taXRpZ2F0aW9ucygpIHRvIG1hdGNoIHByaW9yIGFzIHdlbGwgYXMg
cmVzdWx0aW5nIGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4sIGJ1dCB3aXRoIG9uZQpzdWdnZXN0ZWQgZGVsZXRpb24uCgo+IEBAIC04ODksMTggKzg5
MiwxNiBAQCB2b2lkIF9faW5pdCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zCj4gIAo+ICAg
ICAgLyoKPiAgICAgICAqIEJ5IGRlZmF1bHQsIGVuYWJsZSBQViBkb21VIEwxVEYgbWl0aWdhdGlv
bnMgb24gYWxsIEwxVEYtdnVsbmVyYWJsZQo+IC0gICAgICogaGFyZHdhcmUsIGV4Y2VwdCB3aGVu
IHJ1bm5pbmcgaW4gc2hpbSBtb2RlLgo+ICsgICAgICogaGFyZHdhcmUsIGV4Y2VwdCB3aGVuIHJ1
bm5pbmcgaW4gc2hpbSBtb2RlLCBhbmQgLSBhdCBsZWFzdCBmb3IgdGhlCj4gKyAgICAgKiB0aW1l
IGJlaW5nIC0gYWxzbyBleGNlcHRpbmcgdGhlIGhhcmR3YXJlIGRvbWFpbi4KCkknbSBub3Qgc3Vy
ZSB0aGlzIGFkZGl0aW9uIGlzIGhlbHBmdWwuwqAgV2UgYWxyZWFkeSBzdGF0ZSBQViBkb21VIGFi
b3ZlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
