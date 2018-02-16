From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND v2] mm: don't defer struct page
 initialization for Xen pv guests
Date: Fri, 16 Feb 2018 12:43:57 -0800
Message-ID: <20180216124357.de2cb8fe96c07dea51556adb__7534.95782050795$1518813776$gmane$org@linux-foundation.org>
References: <20180216154101.22865-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ia9n=fk=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1emmrQ-0003uZ-S7
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 20:44:00 +0000
In-Reply-To: <20180216154101.22865-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-mm@kvack.org, mhocko@suse.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNiBGZWIgMjAxOCAxNjo0MTowMSArMDEwMCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOgoKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9wYWdl
X2FsbG9jLmMKPiBAQCAtMzQ3LDYgKzM0Nyw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB1cGRhdGVf
ZGVmZXJfaW5pdChwZ19kYXRhX3QgKnBnZGF0LAo+ICAJLyogQWx3YXlzIHBvcHVsYXRlIGxvdyB6
b25lcyBmb3IgYWRkcmVzcy1jb25zdHJhaW5lZCBhbGxvY2F0aW9ucyAqLwo+ICAJaWYgKHpvbmVf
ZW5kIDwgcGdkYXRfZW5kX3BmbihwZ2RhdCkpCj4gIAkJcmV0dXJuIHRydWU7Cj4gKwkvKiBYZW4g
UFYgZG9tYWlucyBuZWVkIHBhZ2Ugc3RydWN0dXJlcyBlYXJseSAqLwo+ICsJaWYgKHhlbl9wdl9k
b21haW4oKSkKPiArCQlyZXR1cm4gdHJ1ZTsKCkknbGwgZG8gdGhpczoKCi0tLSBhL21tL3BhZ2Vf
YWxsb2MuY35tbS1kb250LWRlZmVyLXN0cnVjdC1wYWdlLWluaXRpYWxpemF0aW9uLWZvci14ZW4t
cHYtZ3Vlc3RzLWZpeAorKysgYS9tbS9wYWdlX2FsbG9jLmMKQEAgLTQ2LDYgKzQ2LDcgQEAKICNp
bmNsdWRlIDxsaW51eC9zdG9wX21hY2hpbmUuaD4KICNpbmNsdWRlIDxsaW51eC9zb3J0Lmg+CiAj
aW5jbHVkZSA8bGludXgvcGZuLmg+CisjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUgPGxp
bnV4L2JhY2tpbmctZGV2Lmg+CiAjaW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+CiAjaW5j
bHVkZSA8bGludXgvcGFnZS1pc29sYXRpb24uaD4KClNvIHdlJ3JlIG5vdCByZWx5aW5nIG9uIGR1
bWIgbHVjayA7KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
