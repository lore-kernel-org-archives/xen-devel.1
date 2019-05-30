From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5.1 279/405] block: avoid to break XEN by
 multi-page bvec
Date: Wed, 29 May 2019 20:04:37 -0700
Message-ID: <20190530030555.005862356@linuxfoundation.org>
References: <20190530030540.291644921@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uLyr=T6=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hWBTo-0001ZX-9J
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 03:11:48 +0000
In-Reply-To: <20190530030540.291644921@linuxfoundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Omar Sandoval <osandov@fb.com>, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

WyBVcHN0cmVhbSBjb21taXQgZGI1ZWJkNmVkZDI2MjdkN2U4MWEwMzE2NDNjZjQzNTg3ZjYzZTY2
YyBdCgpYRU4gaGFzIHNwZWNpYWwgcGFnZSBtZXJnZSByZXF1aXJlbWVudCwgc2VlIHhlbl9iaW92
ZWNfcGh5c19tZXJnZWFibGUoKS4KV2UgY2FuJ3QgbWVyZ2UgcGFnZXMgaW50byBvbmUgYnZlYyBz
aW1wbHkgZm9yIFhFTi4KClNvIG1vdmUgWEVOJ3Mgc3BlY2lmaWMgY2hlY2sgb24gcGFnZSBtZXJn
ZSBpbnRvIF9fYmlvX3RyeV9tZXJnZV9wYWdlKCksCnRoZW4gYWJ2b2lkIHRvIGJyZWFrIFhFTiBi
eSBtdWx0aS1wYWdlIGJ2ZWMuCgpDYzogcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IE9tYXIgU2Fu
ZG92YWwgPG9zYW5kb3ZAZmIuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1pbmcgTGVpIDxtaW5nLmxlaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBibG9jay9iaW8uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ibG9jay9iaW8uYyBiL2Jsb2NrL2Jpby5jCmluZGV4
IDcxNjUxMGVjZDdmZmEuLmEzYzgwYTZjMWZlNTEgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2Jpby5jCisr
KyBiL2Jsb2NrL2Jpby5jCkBAIC03NzYsNiArNzc2LDggQEAgYm9vbCBfX2Jpb190cnlfbWVyZ2Vf
cGFnZShzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBwYWdlICpwYWdlLAogCiAJCWlmICh2ZWNfZW5k
X2FkZHIgKyAxICE9IHBhZ2VfYWRkciArIG9mZikKIAkJCXJldHVybiBmYWxzZTsKKwkJaWYgKHhl
bl9kb21haW4oKSAmJiAheGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZShidiwgcGFnZSkpCisJCQly
ZXR1cm4gZmFsc2U7CiAJCWlmIChzYW1lX3BhZ2UgJiYgKHZlY19lbmRfYWRkciAmIFBBR0VfTUFT
SykgIT0gcGFnZV9hZGRyKQogCQkJcmV0dXJuIGZhbHNlOwogCi0tIAoyLjIwLjEKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
