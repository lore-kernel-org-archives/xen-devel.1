From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 03/14] x86emul: abstract out XCRn accesses
Date: Tue, 20 Mar 2018 17:22:38 +0000
Message-ID: <179fec1d-9153-5925-7e01-33a3785817d7@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zndv=gk=citrix.com=prvs=610f4a706=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eyL1F-0007UQ-11
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 17:25:53 +0000
In-Reply-To: <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTUvMjAxOCAwMTowNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNlIGhvb2tzLCBq
dXN0IGxpa2UgZG9uZSBmb3Igb3RoZXIgc3BlY2lhbCBwdXJwb3NlIHJlZ2lzdGVycy4KPiAKPiBU
aGlzIGluY2x1ZGVzIG1vdmluZyBYQ1IwIGNoZWNrcyBmcm9tIGh2bWVtdWxfZ2V0X2ZwdSgpIHRv
IHRoZSBlbXVsYXRvcgo+IGl0c2VsZiBhcyB3ZWxsIGFzIGFkZGluZyBzdXBwb3J0IGZvciBYR0VU
QlYgZW11bGF0aW9uLgo+IAo+IEZvciBub3cgZnV6emVyIHJlYWRzIHdpbGwgb2J0YWluIHRoZSBy
ZWFsIHZhbHVlcyAobWludXMgdGhlIGZ1enppbmcgb2YKPiB0aGUgaG9vayBwb2ludGVyIGl0c2Vs
ZikuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
VHJhY2luZyBwYXJ0czoKClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
