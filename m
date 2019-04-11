From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
Date: Thu, 11 Apr 2019 15:13:23 +0100
Message-ID: <027594a1-b35b-3624-8fe1-10a46301198f@citrix.com>
References: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
 <1554779560-26204-4-git-send-email-igor.druzhinin@citrix.com>
 <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V9MO=SN=citrix.com=prvs=99793e752=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hEaSN-0007Js-Sj
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 14:13:35 +0000
In-Reply-To: <86f64028-46f1-7857-99cb-82f2246d4aa0@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMjAxOSAxNDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wNC8yMDE5
IDA0OjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gWGVuLCBodm1sb2FkZXIgZmlybXdh
cmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxlZCBmb3IKPj4gZW51bWVyYXRlZCBQQ0kg
ZGV2aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+PiBleHBlY3Qg
aXQgdG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUgUENJIEJBUnMgaW4gc2V2ZXJhbCBw
bGFjZXMKPj4gd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2VzIEJBUjY0LCBmb3IgZXhh
bXBsZSwgYmVpbmcKPj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4+Cj4+IEZpeCBpdCBi
eSBkaXNhYmxpbmcgUENJIGFkZHJlc3MgZGVjb2RpbmcgZXhwbGljaXRseSBiZWZvcmUgdGhlCj4+
IGZpcnN0IGF0dGVtcHQgdG8gc2l6ZSBCQVJzIG9uIFhlbi4KPiAKPiBUaGlzIGlzIGFuIEhWTUxv
YWRlciBidWcsIHN1cmVseT8KCkknbGwgdHJ5IHRvIHR1cm4gaXQgb2ZmIGluIEhWTUxvYWRlciBi
dXQgSSdtIG5vdCBzdXJlIG90aGVyIEJJT1NlcyB3b3VsZApsaWtlIGl0LiBBbHRob3VnaCB0aGV5
IHNob3VsZCBub3QgbWFrZSBhbnkgYXNzdW1wdGlvbnMgb24gd2hldGhlciBtZW1vcnkKZGVjb2Rp
bmcgaXMgZW5hYmxlZCBvciBub3QgKHNvIGFzIE9WTUYgLSBoZW5jZSB0aGlzIHBhdGNoKSBpdCdz
IHN0aWxsCnJpc2t5IGZyb20gbXkgcG9pbnQgb2Ygdmlldy4KCklnb3IKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
