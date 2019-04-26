From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 14/15] cross builds: Build armhf kernels
 on amd64 hosts
Date: Fri, 26 Apr 2019 17:40:01 +0100
Message-ID: <20190426164002.22381-15-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3v4-0008Ug-6d
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:50 +0000
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3VyIGFybWhmIGhvc3RzIGFyZSBkZXZib2FyZHMgYW5kIHZlcnkgc2xvdywgYXMgd2VsbCBhcyBz
Y2FyY2UuICBJdAo1dGFrZXMgMTdrcyBvciBzbyBmb3IgYSBrZXJuZWwgYnVpbGQuICBUaGlzIHdp
bGwgZ28gKm11Y2gqIGZhc3RlciBvbgphbiBhbWQ2NCBib3ggYW5kIHdlIGhhdmUgbG90cyBvZiB0
aG9zZSB0b28uCgpzdGFuZGFsb25lLWdlbmVyYXRlLWR1bXAtZmxpZ2h0LXJ1bnZhcnMgc2hvd3Mg
dGhhdCB0aGUgb25seSBjaGFuZ2UgaXMKdG8gY2hhbmdlIGhvc3RfYXJjaCBmcm9tIGFybWhmIHRv
IGFtZDY0IGluIGJ1aWxkLWFybWhmLXB2b3BzIGpvYnMuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Ci0tLQogbWZpLWNvbW1vbiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21maS1jb21tb24gYi9tZmktY29tbW9u
CmluZGV4IDdiNWM4OTRmLi4zMGYyNjkyZCAxMDA2NDQKLS0tIGEvbWZpLWNvbW1vbgorKysgYi9t
ZmktY29tbW9uCkBAIC00MjQsNyArNDI0LDcgQEAgY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogICAg
IGZpCiAKICAgICBqb2JfY3JlYXRlX2J1aWxkX2Nyb3NzYWJsZSBidWlsZC0kYXJjaC1wdm9wcyBi
dWlsZC1rZXJuICRhcmNoICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgIC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
ICAgICAgICAgICAgYXJtaGYgYW1kNjQgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICBrY29uZmlnaG93PXhlbi1lbmFibGUt
eGVuLWNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
ICRSVU5WQVJTICRCVUlMRF9SVU5WQVJTICRCVUlMRF9MSU5VWF9SVU5WQVJTICRhcmNoX3J1bnZh
cnMgICBcCiAgICAgICAgICAgICAgICAgJGhvc3Rvc19ydW52YXJzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
