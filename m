From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 01/12] VMX: reduce number of
 posted-interrupt hooks
Date: Thu, 30 Aug 2018 01:41:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912E120E@SHSMSX101.ccr.corp.intel.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
 <5B86A6BC02000078001E311D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bxg0=ln=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fvBy1-0004bk-RF
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 01:41:49 +0000
In-Reply-To: <5B86A6BC02000078001E311D@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgQXVndXN0IDI5LCAyMDE4IDk6NTkgUE0KPiAKPiBUaHJlZSBvZiB0aGUgZm91ciBo
b29rcyBhcmUgbm90IGV4cG9zZWQgb3V0c2lkZSBvZiB2bXguYywgYW5kIGFsbCBvZgo+IHRoZW0g
aGF2ZSBvbmx5IGEgc2luZ2xlIHBvc3NpYmxlIG5vbi1OVUxMIHZhbHVlLiBTbyB0aGVyZSdzIG5v
IHJlYXNvbiB0bwo+IHVzZSBob29rcyBoZXJlIC0gYSBzaW1wbGUgc2V0IG9mIGZsYWcgaW5kaWNh
dG9ycyBpcyBzdWZmaWNpZW50IChhbmQgd2UKPiBkb24ndCBldmVuIG5lZWQgYSBmbGFnIGZvciB0
aGUgVk0gZW50cnkgb25lLCBhcyBpdCdzIGFsd2F5cwo+IChkZS0pYWN0aXZhdGVkIHRvZ2V0aGVy
IHRoZSB0aGUgdkNQVSBibG9ja2luZyBob29rLCB3aGljaCBuZWVkcyB0bwo+IHJlbWFpbiBhbiBh
Y3R1YWwgZnVuY3Rpb24gcG9pbnRlcikuIFRoaXMgaXMgdGhlIG1vcmUgdGhhdCB3aXRoIHRoZQo+
IFNwZWN0cmUgdjIgd29ya2Fyb3VuZHMgaW5kaXJlY3QgY2FsbHMgaGF2ZSBiZWNvbWUgbW9yZSBl
eHBlbnNpdmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
