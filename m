From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/3] xen/pt: fix some pass-thru devices
 don't work across reboot
Date: Fri, 25 Jan 2019 09:13:49 -0700
Message-ID: <5C4B35BD0200007800211364@prv1-mh.provo.novell.com>
References: <1548404821-15241-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gn476-0008AP-Qd
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 16:13:52 +0000
In-Reply-To: <1548404821-15241-1-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE5IGF0IDA5OjI2LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMK
PiBAQCAtNzMyLDcgKzczMiwxMSBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAgICAgICAgICAg
ICBicmVhazsKPiAgCj4gICAgICAgICAgcmV0ID0gLUVQRVJNOwo+IC0gICAgICAgIGlmICggaXJx
IDw9IDAgfHwgIWlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJkLCBpcnEpICkKPiArICAgICAgICAv
Kgo+ICsgICAgICAgICAqIGlycSA8IDAgZGVub3RlcyB0aGUgY29ycmVzcG9uZGluZyBwaXJxIGhh
cyBiZWVuIGZvcmNpYmx5IHVuYm91bmQuCj4gKyAgICAgICAgICogRm9yIHRoaXMgY2FzZSwgYnlw
YXNzIHBlcm1pc3Npb24gY2hlY2sgdG8gcmVhcCB0aGUgcGlycS4KPiArICAgICAgICAgKi8KPiAr
ICAgICAgICBpZiAoICFpcnEgfHwgKChpcnEgPiAwKSAmJiAhaXJxX2FjY2Vzc19wZXJtaXR0ZWQo
Y3VycmQsIGlycSkpICkKPiAgICAgICAgICAgICAgYnJlYWs7CgpTbyB3aHkgd291bGQgaXQgYmUg
Y29ycmVjdCB0byBjb250aW51ZSBpbnRvIHB0X2lycV9kZXN0cm95X2JpbmQoKQp3aXRoIGlycSA8
IDA/IEFuZCB3aXRoIGFuIGFjdHVhbCBYU00gcG9saWN5IEknbSBub3Qgc3VyZSB5b3UnZApldmVu
IG1ha2UgaXQgcGFzdCB4c21fdW5iaW5kX3B0X2lycSgpLiBJZiB0aGUgSVJRIHdhcyBmb3JjaWJs
eQp1bmJvdW5kIGJlZm9yZSwgdGhlcmUgc2hvdWxkbid0IGJlIGFueXRoaW5nIGxlZnQgdG8gY2xl
YW4gdXA/CgpPbiB0aGUgd2hvbGUgSSB0aGluayBhbGwgdGhlIGV4dHJhIGFkZGl0aW9ucyBpbiB2
NiBvbmx5IHNlcnZlIHRvCm1hc2sgdGhlIHRvb2wgc3RhY2sgbm90IG5lZWRpbmcgdG8gZG8gYW55
bW9yZSBzb21lIG9mIHdoYXQgaXQKZG9lcywgYXMgc3VnZ2VzdGVkIGluIGEgcmVwbHkgdG8gYW4g
ZWFybGllciB2ZXJzaW9uLiBTbyBJIGd1ZXNzIEkKYWdyZWUgd2l0aCBSb2dlciB0aGF0IHY1IGNh
bWUgY2xvc2VyLCBidXQgbWF5IG5lZWQgdG8gYmUKYW1lbmRlZCBieSBzb21lIHRvb2wgc3RhY2sg
YWRqdXN0bWVudChzKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
