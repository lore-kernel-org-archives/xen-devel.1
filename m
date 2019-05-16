From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/1] Fixes for large framebuffer,
 placed above 4GB
Date: Thu, 16 May 2019 16:07:28 +0200
Message-ID: <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eh32=TQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hRH2p-0003GF-0C
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:07:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QSBidW5jaCBvZiBmaXhlcyBmb3IgYm9vdGluZyBYZW4gb24gVGhpbmtwYWQgUDUyLCB0aHJvdWdo
IGdydWIyLWVmaSArCm11bHRpYm9vdDIuIE1vc3Qgb2YgdGhlbSBjYW4gYmUgYXBwbGllZCBpbmRl
cGVuZGVudGx5LgoKQ2hhbmdlcyBpbiB2MzoKIC0gdXBkYXRlZCAieGVuOiBmaXggaGFuZGxpbmcg
ZnJhbWVidWZmZXIgbG9jYXRlZCBhYm92ZSA0R0IiCiAtIGRyb3BwZWQgYWxyZWFkeSBhcHBsaWVk
IHBhdGNoZXMKCi0tLQpjYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KY2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KY2M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpjYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpjYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Y2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KY2M6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KY2M6IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPgpjYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KY2M6IE9sYWYg
SGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSAoMSk6
CiAgeGVuOiBmaXggaGFuZGxpbmcgZnJhbWVidWZmZXIgbG9jYXRlZCBhYm92ZSA0R0IKCiB4ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmggICAgIHwgIDEgKwogeGVuL2RyaXZlcnMvdmlkZW8vdmVz
YS5jICAgICAgICB8IDE0ICsrKysrKysrKy0tLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMveGVuLWNv
bXBhdC5oIHwgIDIgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgICAgfCAgNSArKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKYmFz
ZS1jb21taXQ6IDlkYzgwNDNiYTE4NDA5ZTdhMjA1N2Q4Y2NjYmYwZGRhZmY3MWViN2UKLS0gCmdp
dC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
