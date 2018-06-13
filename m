From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 07/17] sg-run-job: Allow flight to
 specify recipe flag to disable migr tests
Date: Wed, 13 Jun 2018 14:03:52 +0100
Message-ID: <1528895042-14113-8-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rg-0005Kv-D9
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:16 +0000
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

V2Ugd2FudCB0aGlzIGJlY2F1c2UgdGhlcmUgaXMgbm8gc2Vuc2libGUgd2F5IHRvIHByb2JlIHdo
ZXRoZXIgYQpyZXN0cmljdGVkIHFlbXUgY2FuIGNvcGUgd2l0aCBzYXZlL3Jlc3RvcmUgb3IgbWln
cmF0aW9uLiAgU28gd2Ugd2lsbAp3YW50IHRvIGRpc2FibGUgaXQgaW4gZmxpZ2h0IGNvbnN0cnVj
dGlvbiAoZGVwZW5kaW5nIG9uIFhlbiB2ZXJzaW9uLApldmVudHVhbGx5KS4KClNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHNnLXJ1bi1q
b2IgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3NnLXJ1bi1qb2IgYi9zZy1ydW4tam9iCmluZGV4IDEzNTU4NzYuLjk2NWU1NWQgMTAwNzU1Ci0t
LSBhL3NnLXJ1bi1qb2IKKysrIGIvc2ctcnVuLWpvYgpAQCAtNTkxLDYgKzU5MSw5IEBAIHByb2Mg
cnVuLWpvYi90ZXN0LWxpdmVwYXRjaCB7fSB7CiB9CiAKIHByb2MgdGVzdC1ndWVzdC1taWdyIHtn
fSB7CisgICAgIyBndWVzdCBpcyBleHBlY3RlZCB0byBiZSBydW5uaW5nIGFuZCByZW1haW5zIHNv
CisgICAgaWYge1tyZWNpcGUtZmxhZyBub21pZ3JhdGVdfSByZXR1cm4KKwogICAgIHNldCB0b19y
ZWFwIFtzcGF3bi10cyAuID0gdHMtbWlncmF0ZS1zdXBwb3J0LWNoZWNrICsgaG9zdCAkZyAxXQog
ICAgIHNldCBjYW5fbWlncmF0ZSBbcmVhcC10cyAkdG9fcmVhcF0KICAgICBzZXQgdG9fcmVhcCBb
c3Bhd24tdHMgLiA9IHRzLXNhdmVyZXN0b3JlLXN1cHBvcnQtY2hlY2sgKyBob3N0ICRnXQotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
