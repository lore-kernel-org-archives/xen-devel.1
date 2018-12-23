From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 13/20] xenbus: drop useless LIST_HEAD
Date: Sun, 23 Dec 2018 09:57:08 +0100
Message-ID: <1545555435-24576-14-git-send-email-Julia.Lawall@lip6.fr>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HuYs=PA=lip6.fr=julia.lawall@srs-us1.protection.inumbo.net>)
 id 1gb08y-0007y9-DC
 for xen-devel@lists.xenproject.org; Sun, 23 Dec 2018 09:33:56 +0000
In-Reply-To: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RHJvcCBMSVNUX0hFQUQgd2hlcmUgdGhlIHZhcmlhYmxlIGl0IGRlY2xhcmVzIGlzIG5ldmVyIHVz
ZWQuCgpUaGUgZGVjbGFyYXRpb25zIHdlcmUgaW50cm9kdWNlZCB3aXRoIHRoZSBmaWxlLCBidXQg
dGhlIGRlY2xhcmVkCnZhcmlhYmxlcyB3ZXJlIG5vdCB1c2VkLgoKVGhlIHNlbWFudGljIHBhdGNo
IHRoYXQgZml4ZXMgdGhpcyBwcm9ibGVtIGlzIGFzIGZvbGxvd3M6CihodHRwOi8vY29jY2luZWxs
ZS5saXA2LmZyLykKCi8vIDxzbXBsPgpAQAppZGVudGlmaWVyIHg7CkBACi0gTElTVF9IRUFEKHgp
OwogIC4uLiB3aGVuICE9IHgKLy8gPC9zbXBsPgoKRml4ZXM6IDExMDdiYTg4NWU0NiAoInhlbjog
YWRkIHhlbmZzIHRvIGFsbG93IHVzZXJtb2RlIDwtPiBYZW4gaW50ZXJhY3Rpb24iKQpTaWduZWQt
b2ZmLWJ5OiBKdWxpYSBMYXdhbGwgPEp1bGlhLkxhd2FsbEBsaXA2LmZyPgoKLS0tClN1Y2Nlc3Nm
dWxseSAwLWRheSB0ZXN0ZWQgb24gMTUxIGNvbmZpZ3VyYXRpb25zLgoKIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMgfCAgICAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9m
cm9udGVuZC5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYwppbmRl
eCBjM2UyMDEwMjVlZjAuLjI1YzUzNTQ1ZWEwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVu
YnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVz
X2Rldl9mcm9udGVuZC5jCkBAIC00NjUsNyArNDY1LDYgQEAgc3RhdGljIGludCB4ZW5idXNfd3Jp
dGVfd2F0Y2godW5zaWduZWQgbXNnX3R5cGUsIHN0cnVjdCB4ZW5idXNfZmlsZV9wcml2ICp1KQog
CXN0cnVjdCB3YXRjaF9hZGFwdGVyICp3YXRjaDsKIAljaGFyICpwYXRoLCAqdG9rZW47CiAJaW50
IGVyciwgcmM7Ci0JTElTVF9IRUFEKHN0YWdpbmdfcSk7CiAKIAlwYXRoID0gdS0+dS5idWZmZXIg
KyBzaXplb2YodS0+dS5tc2cpOwogCXRva2VuID0gbWVtY2hyKHBhdGgsIDAsIHUtPnUubXNnLmxl
bik7CkBAIC01MjMsNyArNTIyLDYgQEAgc3RhdGljIHNzaXplX3QgeGVuYnVzX2ZpbGVfd3JpdGUo
c3RydWN0IGZpbGUgKmZpbHAsCiAJdWludDMyX3QgbXNnX3R5cGU7CiAJaW50IHJjID0gbGVuOwog
CWludCByZXQ7Ci0JTElTVF9IRUFEKHN0YWdpbmdfcSk7CiAKIAkvKgogCSAqIFdlJ3JlIGV4cGVj
dGluZyB1c2VybW9kZSB0byBiZSB3cml0aW5nIHByb3Blcmx5IGZvcm1lZAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
