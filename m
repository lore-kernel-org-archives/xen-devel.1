From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] vpci/msi: fix updating already bound MSI
 interrupts
Date: Tue, 15 May 2018 15:10:05 +0100
Message-ID: <20180515141008.69320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zhs+=ic=citrix.com=prvs=666baa678=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIafG-0003fu-3O
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:10:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGVyZSdzIGEgYnVnIGluIGN1cnJlbnQgdnBjaSBjb2RlIGZvciBNU0kgZW11bGF0
aW9uIHdoZW4gdXBkYXRpbmcgYW4KYWxyZWFkeSBib3VuZCBpbnRlcnJ1cHQuIFRoZSBjb2RlIHdp
bGwgZGlzYWJsZSBhbmQgZW5hYmxlIHRoZSBpbnRlcnJ1cHQKaW4gb3JkZXIgdG8gdXBkYXRlIHRo
ZSBiaW5kaW5nLCB3aGljaCBjYWxscyB1bm1hcF9kb21haW5fcGlycSB0aGF0CmRpc2FibGVzIHRo
ZSBnbG9iYWwgTVNJIGVuYWJsZSBmbGFnIGluIHRoZSBjb250cm9sIHJlZ2lzdGVyLgoKSW4gb3Jk
ZXIgdG8gZml4IHRoaXMgaW5jb3JyZWN0IGJlaGF2aW9yIGludHJvZHVjZSBhIG5ldyB1cGRhdGUg
aGVscGVyCnRoYXQgc2hvdWxkIGJlIHVzZWQgdG8gdXBkYXRlIHRoZSBiaW5kaW5ncyBvZiBhbiBh
bHJlYWR5IGVuYWJsZWQgZ3JvdXAKb2YgTVNJIGludGVycnVwdHMuCgpUaGFua3MsIFJvZ2VyLgoK
Um9nZXIgUGF1IE1vbm5lICgzKToKICB2cGNpL21zaTogZml4IHVuYmluZCBsb29wCiAgdnBjaS9t
c2k6IHNwbGl0IGNvZGUgdG8gYmluZCBwaXJxCiAgdnBjaS9tc2k6IGZpeCB1cGRhdGUgb2YgYm91
bmQgTVNJIGludGVycnVwdHMKCiB4ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYyB8IDk2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy92cGNpL21zaS5j
ICB8ICAzICstCiB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICB8ICAyICsKIDMgZmlsZXMgY2hhbmdl
ZCwgNzEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
