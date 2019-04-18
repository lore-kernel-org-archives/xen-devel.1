From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 15/21] starvation: Propagate starved job
 status into dependent jobs
Date: Thu, 18 Apr 2019 17:31:52 +0100
Message-ID: <20190418163158.11408-16-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xP-00027g-64
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:15 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWYgYSBidWlsZCBqb2IgaXMgc3RhcnZlZCwgdGhlbiB0aGUgc2FtZSBzdGF0dXMKCihObyBqb2Jz
IGFyZSBtYXJrZWQgYHN0YXJ2ZWQnIHlldC4pCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5w
bSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9P
c3N0ZXN0L0pvYkRCL0V4ZWN1dGl2ZS5wbSBiL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtCmlu
ZGV4IDJlMTFjOGYzLi5iZTU1ODhmYyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9Kb2JEQi9FeGVjdXRp
dmUucG0KKysrIGIvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KQEAgLTM4MCw2ICszODAsOCBA
QCBFTkQKICAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgICAgZGllICJqb2IgJG9m
bGlnaHQuJG9qb2IgKCR3aHkpIHF1ZXVlZCAod2UgYXJlICRvdXJzdGF0dXMpIjsKICAgICAgICAg
ICAgIH0KKyAgICAgICAgfSBlbHNpZiAoJGpzdGF0dXMgZXEgJ3N0YXJ2ZWQnKSB7CisgICAgICAg
ICAgICBicm9rZW4oImpvYiAkb2ZsaWdodC4kb2pvYiAoJHdoeSkgJGpzdGF0dXMiLCAkanN0YXR1
cyk7CiAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICBicm9rZW4oImpvYiAkb2ZsaWdodC4k
b2pvYiAoJHdoeSkgJGpzdGF0dXMiLCAnYmxvY2tlZCcpOwogICAgICAgICB9Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
