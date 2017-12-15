From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for 4.15-rc4
Date: Fri, 15 Dec 2017 06:57:35 +0100
Message-ID: <20171215055735.30662-1-jgross__38900.7612401203$1513317526$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=aw78=dl=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ePj0E-0008BS-44
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 05:57:46 +0000
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
LjE1LXJjNC10YWcKCnhlbjogZml4ZXMgZm9yIDQuMTUtcmM0CgpJdCBjb250YWlucyB0d28gbWlu
b3IgZml4ZXMgZm9yIHJ1bm5pbmcgYXMgWGVuIGRvbTA6Ci0gd2hlbiBidWlsdCBhcyAzMiBiaXQg
a2VybmVsIG9uIGxhcmdlIG1hY2hpbmVzIHRoZSBYZW4gTEFQSUMgZW11bGF0aW9uCiAgc2hvdWxk
IHJlcG9ydCBhIHJhdGhlciBtb2Rlcm4gTEFQSUMgaW4gb3JkZXIgdG8gc3VwcG9ydCBlbm91Z2gg
QVBJQy1JZHMKLSBUaGUgWGVuIExBUElDIGVtdWxhdGlvbiBpcyBuZWVkZWQgZm9yIGRvbTAgb25s
eSwgc28gYnVpbGQgaXQgb25seSBmb3IKICBrZXJuZWxzIHN1cHBvcnRpbmcgdG8gcnVuIGFzIFhl
biBkb20wCgpUaGFua3MuCgpKdWVyZ2VuCgogYXJjaC94ODYveGVuL2FwaWMuYyB8IDIgKy0KIGRy
aXZlcnMveGVuL0tjb25maWcgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCkphbiBCZXVsaWNoICgyKToKICAgICAgeDg2L1hlbjogZG9uJ3Qg
cmVwb3J0IGFuY2llbnQgTEFQSUMgdmVyc2lvbgogICAgICB4ZW46IFhFTl9BQ1BJX1BST0NFU1NP
UiBpcyBEb20wLW9ubHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
