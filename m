From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] xen: make tracebuffer configurable
Date: Tue, 04 Jun 2019 01:10:28 -0600
Message-ID: <5CF619640200007800234E6E@prv1-mh.provo.novell.com>
References: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3ad-0003iX-1p
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 07:10:35 +0000
In-Reply-To: <1559609096-11356-1-git-send-email-chenbaodong@mxnavi.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE5IGF0IDAyOjQ0LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
dHJhY2UuaAo+IEBAIC0yMSwxMiArMjEsMTUgQEAKPiAgI2lmbmRlZiBfX1hFTl9UUkFDRV9IX18K
PiAgI2RlZmluZSBfX1hFTl9UUkFDRV9IX18KPiAgCj4gKyNpZmRlZiBDT05GSUdfVFJBQ0VCVUZG
RVIKPiAgZXh0ZXJuIGludCB0Yl9pbml0X2RvbmU7Cj4gKyNlbmRpZgoKSWYgdGhpcyBpcyB0byBz
dGF5IHVwIGhlcmUgKHdoaWNoIEknbSBzdGlsbCBub3Qgc3VyZSBpdCBuZWVkcyB0bzsgSSBoYWQK
bWVyZWx5IGluZGljYXRlZCB0aGF0IHRoZXJlIGxpa2VseSBpcyBhIHJlYXNvbiBmb3IgdGhpcyB3
aXRob3V0IGFjdHVhbGx5Cmtub3dpbmcgd2hhdCB0aGF0IHJlYXNvbiBtaWdodCBiZSksIHRoZW4g
SSB0aGluayB0aGUgI2RlZmluZSBuZWVkcwp0byBnbyBoZXJlIGFzIHdlbGwsIGluIGFuICNlbHNl
LgoKPiBAQCAtNDcsNiArNTAsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIg
ZXZlbnQsIGludCBjeWNsZXMsIGludCBleHRyYSwKPiAgdm9pZCBfX3RyYWNlX2h5cGVyY2FsbCh1
aW50MzJfdCBldmVudCwgdW5zaWduZWQgbG9uZyBvcCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB4ZW5fdWxvbmdfdCAqYXJncyk7Cj4gIAo+ICsjZWxzZQo+ICsjZGVmaW5lIHRiX2lu
aXRfZG9uZSBmYWxzZQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgaW5pdF90cmFjZV9idWZzKHZvaWQp
IHt9Cj4gK3N0YXRpYyBpbmxpbmUgaW50IHRiX2NvbnRyb2woc3RydWN0IHhlbl9zeXNjdGxfdGJ1
Zl9vcCAqdGJjKSB7IHJldHVybiAtRU5PU1lTOyB9CgotRU9QTk9UU1VQUAoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
