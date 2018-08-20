From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] x86/xen: avoid 32-bit writes to PTEs in PV
 PAE guests
Date: Mon, 20 Aug 2018 07:14:54 +0200
Message-ID: <20180820051456.20779-1-jgross__37207.1600323126$1534742028$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vhn4=ld=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1frcWs-0002JT-RH
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 05:15:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, mingo@redhat.com, tglx@linutronix.de, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgdGhlIGh5cGVydmlzb3IgZW11bGF0ZXMgcGxhaW4gd3JpdGVzIHRvIFBURXMgaGFwcGls
eSwgdGhpcyBpcwptdWNoIHNsb3dlciB0aGFuIGlzc3VpbmcgYSBoeXBlcmNhbGwgZm9yIFBURSBt
b2RpZmNhdGlvbnMuIEFuZCB3cml0aW5nCmEgUFRFIHZpYSB0d28gMzItYml0IHdyaXRlIGluc3Ry
dWN0aW9ucyAoZXNwZWNpYWxseSB3aGVuIGNsZWFyaW5nIHRoZQpQVEUpIHdpbGwgcmVzdWx0IGlu
IGFuIGludGVybWVkaWF0ZSBMMVRGIHZ1bG5lcmFibGUgUFRFLgoKV3JpdGVzIHRvIFBBRSBQVEVz
IHNob3VsZCBhbHdheXMgYmUgZG9uZSB3aXRoIDY0LWJpdCB3cml0ZXMgb3IgdmlhCmh5cGVyY2Fs
bHMuCgpKdWVyZ2VuIEdyb3NzICgyKToKICB4ODYveGVuOiBkb24ndCB3cml0ZSBwdGVzIGRpcmVj
dGx5IGluIDMyLWJpdCBQViBndWVzdHMKICB4ODYvcGFlOiB1c2UgNjQgYml0IGF0b21pYyB4Y2hn
IGZ1bmN0aW9uIGluIG5hdGl2ZV9wdGVwX2dldF9hbmRfY2xlYXIKCiBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9wZ3RhYmxlLTNsZXZlbC5oIHwgMTQgKysrKysrKystLS0tLS0KIGFyY2gveDg2L3hlbi9t
bXVfcHYuYyAgICAgICAgICAgICAgICAgfCAgNyArKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0gCjIuMTMuNwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
