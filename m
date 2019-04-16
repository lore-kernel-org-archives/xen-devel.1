From: Mao Wenan <maowenan@huawei.com>
Subject: [PATCH] xenbus: drop useless LIST_HEAD in
 xenbus_write_watch() and xenbus_file_write()
Date: Tue, 16 Apr 2019 12:06:51 +0800
Message-ID: <20190416040651.186468-1-maowenan__9462.59872741706$1555389850$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E5BS=SS=huawei.com=maowenan@srs-us1.protection.inumbo.net>)
 id 1hGFCh-0001NT-1Z
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 03:56:15 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RHJvcCBMSVNUX0hFQUQgd2hlcmUgdGhlIHZhcmlhYmxlIGl0IGRlY2xhcmVzIGlzIG5ldmVyIHVz
ZWQuCgpUaGUgZGVjbGFyYXRpb25zIHdlcmUgaW50cm9kdWNlZCB3aXRoIHRoZSBmaWxlLCBidXQg
dGhlIGRlY2xhcmVkCnZhcmlhYmxlcyB3ZXJlIG5vdCB1c2VkLgoKRml4ZXM6IDExMDdiYTg4NWU0
NjkoInhlbjogYWRkIHhlbmZzIHRvIGFsbG93IHVzZXJtb2RlIDwtPiBYZW4gaW50ZXJhY3Rpb24i
KQpTaWduZWQtb2ZmLWJ5OiBNYW8gV2VuYW4gPG1hb3dlbmFuQGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19kZXZfZnJvbnRlbmQuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfZGV2X2Zyb250ZW5kLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Rldl9mcm9udGVu
ZC5jCmluZGV4IDA3ODJmZjMuLmZhZjQ1MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfZGV2X2Zyb250ZW5kLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19k
ZXZfZnJvbnRlbmQuYwpAQCAtNDY1LDcgKzQ2NSw2IEBAIHN0YXRpYyBpbnQgeGVuYnVzX3dyaXRl
X3dhdGNoKHVuc2lnbmVkIG1zZ190eXBlLCBzdHJ1Y3QgeGVuYnVzX2ZpbGVfcHJpdiAqdSkKIAlz
dHJ1Y3Qgd2F0Y2hfYWRhcHRlciAqd2F0Y2g7CiAJY2hhciAqcGF0aCwgKnRva2VuOwogCWludCBl
cnIsIHJjOwotCUxJU1RfSEVBRChzdGFnaW5nX3EpOwogCiAJcGF0aCA9IHUtPnUuYnVmZmVyICsg
c2l6ZW9mKHUtPnUubXNnKTsKIAl0b2tlbiA9IG1lbWNocihwYXRoLCAwLCB1LT51Lm1zZy5sZW4p
OwpAQCAtNTIzLDcgKzUyMiw2IEBAIHN0YXRpYyBzc2l6ZV90IHhlbmJ1c19maWxlX3dyaXRlKHN0
cnVjdCBmaWxlICpmaWxwLAogCXVpbnQzMl90IG1zZ190eXBlOwogCWludCByYyA9IGxlbjsKIAlp
bnQgcmV0OwotCUxJU1RfSEVBRChzdGFnaW5nX3EpOwogCiAJLyoKIAkgKiBXZSdyZSBleHBlY3Rp
bmcgdXNlcm1vZGUgdG8gYmUgd3JpdGluZyBwcm9wZXJseSBmb3JtZWQKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
