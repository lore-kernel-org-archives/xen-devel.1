From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/17] sg-run-job: Provide new
 recipe-flag facility
Date: Wed, 13 Jun 2018 14:03:51 +0100
Message-ID: <1528895042-14113-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rf-0005Kk-5s
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:15 +0000
In-Reply-To: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5kaXZpZHVhbCByZWNpcGVzIGNhbiBub3cgaG9ub3VyIG1vZGlmaWNhdGlvbnMgcmVxdWVzdGVk
IGJ5IHNldHRpbmcKcnVudmFycyBsaWtlIHJlY2lwZV88ZmxhZz4uCgpObyBjYWxsZXJzIHlldCBz
byBubyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4u
SmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHNnLXJ1bi1qb2IgfCA3ICsrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zZy1ydW4tam9iIGIvc2ct
cnVuLWpvYgppbmRleCAwYTNmNjg4Li4xMzU1ODc2IDEwMDc1NQotLS0gYS9zZy1ydW4tam9iCisr
KyBiL3NnLXJ1bi1qb2IKQEAgLTE2MCw2ICsxNjAsMTMgQEAgcHJvYyB0ZXN0aWRfbWF0Y2hlc19n
bG9icyB7dGVzdGlkIGdsb2JzfSB7CiAgICAgcmV0dXJuIDAKIH0KIAorcHJvYyByZWNpcGUtZmxh
ZyB7ZmxhZ25hbWUge2RlZiAwfX0geworICAgIGdsb2JhbCBmbGlnaHQgam9iaW5mbworICAgIHNl
dCBuYW1lICJyZWNpcGVfJGZsYWduYW1lIgorICAgIHNldCB2YWwgW2pvYmRiOjpyZWFkLXJ1bnZh
ciAkZmxpZ2h0ICRqb2JpbmZvKGpvYikgJG5hbWUgJGRlZl0KKyAgICByZXR1cm4gW3JlZ2V4cCB7
dHJ1ZXx5fDF9ICR2YWxdCit9CisKICMtLS0tLS0tLS0tIHRlc3Qgc2NyaXB0IGhhbmRsaW5nIC0t
LS0tLS0tLS0KIAogIyAgIHNwd2FuLXRzICAgIElGRkFJTCBURVNUSUQgU0NSSVBULUFSR1MuLi4K
LS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
