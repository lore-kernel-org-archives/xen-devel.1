From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/9] libxl: New slow lock + fix
 libxl_cdrom_insert with QEMU depriv
Date: Tue, 9 Apr 2019 17:45:33 +0100
Message-ID: <20190409164542.30274-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDtsZ-000888-QN
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:45:47 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpUaGlzIHBhdGNoIHNlcmllcyBmaXggbGlieGxfY2Ryb21faW5zZXJ0IHRvIHdvcmsgd2l0
aCBhIGRlcHJpdmlsZWRnZSBRRU1VLiBGb3IKdGhhdCwgd2UgbmVlZCB0byB1c2UgbGlieGxfX2V2
X3FtcC4gIEZvciB0aGF0LCB3ZSBuZWVkIGEgbmV3IGxvY2sgYmVjYXVzZQp1c2VyZGF0YV9sb2Nr
IGNhbid0IGJlIHVzZWQgYW55bW9yZS4KClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBn
aXQgYnJhbmNoOgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFy
ZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmxpYnhsLXNsb3ctbG9jay12MQoKQW50aG9ueSBQRVJBUkQg
KDkpOgogIGxpYnhsX2ludGVybmFsOiBSZW1vdmUgbG9zdCBjb21tZW50CiAgbGlieGw6IFBvaW50
ZXIgb24gdXNhZ2Ugb2YgbGlieGxfX2RvbWFpbl91c2VyZGF0YV9sb2NrCiAgbGlieGxfaW50ZXJu
YWw6IFNwbGl0IG91dCB1c2VyZGF0YSBsb2NrIGZ1bmN0aW9uCiAgbGlieGxfaW50ZXJuYWw6IENy
ZWF0ZSBuZXcgbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAKICBsaWJ4bF9kaXNrOiBS
ZW9yZ2FuaXNlIGxpYnhsX2Nkcm9tX2luc2VydAogIGxpYnhsX2Rpc2s6IEN1dCBsaWJ4bF9jZHJv
bV9pbnNlcnQgaW50byBzdGVwcyAuLgogIGxpYnhsOiBNb3ZlIHFtcF9wYXJhbWV0ZXJzXyogcHJv
dG90eXBlcyB0byBsaWJ4bF9pbnRlcm5hbC5oCiAgbGlieGxfZGlzazogVXNlIGV2X3FtcCBpbiBs
aWJ4bF9jZHJvbV9pbnNlcnQKICBsaWJ4bF9kaXNrOiBJbXBsZW1lbnQgbWlzc2luZyB0aW1lb3V0
IGZvciBsaWJ4bF9jZHJvbV9pbnNlcnQKCiB0b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgICAgIHwg
MzMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5jIHwgIDc3ICsrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
IHwgIDczICsrKysrKy0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgIDg5ICsrKyst
LS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNDI2IGluc2VydGlvbnMoKyksIDE0MyBkZWxldGlvbnMo
LSkKCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
