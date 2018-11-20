From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] automation: fix debian-{stretch,
 unstable}-32-gcc-debug
Date: Tue, 20 Nov 2018 14:16:32 +0000
Message-ID: <41b71c49-a808-fe01-ee25-b1cc815f6838@citrix.com>
References: <20181120141002.30222-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwHA=N7=citrix.com=prvs=8552da0fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gP6q8-0002ri-FE
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 14:17:20 +0000
In-Reply-To: <20181120141002.30222-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTEvMjAxOCAxNDoxMCwgV2VpIExpdSB3cm90ZToKPiBUaGV5IHNob3VsZCBoYXZlIHVz
ZWQgLmdjYy14ODYtMzItYnVpbGQtZGVidWcgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk9vcHMgeWVzIC0gQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+IC0tLQo+IFRo
aXMgcGF0Y2ggaXMgdHJpdmlhbCBzbyBJIGludGVuZCB0byBjb21taXQgaXQgYXMgc29vbiBhcyBw
b3NzaWJsZSB0bwo+IGZpeCBHaXRsYWIgQ0kuCj4gLS0tCj4gIC5naXRsYWItY2kueW1sIHwgNCAr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAo+IGluZGV4IDU2
NzhiNTUyYzQuLjMzNjhmYWQwMTAgMTAwNjQ0Cj4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPiArKysg
Yi8uZ2l0bGFiLWNpLnltbAo+IEBAIC0yMjcsNyArMjI3LDcgQEAgZGViaWFuLXN0cmV0Y2gtMzIt
Z2NjOgo+ICAgICAgQ09OVEFJTkVSOiBkZWJpYW46c3RyZXRjaC1pMzg2Cj4gIAo+ICBkZWJpYW4t
c3RyZXRjaC0zMi1nY2MtZGVidWc6Cj4gLSAgZXh0ZW5kczogLmdjYy14ODYtNjQtYnVpbGQtZGVi
dWcKPiArICBleHRlbmRzOiAuZ2NjLXg4Ni0zMi1idWlsZC1kZWJ1Zwo+ICAgIHZhcmlhYmxlczoK
PiAgICAgIENPTlRBSU5FUjogZGViaWFuOnN0cmV0Y2gtaTM4Ngo+ICAKPiBAQCAtMjc5LDcgKzI3
OSw3IEBAIGRlYmlhbi11bnN0YWJsZS0zMi1nY2M6Cj4gICAgICBDT05UQUlORVI6IGRlYmlhbjp1
bnN0YWJsZS1pMzg2Cj4gIAo+ICBkZWJpYW4tdW5zdGFibGUtMzItZ2NjLWRlYnVnOgo+IC0gIGV4
dGVuZHM6IC5nY2MteDg2LTY0LWJ1aWxkLWRlYnVnCj4gKyAgZXh0ZW5kczogLmdjYy14ODYtMzIt
YnVpbGQtZGVidWcKPiAgICB2YXJpYWJsZXM6Cj4gICAgICBDT05UQUlORVI6IGRlYmlhbjp1bnN0
YWJsZS1pMzg2Cj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
