From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 16/16] xen: decouple HVM and IOMMU
 capabilities
Date: Thu, 13 Sep 2018 16:52:43 +0100
Message-ID: <23450.34763.858887.27606@mariner.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-17-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i2cq=l3=citrix.com=prvs=787a2bb9e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g0TvE-0003qS-Dh
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 15:52:48 +0000
In-Reply-To: <20180904161533.11575-17-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggdjMgMTYvMTZdIHhlbjogZGVjb3VwbGUgSFZNIGFuZCBJ
T01NVSBjYXBhYmlsaXRpZXMiKToKPiBIVk0gYW5kIElPTU1VIGFyZSB0d28gZGlzdGluY3QgaGFy
ZHdhcmUgZmVhdHVyZXMsIHlldCB0aGV5IHdlcmUKPiBidW5kbGVkIHRvZ2V0aGVyIGluIHN5c2N0
bCBhbmQgeGwncyBvdXRwdXQuCj4gCj4gRGVjb3VwbGUgdGhlbSBvbiBzeXNjdGwgbGV2ZWwuIE9u
IHRvb2xzdGFjayBsZXZlbCB3ZSBzdGlsbCBuZWVkIHRvCj4gbWFpbnRhaW4gYSBzZW5zaWJsZSBz
ZW1hbnRpY3MgZm9yIGB4bCBpbmZvYC4gTWFzc2FnZSB0aGUgaW5mb3JtYXRpb24KPiBhY2NvcmRp
bmcgdG8gdGhlIGZvbGxvd2luZyB0YWJsZToKPiAKPiBwdiAgICAgIGh2bSAgICAgaW9tbXUgICAg
ICAgICAgIGZsYWdzIGluIHhsIGluZm8KPiAwICAgICAgIDAgICAgICAgMCAgICAgICAgICAgICAg
IG4vYQo+IDAgICAgICAgMCAgICAgICAxICAgICAgICAgICAgICAgbi9hCj4gMCAgICAgICAxICAg
ICAgIDAgICAgICAgICAgICAgICBodm0KPiAwICAgICAgIDEgICAgICAgMSAgICAgICAgICAgICAg
IGh2bSBodm1fZGlyZWN0aW8KPiAxICAgICAgIDAgICAgICAgMCAgICAgICAgICAgICAgIE5JTAo+
IDEgICAgICAgMCAgICAgICAxICAgICAgICAgICAgICAgZGlyZWN0aW8KPiAxICAgICAgIDEgICAg
ICAgMCAgICAgICAgICAgICAgIGh2bQo+IDEgICAgICAgMSAgICAgICAxICAgICAgICAgICAgICAg
aHZtIGh2bV9kaXJlY3RpbyBkaXJlY3RpbwoKTEdUTS4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
