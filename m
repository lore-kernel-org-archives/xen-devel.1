From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] xentrace: fix xentrace for smt=0
Date: Thu,  4 Oct 2018 12:51:48 +0200
Message-ID: <20181004105150.27923-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vyab=mq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g81Eb-00043P-LP
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 10:51:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George.Dunlap@eu.citrix.com, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBoeXBlcnRocmVhZHMgYXJlIGRpc2FibGVkIHZpYSBzbXQ9MCBYZW4gYm9vdCBwYXJhbWV0
ZXIgeGVudHJhY2UKaXMgbm8gbG9uZ2VyIHdvcmtpbmcsIGJ1dCBjcmFzaGluZyB0aGUgc3lzdGVt
LgoKUGF0Y2ggMSBtYWtlcyB0aGUgeGVudHJhY2UgdXNlciB0b29sIHdvcmsgb24gc3lzdGVtcyB3
aGVuIG5vdCBhbGwKcG9zc2libGUgY3B1IGlkcyBoYXZlIGFuIGFzc29jaWF0ZWQgdHJhY2UgYnVm
ZmVyIGFsbG9jYXRlZC4KClBhdGNoIDIgY29ycmVjdHMgeGVudHJhY2UgaGFuZGxpbmcgYnkgc2l6
aW5nIHRoZSBjb250cm9sIHN0cnVjdHVyZXMKYWNjb3JkaW5nIHRvIHRoZSBwaHlzaWNhbCBjcHVz
IGluc3RlYWQgb2YgdGFraW5nIG9ubGluZSBjcHVzIGludG8KYWNjb3VudCBvbmx5LgoKSnVlcmdl
biBHcm9zcyAoMik6CiAgeGVudHJhY2U6IGFsbG93IHNwYXJzZSBjcHUgbGlzdAogIHhlbnRyYWNl
OiBoYW5kbGUgc3BhcnNlIGNwdSBpZHMgY29ycmVjdGx5IGluIHhlbiB0cmFjZSBidWZmZXIgaGFu
ZGxpbmcKCiB0b29scy94ZW50cmFjZS94ZW50cmFjZS5jIHwgMTggKysrKysrKysrKysrLS0tLS0t
CiB4ZW4vY29tbW9uL3RyYWNlLmMgICAgICAgIHwgIDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
