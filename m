From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH] VT-d: return full destination ID for
 IO-APIC reads
Date: Wed, 3 Apr 2019 01:02:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9C98C1@SHSMSX104.ccr.corp.intel.com>
References: <5CA35C010200007800223E4C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzZq=SF=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hBUIA-0005kA-Eo
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 01:02:14 +0000
In-Reply-To: <5CA35C010200007800223E4C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDIsIDIwMTkgODo1NyBQTQo+IAo+IEluIHgyQVBJQyBtb2RlIGl0IGlzIDMy
IGJpdHMgd2lkZS4gTm90IGhhdmluZyByZXR1cm5lZCB0aGUgZnVsbCB2YWx1ZQo+IHdhcyBtb3N0
bHkgYmVuaWduOiBXZSBuZXZlciBtb2RpZnkgdGhlIElEIGJhc2VkIG9uIGl0cyBvcmlnaW5hbCB2
YWx1ZTsKPiBmdWxsIG5ldyB2YWx1ZXMgZ2V0IHdyaXR0ZW4gYXQgYWxsIHRpbWVzLiBJdCB3YXMg
Imp1c3QiIGRlYnVnIGxvZ2dpbmcKPiB3aGljaCBlbmRlZCB1cCB3cm9uZyB0aGlzIHdheSAoYW5k
IHdoaWNoIHdpbGwgbmVlZCBhZGp1c3RtZW50IGl0c2VsZiBhcwo+IHdlbGwsIHRvIGFsc28gY29u
c3VtZSB0aGUgZnVsbCB2YWx1ZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
