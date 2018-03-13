From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/6] x86: improve PDX <-> PFN and alike
	translations
Date: Tue, 13 Mar 2018 08:00:35 -0600
Message-ID: <5AA7E79302000078001B0FAB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evkTv-0003lP-EF
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 14:00:47 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogcmVtb3ZlIHBhZ2UuaCBhbmQgcHJvY2Vzc29yLmggaW5jbHVzaW9uIGZyb20gYXNtX2RlZm5z
LmgKMjogeDg2OiBmaXggT0xESU5TVFJfMigpCjM6IHVzZSBQREVQIGZvciBQVEUgZmxhZ3MgaW5z
ZXJ0aW9uIHdoZW4gYXZhaWxhYmxlCjQ6IHVzZSBQREVQL1BFWFQgZm9yIG1hZGRyL2RpcmVjdC1t
YXAtb2Zmc2V0IGNvbnZlcnNpb24gd2hlbiBhdmFpbGFibGUKNTogdXNlIFBERVAvUEVYVCBmb3Ig
UEZOL1BEWCBjb252ZXJzaW9uIHdoZW4gYXZhaWxhYmxlCjY6IHVzZSBNT1YgZm9yIFBGTi9QRFgg
Y29udmVyc2lvbiB3aGVuIHBvc3NpYmxlCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogRXh0ZW5zaXZlIHJlLWJhc2UuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
