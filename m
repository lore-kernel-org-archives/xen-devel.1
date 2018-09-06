From: Ding Xiang <dingxiang@cmss.chinamobile.com>
Subject: [PATCH] xen: remove redundant put_device
Date: Thu,  6 Sep 2018 14:33:10 +0800
Message-ID: <1536215590-400-1-git-send-email-dingxiang__15056.3850453638$1536215838$gmane$org@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=foks=lu=cmss.chinamobile.com=dingxiang@srs-us1.protection.inumbo.net>)
 id 1fxnqy-0002Iw-Es
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 06:33:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

ZGV2aWNlX3VucmVnaXN0ZXIgd2lsbCBwdXQgZGV2aWNlLCBkbyBub3QgbmVlZCB0byBkbyBpdCBv
bmUgbW9yZSB0aW1lCgpTaWduZWQtb2ZmLWJ5OiBEaW5nIFhpYW5nIDxkaW5neGlhbmdAY21zcy5j
aGluYW1vYmlsZS5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJv
YmUuYwppbmRleCA1YjQ3MTg4Li5jZmFhODc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5j
CkBAIC0zNjksNyArMzY5LDYgQEAgc3RhdGljIHZvaWQgeGVuYnVzX2NsZWFudXBfZGV2aWNlcyhj
b25zdCBjaGFyICpwYXRoLCBzdHJ1Y3QgYnVzX3R5cGUgKmJ1cykKIAkJYnVzX2Zvcl9lYWNoX2Rl
dihidXMsIE5VTEwsICZpbmZvLCBjbGVhbnVwX2Rldik7CiAJCWlmIChpbmZvLmRldikgewogCQkJ
ZGV2aWNlX3VucmVnaXN0ZXIoJmluZm8uZGV2LT5kZXYpOwotCQkJcHV0X2RldmljZSgmaW5mby5k
ZXYtPmRldik7CiAJCX0KIAl9IHdoaWxlIChpbmZvLmRldik7CiB9Ci0tIAoxLjkuMQoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
