From: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 1/4] xen/PVH: Replace GDT_ENTRY with
 explicit constant
Date: Tue, 1 May 2018 11:31:16 +0000
Message-ID: <70673793884c4eba857970359f9f5158__31501.9391281114$1525174138$gmane$org@AcuMS.aculab.com>
References: <20180430162339.17143-1-boris.ostrovsky@oracle.com>
 <20180430162339.17143-2-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rybd=hu=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1fDTU8-0000Z0-Ah
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 11:30:16 +0000
In-Reply-To: <20180430162339.17143-2-boris.ostrovsky@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Boris Ostrovsky' <boris.ostrovsky@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQm9yaXMgT3N0cm92c2t5Cj4gU2VudDogMzAgQXByaWwgMjAxOCAxNzoyNAo+IFRvOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKPiBDYzogamdyb3NzQHN1c2UuY29tOyBCb3JpcyBPc3Ryb3Zza3k7IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKPiBTdWJqZWN0OiBbUEFUQ0ggMS80XSB4ZW4vUFZIOiBSZXBsYWNlIEdEVF9FTlRS
WSB3aXRoIGV4cGxpY2l0IGNvbnN0YW50Cj4gCj4gTGF0ZXN0IGJpbnV0aWxzIHJlbGVhc2UgKDIu
MjkuMSkgd2lsbCBubyBsb25nZXIgYWxsb3cgcHJvcGVyIGNvbXB1dGF0aW9uCj4gb2YgR0RUIGVu
dHJpZXMgb24gMzItYml0cywgd2l0aCB3YXJuaW5nOgo+IAo+IGFyY2gveDg2L3hlbi94ZW4tcHZo
LlM6IEFzc2VtYmxlciBtZXNzYWdlczoKPiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5TOjE1MDogV2Fy
bmluZzogc2hpZnQgY291bnQgb3V0IG9mIHJhbmdlICgzMiBpcyBub3QgYmV0d2VlbiAwIGFuZCAz
MSkKPiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5TOjE1MDogV2FybmluZzogc2hpZnQgY291bnQgb3V0
IG9mIHJhbmdlICg0MCBpcyBub3QgYmV0d2VlbiAwIGFuZCAzMSkKPiBhcmNoL3g4Ni94ZW4veGVu
LXB2aC5TOjE1MDogV2FybmluZzogc2hpZnQgY291bnQgb3V0IG9mIHJhbmdlICgzMiBpcyBub3Qg
YmV0d2VlbiAwIGFuZCAzMSkKPiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5TOjE1MjogV2FybmluZzog
c2hpZnQgY291bnQgb3V0IG9mIHJhbmdlICgzMiBpcyBub3QgYmV0d2VlbiAwIGFuZCAzMSkKPiBh
cmNoL3g4Ni94ZW4veGVuLXB2aC5TOjE1MjogV2FybmluZzogc2hpZnQgY291bnQgb3V0IG9mIHJh
bmdlICg0MCBpcyBub3QgYmV0d2VlbiAwIGFuZCAzMSkKPiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5T
OjE1MjogV2FybmluZzogc2hpZnQgY291bnQgb3V0IG9mIHJhbmdlICgzMiBpcyBub3QgYmV0d2Vl
biAwIGFuZCAzMSkKPiAKPiBVc2UgZXhwbGljaXQgdmFsdWUgb2YgdGhlIGVudHJ5IGluc3RlYWQg
b2YgdXNpbmcgR0RUX0VOVFJZKCkgbWFjcm8uCi4uLgo+ICAjaWZkZWYgQ09ORklHX1g4Nl82NAo+
IC0JLnF1YWQgR0RUX0VOVFJZKDB4YTA5YSwgMCwgMHhmZmZmZikgLyogX19LRVJORUxfQ1MgKi8K
PiArCS5xdWFkIDB4MDBhZjlhMDAwMDAwZmZmZiAgICAgICAgICAgIC8qIF9fQk9PVF9DUyAqLwo+
ICAjZWxzZQo+IC0JLnF1YWQgR0RUX0VOVFJZKDB4YzA5YSwgMCwgMHhmZmZmZikgLyogX19LRVJO
RUxfQ1MgKi8KPiArCS5xdWFkIDB4MDBjZjlhMDAwMDAwZmZmZiAgICAgICAgICAgIC8qIF9fQk9P
VF9DUyAqLwo+ICAjZW5kaWYKPiAtCS5xdWFkIEdEVF9FTlRSWSgweGMwOTIsIDAsIDB4ZmZmZmYp
IC8qIF9fS0VSTkVMX0RTICovCj4gKwkucXVhZCAweDAwY2Y5MjAwMDAwMGZmZmYgICAgICAgICAg
ICAvKiBfX0JPT1RfRFMgKi8KPiAgZ2R0X2VuZDoKCkl0IGhhcyB0byBiZSBwb3NzaWJsZSB0byBm
aXggdGhlIEdEVF9FTlRSWSgpIG1hY3JvLgpFdmVuIGlmIHlvdSBlbmQgdXAgd2l0aCBvbmUgdGhh
dCBnZW5lcmF0ZXMgdHdvIDMyYml0IHZhbHVlcy4KCllvdSd2ZSBhbHNvIGNoYW5nZWQgdGhlIG5h
bWUgaW4gdGhlIGNvbW1lbnRzLgoKCURhdmlkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
