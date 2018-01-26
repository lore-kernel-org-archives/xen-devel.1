From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH] xen/arm: Fix platform name for Xilinx ZynqMP
Date: Fri, 26 Jan 2018 17:02:49 +0000
Message-ID: <af13b246-289b-49ff-cc03-0cfd3c174762@linaro.org>
References: <1516892629-11398-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bdqa=ev=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ef7Pq-0001ih-LP
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 17:03:50 +0000
Received: by mail-wm0-f49.google.com with SMTP id v71so22550939wmv.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2018 09:03:47 -0800 (PST)
In-Reply-To: <1516892629-11398-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgooQ0M6aW5nIEVkZ2FyKQoKT24gMjUvMDEvMTggMTU6MDMsIEFtaXQgU2luZ2ggVG9tYXIg
d3JvdGU6Cj4gVGhpcyBzZWVtcyB0byBiZSBjb3B5L3Bhc3RlIGVycm9yLlRoaXMgcGF0Y2ggc2lt
cGx5Cj4gcmVwbGFjZSBzdHJpbmcgeGdlbmVfc3Rvcm0gd2l0aCB4aWxpbmtfenltcCBmb3IgeGls
aW5rCj4gcGxhdGZvcm0uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1p
dHRvbWVyMjVAZ21haWwuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlu
eC16eW5xbXAuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54
LXp5bnFtcC5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKPiBpbmRl
eCAyYWRlZTkxLi4zOGYyYzE2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMv
eGlsaW54LXp5bnFtcC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlu
cW1wLmMKPiBAQCAtMzIsNyArMzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9t
YXRjaCB6eW5xbXBfYmxhY2tsaXN0X2RldltdIF9faW5pdGNvbnN0ID0KPiAgICAgIHsgLyogc2Vu
dGluZWwgKi8gfSwKPiAgfTsKPiAgCj4gLVBMQVRGT1JNX1NUQVJUKHhnZW5lX3N0b3JtLCAiWGls
aW54IFp5bnFNUCIpCj4gK1BMQVRGT1JNX1NUQVJUKHhpbGlua196eW5xbXAsICJYaWxpbnggWnlu
cU1QIikKCkkgZ3Vlc3MgeW91IG1lYW46IHhpbGlueF96eW5xbXAsIC4uLiA/CgpBbmQgcGxlYXNl
IENDOiBFZGdhciBhbmQgdGhlIEFSTSBtYWludGFpbmVycyAodXNlCnNjcmlwdHMvZ2V0X21haW50
YWluZXIucGwpIG9uIGEgcmVwb3N0LgoKQ2hlZXJzLApBbmRyZS4KCj4gICAgICAuY29tcGF0aWJs
ZSA9IHp5bnFtcF9kdF9jb21wYXQsCj4gICAgICAuYmxhY2tsaXN0X2RldiA9IHp5bnFtcF9ibGFj
a2xpc3RfZGV2LAo+ICBQTEFURk9STV9FTkQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
