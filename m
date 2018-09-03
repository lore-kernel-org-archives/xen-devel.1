From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v5 0/3] Add hvmops for setting and getting the
 suppress #VE bit
Date: Mon,  3 Sep 2018 18:48:33 +0300
Message-ID: <20180903154836.25708-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ffst=lr=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fwr5r-0006ur-B5
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 15:48:47 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 046EB305FFA4
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 18:48:46 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id E8B617FC77
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 18:48:45 +0300 (EEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
List-Id: xen-devel@lists.xenproject.org

QXMgdGhlIGNvZGUgc3RhbmRzIHJpZ2h0IG5vdywgYWZ0ZXIgRG9tVSBoYXMgZW5hYmxlZCAjVkUg
dXNpbmcKSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSwgYWxsIGl0cyBwYWdlcyBoYXZl
IHRoZSAjVkUgc3VwcHJlc3MgYml0CmNsZWFyZWQsIGdlbmVyYXRpbmcgI1ZFcyBmb3IgYW55IEVQ
VCB2aW9sYXRpb24uICBUaGVyZSBpcyBjdXJyZW50bHkgbm8Kd2F5IHRvIGNoYW5nZSB0aGUgdmFs
dWUgb2YgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIGEgcGFnZSBmcm9tIGEKZG9tYWluOyBpdCBj
YW4gb25seSBiZSBkb25lIGluIFhlbiBpbnRlcm5hbGx5IHVzaW5nIGVwdF9zZXRfZW50cnkoKS4K
CkZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBmcm9tCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTAzL21zZzAxMzEyLmh0bWwgdGhlc2UKcGF0Y2hlcyBp
bnRyb2R1Y2UgbmV3IGh2bW9wcyBmb3Igc2V0dGluZyBhbmQgZ2V0dGluZyB0aGlzIGJpdCBhbmQg
dGh1cwoKQWRyaWFuIFBvcCAoMyk6CiAgeDg2L2FsdHAybTogQWRkIGEgaHZtb3AgZm9yIHNldHRp
bmcgdGhlIHN1cHByZXNzICNWRSBiaXQKICB4ODYvYWx0cDJtOiBBZGQgYSBodm1vcCBmb3IgcXVl
cnlpbmcgdGhlIHN1cHByZXNzICNWRSBiaXQKClZsYWQgSW9hbiBUb3BhbiAoMSk6CiAgeDg2L21t
OiBDaGFuZ2UgZGVmYXVsdCB2YWx1ZSBmb3Igc3VwcHJlc3MgI1ZFIGluIHNldF9tZW1fYWNjZXNz
KCkKCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwgICA0ICsrCiB0b29scy9saWJ4
Yy94Y19hbHRwMm0uYyAgICAgICAgIHwgIDUwICsrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4
Ni9odm0vaHZtLmMgICAgICAgICAgfCAgMzMgKysrKysrKysrKwogeGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYyAgICB8IDEwMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogeGVu
L2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaCB8ICAxMyArKysrCiB4ZW4vaW5jbHVkZS94ZW4v
bWVtX2FjY2Vzcy5oICAgIHwgICA2ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDIwNyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
