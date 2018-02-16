From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] mm: don't defer struct page initialization for
	Xen pv guests
Date: Fri, 16 Feb 2018 14:37:26 +0100
Message-ID: <20180216133726.30813-1-jgross__38924.9068256051$1518788771$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zjwl=fk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emgM4-0002j1-CI
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 13:47:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, akpm@linux-foundation.org, mhocko@suse.com, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IGY3Zjk5MTAwZDhkOTVkYmNmMDllMDIxNmExNDMyMTFlNzk0MThiOWYgKCJtbTogc3Rv
cCB6ZXJvaW5nCm1lbW9yeSBkdXJpbmcgYWxsb2NhdGlvbiBpbiB2bWVtbWFwIikgYnJva2UgWGVu
IHB2IGRvbWFpbnMgaW4gc29tZQpjb25maWd1cmF0aW9ucywgYXMgdGhlICJQaW5uZWQiIGluZm9y
bWF0aW9uIGluIHN0cnVjdCBwYWdlIG9mIGVhcmx5CnBhZ2UgdGFibGVzIGNvdWxkIGdldCBsb3N0
LgoKQXZvaWQgdGhpcyBwcm9ibGVtIGJ5IG5vdCBkZWZlcnJpbmcgc3RydWN0IHBhZ2UgaW5pdGlh
bGl6YXRpb24gd2hlbgpydW5uaW5nIGFzIFhlbiBwdiBndWVzdC4KCkNjOiA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gIzQuMTUKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgotLS0KIG1tL3BhZ2VfYWxsb2MuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxv
Yy5jCmluZGV4IDgxZTE4Y2VlZjU3OS4uNjgxZDUwNGI5YTQwIDEwMDY0NAotLS0gYS9tbS9wYWdl
X2FsbG9jLmMKKysrIGIvbW0vcGFnZV9hbGxvYy5jCkBAIC0zNDcsNiArMzQ3LDkgQEAgc3RhdGlj
IGlubGluZSBib29sIHVwZGF0ZV9kZWZlcl9pbml0KHBnX2RhdGFfdCAqcGdkYXQsCiAJLyogQWx3
YXlzIHBvcHVsYXRlIGxvdyB6b25lcyBmb3IgYWRkcmVzcy1jb25zdHJhaW5lZCBhbGxvY2F0aW9u
cyAqLwogCWlmICh6b25lX2VuZCA8IHBnZGF0X2VuZF9wZm4ocGdkYXQpKQogCQlyZXR1cm4gdHJ1
ZTsKKwkvKiBYZW4gUFYgZG9tYWlucyBuZWVkIHBhZ2Ugc3RydWN0dXJlcyBlYXJseSAqLworCWlm
ICh4ZW5fcHZfZG9tYWluKCkpCisJCXJldHVybiB0cnVlOwogCSgqbnJfaW5pdGlhbGlzZWQpKys7
CiAJaWYgKCgqbnJfaW5pdGlhbGlzZWQgPiBwZ2RhdC0+c3RhdGljX2luaXRfcGdjbnQpICYmCiAJ
ICAgIChwZm4gJiAoUEFHRVNfUEVSX1NFQ1RJT04gLSAxKSkgPT0gMCkgewotLSAKMi4xMy42CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
