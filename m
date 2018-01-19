From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/6] misc flush and dirty-mask related
	adjustments
Date: Fri, 19 Jan 2018 08:57:47 -0700
Message-ID: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mpbx=eo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ecZ3B-0004aJ-CT
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:57:53 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

MTogeDg2OiBtb3ZlIGludm9jYXRpb25zIG9mIGh2bV9mbHVzaF9ndWVzdF90bGJzKCkKMjogeDg2
OiBtYWtlIENQVSBzdGF0ZSBmbHVzaCByZXF1ZXN0cyBleHBsaWNpdAozOiBhZGQgY2hlY2sgdG8g
Y3B1bWFza19vZigpCjQ6IHJlcGxhY2UgdkNQVSdzIGRpcnR5IENQVSBtYXNrIGJ5IG51bWVyaWMg
SUQKNTogeDg2OiBhdm9pZCBleHBsaWNpdCBUTEIgZmx1c2ggd2hlbiBzYXZpbmcgZXhlYyBzdGF0
ZQo2OiBkcm9wICJkb21haW5fIiBwcmVmaXggZnJvbSBzdHJ1Y3QgZG9tYWluJ3MgZGlydHkgQ1BV
IG1hc2sKClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
