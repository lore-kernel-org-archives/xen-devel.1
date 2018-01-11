From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/2] Fix a couple of crashes in netfront
Date: Thu, 11 Jan 2018 09:36:36 +0000
Message-ID: <20180111093638.28937-1-ross.lagerwall__14176.7967296348$1515663350$gmane$org@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oq2j=eg=citrix.com=prvs=54256733d=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1eZZI0-0002BG-23
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 09:36:48 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SGVyZSBhcmUgYSBjb3VwbGUgb2YgcGF0Y2hlcyB0byBmaXggdHdvIGNyYXNoZXMgaW4gbmV0ZnJv
bnQuCgpSb3NzIExhZ2Vyd2FsbCAoMik6CiAgeGVuL2dyYW50LXRhYmxlOiBVc2UgcHV0X3BhZ2Ug
aW5zdGVhZCBvZiBmcmVlX3BhZ2UKICB4ZW4tbmV0ZnJvbnQ6IEZpeCByYWNlIGJldHdlZW4gZGV2
aWNlIHNldHVwIGFuZCBvcGVuCgogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgfCA0NiArKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL3hlbi9n
cmFudC10YWJsZS5jICB8ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KSwgMjQgZGVsZXRpb25zKC0pCgotLSAKMi45LjUKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
