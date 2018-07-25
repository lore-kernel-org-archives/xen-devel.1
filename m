From: Juergen Gross <jgross@suse.com>
Subject: Xen 4.12 release planning
Date: Wed, 25 Jul 2018 09:19:21 +0200
Message-ID: <6a766b09-d5fe-a9ce-cacf-546c998ab803@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sdpf=kj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fiE50-0006Mg-T9
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 07:19:26 +0000
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F495ADEF
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 07:19:23 +0000 (UTC)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SXRzIHRpbWUgdG8gcGxhbiB0aGUgWGVuIDQuMTIgcmVsZWFzZSBkYXRlcy4KClRoZXJlIGhhdmUg
YmVlbiBjb25jZXJucyB3aXRoIHRoZSBzY2hlZHVsZSBvZiA2IG1vbnRocyBiZXR3ZWVuIHJlbGVh
c2VzLAphcyB0aGlzIHNjaGVtZSBpcyBsZWFkaW5nIHRvIHRvbyBtYW55IHN1cHBvcnRlZCB2ZXJz
aW9ucyBvZiBYZW4gYXQgYQp0aW1lLiBUaGUgbmVlZGVkIHJlc291cmNlcyB0byBiYWNrcG9ydCBi
dWcgZml4ZXMgYW5kIHNlY3VyaXR5IGZpeGVzIGFzCndlbGwgYXMgZG9pbmcgdGhlIHRlc3RzIGZv
ciBhbGwgdGhvc2UgcmVsZWFzZXMgYXJlIGEgbGltaXRpbmcgZmFjdG9yIHRvCnB1c2ggb3V0IHRo
ZSBjdXJyZW50IG1haW4gcmVsZWFzZSBhcyB3ZWxsIGFzIHBvaW50IHJlbGVhc2VzIG9uIHRpbWUu
CgpBZnRlciBzb21lIGRpc2N1c3Npb25zIGF0IHRoZSBYZW4gZGV2ZWxvcGVyIHN1bW1pdCwgb24g
eGVuLWRldmVsIGFuZApiZXR3ZWVuIHRoZSBjb21taXR0ZXJzIGEgc2xpZ2h0bHkgbG9uZ2VyIHJl
bGVhc2UgY3ljbGUgb2YgOCBvciA5IG1vbnRocwp3YXMgc3VnZ2VzdGVkLgoKV2l0aCAxOCBtb250
aHMgb2YgZnVsbCBzdXBwb3J0IGFuZCAzNiBtb250aHMgb2Ygc2VjdXJpdHkgc3VwcG9ydCB0aGUK
bnVtYmVyIG9mIGNvbmN1cnJlbnQgc3VwcG9ydGVkIHJlbGVhc2VzIHdpbGwgYmUgdGhlIHNhbWUg
d2l0aCBlaXRoZXIgOApvciA5IG1vbnRocyByZWxlYXNlIGN5Y2xlcywgc28gSSBoYXZlIGNob3Nl
biBhbiA4IG1vbnRoIGN5Y2xlIGZvciBub3cuCkhhdmluZyBvbmx5IDMgcG9zc2libGUgdGltZXMg
aW4gdGhlIHllYXIgZm9yIGEgcmVsZWFzZSB3aWxsIG1ha2UgaXQKZWFzaWVyIHRvIGF2b2lkIG1h
am9yIGhvbGlkYXkgc2Vhc29ucy4KCkluIGNhc2UgdGhlcmUgaXMgbm8gb2JqZWN0aW9uIEknbSBw
bGFubmluZyBYZW4gNC4xMiB3aXRoOgoKKiBMYXN0IHBvc3RpbmcgZGF0ZTogRGVjZW1iZXIgMTR0
aCwgMjAxOAoqIEhhcmQgY29kZSBmcmVlemU6IEphbnVhcnkgMTF0aCwgMjAxOQoqIFJlbGVhc2U6
IE1hcmNoIDd0aCwgMjAxOQoKUmVsZWFzZSBvZiBYZW4gNC4xMyB3b3VsZCB0aGVuIGJlIGVhcmx5
IE5vdmVtYmVyIDIwMTksIDQuMTQgYXQgZWFybHkKSnVseSAyMDIwLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
