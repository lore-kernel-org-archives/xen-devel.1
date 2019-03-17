From: Ming Lei <ming.lei@redhat.com>
Subject: [PATCH V2 02/10] block: avoid to break XEN by
 multi-page bvec
Date: Sun, 17 Mar 2019 18:01:04 +0800
Message-ID: <20190317100112.8106-3-ming.lei@redhat.com>
References: <20190317100112.8106-1-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FEWO=RU=redhat.com=ming.lei@srs-us1.protection.inumbo.net>)
 id 1h5Sbk-0004H4-Ik
 for xen-devel@lists.xenproject.org; Sun, 17 Mar 2019 10:01:32 +0000
In-Reply-To: <20190317100112.8106-1-ming.lei@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Juergen Gross <jgross@suse.com>, Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>
List-Id: xen-devel@lists.xenproject.org

WEVOIGhhcyBzcGVjaWFsIHBhZ2UgbWVyZ2UgcmVxdWlyZW1lbnQsIHNlZSB4ZW5fYmlvdmVjX3Bo
eXNfbWVyZ2VhYmxlKCkuCldlIGNhbid0IG1lcmdlIHBhZ2VzIGludG8gb25lIGJ2ZWMgc2ltcGx5
IGZvciBYRU4uCgpTbyBtb3ZlIFhFTidzIHNwZWNpZmljIGNoZWNrIG9uIHBhZ2UgbWVyZ2UgaW50
byBfX2Jpb190cnlfbWVyZ2VfcGFnZSgpLAp0aGVuIGFidm9pZCB0byBicmVhayBYRU4gYnkgbXVs
dGktcGFnZSBidmVjLgoKQ2M6IHJpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCkNjOiBPbWFyIFNhbmRvdmFsIDxvc2FuZG92QGZiLmNvbT4KQ2M6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpTaWduZWQtb2ZmLWJ5OiBNaW5nIExlaSA8
bWluZy5sZWlAcmVkaGF0LmNvbT4KLS0tCiBibG9jay9iaW8uYyB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ibG9jay9iaW8uYyBiL2Jsb2NrL2Jp
by5jCmluZGV4IDcxYTc4ZDlmYjhiNy4uZDhmNDgxODg5MzdjIDEwMDY0NAotLS0gYS9ibG9jay9i
aW8uYworKysgYi9ibG9jay9iaW8uYwpAQCAtNzc2LDYgKzc3Niw4IEBAIGJvb2wgX19iaW9fdHJ5
X21lcmdlX3BhZ2Uoc3RydWN0IGJpbyAqYmlvLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAogCQlpZiAo
dmVjX2VuZF9hZGRyICsgMSAhPSBwYWdlX2FkZHIgKyBvZmYpCiAJCQlyZXR1cm4gZmFsc2U7CisJ
CWlmICh4ZW5fZG9tYWluKCkgJiYgIXhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoYnYsIHBhZ2Up
KQorCQkJcmV0dXJuIGZhbHNlOwogCQlpZiAoc2FtZV9wYWdlICYmICh2ZWNfZW5kX2FkZHIgJiBQ
QUdFX01BU0spICE9IHBhZ2VfYWRkcikKIAkJCXJldHVybiBmYWxzZTsKIAotLSAKMi45LjUKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
