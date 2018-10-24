From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 01/22] xen/arm: traps: Constify
 show_registers parameters
Date: Wed, 24 Oct 2018 14:03:15 +0000
Message-ID: <d94b4ecf-4894-b7d6-10de-200fbc04f22e@epam.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
 <20181018132109.31192-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-2-julien.grall@arm.com>
Content-Language: en-US
Content-ID: <23BC011A1D6E4F4FA26CA0643B62ADF1@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLA0KDQoNCk9uIDE4LjEwLjE4IDE2OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+IHNob3dfcmVnaXN0ZXJzIGhlbHBlcnMgYXJlIG5vdCBtZWFudCB0byBtb2RpZnkgYW55IHBh
cmFtZXRlcnMuDQo+IFNvIGNvbnN0aWZ5IHRoZW0uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS90
cmFwcy5jICAgICAgICAgICAgfCAxNCArKysrKysrLS0tLS0tLQ0KPiAgIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcHJvY2Vzc29yLmggfCAgMiArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQ0KVGhlIGZpbGUgeGVuL2FyY2gvYXJtL3RyYXBzLmMgaGFz
IGEgYnVuY2ggb2Ygc2hvdyBmdW5jdGlvbnMgZXhjZXB0IGZvciANCnJlZ2lzdGVycy4gRm9yIHN0
YWNrLCB0cmFjZSwgZXRjLiBTbyBtYXliZSBjb25zdGlmeSB0aGVpciBwYXJhbWV0ZXJzIA0Kcmln
aHQgYXdheT8NCg0KLS0gDQoNCipBbmRyaWkgQW5pc292Kg0KDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
