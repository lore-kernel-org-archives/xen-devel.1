From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 4.20-rc2
Date: Sat, 10 Nov 2018 14:46:12 +0100
Message-ID: <20181110134612.19508-1-jgross__30103.7400532097$1541857519$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffp4=nv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gLTaa-0004zX-G3
 for xen-devel@lists.xenproject.org; Sat, 10 Nov 2018 13:46:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjIwYS1yYzItdGFnCgp4ZW46IGZpeGVzIGZvciA0LjIwLXJjMgoKSXQgY29udGFpbnMgc2V2ZXJh
bCBmaXhlcywgbW9zdGx5IGZvciByYXRoZXIgcmVjZW50IHJlZ3Jlc3Npb25zIHdoZW4KcnVubmlu
ZyB1bmRlciBYZW4uCgoKVGhhbmtzLgoKSnVlcmdlbgoKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hl
bi9wYWdlLmggfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogYXJjaC94
ODYveGVuL3AybS5jICAgICAgICAgICAgICB8ICAzICstLQogYXJjaC94ODYveGVuL3NwaW5sb2Nr
LmMgICAgICAgICB8IDE0ICsrKysrKysrLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jICAgIHwgIDEgKwogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyAgICAgICB8ICAyICstCiBk
cml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jICAgICAgIHwgMjIgKysrKy0tLS0tLS0tLS0tLS0tLS0t
LQogaW5jbHVkZS94ZW4veGVuLW9wcy5oICAgICAgICAgICB8IDEyICsrKysrKystLS0tLQogNyBm
aWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCkp1ZXJnZW4g
R3Jvc3MgKDMpOgogICAgICB4ODYveGVuOiBmaXggcHYgYm9vdAogICAgICB4ZW46IGZpeCB4ZW5f
cWxvY2tfd2FpdCgpCiAgICAgIHhlbjogcmVtb3ZlIHNpemUgbGltaXQgb2YgcHJpdmNtZC1idWYg
bWFwcGluZyBpbnRlcmZhY2UKCkxpYW0gTWVyd2ljayAoMSk6CiAgICAgIHhlbi9ncmFudC10YWJs
ZTogRml4IGluY29ycmVjdCBnbnR0YWJfZG1hX2ZyZWVfcGFnZXMoKSBwcl9kZWJ1ZyBtZXNzYWdl
CgpNYW5qdW5hdGggUGF0aWwgKDEpOgogICAgICB4ZW4tYmxrZnJvbnQ6IGZpeCBrZXJuZWwgcGFu
aWMgd2l0aCBuZWdvdGlhdGVfbXEgZXJyb3IgcGF0aAoKU3RlZmFubyBTdGFiZWxsaW5pICgxKToK
ICAgICAgQ09ORklHX1hFTl9QViBicmVha3MgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbiBv
biBBUk0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
