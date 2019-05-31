From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 5.2-rc3
Date: Fri, 31 May 2019 15:56:03 +0200
Message-ID: <20190531135603.3403-1-jgross__8840.25488501123$1559311025$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWi0x-0003Xh-Jc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:56:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjJiLXJjMy10YWcKCnhlbjogZml4ZXMgZm9yIDUuMi1yYzMKCkl0IGNvbnRhaW5zIG9uZSBtaW5v
ciBjbGVhbnVwIHBhdGNoIGFuZCBhIGZpeCBmb3IgaGFuZGxpbmcgb2YgbGl2ZQptaWdyYXRpb24g
d2hlbiBydW5uaW5nIGFzIFhlbiBndWVzdC4KClRoYW5rcy4KCkp1ZXJnZW4KCiBkcml2ZXJzL3hl
bi9wdmNhbGxzLWZyb250LmMgICAgICAgICAgICAgIHwgIDQgLS0tLQogZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1cy5oICAgICAgICAgICAgICB8ICAzICsrKwogZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19kZXZfZnJvbnRlbmQuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c194cy5jICAgICAgICAgICB8ICA3ICsrKysrLS0KIDQgZmlsZXMgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKClJvc3MgTGFnZXJ3YWxsICgxKToK
ICAgICAgeGVuYnVzOiBBdm9pZCBkZWFkbG9jayBkdXJpbmcgc3VzcGVuZCBkdWUgdG8gb3BlbiB0
cmFuc2FjdGlvbnMKCll1ZUhhaWJpbmcgKDEpOgogICAgICB4ZW4vcHZjYWxsczogUmVtb3ZlIHNl
dCBidXQgbm90IHVzZWQgdmFyaWFibGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
