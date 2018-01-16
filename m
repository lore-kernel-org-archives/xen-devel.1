From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 16:05:14 +0000
Message-ID: <2899d9ee-c261-77f2-a2c8-ddde57a35ade@citrix.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5E2574020000780019F27A@prv-mh.provo.novell.com>
 <5A5E26A0020000780019F28C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3dza=el=citrix.com=prvs=547832a6c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ebU8d-00061B-UW
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 16:31:03 +0000
In-Reply-To: <5A5E26A0020000780019F28C@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMTggMTU6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYveDg2XzY0L3BhZ2UuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0
L3BhZ2UuaAo+IEBAIC0yNCw4ICsyNCw4IEBACj4gIC8qIFRoZXNlIGFyZSBhcmNoaXRlY3R1cmFs
IGxpbWl0cy4gQ3VycmVudCBDUFVzIHN1cHBvcnQgb25seSA0MC1iaXQgcGh5cy4gKi8KPiAgI2Rl
ZmluZSBQQUREUl9CSVRTICAgICAgICAgICAgICA1Mgo+ICAjZGVmaW5lIFZBRERSX0JJVFMgICAg
ICAgICAgICAgIDQ4Cj4gLSNkZWZpbmUgUEFERFJfTUFTSyAgICAgICAgICAgICAgKCgxVUwgPDwg
UEFERFJfQklUUyktMSkKPiAtI2RlZmluZSBWQUREUl9NQVNLICAgICAgICAgICAgICAoKDFVTCA8
PCBWQUREUl9CSVRTKS0xKQo+ICsjZGVmaW5lIFBBRERSX01BU0sgICAgICAgICAgICAgICgoX0FD
KDEsVUwpIDw8IFBBRERSX0JJVFMpLTEpCj4gKyNkZWZpbmUgVkFERFJfTUFTSyAgICAgICAgICAg
ICAgKChfQUMoMSxVTCkgPDwgVkFERFJfQklUUyktMSkKClNvcnJ5IHRvIG9ubHkgbm90aWNlIHRo
ZXNlIG5vdywgYnV0IHNwYWNlcyBhcyB5b3UncmUgYWRqdXN0aW5nIHRoZXNlLgoKUmV2aWV3ZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+ICAKPiAgI2Rl
ZmluZSBWQUREUl9UT1BfQklUICAgICAgICAgICAoMVVMIDw8IChWQUREUl9CSVRTIC0gMSkpCj4g
ICNkZWZpbmUgQ0FOT05JQ0FMX01BU0sgICAgICAgICAgKH4wVUwgJiB+VkFERFJfTUFTSykKPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
