From: Huaisheng Ye <yehs2007@gmail.com>
Subject: [RFC PATCH v3 5/9] drivers/block/zram/zram_drv: update
 usage of zone modifiers
Date: Thu, 24 May 2018 01:16:29 +0800
Message-ID: <1527095789-5668-1-git-send-email-yehs2007__48587.9707885489$1527095733$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pyse=ik=gmail.com=yehs2007@srs-us1.protection.inumbo.net>)
 id 1fLXNP-0000g1-RT
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 17:16:39 +0000
Received: by mail-pf0-x243.google.com with SMTP id w129-v6so10822340pfd.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 10:16:37 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: kstewart@linuxfoundation.org, mhocko@suse.com, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Huaisheng Ye <yehs1@lenovo.com>, hehy1@lenovo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, colyli@suse.de, Christoph Hellwig <hch@infradead.org>, Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org, linux-btrfs@vger.kernel.org, chengnt@lenovo.com, xen-devel@lists.xenproject.org, Nitin Gupta <ngupta@vflare.org>, mgorman@techsingularity.net, hch@lst.de, vbabka@suse.cz
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgoKVXNlIF9fR0ZQX1pPTkVfTU9W
QUJMRSB0byByZXBsYWNlIChfX0dGUF9ISUdITUVNIHwgX19HRlBfTU9WQUJMRSkuCgpfX19HRlBf
RE1BLCBfX19HRlBfSElHSE1FTSBhbmQgX19fR0ZQX0RNQTMyIGhhdmUgYmVlbiBkZWxldGVkIGZy
b20gR0ZQCmJpdG1hc2tzLCB0aGUgYm90dG9tIHRocmVlIGJpdHMgb2YgR0ZQIG1hc2sgaXMgcmVz
ZXJ2ZWQgZm9yIHN0b3JpbmcKZW5jb2RlZCB6b25lIG51bWJlci4KCl9fR0ZQX1pPTkVfTU9WQUJM
RSBjb250YWlucyBlbmNvZGVkIFpPTkVfTU9WQUJMRSBhbmQgX19HRlBfTU9WQUJMRSBmbGFnLgoK
V2l0aCBHRlBfWk9ORV9UQUJMRSwgX19HRlBfSElHSE1FTSBPUmluZyBfX0dGUF9NT1ZBQkxFIG1l
YW5zIGdmcF96b25lCnNob3VsZCByZXR1cm4gWk9ORV9NT1ZBQkxFLiBJbiBvcmRlciB0byBrZWVw
IHRoYXQgY29tcGF0aWJsZSB3aXRoCkdGUF9aT05FX1RBQkxFLCByZXBsYWNlIChfX0dGUF9ISUdI
TUVNIHwgX19HRlBfTU9WQUJMRSkgd2l0aApfX0dGUF9aT05FX01PVkFCTEUuCgpTaWduZWQtb2Zm
LWJ5OiBIdWFpc2hlbmcgWWUgPHllaHMxQGxlbm92by5jb20+CkNjOiBNaW5jaGFuIEtpbSA8bWlu
Y2hhbkBrZXJuZWwub3JnPgpDYzogTml0aW4gR3VwdGEgPG5ndXB0YUB2ZmxhcmUub3JnPgpDYzog
U2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3kud29ya0BnbWFpbC5jb20+CkNj
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+Ci0tLQogZHJpdmVycy9ibG9j
ay96cmFtL3pyYW1fZHJ2LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3pyYW0venJh
bV9kcnYuYyBiL2RyaXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5jCmluZGV4IDBmM2ZhZGQuLjFi
YjVjYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5jCisrKyBiL2Ry
aXZlcnMvYmxvY2svenJhbS96cmFtX2Rydi5jCkBAIC0xMDA0LDE0ICsxMDA0LDEyIEBAIHN0YXRp
YyBpbnQgX196cmFtX2J2ZWNfd3JpdGUoc3RydWN0IHpyYW0gKnpyYW0sIHN0cnVjdCBiaW9fdmVj
ICpidmVjLAogCQloYW5kbGUgPSB6c19tYWxsb2MoenJhbS0+bWVtX3Bvb2wsIGNvbXBfbGVuLAog
CQkJCV9fR0ZQX0tTV0FQRF9SRUNMQUlNIHwKIAkJCQlfX0dGUF9OT1dBUk4gfAotCQkJCV9fR0ZQ
X0hJR0hNRU0gfAotCQkJCV9fR0ZQX01PVkFCTEUpOworCQkJCV9fR0ZQX1pPTkVfTU9WQUJMRSk7
CiAJaWYgKCFoYW5kbGUpIHsKIAkJemNvbXBfc3RyZWFtX3B1dCh6cmFtLT5jb21wKTsKIAkJYXRv
bWljNjRfaW5jKCZ6cmFtLT5zdGF0cy53cml0ZXN0YWxsKTsKIAkJaGFuZGxlID0genNfbWFsbG9j
KHpyYW0tPm1lbV9wb29sLCBjb21wX2xlbiwKLQkJCQlHRlBfTk9JTyB8IF9fR0ZQX0hJR0hNRU0g
fAotCQkJCV9fR0ZQX01PVkFCTEUpOworCQkJCUdGUF9OT0lPIHwgX19HRlBfWk9ORV9NT1ZBQkxF
KTsKIAkJaWYgKGhhbmRsZSkKIAkJCWdvdG8gY29tcHJlc3NfYWdhaW47CiAJCXJldHVybiAtRU5P
TUVNOwotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
