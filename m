From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Wed, 10 Apr 2019 12:20:27 +0100
Message-ID: <4382b3ef-83e3-472d-0713-152a6192de6f@citrix.com>
References: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
 <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+PC=SM=citrix.com=prvs=996a3bdca=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEBHQ-0006LQ-8c
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:20:36 +0000
In-Reply-To: <2930e42d-5ba2-abb7-0dd7-c9dabfc7ddfe@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xMC8xOSAxMjoxMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wNC8yMDE5
IDExOjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUg
YW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IEkgd29uZGVyIHdoZXRoZXIgbWVt
X3NoYXJpbmdfaW5pdCgpIHNob3VsZG4ndCBnbyBhd2F5IGFsdG9nZXRoZXIgdGhlbi4KPiAKPiBJ
IHZvdGUgZm9yIHJlbW92aW5nIGl0IGNvbXBsZXRlbHkuwqAgVGhlIHByaW50ayBpcyBhIG91dC1v
Zi1jaGFyYWN0ZXIKPiBjb21wYXJlZCB0byBvdGhlciBzdWJzeXN0ZW1zIGluIFhlbi4KCisxCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
