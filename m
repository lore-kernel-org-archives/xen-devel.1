From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 43/62] preseed_hook_installscript: Use
 partman/early_command, not preseed/
Date: Wed, 10 Apr 2019 15:23:49 +0100
Message-ID: <20190410142408.22848-44-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAT-0006nP-Sy
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:37 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gaXNvLWJhc2VkIGluc3RhbGxzLCB3aXRoIHN0cmV0Y2gsIHByZXNlZWQvZWFybHlfY29tbWFu
ZCBydW5zIGJlZm9yZQp0aGUgbmV0d29yayBpcyB1cC4gIFRoaXMgY2F1c2VzIHRoZSBpbnN0YWxs
IHRvIGZhaWwuCgpPdXIgZXhpc3RpbmcgY2FsbCBzaXRlcyBhZGQgdGhpbmdzIHRvCiAgIC91c3Iv
bGliL2Jhc2UtaW5zdGFsbGVyLmQvCiAgIC9saWIvcGFydG1hbi9pbml0LmQvCmZvciB3aGljaCB0
aGlzIGlzIHN0aWxsIGVhcmx5IGVub3VnaC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IGY4ZmY0ZjQ2
Li4zYWZlYTYyYiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9E
ZWJpYW4ucG0KQEAgLTE0ODQsMTEgKzE0ODQsMTIgQEAgc3ViIHByZXNlZWRfaG9va19jb21tYW5k
ICgkJCQkKSB7CiAKIHN1YiBwcmVzZWVkX2hvb2tfaW5zdGFsbHNjcmlwdCAoJCQkJCQpIHsKICAg
ICBteSAoJGhvLCAkc2Z4LCAkaW5zdGFsbGVyX2RpciwgJGluc3RhbGxlcl9sZWFmLCAkZGF0YSkg
PSBAXzsKKyAgICAjIHRoZSBzcGVjaWZpZWQgc2NyaXB0IGlzIGluc3RhbGxlZCB2aWEgcGFydG1h
bi9lYXJseV9jb21tYW5kCiAgICAgbXkgJGluc3RhbGxlcl9wYXRobmFtZT0gIiRpbnN0YWxsZXJf
ZGlyLyRpbnN0YWxsZXJfbGVhZiI7CiAgICAgbXkgJHVybGZpbGU9ICRpbnN0YWxsZXJfcGF0aG5h
bWU7CiAgICAgJHVybGZpbGUgPX4gcy9bXi1fMC05YS16XS8gc3ByaW50ZiAiWCUwMngiLCBvcmQo
JCYpIC9nZTsKICAgICBteSAkdXJsPSBjcmVhdGVfd2ViZmlsZSgkaG8sICR1cmxmaWxlLCAkZGF0
YSk7Ci0gICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnZWFybHlfY29tbWFuZCcsICRzZngs
IDw8RU5EKTsKKyAgICBwcmVzZWVkX2hvb2tfY29tbWFuZCgkaG8sICdwYXJ0bWFuL2Vhcmx5X2Nv
bW1hbmQnLCAkc2Z4LCA8PEVORCk7CiAjIS9iaW4vc2gKIHNldCAtZXgKIG1rZGlyIC1wICckaW5z
dGFsbGVyX2RpcicKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
