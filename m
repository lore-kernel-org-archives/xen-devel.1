From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] x86/mm-locks: add a bias to control
 domain lock levels
Date: Fri, 21 Dec 2018 10:41:02 +0100
Message-ID: <20181221094105.83881-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Efb1=O6=citrix.com=prvs=886684236=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gaHIx-0004pl-DI
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 09:41:15 +0000
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhdHRlbXB0cyB0byBmaXggYSBtbSBsb2NrIGxl
dmVsIGlzc3VlIHRoYXQgcHJldmVudHMKdXNpbmcgcGFnaW5nX2xvZ19kaXJ0eV9vcCBmcm9tIGEg
cGFnaW5nIERvbTAgKGxpa2UgYSBQVkggRG9tMCkuIFRoZQpkaXNjdXNzaW9uIHRoYXQgbGVhZCB0
byB0aGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTIvbXNnMDExOTcuaHRtbAoKUm9nZXIg
UGF1IE1vbm5lICgzKToKICB4ODYvbW0tbG9ja3M6IHJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNl
CiAgeDg2L21tLWxvY2tzOiBjb252ZXJ0IHNvbWUgbWFjcm9zIHRvIGlubGluZSBmdW5jdGlvbnMK
ICB4ODYvbW0tbG9ja3M6IGFwcGx5IGEgYmlhcyB0byBsb2NrIGxldmVscyBmb3IgY29udHJvbCBk
b21haW4KCiB4ZW4vYXJjaC94ODYvbW0vbW0tbG9ja3MuaCB8IDIxNyArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLXBvZC5jICB8ICAgNSAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKSwgOTIgZGVsZXRpb25zKC0pCgot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
