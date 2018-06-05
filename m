From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/7] xen/arm: Shrink down Xen on Arm
Date: Tue,  5 Jun 2018 18:12:30 +0100
Message-ID: <20180605171237.30601-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s9k6=ix=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fQFVr-0007uq-6F
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 17:12:51 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzZXJpZXMgcmVtb3ZlIHNvbWUgdW51c2VkIGNvZGUgZnJvbSBYZW4gYW5k
IGFsc28gbW92ZSBzb21lIHBhcnQgdW5kZXIKX19pbml0IGlmIG9ubHkgdXNlZCBkdXJpbmcgYm9v
dC4KClRoZSBtYWpvciBjaGFuZ2Ugb2YgdGhpcyBwYXRjaCBpcyByZW1vdmluZyBzdXBwb3J0IGxp
YmVsZiBpbiBYZW4gKHNlZSAjNAphbmQgIzUpLgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICg3KToK
ICB4ZW4vYXJtOiBSZW1vdmUgdGhlIHZhcmlhYmxlIGRvbTBfMTFfbWFwcGluZyBhbmQgb3Blbi1j
b2RlIHRoZSB2YWx1ZQogIHhlbi9hcm06IGRvbWFpbl9idWlsZDogTW92ZSBpbiBpbml0IGFsbCBj
b2RlL2RhdGEgb2YgZG9tYWluX2J1aWxkLmMKICB4ZW4vYXJtOiBrZXJuZWw6IE1vdmUgaW4gaW5p
dCBhbGwgdGhlIGNvZGUvZGF0YSBvZiBrZXJuZWwuYwogIHhlbi9hcm06IERyb3Agc3VwcG9ydCBm
b3IgbG9hZGluZyBFTEYgRG9tMCBrZXJuZWwKICB4ZW46IERvbid0IGJ1aWxkIGxpYmVsZiBmb3Ig
QXJtCiAgeGVuL2xpYmZkdDogUHV0IGFsbCBsaWJmZHQgaW4gaW5pdAogIHhlbi9hcm06IHNldHVw
OiBNb3ZlIGluIGluaXQgY29kZSBvbmx5IHVzZWQgYXQgYm9vdCBpbiBzZXR1cC5jCgogeGVuL2Fy
Y2gvYXJtL01ha2VmaWxlICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jICB8IDEzNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgIHwgMTAzICsrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0va2VybmVsLmggICAgICAgIHwgIDEwICstLS0KIHhlbi9h
cmNoL2FybS9zZXR1cC5jICAgICAgICAgfCAgMTAgKystLQogeGVuL2FyY2gveDg2L0tjb25maWcg
ICAgICAgICB8ICAgMSArCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgIHwgICAzICsKIHhl
bi9jb21tb24vTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKy0KIHhlbi9jb21tb24vbGliZmR0L01h
a2VmaWxlICAgfCAgMTAgKysrLQogeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCB8ICAgNCAr
LQogMTAgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDE3NyBkZWxldGlvbnMoLSkK
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
