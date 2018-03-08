From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 10/11] xen: Expect xenstore write to fail when
	restricted
Date: Thu, 8 Mar 2018 17:39:16 +0000
Message-ID: <1520530757-4477-11-git-send-email-ian.jackson@eu.citrix.com>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=awgw=f6=citrix.com=prvs=5980b9d75=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etzVw-0005Xx-Mp
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 17:39:36 +0000
In-Reply-To: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpTYXZpbmcg
dGhlIGN1cnJlbnQgc3RhdGUgdG8geGVuc3RvcmUgbWF5IGZhaWwgd2hlbiBydW5uaW5nIHJlc3Ry
aWN0ZWQKKGluIHBhcnRpY3VsYXIsIGFmdGVyIGEgbWlncmF0aW9uKS4gVGhlcmVmb3JlLCBkb24n
dCByZXBvcnQgdGhlIGVycm9yIG9yCmV4aXQgd2hlbiBydW5uaW5nIHJlc3RyaWN0ZWQuICBUb29s
c3RhY2tzIHRoYXQgd2FudCB0byBhbGxvdyBydW5uaW5nClFFTVUgcmVzdHJpY3RlZCBzaG91bGQg
aW5zdGVhZCBtYWtlIHVzZSBvZiBRTVAgZXZlbnRzIHRvIGxpc3RlbiBmb3IKc3RhdGUgY2hhbmdl
cy4KCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCi0tLQp2NjogTmV3
IHBhdGNoIGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzCi0tLQogaHcveGVuL3hlbi1jb21t
b24uYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4tY29tbW9uLmMgYi9ody94ZW4veGVuLWNv
bW1vbi5jCmluZGV4IGY3M2I0MTYuLjhlZGUyNDYgMTAwNjQ0Ci0tLSBhL2h3L3hlbi94ZW4tY29t
bW9uLmMKKysrIGIvaHcveGVuL3hlbi1jb21tb24uYwpAQCAtMTAxLDcgKzEwMSwxMiBAQCBzdGF0
aWMgdm9pZCB4ZW5zdG9yZV9yZWNvcmRfZG1fc3RhdGUoc3RydWN0IHhzX2hhbmRsZSAqeHMsIGNv
bnN0IGNoYXIgKnN0YXRlKQogICAgIH0KIAogICAgIHNucHJpbnRmKHBhdGgsIHNpemVvZiAocGF0
aCksICJkZXZpY2UtbW9kZWwvJXUvc3RhdGUiLCB4ZW5fZG9taWQpOwotICAgIGlmICgheHNfd3Jp
dGUoeHMsIFhCVF9OVUxMLCBwYXRoLCBzdGF0ZSwgc3RybGVuKHN0YXRlKSkpIHsKKyAgICAvKgor
ICAgICAqIFRoaXMgY2FsbCBtYXkgZmFpbCB3aGVuIHJ1bm5pbmcgcmVzdHJpY3RlZCBzbyBkb24n
dCBtYWtlIGl0IGZhdGFsIGluCisgICAgICogdGhhdCBjYXNlLiBUb29sc3RhY2tzIHNob3VsZCBp
bnN0ZWFkIHVzZSBRTVAgdG8gbGlzdGVuIGZvciBzdGF0ZSBjaGFuZ2VzLgorICAgICAqLworICAg
IGlmICgheHNfd3JpdGUoeHMsIFhCVF9OVUxMLCBwYXRoLCBzdGF0ZSwgc3RybGVuKHN0YXRlKSkg
JiYKKyAgICAgICAgICAgICF4ZW5fZG9taWRfcmVzdHJpY3QpIHsKICAgICAgICAgZXJyb3JfcmVw
b3J0KCJlcnJvciByZWNvcmRpbmcgZG0gc3RhdGUiKTsKICAgICAgICAgZXhpdCgxKTsKICAgICB9
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
