From: Norbert Manthey <nmanthey@amazon.de>
Subject: [goto-label v2] memory: fix label syntax
Date: Tue, 31 Jul 2018 10:56:09 +0200
Message-ID: <1533027369-16597-1-git-send-email-nmanthey@amazon.de>
References: <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vjw3=kp=amazon.de=prvs=74377f6f8=nmanthey@srs-us1.protection.inumbo.net>)
 id 1fkQS3-00062E-Q7
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 08:56:19 +0000
In-Reply-To: <5B60210E02000078001D9489@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Elizabeth Polgreen <polgreen@amazon.de>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBjb21waWxpbmcgdGhpcyBmaWxlIHdpdGggZ2NjLCB0aGUgY29tcGlsZXIgaGFwcGlseSBh
Y2NlcHRzIHRoZQpzZXF1ZW5jZSBvZiBhIGxhYmVsIGZvbGxvd2VkIGJ5IGFuIGF0dHJpYnV0ZS4g
SG93ZXZlciwgdGhpcyBzZXF1ZW5jZSBkb2VzCm5vdCBmb2xsb3cgdGhlIGdjYyBkb2N1bWVudGF0
aW9uLiBIZW5jZSwgb3RoZXIgY29tcGlsZXJzIG1pZ2h0IHN0dW1ibGUKdXBvbiB0aGlzIHN0YXRl
bWVudC4KClRvIGJlIGFibGUgdG8gY29tcGlsZSBYZW4gd2l0aCBnb3RvLWNjICh0aGUgY29tcGls
ZXIgb2YgdGhlIENQUk9WRVIgdG9vbApzdWl0ZSksIHRoZSBtaXNzaW5nIHNlbWljb2xvbiBpcyBh
ZGRlZCBpbiB0aGlzIGNvbW1pdC4KClJlcG9ydGVkLWJ5OiBFbGl6YWJldGggUG9sZ3JlZW4gPHBv
bGdyZWVuQGFtYXpvbi5kZT4KU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhl
eUBhbWF6b24uZGU+Ci0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vbWVtb3J5LmMgYi94ZW4vY29tbW9uL21lbW9yeS5jCmluZGV4IDc1MDEwYjcuLmUyOWQ1OTYg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnku
YwpAQCAtMzg3LDcgKzM4Nyw3IEBAIGludCBndWVzdF9yZW1vdmVfcGFnZShzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBsb25nIGdtZm4pCiAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwogCiAgICAg
cHV0X3BhZ2UocGFnZSk7Ci0gb3V0X3B1dF9nZm46IF9fbWF5YmVfdW51c2VkCisgb3V0X3B1dF9n
Zm46IF9fbWF5YmVfdW51c2VkOwogICAgIHB1dF9nZm4oZCwgZ21mbik7CiAKICAgICAvKgotLSAK
Mi43LjQKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkJlcmxpbiAtIERy
ZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEtyYXVzZW5zdHIuIDM4LCAxMDExNyBCZXJsaW4K
R2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhlcmJyaWNoLCBDaHJpc3RpYW4gU2NobGFlZ2Vy
ClVzdC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRl
bmJ1cmcgSFJCIDE0OTE3MyBCCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
