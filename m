From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 2/2] xen/arm: Add Marvell ARMADA 3700
 early printk support
Date: Fri, 6 Apr 2018 10:30:17 +0100
Message-ID: <76fd9658-03fb-1966-1fd4-ff8a308fcfbb@arm.com>
References: <1522923373-21039-1-git-send-email-amittomer25@gmail.com>
 <1522923373-21039-3-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7n7s=g3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f4NhP-0002Eb-Qx
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 09:30:23 +0000
In-Reply-To: <1522923373-21039-3-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andre.przywara@arm.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNC8wNS8yMDE4IDExOjE2IEFNLCBBbWl0IFNpbmdoIFRvbWFyIHdyb3RlOgo+IFNp
Z25lZC1vZmYtYnk6IEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KCldp
dGggb25lIGNoYW5nZSAoc2VlIGJlbG93KToKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKWy4uLl0KCj4gKy8qCj4gKyAqIE1WRUJVIFVBUlQgd2FpdCBVQVJU
IHRvIGJlIHJlYWR5IHRvIHRyYW5zbWl0Cj4gKyAqIHhiOiByZWdpc3RlciB3aGljaCBjb250YWlu
cyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKPiArICogYzogc2NyYXRjaCByZWdpc3Rlcgo+ICsgKi8K
PiArLm1hY3JvIGVhcmx5X3VhcnRfcmVhZHkgeGIgYwo+ICsxOgo+ICsgICAgICAgIGxkcmggICB3
XGMsIFtceGIsICNVQVJUX1NUQVRVU19SRUddICAvKiBzdGF0dXMgcmVnaXN0ZXIgKi8KPiArICAg
ICAgICB0c3QgICAgd1xjLCAjKDEgPDwgMTEpCQkgICAgICAgICAvKiBDaGVjayBUWEZJRk8gRlVM
TCBiaXQgKi8KClRoaXMgaXMgdXNpbmcgaGFyZCB0YWJ1bGF0aW9uLiBYZW4gY29kaW5nIHN0eWxl
IHJlcXVlc3QgdG8gdXNlIHNvZnQgdGFiLgoKSSB3aWxsIGZpeCB0aGF0IG9uIGNvbW1pdC4KCj4g
KyAgICAgICAgYi5uZSAgIDFiICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFdhaXQgZm9y
IHRoZSBVQVJUIHRvIGJlIHJlYWR5ICovCj4gKy5lbmRtCj4gKwo+ICsvKgo+ICsgKiBNVkVCVSBV
QVJUIHRyYW5zbWl0IGNoYXJhY3Rlcgo+ICsgKiB4YjogcmVnaXN0ZXIgd2hpY2ggY29udGFpbnMg
dGhlIFVBUlQgYmFzZSBhZGRyZXNzCj4gKyAqIHd0OiByZWdpc3RlciB3aGljaCBjb250YWlucyB0
aGUgY2hhcmFjdGVyIHRvIHRyYW5zbWl0Cj4gKyAqLwo+ICsubWFjcm8gZWFybHlfdWFydF90cmFu
c21pdCB4YiB3dAo+ICsJc3RyYiAgXHd0LCBbXHhiLCAjVUFSVF9UWF9SRUddCj4gKy5lbmRtCj4g
Kwo+ICsvKgo+ICsgKiBMb2NhbCB2YXJpYWJsZXM6Cj4gKyAqIG1vZGU6IEFTTQo+ICsgKiBpbmRl
bnQtdGFicy1tb2RlOiBuaWwKPiArICogRW5kOgo+ICsgKi8KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
