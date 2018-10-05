From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 01/18] docs/man: Fix two typos detected by the
 Debian lintian tool
Date: Fri,  5 Oct 2018 18:29:00 +0100
Message-ID: <20181005172917.11963-2-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8Tut-00049r-5Y
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:29:31 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQog
ZG9jcy9tYW4veGVuc3RvcmUucG9kLjEgfCAyICstCiBkb2NzL21hbi94bC5wb2QuMS5pbiAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hlbnN0b3JlLnBvZC4xIGIvZG9jcy9tYW4veGVuc3RvcmUu
cG9kLjEKaW5kZXggNzQxNzI4OTFlMi4uZGQ4ZjgwNjQ3ZCAxMDA2NDQKLS0tIGEvZG9jcy9tYW4v
eGVuc3RvcmUucG9kLjEKKysrIGIvZG9jcy9tYW4veGVuc3RvcmUucG9kLjEKQEAgLTE4LDcgKzE4
LDcgQEAgU2V0cyB0aGUgcGVybWlzc2lvbnMgb2Yga2V5cy4KIAogPWl0ZW0gQjx4ZW5zdG9yZS1l
eGlzdHM+KDEpCiAKLVRlc3QgZm9yIHRoZSBleGlzdGFuY2Ugb2YgYSBrZXkuCitUZXN0IGZvciB0
aGUgZXhpc3RlbmNlIG9mIGEga2V5LgogCiA9aXRlbSBCPHhlbnN0b3JlLWxpc3Q+KDEpCiAKZGlm
ZiAtLWdpdCBhL2RvY3MvbWFuL3hsLnBvZC4xLmluIGIvZG9jcy9tYW4veGwucG9kLjEuaW4KaW5k
ZXggYjc0NzY0ZGNkMy4uMTgwMDY4ODBkNiAxMDA2NDQKLS0tIGEvZG9jcy9tYW4veGwucG9kLjEu
aW4KKysrIGIvZG9jcy9tYW4veGwucG9kLjEuaW4KQEAgLTEzOTgsNyArMTM5OCw3IEBAIENyZWF0
ZXMgYSBuZXcgbmV0d29yayBkZXZpY2UgaW4gdGhlIGRvbWFpbiBzcGVjaWZpZWQgYnkgSTxkb21h
aW4taWQ+LgogSTxuZXR3b3JrLWRldmljZT4gZGVzY3JpYmVzIHRoZSBkZXZpY2UgdG8gYXR0YWNo
LCB1c2luZyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlCiBCPHZpZj4gc3RyaW5nIGluIHRoZSBkb21h
aW4gY29uZmlnIGZpbGUuIFNlZSBMPHhsLmNmZyg1KT4gYW5kCiBMPHhsLW5ldHdvcmstY29uZmln
dXJhdGlvbig1KT4KLWZvciBtb3JlIGluZm9ybWF0aW9ucy4KK2ZvciBtb3JlIGluZm9ybWF0aW9u
LgogCiBOb3RlIHRoYXQgb25seSBhdHRhY2hpbmcgUFYgbmV0d29yayBpbnRlcmZhY2VzIGlzIHN1
cHBvcnRlZC4KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
