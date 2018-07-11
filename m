From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 0/3] Fixes to build with lld 6.0.0
Date: Wed, 11 Jul 2018 17:34:47 +0200
Message-ID: <20180711153450.83331-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdH9Q-0007QS-Es
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 15:35:32 +0000
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

SGVsbG8sCgpUaGUgZm9sbG93aW5nIDMgcGF0Y2hlcyBhbGxvdyBidWlsZGluZyB0aGUgaHlwZXJ2
aXNvciB3aXRoIGxsZCA2LjAuMC4KClRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB2MiBpcyB0
aGUgc3BsaXQgaW50byBtdWx0aXBsZSBwYXRjaGVzLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBh
dSBNb25uZSAoMyk6CiAgeGVuL3g4NjogcmVwbGFjZSAnfHwnIHVzYWdlIGluIHRoZSBsaW5rZXIg
c2NyaXB0CiAgeGVuL2NvbXBpbGVyOiBpbnRyb2R1Y2UgYSBkZWZpbmUgZm9yIHdlYWsgc3ltYm9s
cwogIHhlbi94ODY6IGRlY2xhcmUgdGhlIGVmaSBzeW1ib2wgYXMgd2VhawoKIHhlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMgICAgICAgICAgICAgIHwgNCArLS0tCiB4ZW4vaW5jbHVkZS94ZW4vY29tcGls
ZXIuaCAgICAgICAgICB8IDIgKysKIHhlbi9pbmNsdWRlL3hlbi9lZmkuaCAgICAgICAgICAgICAg
IHwgMiArLQogeGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmggfCA0ICsrLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
