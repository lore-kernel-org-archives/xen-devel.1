From: "msd+xen-devel@msd.im" <msd+xen-devel@msd.im>
Subject: I only see one CPU core on Xen when booted via grub
Date: Mon, 22 Jan 2018 18:28:17 +0100
Message-ID: <2766a680-8c00-f281-494f-3f62eff9d68d@msd.im>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dkkz=er=msd.im=msd+xen-devel@srs-us1.protection.inumbo.net>)
 id 1edftT-0001UZ-5Y
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 17:28:27 +0000
Received: from [10.59.118.51] (wam59-2-88-189-137-202.fbx.proxad.net
 [88.189.137.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by msd.im (Postfix) with ESMTPSA id 9AF54200A1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2018 18:28:17 +0100 (CET)
Content-Language: fr
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

SGksCgpJIG9ubHkgc2VlIDEgQ1BVIGNvcmUgb24gWGVuIDQuOSB3aGVuIGJvb3RlZCB2aWEgZ3J1
YiBpbnN0ZWFkIG9mIDguCgpJdCdzIG1heSBiZSByZWxhdGVkIHRvIDoKLSBodHRwczovL2J1Z3Mu
ZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTgyMDgwNwotIGh0dHBzOi8veGVu
cHJvamVjdC5hdGxhc3NpYW4ubmV0L2Jyb3dzZS9YRU4tNDIKCkl0IGlzIHRoZSBmaXJzdCBzZXJ2
ZXIgb24gd2hpY2ggSSBoYXZlIHRoaXMgcHJvYmxlbS4KCkkgY2FuIGNvbmZpcm0gdGhhdCA6Ci0g
aWYgSSBib290IERlYmlhbiB0aHJvdWd0IGdydWIsIEkgc2VlIHRoZSA4IGNvcmVzCi0gaWYgSSBi
b290IFhlbiB0aHJvdWdoIGdydWIsIEkgb25seSBzZWUgX29uZV8gY29yZQotIGlmIEkgYm9vdCBY
ZW4gZGlyZWN0bHkgdGhyb3VnaCBFRkkgKHVzaW5nIGBlZmlib290bWdyYCksIEkgc2VlIHRoZSA4
IGNvcmVzCgoxLiBEbyB5b3Uga25vdyB3aGF0IGhhcHBlbnMgPwoyLiBEbyB5b3UgbmVlZCBzb21l
IGxvZ3MgPwoKUmVnYXJkcywKCgpHdWlsbGF1bWUKCgojIGNhdCAvcHJvYy9jcHVpbmZvCm1vZGVs
IG5hbWUgICAgICA6IEludGVsKFIpIFhlb24oUikgQ1BVIEUzLTEyNzAgdjYgQCAzLjgwR0h6Cm1p
Y3JvY29kZSAgICAgICA6IDB4NWUKZmxhZ3MgICAgICAgICAgIDogZnB1IGRlIHRzYyBtc3IgcGFl
IG1jZSBjeDggYXBpYyBzZXAgbWNhIGNtb3YgcGF0IApjbGZsdXNoIGFjcGkgbW14IGZ4c3Igc3Nl
IHNzZTIgaHQgc3lzY2FsbCBueCBsbSBjb25zdGFudF90c2MgCmFyY2hfcGVyZm1vbiByZXBfZ29v
ZCBub3BsIG5vbnN0b3BfdHNjIGVhZ2VyZnB1IHBuaSBwY2xtdWxxZHEgbW9uaXRvciAKZXN0IHNz
c2UzIGZtYSBjeDE2IHNzZTRfMSBzc2U0XzIgbW92YmUgcG9wY250IGFlcyB4c2F2ZSBhdnggZjE2
YyByZHJhbmQgCmh5cGVydmlzb3IgbGFoZl9sbSBhYm0gM2Rub3dwcmVmZXRjaCBlcGIgZnNnc2Jh
c2UgYm1pMSBobGUgYXZ4MiBibWkyIAplcm1zIHJ0bSByZHNlZWQgYWR4IGNsZmx1c2hvcHQgeHNh
dmVvcHQgeHNhdmVjIHhnZXRidjEgZHRoZXJtIGlkYSBhcmF0IApwbG4gcHRzIGh3cCBod3Bfbm90
aWZ5IGh3cF9hY3Rfd2luZG93IGh3cF9lcHAKCiMgeGwgaW5mbwpyZWxlYXNlICAgICAgICAgICAg
ICAgIDogNC45LjAtNS1hbWQ2NAp2ZXJzaW9uICAgICAgICAgICAgICAgIDogIzEgU01QIERlYmlh
biA0LjkuNjUtMytkZWI5dTIgKDIwMTgtMDEtMDQpCnhlbl92ZXJzaW9uICAgICAgICAgICAgOiA0
LjguMy1wcmUKCiMgY2F0IC9ldGMvZGViaWFuX3ZlcnNpb24KOS4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
