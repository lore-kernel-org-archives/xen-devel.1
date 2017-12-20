From: Kevin Stange <kevin@steadfast.net>
Subject: PCI Device Subtree Change from Traditional to Upstream
Date: Wed, 20 Dec 2017 11:40:03 -0600
Message-ID: <c8ed6851-70c1-500d-5d66-1e8a6b7133c5@steadfast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6grp=dq=steadfast.net=kevin@srs-us1.protection.inumbo.net>)
 id 1eRiLm-0001I8-6h
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 17:40:14 +0000
Received: from staffmx.steadfast.net (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTPS id 8533314800D6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 11:40:10 -0600 (CST)
Received: from localhost (localhost [IPv6:::1])
 by staffmx.steadfast.net (Postfix) with ESMTP id 6CF1A14800C2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 11:40:10 -0600 (CST)
Received: from staffmx.steadfast.net ([IPv6:::1])
 by localhost (staffmx.steadfast.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id Qcc6dGepgOYZ for <xen-devel@lists.xenproject.org>;
 Wed, 20 Dec 2017 11:40:10 -0600 (CST)
Received: from ziyal.office.steadfast.net (unknown [10.254.4.33])
 by staffmx.steadfast.net (Postfix) with ESMTPSA id 554CD14800C0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 11:40:10 -0600 (CST)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpJJ3ZlIGJlZW4gd29ya2luZyBvbiB0cmFuc2l0aW9uaW5nIGEgbnVtYmVyIG9mIFdpbmRv
d3MgZ3Vlc3RzIHVuZGVyIEhWTQpmcm9tIHVzaW5nIFFFTVUgdHJhZGl0aW9uYWwgdG8gUUVNVSB1
cHN0cmVhbSBhcyBpcyByZWNvbW1lbmRlZCBpbiB0aGUKZG9jdW1lbnRhdGlvbi4gIFdoZW4gSSBt
b3ZlIHRoZXNlIGd1ZXN0cywgdGhlIFBDSSBzdWJ0cmVlIGZvciBYZW4KZGV2aWNlcyBjaGFuZ2Vz
IGFuZCBXaW5kb3dzIGNyZWF0ZXMgYSB0b3RhbGx5IG5ldyBjb3B5IG9mIGVhY2ggZGV2aWNlLgpX
aW5kb3dzIHRyYWNrcyBkb3duIHRoZSBzdG9yYWdlIHdpdGhvdXQgaXNzdWUsIGJ1dCBpdCB0cmVh
dHMgdGhlIG5ldwppbnN0YW5jZSBvZiB0aGUgTklDIGRyaXZlciBhcyBhIG5ldyBkZXZpY2UgYW5k
IGNsZWFycyB0aGUgbmV0d29yawpjb25maWd1cmF0aW9uIGV2ZW4gdGhvdWdoIHRoZSBNQUMgYWRk
cmVzcyBpcyB1bmNoYW5nZWQuICBNYW51YWxseQpib290aW5nIHRoZSBndWVzdCBiYWNrIG9uIHRo
ZSB0cmFkaXRpb25hbCBkZXZpY2UgbW9kZWwgcmVhY3RpdmF0ZXMgdGhlCm9yaWdpbmFsIFBDSSBz
dWJ0cmVlIGFuZCB0aGUgb2xkIG5ldHdvcmsgY29uZmlndXJhdGlvbiB3aXRoIGl0LgoKVGhlIG9u
bHkgdGhpbmcgdGhhdCBJIGhhdmUgYmVlbiBhYmxlIHRvIGZpbmQgdGhhdCdzIHN1YnN0YW50aWFs
bHkKZGlmZmVyZW50IGNvbXBhcmluZyB0aGUgZGV2aWNlIHRyZWVzIGlzIHRoYXQgdGhlIGRldmlj
ZSBpbnN0YW5jZSBJRAp2YWx1ZXMgZGlmZmVyIG9uIHRoZSBwYXJlbnQgWGVuIFBDSSBkZXZpY2U6
CgpQQ0lcVkVOXzU4NTMmREVWXzAwMDEmU1VCU1lTXzAwMDE1ODUzJlJFVl8wMVwzJjI2N0E2MTZB
JjMmMTgKClBDSVxWRU5fNTg1MyZERVZfMDAwMSZTVUJTWVNfMDAwMTU4NTMmUkVWXzAxXDMmMjY3
QTYxNkEmMyYxMAoKQmVzaWRlcyBhY3R1YWxseSBzZXR0aW5nIHRoZSBndWVzdCB0byBib290IHVz
aW5nIFFFTVUgdHJhZGl0aW9uYWwsIGlzCnRoZXJlIGEgd2F5IHRvIGNvbnZpbmNlIFdpbmRvd3Mg
dG8gdHJlYXQgdGhlc2UgZGV2aWNlcyBhcyB0aGUgc2FtZT8gIEEKcGF0Y2gtYmFzZWQgc29sdXRp
b24gd291bGQgYmUgYWNjZXB0YWJsZSB0byBtZSBpZiB0aGVyZSBpcyBvbmUsIGJ1dCBJCmRvbid0
IHVuZGVyc3RhbmQgdGhlIGNvZGUgd2VsbCBlbm91Z2ggdG8gY3JlYXRlIG15IG93biBzb2x1dGlv
bi4KCi0tIApLZXZpbiBTdGFuZ2UKQ2hpZWYgVGVjaG5vbG9neSBPZmZpY2VyClN0ZWFkZmFzdCB8
IE1hbmFnZWQgSW5mcmFzdHJ1Y3R1cmUsIERhdGFjZW50ZXIgYW5kIENsb3VkIFNlcnZpY2VzCjgw
MCBTIFdlbGxzLCBTdWl0ZSAxOTAgfCBDaGljYWdvLCBJTCA2MDYwNwozMTIuNjAyLjI2ODkgWDIw
MyB8IEZheDogMzEyLjYwMi4yNjg4CmtldmluQHN0ZWFkZmFzdC5uZXQgfCB3d3cuc3RlYWRmYXN0
Lm5ldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
