From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] x86: (command line option to) avoid use
 of secondary hyper-threads
Date: Thu, 12 Jul 2018 16:45:39 +0100
Message-ID: <55886b2f-e5bb-c2c5-b6e5-a5d0c898b876@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F3C702000078001D316D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+/yn=j4=citrix.com=prvs=7248936b7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fde11-0006nA-2S
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 16:00:23 +0000
In-Reply-To: <5B45F3C702000078001D316D@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTM6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFNoYXJlZCByZXNvdXJjZXMg
KEwxIGNhY2hlIGFuZCBUTEIgaW4gcGFydGljdWxhcikgcHJlc2VudCBhIHJpc2sgb2YKPiBpbmZv
cm1hdGlvbiBsZWFrIHZpYSBzaWRlIGNoYW5uZWxzLiBEb24ndCB1c2UgaHlwZXJ0aHJlYWRzIGlu
IHN1Y2gKPiBjYXNlcywgYnV0IGFsbG93IGluZGVwZW5kZW50IGNvbnRyb2wgb2YgdGhlaXIgdXNl
IGF0IHRoZSBzYW1lIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gLS0tCj4gQW4gb3B0aW9uIHRvIGF2b2lkIHRoZSB1cC9kb3duIGN5Y2xl
IHdvdWxkIGJlIHRvIGF2b2lkIGNsZWFyaW5nIHRoZQo+IHNpYmxpbmcgKGFuZCB0aGVuIHBlcmhh
cHMgYWxzbyBjb3JlKSBtYXAgb2YgcGFya2VkIENQVXMsIGFsbG93aW5nIHRvCj4gYmFpbCBlYXJs
eSBmcm9tIGNwdV91cF9oZWxwZXIoKS4KPgo+IFRCRDogSG93IHRvIHByZXZlbnQgdGhlIENQVSBm
cm9tIHRyYW5zaWVudGx5IGJlY29taW5nIGF2YWlsYWJsZSBmb3IKPiAgICAgIHNjaGVkdWxpbmcg
d2hlbiBiZWluZyBvbmxpbmVkIGF0IHJ1bnRpbWU/CgpUaGlzIGxvb2tzIGxpa2UgYW4gYXJndW1l
bnQgZm9yIGNhbmNlbGxpbmcgYXQgY2FsbC1pbiB0aW1lLCBubz8KCj4gLS0tIGEvZG9jcy9taXNj
L3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KPiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5tYXJrZG93bgo+IEBAIC0xMDQwLDYgKzEwNDAsMTMgQEAgaWRlbnRpY2FsIHRvIHRoZSBi
b290IENQVSB3aWxsIGJlIHBhcmtlZAo+ICAjIyMgaHBldGJyb2FkY2FzdCAoeDg2KQo+ICA+IGA9
IDxib29sZWFuPmAKPiAgCj4gKyMjIyBodCAoeDg2KQoKSSdkIHN1Z2dlc3Qgc210IHJhdGhlciB0
aGFuIGh0IGhlcmUuwqAgU01UIGlzIHRoZSB0ZWNobmljYWwgdGVybSwgd2hpbGUKSFQgaXMgSW50
ZWwncyBtYXJrZXRpbmcgbmFtZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
