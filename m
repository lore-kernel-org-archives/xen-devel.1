From: Julien Grall <julien.grall@arm.com>
Subject: struct vcpu_guest_core_reg stable ABI?
Date: Wed, 15 May 2019 20:58:09 +0100
Message-ID: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9wX=TP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hR02Y-000224-0B
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 19:58:14 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKSXQgbG9va3MgbGlrZSB0aGUgc3RydWN0dXJlcyB2Y3B1X2d1ZXN0X2NvcmVfcmVn
cyBhbmQgdmNwdV9ndWVzdF9jb250ZXh0IApkb2VzIG5vdCBjb3JyZWN0bHkgcmVmbGVjdCB0aGUg
QUFyY2g2NCBzdGF0ZS4gRm9yIGluc3RhbmNlLCBhbGwgQXJtNjQgCnN5c3RlbSByZWdpc3RlcnMg
KGUuZyBzY3RsciwgY3Bzciwgc3Bzcl9lbDEpIHNob3VsZCBiZSA2NC1iaXQgd2lkZSBub3QgCjMy
LWJpdCB3aWRlLgoKT24gQVJNdjguMCwgc29tZSBvZiB0aGUgcmVnaXN0ZXJzIGhhdmUgb25seSB0
aGUgbG93IDMyLWJpdCBkZWZpbmVkLCB0aGUgCnJlc3QgaXMgUkVTMC4gUkVTMCBvbmx5IG1lYW5z
IHRoZXkgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgdXNlLCBpdCBkb2VzIApub3QgbWVhbiB0aGV5
IGNhbiBiZSBpZ25vcmVkLiBOZXdlciByZXZpc2lvbiAoc3VjaCBhcyBBUk12OC4wLVNTQlMpIAph
Y3R1YWxseSBiZWdhbiB0byBkZWZpbmUgYml0IGluIHRoZSB0b3AgMzItYml0LgoKVGhpcyBtZWFu
cyB0aGF0IHRoZSBzdHJ1Y3R1cmVzIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGFuZCAKdmNwdV9ndWVz
dF9jb250ZXh0IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHN0b3JlIHRoZSB0b3AgMzItYml0IGFuZCAK
dGhlcmVmb3JlIG1pc3JlcHJlc2VudGluZyB0aGUgaGFyZHdhcmUuCgogRnJvbSBteSB1bmRlcnN0
YW5kaW5nLCB2Y3B1X2d1ZXN0X2NvbnRleHQgaXMgZGVmaW5lZCBiZXR3ZWVuIHRoZSB0b29scyAK
YW5kIFhlbi4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gbW9kaWZ5IGl0IHdpdGhvdXQgY2Fy
aW5nIG9uIGJhY2t3YXJkIApjb21wYXRpYmx5LgoKSG93ZXJ2ZXIsIHN0cnVjdCB2Y3B1X2d1ZXN0
X2NvcmVfcmVnIHNlZW1zIHRvIGJlIG91dHNpZGUgb2YgdGhlICNpZmRlZi4gClNvIEkgYXNzdW1l
IGl0IGlzIHBhcnQgb2YgdGhlIHN0YWJsZSBBQkkuIEFtIEkgY29ycmVjdD8KCkRvIHlvdSBoYXZl
IGFueSBzdWdnZXN0aW9uIGhvdyB0aGlzIGNvdWxkIHNhZmVseSBiZSBleHRlbmRlZD8KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
