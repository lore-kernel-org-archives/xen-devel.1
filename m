From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/5] Fixes for large framebuffer,
 placed above 4GB
Date: Mon,  6 May 2019 16:50:16 +0200
Message-ID: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9c-0004OY-Fc
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:44 +0000
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
cGVuZGVudGx5LgoKLS0tCmNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpjYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpjYzog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CmNjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CmNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpjYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpjYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpjYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CmNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpjYzogT2xh
ZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICg1
KToKICB4ZW4vYml0bWFwOiBmaXggYml0bWFwX2ZpbGwgd2l0aCB6ZXJvLXNpemVkIGJpdG1hcAog
IGRyaXZlcnMvdmlkZW86IGRyb3AgdW51c2VkIGxpbWl0cwogIGRyaXZlcnMvdmlkZW86IERyb3Ag
ZnJhbWVidWZmZXIgc2l6ZSBjb25zdHJhaW50cwogIHhlbjogZml4IGhhbmRsaW5nIGZyYW1lYnVm
ZmVyIGxvY2F0ZWQgYWJvdmUgNEdCCiAgZHJpdmVycy92aWRlbzogdXNlIHZsZmJfaW5mbyBjb25z
aXN0ZW50bHkKCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggfCAgMSArCiB4ZW4vZHJpdmVy
cy92aWRlby9sZmIuYyAgICAgfCAxMyAtLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy92aWRlby92
ZXNhLmMgICAgfCAxNyArKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvcHVibGljL3hlbi5o
ICAgIHwgIDIgKysKIHhlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaCAgICB8ICAyICsrCiA1IGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6
IGRjNDk3NjM1ZDkzZjY2NzJmODI3MjdhZDk3YTU1MjA1MTc3YmUyYWEKLS0gCmdpdC1zZXJpZXMg
MC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
